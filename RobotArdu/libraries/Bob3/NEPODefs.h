#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#ifndef M_E
#define M_E 2.718281828459045
#endif

#ifndef M_GOLDEN_RATIO
#define M_GOLDEN_RATIO 1.61803398875
#endif

#ifndef M_SQRT2
#define M_SQRT2 1.41421356237
#endif

#ifndef M_SQRT1_2
#define M_SQRT1_2 0.707106781187
#endif

#ifndef M_INFINITY
#define M_INFINITY 0x7f800000
#endif

#ifndef RCHANNEL
#define RCHANNEL(color) ((uint8_t)(color >> 16))
#endif

#ifndef GCHANNEL
#define GCHANNEL(color) ((uint8_t)(color >> 8))
#endif

#ifndef BCHANNEL
#define BCHANNEL(color) ((uint8_t)(color))
#endif

inline unsigned RGB(unsigned r, unsigned g, unsigned b) {
    return ((r & 0xF0) << 4) | (g & 0xF0) | ((b & 0xF0) >> 4);
}
