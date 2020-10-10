#include <limits.h>

#include "board.h"

#define SIMULATION

#ifdef SIMULATION
#define SYS_FREQ  0
#define BAUD_RATE 1
#else
#define SYS_FREQ  50000000
#define BAUD_RATE 115200
#endif

void main(void) {
  int i=0, sum=0;
  uart_init(SYS_FREQ, BAUD_RATE, 0x3);
  //printstr("hello world!\n");
  printf("hello world!\n");
  for (i=0; i<=100; i=i+1) {
    sum+=i;
  }
  printf("sum: %d\n", sum);
  while(i--);
  stop_simulation();
}
