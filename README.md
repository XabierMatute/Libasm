# Libasm: Assembly Yourself!

## Overview

**Libasm** is a project that showcases the power and elegance of assembly language programming. It implements several standard C library functions in x86-64 assembly, providing a deeper understanding of low-level programming and system calls. This project is a technical challenge aimed at improving performance and exploring the intricacies of assembly language.

The implemented functions include:
- `ft_strlen`: Calculates the length of a string.
- `ft_strcpy`: Copies a string from source to destination.
- `ft_strcmp`: Compares two strings lexicographically.
- `ft_write`: Writes data to a file descriptor.
- `ft_read`: Reads data from a file descriptor.
- `ft_strdup`: Duplicates a string by allocating memory dynamically.

## Features

### Functionality
- **String Manipulation**: Efficient implementations of `strlen`, `strcpy`, and `strcmp`.
- **File I/O**: Low-level system calls for reading and writing data.
- **Memory Management**: Dynamic memory allocation for string duplication.

### Assembly Language
- **Optimized Code**: Direct interaction with CPU registers and memory.
- **System Calls**: Leveraging Linux system calls for file I/O operations.
- **Error Handling**: Proper management of errors using `errno`.

### Testing
- Comprehensive tests for each function are provided in [`main.c`](Libasm/main.c), ensuring correctness and reliability.

## Code Structure

### Core Functions
- [`ft_strlen.s`](Libasm/ft_strlen.s): Calculates the length of a string.
- [`ft_strcpy.s`](Libasm/ft_strcpy.s): Copies a string from source to destination.
- [`ft_strcmp.s`](Libasm/ft_strcmp.s): Compares two strings lexicographically.
- [`ft_write.s`](Libasm/ft_write.s): Writes data to a file descriptor.
- [`ft_read.s`](Libasm/ft_read.s): Reads data from a file descriptor.
- [`ft_strdup.s`](Libasm/ft_strdup.s): Duplicates a string by allocating memory dynamically.

### Extra Functions
- [`ft_putchar.s`](Libasm/extra/ft_putchar.s): Writes a single character to standard output.
- [`hw.s`](Libasm/extra/hw.s): Prints "Holi mundo!" to standard output.

### Testing and Compilation
- [`main.c`](Libasm/main.c): Contains test cases for all implemented functions.
- [`Makefile`](Libasm/Makefile): Automates the compilation process.

## Competencies Involved

### Technical Skills
- **Assembly Programming**: Writing efficient and optimized code in x86-64 assembly.
- **System Calls**: Direct interaction with the operating system for file I/O.
- **Memory Management**: Handling dynamic memory allocation and error cases.

### Problem-Solving
- **Optimization**: Reducing overhead and improving performance.
- **Error Handling**: Managing edge cases and system-level errors.

### Collaboration
- **Teamwork**: Sharing knowledge and debugging assembly code collaboratively.
- **Documentation**: Writing clear and concise comments and README files.

## How to Run

1. Clone the repository.
2. Run `make` to compile the library.
3. Use `make test` to compile and execute the test cases.

## Acknowledgments

Special thanks to the assembly programming community for their support and resources.