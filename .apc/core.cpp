#include "core.h"
#include <hls_math.h>

uint8_t mean[76800][4];
uint8_t sigma[76800][4];
uint8_t vinit = 1;
float F[4] = { 0 };	//Fitness
float akt[4] = { 0.003,0.003, 0.003, 0.003 };	//learning rate of mean and variance
float weight[76800][4];	//weight
uint8_t matchsum[4] = { 0, 0, 0, 0 };
float alpha_w = 0.005;

int backsub(AXI_STREAM& inStream, AXI_STREAM_OUT& outStream, bool init) {
//#pragma HLS INTERFACE bram port=frame
#pragma HLS INTERFACE s_axilite port=init bundle=CRTL_BUS
#pragma HLS INTERFACE axis port=outStream
#pragma HLS INTERFACE axis port=inStream
#pragma HLS INTERFACE s_axilite port=return bundle=CRTL_BUS
	for (int i = 0; i < IMG_SIZE; i = i + 1) {
		mean[i][0]= 0;
		mean[i][1]= 0;
		mean[i][2]= 0;
		mean[i][3]= 0;

		sigma[i][0]=20;
		sigma[i][1]=20;
		sigma[i][2]=20;
		sigma[i][3]=20;

		weight[i][0]= 0.05;
		weight[i][1]= 0.05;
		weight[i][2]= 0.05;
		weight[i][3]= 0.05;
	}

	loop1: {
		if (init) {
			for (int i = 0; i < IMG_SIZE; i = i + 2) {
#pragma HLS PIPELINE
				ap_axiu<32, 1, 1, 1> valIn;

				ap_axiu<8, 1, 1, 1> valOut1;
				ap_axiu<8, 1, 1, 1> valOut2;

				inStream.read(valIn);
				uint32_t val = valIn.data;
				yuv pix;

				tostruct(val, &pix);



				if (!EM_ALGO(pix.y1,i))
					valOut1.data = 0;
				else
					valOut1.data = 255;

				//std::cout << valIn.data << std::endl;

				//frame[i] = frame[i] | (pix.y1 << 8);
				//frame[i + 1] = frame[i + 1] | (pix.y2 << 8);

				valOut1.keep = valIn.keep;
				valOut1.strb = valIn.strb;
				valOut1.dest = valIn.dest;
				valOut1.id = valIn.id;
				valOut1.last = valIn.last;
				valOut1.user = valIn.user;

				outStream.write(valOut1);

				if (!EM_ALGO(pix.y2,i+1))
					valOut2.data = 0;
				else
					valOut2.data = 255;

				valOut2.keep = valIn.keep;
				valOut2.strb = valIn.strb;
				valOut2.dest = valIn.dest;
				valOut2.id = valIn.id;
				valOut2.last = valIn.last;
				valOut2.user = valIn.user;
				//valOut2.data = pix.y2;
				outStream.write(valOut2);

//				frame1[i] = valIn.data;
//				frame2[i] = valIn.data;

			}

		} else {

			for (int i = 0; i < IMG_SIZE; i = i + 2) {
#pragma HLS PIPELINE
				ap_axiu<32, 1, 1, 1> valIn;
				ap_axiu<8, 1, 1, 1> valOut1;
				ap_axiu<8, 1, 1, 1> valOut2;
				inStream.read(valIn);

				uint32_t val = valIn.data;
				yuv pix;

				tostruct(val, &pix);


				//frame[i] = frame[i] | (pix_12 << 8);


//				frame[i + 1] = frame[i + 1] | (pix_22 << 8);
//
//				uint8_t temp_2 = alpha * pix_21 + beta * pix_22
//						+ gamma * pix_23;
//
//				//have to do for two pixels
//
//				if (15 > hls::abs(pix_11 - temp_1))
//					valOut1.data = 0;
//				else
//					valOut1.data = 255;

				if (!EM_ALGO(pix.y1,i))
					valOut1.data = 0;
				else
					valOut1.data = 255;

				valOut1.keep = valIn.keep;
				valOut1.strb = valIn.strb;
				valOut1.dest = valIn.dest;
				valOut1.id = valIn.id;
				valOut1.last = valIn.last;
				valOut1.user = valIn.user;
				outStream.write(valOut1);

				if (!EM_ALGO(pix.y2,i+1))
					valOut2.data = 0;
				else
					valOut2.data = 255;

//				if (15 > hls::abs(pix_21 - temp_2))
//					valOut2.data = 0;
//				else
//					valOut2.data = 255;

				valOut2.keep = valIn.keep;
				valOut2.strb = valIn.strb;
				valOut2.dest = valIn.dest;
				valOut2.id = valIn.id;
				valOut2.last = valIn.last;
				valOut2.user = valIn.user;
				outStream.write(valOut2);

			}
		}
	}
	return 0;
}

