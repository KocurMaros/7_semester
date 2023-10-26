################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/Drivers/tlv493/utils/BusUnterface.cpp \
../Core/Drivers/tlv493/utils/RegMask.cpp 

OBJS += \
./Core/Drivers/tlv493/utils/BusUnterface.o \
./Core/Drivers/tlv493/utils/RegMask.o 

CPP_DEPS += \
./Core/Drivers/tlv493/utils/BusUnterface.d \
./Core/Drivers/tlv493/utils/RegMask.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Drivers/tlv493/utils/%.o Core/Drivers/tlv493/utils/%.su Core/Drivers/tlv493/utils/%.cyclo: ../Core/Drivers/tlv493/utils/%.cpp Core/Drivers/tlv493/utils/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DSTM32F303x8 -DUSE_FULL_LL_DRIVER -DHSE_VALUE=8000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=8000000 -DHSI_VALUE=8000000 -DLSI_VALUE=40000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Drivers-2f-tlv493-2f-utils

clean-Core-2f-Drivers-2f-tlv493-2f-utils:
	-$(RM) ./Core/Drivers/tlv493/utils/BusUnterface.cyclo ./Core/Drivers/tlv493/utils/BusUnterface.d ./Core/Drivers/tlv493/utils/BusUnterface.o ./Core/Drivers/tlv493/utils/BusUnterface.su ./Core/Drivers/tlv493/utils/RegMask.cyclo ./Core/Drivers/tlv493/utils/RegMask.d ./Core/Drivers/tlv493/utils/RegMask.o ./Core/Drivers/tlv493/utils/RegMask.su

.PHONY: clean-Core-2f-Drivers-2f-tlv493-2f-utils

