#include "hls_video.h"
#include <hls_math.h>
#include <ap_fixed.h>

#define IMG_H 240
#define IMG_W 320
#define IMG_SIZE 76800

typedef hls::stream<ap_axiu<32, 1, 1, 1> > AXI_STREAM;
typedef hls::stream<ap_axiu<8, 1, 1, 1> > AXI_STREAM_OUT;
typedef struct yuv {
	uint8_t u;
	uint8_t y1;
	uint8_t v;
	uint8_t y2;
};



int backsub(AXI_STREAM& inStream, AXI_STREAM_OUT& outStream, bool init);

void tostruct(uint32_t val, yuv *yuv_struct);
bool EM_ALGO(uint8_t pixel,int pos);
void YUV2RGB();
