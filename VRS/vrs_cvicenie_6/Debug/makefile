################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32F3xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include Core/Drivers/tlv493c/subdir.mk
-include Core/Drivers/LPS25HB/subdir.mk
-include Core/Drivers/HTS221/subdir.mk
-include Core/Drivers/HID/src/typec/subdir.mk
-include Core/Drivers/HID/src/portable/wch/subdir.mk
-include Core/Drivers/HID/src/portable/valentyusb/eptri/subdir.mk
-include Core/Drivers/HID/src/portable/ti/msp430x5xx/subdir.mk
-include Core/Drivers/HID/src/portable/template/subdir.mk
-include Core/Drivers/HID/src/portable/synopsys/dwc2/subdir.mk
-include Core/Drivers/HID/src/portable/sunxi/subdir.mk
-include Core/Drivers/HID/src/portable/st/typec/subdir.mk
-include Core/Drivers/HID/src/portable/st/stm32_fsdev/subdir.mk
-include Core/Drivers/HID/src/portable/sony/cxd56/subdir.mk
-include Core/Drivers/HID/src/portable/renesas/rusb2/subdir.mk
-include Core/Drivers/HID/src/portable/raspberrypi/rp2040/subdir.mk
-include Core/Drivers/HID/src/portable/raspberrypi/pio_usb/subdir.mk
-include Core/Drivers/HID/src/portable/ohci/subdir.mk
-include Core/Drivers/HID/src/portable/nxp/lpc_ip3511/subdir.mk
-include Core/Drivers/HID/src/portable/nxp/lpc17_40/subdir.mk
-include Core/Drivers/HID/src/portable/nxp/khci/subdir.mk
-include Core/Drivers/HID/src/portable/nuvoton/nuc505/subdir.mk
-include Core/Drivers/HID/src/portable/nuvoton/nuc121/subdir.mk
-include Core/Drivers/HID/src/portable/nuvoton/nuc120/subdir.mk
-include Core/Drivers/HID/src/portable/nordic/nrf5x/subdir.mk
-include Core/Drivers/HID/src/portable/mindmotion/mm32/subdir.mk
-include Core/Drivers/HID/src/portable/microchip/samx7x/subdir.mk
-include Core/Drivers/HID/src/portable/microchip/samg/subdir.mk
-include Core/Drivers/HID/src/portable/microchip/samd/subdir.mk
-include Core/Drivers/HID/src/portable/microchip/pic32mz/subdir.mk
-include Core/Drivers/HID/src/portable/microchip/pic/subdir.mk
-include Core/Drivers/HID/src/portable/mentor/musb/subdir.mk
-include Core/Drivers/HID/src/portable/espressif/esp32sx/subdir.mk
-include Core/Drivers/HID/src/portable/ehci/subdir.mk
-include Core/Drivers/HID/src/portable/dialog/da146xx/subdir.mk
-include Core/Drivers/HID/src/portable/chipidea/ci_hs/subdir.mk
-include Core/Drivers/HID/src/portable/chipidea/ci_fs/subdir.mk
-include Core/Drivers/HID/src/portable/bridgetek/ft9xx/subdir.mk
-include Core/Drivers/HID/src/portable/analog/max3421/subdir.mk
-include Core/Drivers/HID/src/host/subdir.mk
-include Core/Drivers/HID/src/device/subdir.mk
-include Core/Drivers/HID/src/common/subdir.mk
-include Core/Drivers/HID/src/class/video/subdir.mk
-include Core/Drivers/HID/src/class/vendor/subdir.mk
-include Core/Drivers/HID/src/class/usbtmc/subdir.mk
-include Core/Drivers/HID/src/class/net/subdir.mk
-include Core/Drivers/HID/src/class/msc/subdir.mk
-include Core/Drivers/HID/src/class/midi/subdir.mk
-include Core/Drivers/HID/src/class/hid/subdir.mk
-include Core/Drivers/HID/src/class/dfu/subdir.mk
-include Core/Drivers/HID/src/class/cdc/subdir.mk
-include Core/Drivers/HID/src/class/bth/subdir.mk
-include Core/Drivers/HID/src/class/audio/subdir.mk
-include Core/Drivers/HID/src/subdir.mk
-include Core/Drivers/HID/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := vrs_cvicenie_6
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
vrs_cvicenie_6.elf \

MAP_FILES += \
vrs_cvicenie_6.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
vrs_cvicenie_6.list \


# All Target
all: main-build

# Main-build Target
main-build: vrs_cvicenie_6.elf secondary-outputs

# Tool invocations
vrs_cvicenie_6.elf vrs_cvicenie_6.map: $(OBJS) $(USER_OBJS) /home/maros-pc/school/7_semester/VRS/vrs_cvicenie_6/STM32F303K8TX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "vrs_cvicenie_6.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/home/maros-pc/school/7_semester/VRS/vrs_cvicenie_6/STM32F303K8TX_FLASH.ld" --specs=nosys.specs -Wl,-Map="vrs_cvicenie_6.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -u _printf_float -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

vrs_cvicenie_6.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "vrs_cvicenie_6.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) default.size.stdout vrs_cvicenie_6.elf vrs_cvicenie_6.list vrs_cvicenie_6.map
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
