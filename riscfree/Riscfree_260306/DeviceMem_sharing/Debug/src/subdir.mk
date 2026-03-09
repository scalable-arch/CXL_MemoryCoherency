################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/main.c 

S_UPPER_SRCS += \
../src/init.S 

OBJS += \
./src/init.o \
./src/main.o 

S_UPPER_DEPS += \
./src/init.d 

C_DEPS += \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.S src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross Assembler'
	aarch64-none-elf-gcc -mcpu=generic+simd -mcmodel=small -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -g3 -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	aarch64-none-elf-gcc -mcpu=generic+simd -mcmodel=small -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -g3 -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


