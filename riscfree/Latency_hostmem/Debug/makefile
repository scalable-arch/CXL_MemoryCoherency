################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(SX_DEPS)),)
-include $(SX_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
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


BUILD_ARTIFACT_NAME := Latency_hostmem
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
Latency_hostmem.hex \

SECONDARY_SIZE += \
Latency_hostmem.siz \


# All Target
all: main-build

# Main-build Target
main-build: Latency_hostmem.elf secondary-outputs

# Tool invocations
Latency_hostmem.elf: $(OBJS) $(USER_OBJS) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU Arm Cross C Linker'
	aarch64-none-elf-gcc -mcpu=generic+simd -mcmodel=small -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -g3 -T "/home/wjdtjarla4/CXL/CXL_MemoryCoherency/riscfree/Latency_hostmem/src/link.ld" -nostartfiles -Xlinker --gc-sections -Xlinker --no-warn-rwx-segments -Wl,-Map,"Latency_hostmem.map" --specs=nosys.specs -o "Latency_hostmem.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Latency_hostmem.hex: Latency_hostmem.elf makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: GNU Arm Cross Create Flash Image'
	aarch64-none-elf-objcopy -O ihex "Latency_hostmem.elf"  "Latency_hostmem.hex"
	@echo 'Finished building: $@'
	@echo ' '

Latency_hostmem.siz: Latency_hostmem.elf makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: GNU Arm Cross Print Size'
	aarch64-none-elf-size --format=berkeley "Latency_hostmem.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(SX_DEPS)$(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) Latency_hostmem.elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents main-build

-include ../makefile.targets
