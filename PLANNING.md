# Minishell Project - Architectural Planning

## 1. Project Overview
The Minishell project aims to build a functional Unix-like command-line interpreter. This project focuses on the **Compiler/Interpreter design patterns** by utilizing formal grammar analysis for parsing and **POSIX system calls** for command execution.

## 2. Development Phases

### Phase 1: Setup & Formal Analysis (The Compiler Core)
* **Goal:** Define the language grammar and tokenization logic.
* **Tasks:**
    * Setup `flex` (Lexer) and `bison` (Parser) integration in `Makefile`.
    * Define token types: `WORD`, `PIPE`, `REDIRECT_IN`, `REDIRECT_OUT`.
    * Define the **BNF (Backus-Naur Form)** grammar for commands, pipelines, and redirections.
* **Deliverable:** A functional parser that accepts command strings and constructs an **Abstract Syntax Tree (AST)**.

### Phase 2: AST Structure & Semantic Foundation
* **Goal:** Define the internal representation of the user command.
* **Tasks:**
    * Design the C `struct` to hold command arguments and pipe/redirection links.
    * Implement nodes traversal functions to validate the command structure before execution.
* **Deliverable:** A debug feature (`--print-ast`) that verifies the parsing logic.

### Phase 3: Runtime Execution (The Kernel Interface)
* **Goal:** Map the AST nodes to system operations.
* **Tasks:**
    * Implement **Built-ins** (`cd`, `exit`, `pwd`) within the process lifecycle.
    * Implement **External Execution** using `fork()` and `execvp()`.
    * Implement **Pipes & Redirections** using `pipe()` and `dup2()`.
* **Deliverable:** A working shell capable of executing pipelines.

### Phase 4: System Integration & Polish
* **Goal:** Ensure stability and professional standards.
* **Tasks:**
    * Signal Handling (`SIGINT`, `SIGQUIT`).
    * Memory management audits using `Valgrind`.
    * Comprehensive testing suite.
* **Deliverable:** A polished, memory-leak-free shell.

## 3. Planning Timeline (8-Week Estimate)

| Week | Focus Area | Key Milestone |
| :--- | :--- | :--- |
| 1-2 | Lexer/Parser Design | AST Generation functional. |
| 3 | Command Infrastructure | Simple execution (no pipes). |
| 4 | Built-ins Logic | Full support for `cd` and `exit`. |
| 5-6 | Pipe & Redirection | Handling complex I/O between processes. |
| 7 | Signal & Memory | Stability and signal management. |
| 8 | Docs & Testing | Final Polish and GitHub README. |
