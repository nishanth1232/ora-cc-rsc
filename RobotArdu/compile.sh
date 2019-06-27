#!/bin/bash

INCLUDE_PATH=$1
LIBRARY_PATH=$2
BUILD_PATH=$3
SOURCE_FILE_NAME=$4

avr-gcc -I $INCLUDE_PATH -D_BOB3_ -g -Os -fno-exceptions -fdata-sections -fno-threadsafe-statics -MMD -ffunction-sections -DAVR -Wall -Wextra -Wpointer-arith -Wcast-qual -Wmissing-include-dirs -Wno-unused-parameter -Wuninitialized -mmcu=atmega88 -DF_CPU=8000000 -finput-charset=UTF-8 -c $BUILD_PATH/$SOURCE_FILE_NAME -o $BUILD_PATH/$SOURCE_FILE_NAME.o
avr-gcc -L $LIBRARY_PATH -mmcu=atmega88 -Os -Wl,--gc-sections -o $BUILD_PATH/$SOURCE_FILE_NAME.elf $BUILD_PATH/$SOURCE_FILE_NAME.o  -lbob3-smd
avr-objcopy -j .text -j .data -O ihex $BUILD_PATH/$SOURCE_FILE_NAME.elf $BUILD_PATH/$SOURCE_FILE_NAME.hex