void tostruct(uint32_t val, yuv *yuv_struct) {
	yuv_struct->y1 = 255 & val;
	yuv_struct->u = 255 & (val >> 8);
	yuv_struct->y2 = 255 & (val >> 16);
	yuv_struct->v = 255 & (val >> 24);
}

bool EM_ALGO(uint8_t pixel,int pos ) {
	bool M[4] = { false, false, false, false };
	for (int j = 0; j < 4; j++) {
		if (abs(pixel - mean[pos][j]) < 2.5 * sigma[pos][j]) {
			M[j] = true;
		}
		akt[j] = alpha_w / weight[pos][j];
		F[j] = weight[pos][j] / sigma[pos][j];
	}

	/*The Gaussian that matches with the pixel (M=1) and has the highest F value is
	 considered as the “matched distribution” and its parameters are updated */
	float sorted_F[4];
	for (int i = 1; i < 4; i++) {
		sorted_F[i] = F[i];
	}

	float sorted_weight[4];
	for (int i = 1; i < 4; i++) {
		sorted_weight[i] = weight[pos][i];
	}

	int index[4] = { 0, 1, 2, 3 };
	int temp_F, temp_W, temp_index, j;

	float max_F = 0;
	float min_F = 1000;
	int max_val = 10;
	int min_val = 10;

	for (int i = 1; i < 4; i++) {
		temp_F = sorted_F[i];
		temp_W = sorted_weight[i];
		temp_index = index[i];
		std::cout << temp_index << std::endl;
		j = i - 1;
		while (temp_F > sorted_F[j] && j >= 0)
		/*To sort elements in descending order, change temp<data[j] to temp>data[j] in above line.*/
		{
			sorted_F[j + 1] = sorted_F[j];
			sorted_weight[j + 1] = sorted_weight[j];
			index[j + 1] = index[j];
			--j;
		}
		sorted_F[j + 1] = temp_F;
		sorted_weight[j + 1] = temp_W;
		index[j + 1] = temp_index;
	}

	for (int j = 0; j < 4; j++) {
		if (M[j]) {
			if (F[j] > max_F) {
				max_val = j;
			}
		}
		if (F[j] < min_F) {
			min_val = j;
		}
	}

	if (max_val < 4) {	//For the largest F with M = 1
		mean[pos][max_val] = mean[pos][max_val] + akt[max_val] * (pixel - mean[pos][max_val]);
		sigma[pos][max_val] = sigma[pos][max_val]
				+ akt[max_val] * ((pixel - mean[pos][max_val]) ^ 2 - sigma[pos][max_val]);
		weight[pos][max_val] = weight[pos][max_val] - alpha_w * weight[pos][max_val] + alpha_w;
		matchsum[max_val] = matchsum[max_val] + 1;

		for (int j = 0; j < 4; j++) {
			//For the unmatched Gaussian distributions mean and variance are unchanged while the weights are updated
			if (j != max_val) {
				weight[pos][j] = weight[pos][j] - alpha_w;
			}
		}
	} else { // no match procedure
		mean[pos][min_val] = pixel;
		sigma[pos][min_val] = vinit;
		matchsum[min_val] = 1;

		float matchsumtot = 0;
		for (int j = 0; j < 4; j++) {
			//For the unmatched Gaussian distributions mean and variance are unchanged while the weights are updated
			if (j != min_val) {
				weight[pos][j] = weight[pos][j] - alpha_w;
				matchsumtot = matchsumtot + matchsum[j]; // matchsumtot is the sum of the values of the matchsum of the K-1 Gaussians with highest F
			}
		}

		weight[pos][min_val] = matchsumtot;
		return true; //not matched to any gaussian-> foreground
	}

	float T = 0.7;
	float B = 0;
	for (int j = 0; j < 4; j++) {
		if (B < T) {
			B = B + sorted_weight[j];
			if (index[j] == max_val) {
				return false;
			}
		} else {
			return true;
		}

	}
	return true; //??????
}
