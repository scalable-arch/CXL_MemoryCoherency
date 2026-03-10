/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright 2019 Western Digital Corporation or its affiliates.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/ 

/*
 Linker script
*/


ENTRY(_start)

MEMORY
{
	RAM  (wxa!ri) : ORIGIN = 0x7fe00300 , LENGTH = 64K
}

/*----------------------------------------------------------------------*/
/* Sections                                                             */
/*----------------------------------------------------------------------*/

SECTIONS
{
  __stack_size = DEFINED(__stack_size) ? __stack_size : 4K;

  .text.init	:
  {
	*(.text.init)
	. = ALIGN(16);
  } > RAM
  
    .note.gnu.build-id :
  {
    KEEP(*(.note.gnu.build-id))
    . = ALIGN(16);
  } > RAM

  .text :
  {
    *(.text.unlikely .text.unlikely.*)
    *(.text.startup .text.startup.*)
    *(.text .text.*)
    *(.gnu.linkonce.t.*)
	. = ALIGN(16);
  } > RAM

  .rodata	:
  {
    *(.rdata)
    *(.rodata .rodata.*)
    *(.gnu.linkonce.r.*)
	. = ALIGN(16);
  } > RAM

  .data	:
  {
	*(.data .data.*)
    *(.gnu.linkonce.d.*)
	. = ALIGN(16);
  } > RAM
  
  .sdata :
  {
	. = ALIGN(16);
    *(.sdata .sdata.*)
    *(.gnu.linkonce.s.*)
    . = ALIGN(16);
    *(.srodata .srodata.*)
	. = ALIGN(16);
  } > RAM

  .sbss :
  {
    *(.sbss .sbss.* .gnu.linkonce.sb.*)
    *(.scommon)
	. = ALIGN(16);
  } > RAM
  
  .bss :
  {
	__bss_start__ = .;
	*(.bss)
	__bss_end__ = .;
	. = ALIGN(16);
  } > RAM

  _end = .;

  .stack : ALIGN(16)
  {
	_heap_end = .;
	. = . + __stack_size;
	_sp = .;
	__stack_start__ = .;
	__alt_stack_pointer = .;
  } > RAM
}
