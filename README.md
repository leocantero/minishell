# msh (Minishell)

> A modular Unix command interpreter implemented in C, leveraging compiler design paradigms.

## 1. About the Project
This project is a modular implementation of a Unix-like shell. The core objective is to explore low-level process management, file descriptor handling, and the translation of formal languages into kernel operations using an **Abstract Syntax Tree (AST)**.

## 2. System Architecture
The interpreter is divided into three fundamental layers:
* **Lexer (Flex):** Tokenizes the input stream based on a formal grammar.
* **Parser (Bison):** Constructs an AST representing the hierarchical structure of commands.
* **Executor:** Traverses the AST to perform task execution using `fork()`, `execvp()`, and managing pipelines with `pipe()` and `dup2()`.

## 3. Technical Specifications
* **Language:** C (C99/C11 standard).
* **Parsing Tools:** Flex & Bison.
* **Target System:** POSIX (Linux/macOS).
* **Memory Management:** Rigorous tracking using `valgrind` to prevent leaks throughout the AST lifecycle.

## 4. Build and Run
This project uses a modular `Makefile` system.

```bash
# Clone the repository
git clone <repo-url>
cd msh

# Compile the project
make

# Run the shell
./msh
