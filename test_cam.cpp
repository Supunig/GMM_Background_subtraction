#include "test_cam.h"
#include "core.h"

//uint8_t bram_ar[76800] = { 0 };
float mean[76800][4];
float sigma[76800][4];
float weight[76800][4];	//weight
uint8_t matchsum[76800][4];

cv::Mat outImg1(IMG_H, IMG_W, CV_8UC1);

void execute(uint32_t *data_array, bool init);
int main() {
	for (int i = 0; i < IMG_SIZE; i = i + 1) {
			mean[i][0] = 0;
			mean[i][1] = 0;
			mean[i][2] = 0;
			mean[i][3] = 0;

			sigma[i][0] = 100;
			sigma[i][1] = 100;
			sigma[i][2] = 100;
			sigma[i][3] = 100;

			weight[i][0] = 0.05;
			weight[i][1] = 0.05;
			weight[i][2] = 0.05;
			weight[i][3] = 0.05;

			matchsum[i][0] = 0;
			matchsum[i][1] = 0;
			matchsum[i][2] = 0;
			matchsum[i][3] = 0;
		}
	// Initializing IP Core Ends here .........................

	/******************Initializing V4L2 Driver Starts Here**********************/
	// 1.  Open the device
	int fd; // A file descriptor to the video device
	fd = open("/dev/video0", O_RDWR);
	if (fd < 0) {
		perror("Failed to open device, OPEN");
		return 1;
	}

	// 2. Ask the device if it can capture frames
	v4l2_capability capability;
	if (ioctl(fd, VIDIOC_QUERYCAP, &capability) < 0) {
		// something went wrong... exit
		perror("Failed to get device capabilities, VIDIOC_QUERYCAP");
		return 1;
	}

	// 3. Set Image format
	v4l2_format imageFormat;
	imageFormat.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	imageFormat.fmt.pix.width = 320;
	imageFormat.fmt.pix.height = 240;
	imageFormat.fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
	imageFormat.fmt.pix.field = V4L2_FIELD_NONE;
	// tell the device you are using this format
	if (ioctl(fd, VIDIOC_S_FMT, &imageFormat) < 0) {
		perror("Device could not set format, VIDIOC_S_FMT");
		return 1;
	}

	// 4. Request Buffers from the device
	v4l2_requestbuffers requestBuffer = { 0 };
	requestBuffer.count = 1; // one request buffer
	requestBuffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE; // request a buffer wich we an use for capturing frames
	requestBuffer.memory = V4L2_MEMORY_MMAP;

	if (ioctl(fd, VIDIOC_REQBUFS, &requestBuffer) < 0) {
		perror("Could not request buffer from device, VIDIOC_REQBUFS");
		return 1;
	}

	// 5. Quety the buffer to get raw data ie. ask for the you requested buffer
	// and allocate memory for it
	v4l2_buffer queryBuffer = { 0 };
	queryBuffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	queryBuffer.memory = V4L2_MEMORY_MMAP;
	queryBuffer.index = 0;
	if (ioctl(fd, VIDIOC_QUERYBUF, &queryBuffer) < 0) {
		perror("Device did not return the buffer information, VIDIOC_QUERYBUF");
		return 1;
	}
	// use a pointer to point to the newly created buffer
	// mmap() will map the memory address of the device to
	// an address in memory
	char* buffer = (char*) mmap(NULL, queryBuffer.length,
			PROT_READ | PROT_WRITE, MAP_SHARED, fd, queryBuffer.m.offset);
	memset(buffer, 0, queryBuffer.length);

	// 6. Get a frame
	// Create a new buffer type so the device knows whichbuffer we are talking about
	v4l2_buffer bufferinfo;
	memset(&bufferinfo, 0, sizeof(bufferinfo));
	bufferinfo.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	bufferinfo.memory = V4L2_MEMORY_MMAP;
	bufferinfo.index = 0;

	// Activate streaming
	int type = bufferinfo.type;
	if (ioctl(fd, VIDIOC_STREAMON, &type) < 0) {
		perror("Could not start streaming, VIDIOC_STREAMON");
		return 1;
	}
	/******************Initializing V4L2 Driver Ends Here**********************/

	/***************************** Begin looping here *********************/
	//auto begin = std::chrono::high_resolution_clock::now();
	bool isFirst = true;

	uint32_t data_array[IMG_H * IMG_W / 2];
	bool init = 0;

	for (int it = 0; it < 10000; it++) {
		// Queue the buffer
		// auto begin = std::chrono::high_resolution_clock::now();
		if (ioctl(fd, VIDIOC_QBUF, &bufferinfo) < 0) {
			perror("Could not queue buffer, VIDIOC_QBUF");
			return 1;
		}

		// Dequeue the buffer
		if (ioctl(fd, VIDIOC_DQBUF, &bufferinfo) < 0) {
			perror("Could not dequeue the buffer, VIDIOC_DQBUF");
			return 1;
		}

		// string filename = "Webcam" + to_string(i) + ".jpg";

		// ofstream outFile;
		// outFile.open(filename, ios::binary| ios::app);

		int outFileMemBlockSize = bufferinfo.bytesused;
		int remainingBufferSize = bufferinfo.bytesused;

		//if (sizeof(uint8_t)*76800 == outFileMemBlockSize){
		//printf("Same %d \n",outFileMemBlockSize);
		//}
		//IP Core Starts Here...........

		memcpy(data_array, buffer, sizeof(uint32_t) * IMG_H * IMG_W / 2);
		if (it == 0) {
			init = true;
		} else {
			init = false;
		}

		execute(data_array, init);

		if (it == 0) {
			cv::namedWindow("Live2");
			cv::imshow("Live2", outImg1);
			cv::waitKey(0);
	}else{

	cv::namedWindow("Live2");
	cv::imshow("Live2", outImg1);
	if (cv::waitKey(1) >= 0)
		break;
	}

//		uint8_t * ybuffer = new uint8_t[N];
//		for (int j = 0; j < N; j++) {
//			ybuffer[j] = buffer[2 * j];
//		}
//
//
//		cv::Mat img(240, 320, CV_8UC1, ybuffer);
//		cv::namedWindow("Live1");
//		cv::imshow("Live1", img);
//
//

}

if (ioctl(fd, VIDIOC_STREAMOFF, &type) < 0) {
	perror("Could not end streaming, VIDIOC_STREAMOFF");
	return 1;
}

close(fd);

printf("Device unmapped\n");

return 0;
}

