#!/bin/bash


compiler=''
program_name=''
program_location=''
compiler_resources=''
bluetooth=''

compiler="$1"
program_name="$2"
program_location="$3"
compiler_resources="$4"
bluetooth="$5"


include_paths="-I${compiler_resources}/microbit -I${compiler_resources}/microbit-dal -I${compiler_resources}/mbed-classic -I${compiler_resources}/ble -I${compiler_resources}/ble-nrf51822 -I${compiler_resources}/nrf51-sdk -I${compiler_resources}/microbit/inc -I${compiler_resources}/microbit-dal/inc/core -I${compiler_resources}/microbit-dal/inc/types -I${compiler_resources}/microbit-dal/inc/drivers -I${compiler_resources}/microbit-dal/inc/bluetooth -I${compiler_resources}/microbit-dal/inc/platform -I${compiler_resources}/mbed-classic/api -I${compiler_resources}/mbed-classic/hal -I${compiler_resources}/mbed-classic/targets/hal -I${compiler_resources}/mbed-classic/targets/cmsis -I${compiler_resources}/ble-nrf51822/source/btle -I${compiler_resources}/ble-nrf51822/source/btle/custom -I${compiler_resources}/ble-nrf51822/source/common -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/ble/ble_radio_notification -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/ble/ble_services/ble_dfu -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/ble/common -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/ble/device_manager -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/ble/device_manager/config -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/ble/peer_manager -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/device -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/drivers_nrf/ble_flash -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/drivers_nrf/delay -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/drivers_nrf/hal -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/drivers_nrf/pstorage -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/drivers_nrf/pstorage/config -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/bootloader_dfu -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/bootloader_dfu/hci_transport -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/crc16 -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/hci -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/scheduler -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/timer -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/util -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/fds -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/fstorage -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/libraries/experimental_section_vars -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/softdevice/common/softdevice_handler -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/softdevice/s130/headers -I${compiler_resources}/nrf51-sdk/source/nordic_sdk/components/toolchain -I${compiler_resources}/mbed-classic/targets -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822 -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/TARGET_NRF51_CALLIOPE -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/nordic_sdk -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/nordic_sdk/components -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/nordic_sdk/components/libraries -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/nordic_sdk/components/libraries/util -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/nordic_sdk/components/libraries/scheduler -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/nordic_sdk/components/libraries/crc16 -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/s130_nrf51822_1_0_0 -I${compiler_resources}/mbed-classic/targets/hal/TARGET_NORDIC/TARGET_MCU_NRF51822/Lib/s110_nrf51822_8_0_0 -I${compiler_resources}/mbed-classic/targets/cmsis/TARGET_NORDIC -I${compiler_resources}/mbed-classic/targets/cmsis/TARGET_NORDIC/TARGET_MCU_NRF51822 -I${compiler_resources}/mbed-classic/targets/cmsis/TARGET_NORDIC/TARGET_MCU_NRF51822/TOOLCHAIN_GCC_ARM -I${compiler_resources}/mbed-classic/targets/cmsis/TARGET_NORDIC/TARGET_MCU_NRF51822/TOOLCHAIN_GCC_ARM/TARGET_MCU_NRF51_16K_S110 -I${compiler_resources}/FourDigitDisplay -I${compiler_resources}/Grove_LED_Bar -I${compiler_resources}/Sht31 -Isource"
objecs="${program_location}target/${program_name}.cpp.o  ${compiler_resources}/microbit${bluetooth}.a ${compiler_resources}/ble.a ${compiler_resources}/microbit-dal${bluetooth}.a ${compiler_resources}/ble-nrf51822.a ${compiler_resources}/nrf51-sdk.a ${compiler_resources}/mbed-classic${bluetooth}.a ${compiler_resources}/FourDigitDisplay.a ${compiler_resources}/Grove_LED_Bar.a ${compiler_resources}/Sht31.a"


cppc_flags='-fno-exceptions -fno-unwind-tables -ffunction-sections -fdata-sections -Wdeprecated -Wno-unused-variable -Wall -Wextra -fno-rtti -fno-threadsafe-statics -mcpu=cortex-m0 -mthumb -D__thumb2__ -std=c++11 -fwrapv -Os -g -gdwarf-3 -DNDEBUG   -DTOOLCHAIN_GCC -DTOOLCHAIN_GCC_ARM -DMBED_OPERATORS -DNRF51 -DTARGET_NORDIC -DTARGET_M0 -D__MBED__=1 -DMCU_NORDIC_16K -DTARGET_NRF51_CALLIOPE -DTARGET_MCU_NORDIC_16K -DTARGET_MCU_NRF51_16K_S110  -DTARGET_NRF_LFCLK_RC -DTARGET_MCU_NORDIC_16K -D__CORTEX_M0 -DARM_MATH_CM0 -MMD'
ld_flags='-fno-exceptions -fno-unwind-tables -Wl,--no-wchar-size-warning -Wl,--gc-sections -Wl,--sort-common -Wl,--sort-section=alignment -Wl,-wrap,main -mcpu=cortex-m0 -mthumb --specs=nano.specs'
ld_sys_libs='-lnosys  -lstdc++ -lsupc++ -lm -lc -lgcc -lstdc++ -lsupc++ -lm -lc -lgcc -Wl,'

echo "[1/3] Building the ${program_name}."
run="${compiler}arm-none-eabi-g++ ${include_paths} ${cppc_flags} -MT ${program_location}source/${program_name}.cpp.o -MF ${program_location}target/${program_name}.cpp.o.d -o ${program_location}target/${program_name}.cpp.o -c ${program_location}source/${program_name}.cpp"
if ! $run; then
    echo "Error in building !!!"
    exit 1
fi

echo "[2/3] Linking CXX executable"
run="${compiler}arm-none-eabi-g++ ${ld_flags} -T ${compiler_resources}/NRF51822.ld -Wl,-Map,${program_location}target/${program_name}.map -Wl,--start-group ${objecs} ${ld_sys_libs}--end-group -o ${program_location}target/${program_name}"
if ! $run; then
    echo "Error in linking !!!"
    exit 1
fi
echo "[3/3] Creating HEX file"
run="${compiler}arm-none-eabi-objcopy -O ihex ${program_location}target/${program_name} ${program_location}target/firmware.hex"
if ! $run; then
    echo "Error creating firmware.hex !!!"
    exit 1
fi
run="srec_cat ${compiler_resources}/BLE_BOOTLOADER_RESERVED.hex -intel ${compiler_resources}/s110_nrf51822_8.0.0_softdevice.hex -intel ${program_location}target/firmware.hex -intel -o ${program_location}target/${program_name}.hex -intel --line-length=44"
if ! $run; then
    echo "Error creating the HEX !!!"
    exit 1
fi
