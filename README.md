# Nano-Kernel.
NanoKernel is a lightweight and educational operating system kernel developed for the x86 architecture as part of an academic project. The objective of this project is to understand how an operating system works at a low level, from the booting process to kernel execution and direct hardware interaction.

The system starts with a custom bootloader written in Assembly language, which loads the kernel into memory and switches the processor into protected mode. After booting, the kernel—implemented in C—initializes essential components such as basic memory management, the Global Descriptor Table (GDT), and the Interrupt Descriptor Table (IDT). These components enable protected mode operation and allow the system to handle interrupts correctly.

NanoKernel also includes basic screen output using VGA text mode, enabling the kernel to display messages directly on the screen. This feature is important for debugging and understanding kernel execution in a low-level environment without standard libraries.

The project is built using a GCC cross-compiler and NASM, with a Makefile managing the build process. Testing is performed using emulators such as QEMU or Bochs to ensure correct booting, kernel loading, and stable execution. All core features have been successfully implemented and tested.

NanoKernel is designed mainly for learning and academic purposes. While minimal in functionality, it provides a strong foundation for future extensions such as keyboard input, multitasking, file system support, and a simple command-line shell.
