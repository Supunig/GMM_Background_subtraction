#include "core.h"
#include <hls_math.h>

float vinit = 400;
float F[4];	//Fitness
float akt[4];	//learning rate of mean and variance

float alpha_w = 0.004;


float mean[76800][4];
float sigma[76800][4];
float weight[76800][4];	//weight
uint8_t matchsum[76800][4];
bool back_gauss[76800][4];
//
//int backsub(AXI_STREAM& inStream, AXI_STREAM_OUT& outStream, bool init,
//		float mean[76800][4], float sigma[76800][4], float weight[76800][4],
//		uint8_t matchsum[76800][4], bool back_gauss[76800][4]) {

int backsub(uint32_t data_array[IMG_H * IMG_W / 2], uint8_t out_frame[76800], bool init) {

	loop1: {
		if (init) {

			for (int i = 0; i < IMG_SIZE; i = i + 1) {
					mean[i][0] = 32;
					mean[i][1] = 120;
					mean[i][2] = 180;
					mean[i][3] = 220;

					sigma[i][0] = 400;
					sigma[i][1] = 400;
					sigma[i][2] = 400;
					sigma[i][3] = 400;

					weight[i][0] = 0.05;
					weight[i][1] = 0.05;
					weight[i][2] = 0.05;
					weight[i][3] = 0.05;

					matchsum[i][0] = 0;
					matchsum[i][1] = 0;
					matchsum[i][2] = 0;
					matchsum[i][3] = 0;

					back_gauss[i][0] = true;
					back_gauss[i][1] = true;
					back_gauss[i][2] = true;
					back_gauss[i][3] = true;
				}
//				for (int i = 0; i < IMG_SIZE; i = i + 2) {
//#pragma HLS PIPELINE
//					ap_axiu<32, 1, 1, 1> valIn;
//
//					ap_axiu<8, 1, 1, 1> valOut1;
//					ap_axiu<8, 1, 1, 1> valOut2;
//
//					inStream.read(valIn);
//					uint32_t val = valIn.data;
//					yuv pix;
//
//					tostruct(val, &pix);
//
//					if (!EM_ALGO(pix.y1, i, mean, sigma, weight, matchsum,
//							back_gauss))
//						valOut1.data = 0;
//					else
//						valOut1.data = 255;
//
//					//std::cout << valIn.data << std::endl;
//
//					valOut1.keep = valIn.keep;
//					valOut1.strb = valIn.strb;
//					valOut1.dest = valIn.dest;
//					valOut1.id = valIn.id;
//					valOut1.last = valIn.last;
//					valOut1.user = valIn.user;
//
//					outStream.write(valOut1);
//
//					if (!EM_ALGO(pix.y2, i + 1, mean, sigma, weight, matchsum,
//							back_gauss))
//						valOut2.data = 0;
//					else
//						valOut2.data = 255;
//
//					valOut2.keep = valIn.keep;
//					valOut2.strb = valIn.strb;
//					valOut2.dest = valIn.dest;
//					valOut2.id = valIn.id;
//					valOut2.last = valIn.last;
//					valOut2.user = valIn.user;
//					//valOut2.data = pix.y2;
//					outStream.write(valOut2);

			for (int idxRow = 0; idxRow < IMG_H; idxRow++) {
				for (int idxCols = 0; idxCols < IMG_W / 2; idxCols++) {
					int i = idxRow * IMG_W / 2 + idxCols;
					uint32_t val = data_array[i];
					yuv pix;

					tostruct(val, &pix);

					if (!EM_ALGO(pix.y1, i * 2, mean, sigma, weight, matchsum,
							back_gauss))
						out_frame[i * 2] = 0;
					else
						out_frame[i * 2] = 255;

					if (!EM_ALGO(pix.y2, i * 2 + 1, mean, sigma, weight,
							matchsum, back_gauss))
						out_frame[i * 2 + 1] = 0;
					else
						out_frame[i * 2 + 1] = 255;

				}

			}

		} else {

//				for (int i = 0; i < IMG_SIZE; i = i + 2) {
//#pragma HLS PIPELINE
//					ap_axiu<32, 1, 1, 1> valIn;
//					ap_axiu<8, 1, 1, 1> valOut1;
//					ap_axiu<8, 1, 1, 1> valOut2;
//					inStream.read(valIn);
//
//					uint32_t val = valIn.data;
//					yuv pix;
//
//					tostruct(val, &pix);
//
//					if (!EM_ALGO(pix.y1, i, mean, sigma, weight, matchsum,
//							back_gauss))
//						valOut1.data = 0;
//					else
//						valOut1.data = 255;
//
//					valOut1.keep = valIn.keep;
//					valOut1.strb = valIn.strb;
//					valOut1.dest = valIn.dest;
//					valOut1.id = valIn.id;
//					valOut1.last = valIn.last;
//					valOut1.user = valIn.user;
//					outStream.write(valOut1);
//
//					if (!EM_ALGO(pix.y2, i + 1, mean, sigma, weight, matchsum,
//							back_gauss))
//						valOut2.data = 0;
//					else
//						valOut2.data = 255;
//
//					valOut2.keep = valIn.keep;
//					valOut2.strb = valIn.strb;
//					valOut2.dest = valIn.dest;
//					valOut2.id = valIn.id;
//					valOut2.last = valIn.last;
//					valOut2.user = valIn.user;
//					outStream.write(valOut2);
//
//				}

			for (int idxRow = 0; idxRow < IMG_H; idxRow++) {
				for (int idxCols = 0; idxCols < IMG_W / 2; idxCols++) {
					int i = idxRow * IMG_W / 2 + idxCols;
					uint32_t val = data_array[i];
					yuv pix;

					tostruct(val, &pix);

					if (!EM_ALGO(pix.y1, i * 2, mean, sigma, weight, matchsum,
							back_gauss))
						out_frame[i * 2] = 0;
					else
						out_frame[i * 2] = 255;

					if (!EM_ALGO(pix.y2, i * 2 + 1, mean, sigma, weight,
							matchsum, back_gauss))
						out_frame[i * 2 + 1] = 0;
					else
						out_frame[i * 2 + 1] = 255;

				}
			}
		}
		return 0;
	}
}