void execute(uint32_t *data_array, bool init) {
AXI_STREAM ch1;

for (int idxRow = 0; idxRow < IMG_H; idxRow++) {
	for (int idxCols = 0; idxCols < IMG_W / 2; idxCols++) {
		ap_axiu<32, 1, 1, 1> valIn;
		valIn.data = data_array[idxRow * IMG_W / 2 + idxCols];
		valIn.keep = 1;
		valIn.strb = 1;
		valIn.user = 1;
		valIn.id = 1;
		valIn.dest = 1;
		if (idxRow == IMG_H - 1 && idxCols == IMG_W / 2 - 1)
			valIn.last = 1;
		else
			valIn.last = 0;
		ch1 << valIn;
	}
}

AXI_STREAM_OUT outStream1;
backsub(ch1, outStream1, init, mean,sigma, weight,  matchsum);

for (int idxRows = 0; idxRows < IMG_H; idxRows++) {
	for (int idxCols = 0; idxCols < IMG_W; idxCols = idxCols + 2) {
		ap_axiu<8, 1, 1, 1> valOut1;
		ap_axiu<8, 1, 1, 1> valOut2;
		outStream1.read(valOut1);
		outStream1.read(valOut2);
		outImg1.at<unsigned char>(idxRows, idxCols) = valOut1.data;	//.to_uchar();
		outImg1.at<unsigned char>(idxRows, idxCols + 1) = valOut2.data;	//.to_uchar();
	}
}

}

