# Project 6: Assembler

The objective of this project is to develop an **assembler** that translates programs written in the Hack assembly language into Hack binary code. This version of the assembler assumes that the source assembly code is valid. Error checking, reporting and handling can be added to later versions of the assembler, but are not part of this project.

More information about this project is available on https://www.nand2tetris.org/course

The files of the Assembler are in [assembler](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/06/assembler).

## Assembler Usage

This assembler accepts a single command-line argument, as follows,

  ```bash
  prompt> ruby HackAssembler.rb Prog.asm
  ```

* Where the input file `Prog.asm` contains assembly instructions (the `.asm` extension is mandatory).

* The file name may contain a file path.

* If **no path** is specified, the assembler operates on the current folder.

* The assembler creates an output file named `Prog.hack` and writes the translated binary instructions into it.

* The output file is created in the same folder as the input file.

  * If there is a file by this name in the folder, it will be **overwritten**.

## Definitions of the assembler components

The api for the components are:

* **Parser**

  | Routine                   | Arguments           | Returns                                                      | Function                                                     |
  | ------------------------- | ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | Constructor / initializer | Input file / stream | -                                                            | Opens the input file / stream ang gets ready to parse it.    |
  | `hasMoreLines`            | -                   | boolean                                                      | Are there more lines in the input?                           |
  | `advance`                 | -                   | -                                                            | Skips over white space and comments, if necessary. Reads the next instruction from the input, and makes it the current instruction. This routine should be called only if `hasMoreLines`is **true**. Initially there is no current instruction. |
  | `instructionType`         | -                   | `A_INSTRUCTION`, `C_INSTRUCTION`, `L_INSTRUCTION`, (constants) | Return the type of the current instruction: `A_INSTRUCTION` for `@xxx`, where `xxx`is either decimal number or a symbol; `C_INSTRUCTION` for `dest=comp;jump´` ; `L_INSTRUCTION` for `(xxx)`, where `xxx` is a symbol. |
  | `symbol`                  | -                   | string                                                       | If the current instruction is `(xxx)`, returns the symbol `xxx`. If the current instruction is `@xxx`, returns the symbol or decimal `xxx` (as a string). Should be called only if `instructionType` is `A_INSTRUCTION` or `L_INSTRUCTION` |
  | `dest`                    | -                   | string                                                       | Returns the symbolic `dest` part of the current `C_INSTRUCTION` (8 possibilities). Should be called only if `instructionType` is `C_INSTRUCTION`. |
  | `comp`                    | -                   | string                                                       | Returns the symbolic `comp` part of the current `C_INSTRUCTION` (28 possibilities). Should be called only if `instructionType` is `C_INSTRUCTION`. |
  | `jump`                    | -                   | string                                                       | Returns the symbolic `jump` part of the current `C_INSTRUCTION` (8 possibilities). Should be called only if `instructionType` is `C_INSTRUCTION`. |

* **Code**

  | Routine | Arguments | Returns             | Function                                        |
  | ------- | --------- | ------------------- | ----------------------------------------------- |
  | `dest`  | string    | 3 bits, as a string | Returns the binary code of the `dest` mnemonic. |
  | `comp`  | string    | 7 bits, as a string | Returns the binary code of the `comp` mnemonic. |
  | `jump`  | string    | 3 bits, as a string | Returns the binary code of the `jump` mnemonic. |

* **Symbol Table**

  | Routine                   | Arguments                      | Returns | Function                                        |
  | ------------------------- | ------------------------------ | ------- | ----------------------------------------------- |
  | Constructor / initializer | -                              | -       | Creates a new empty symbol table.               |
  | `addEntry`                | symbol (string), address (int) | -       | Adds `<symbol, address>` to the table.          |
  | `contains`                | symbol (string)                | boolean | Does the symbol table contain the given symbol? |
  | `getAddress`              | symbol (string)                | int     | Returns the address associated with the symbol. |