void tostruct(uint32_t val, yuv *yuv_struct) {
	yuv_struct->y1 = 255 & val;
	yuv_struct->u = 255 & (val >> 8);
	yuv_struct->y2 = 255 & (val >> 16);
	yuv_struct->v = 255 & (val >> 24);
}

bool EM_ALGO(uint8_t pixel, int pos, float mean[76800][4],
		float sigma[76800][4], float weight[76800][4],
		uint8_t matchsum[76800][4], bool back_gauss[76800][4]) {

	bool M[4] = {false, false, false, false};

	//Checking whether the pixel is in 2.5sigma distance of every mean
	for (int j = 0; j < 4; j++) {
		if ((abs(pixel - mean[pos][j]) < 2.5 * hls::sqrtf(sigma[pos][j]))
				and (back_gauss[pos][j])) {
			M[j] = true;
		}
		akt[j] = alpha_w / weight[pos][j];
		F[j] = weight[pos][j] / sigma[pos][j];
	}

	/*The Gaussian that matches with the pixel (M=1) and has the highest F value is
	 considered as the “matched distribution” and its parameters are updated */

	float max_F = 0;
	float min_F = 1000;
	int max_val = 10;
	int min_val = 10;
	for (int j = 0; j < 4; j++) {
		if (M[j]) {
			if (F[j] > max_F) {
				max_val = j;
				max_F = F[j];
			}
		}
		if (F[j] < min_F) {
			min_val = j;
			min_F = F[j];
		}
	}

	if (max_val < 4) {	//For the largest F with M = 1
		mean[pos][max_val] = mean[pos][max_val]
		+ akt[max_val] * (pixel - mean[pos][max_val]);
		sigma[pos][max_val] = sigma[pos][max_val]
		+ akt[max_val]
		* ((pixel - mean[pos][max_val])
				* (pixel - mean[pos][max_val])
				- sigma[pos][max_val]);
		weight[pos][max_val] = weight[pos][max_val]
		- alpha_w * weight[pos][max_val] + alpha_w;
		//std::cout << 	"********"<<	weight[pos][max_val] << " " << pos<<std::endl;
		matchsum[pos][max_val] = matchsum[pos][max_val] + 1;

		for (int j = 0; j < 4; j++) {
			//For the unmatched Gaussian distributions mean and variance are unchanged while the weights are updated
			if (j != max_val) {
				weight[pos][j] = weight[pos][j] - alpha_w;
			}
		}
	} else { // no match procedure
		mean[pos][min_val] = pixel;
		sigma[pos][min_val] = vinit;
		matchsum[pos][min_val] = 1;

		float matchsumtot = 0;
		for (int j = 0; j < 4; j++) {
			//For the unmatched Gaussian distributions mean and variance are unchanged while the weights are updated
			if (j != min_val) {
				weight[pos][j] = weight[pos][j] - alpha_w;
				matchsumtot = matchsumtot + matchsum[pos][j]; // matchsumtot is the sum of the values of the matchsum of the K-1 Gaussians with highest F
			}
		}
		if (matchsumtot != 0) {
			weight[pos][min_val] = 1 / matchsumtot;
		} else {
			weight[pos][min_val] = 0.07;
		}
		return true; //not matched to any gaussian-> foreground
	}

	//creating a copy of weight and F to be sorted
	float sorted_F[4];
	for (int i = 0; i < 4; i++) {
		sorted_F[i] = F[i];
	}
	float sorted_weight[4];
	for (int i = 0; i < 4; i++) {
		sorted_weight[i] = weight[pos][i];
		//std::cout << sorted_weight[i] << " " << pos<<std::endl;
	}

	int index[4] = {0, 1, 2, 3};
	float temp_F, temp_W;
	int temp_index, j;
	//Sorting W according to F - descending order
	for (int i = 1; i < 4; i++) {
		temp_F = sorted_F[i];
		temp_W = sorted_weight[i];
		temp_index = index[i];
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

	back_gauss[pos][0] = false;
	back_gauss[pos][1] = false;
	back_gauss[pos][2] = false;
	back_gauss[pos][3] = false;

	float T = 0.7;
	float B = 0;

	for (int ind = 0; ind < 4; ind++) {
		B = B + sorted_weight[ind];
		back_gauss[pos][index[ind]] = true;
		if (B >= T) {
			//std::cout << B<<" "<<ind << " " << pos<<std::endl;
			break;
		}
	}

	return false; //Background
}
