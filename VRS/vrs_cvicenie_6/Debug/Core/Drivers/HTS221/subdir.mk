################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Drivers/HTS221/hts221.c 

OBJS += \
./Core/Drivers/HTS221/hts221.o 

C_DEPS += \
./Core/Drivers/HTS221/hts221.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Drivers/HTS221/%.o Core/Drivers/HTS221/%.su Core/Drivers/HTS221/%.cyclo: ../Core/Drivers/HTS221/%.c Core/Drivers/HTS221/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F303x8 -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Drivers-2f-HTS221

clean-Core-2f-Drivers-2f-HTS221:
	-$(RM) ./Core/Drivers/HTS221/hts221.cyclo ./Core/Drivers/HTS221/hts221.d ./Core/Drivers/HTS221/hts221.o ./Core/Drivers/HTS221/hts221.su

.PHONY: clean-Core-2f-Drivers-2f-HTS221

