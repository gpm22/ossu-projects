# Project 7: VM I: Stack Arithmetic

The objective of this projected id to build a basic VM translator that implements the arithmetic-logical and push/pop commands of the VM language. For the purpose of this project, This version of the VM translator assumes that the source VM code is error-free. Error checking, reporting and handling can be added to later versions of the VM translator, but are not part of this project.

More information about this project is available on https://www.nand2tetris.org/course

The files of the VM Translator are in [VMTranslator](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/07/VMTranslator).

## VM Translator Usage

This VM Translator accepts a single command-line argument, as follows,

  ```bash
  prompt> ruby VMTranslator.rb Prog.vm
  ```

* Where the input file `Prog.vm` contains VM instructions (the `.vm` extension is mandatory and the first character in the file name must be an uppercase letter).

* The file name may contain a file path.

* If **no path** is specified, the VM translator operates on the current folder.

* The file contains a sequence of one or more VM commands.

* The VM Translator creates an output file named `Prog.asm` and writes the assembly instructions into it.

* The output file is created in the same folder as the input file.

  * If there is a file by this name in the folder, it will be **overwritten**.

## Definitions of the VM Translator components

The API's for the components are

* **`Parser`**

  | Routine                     | Arguments           | Returns                                                      | Function                                                     |
  | --------------------------- | ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | `Constructor`/`initializer` | Input file / stream | -                                                            | Opens the input file / stream, and gets ready to parse it.   |
  | `hasMoreLines`              | -                   | boolean                                                      | Are there more lines in the input?                           |
  | `advance`                   | -                   | -                                                            | Reads the next command from the input and makes it the current command. This routine should be called only if `hasMoreLines` is true. Initially there is no current command. |
  | `commandType`               | -                   | `C_ARITHMETIC`, `C_PUSH`, `C_POP`, `C_LABEL`, `C_GOTO`, `C_IF`, `C_FUNCTION`, `C_RETURN`, `C_CALL`  (constant) | Returns a constant representing the type of the current command. If the current command is an arithmetic-logical command, returns `C_ARITHMETIC`. |
  | `arg1`                      | -                   | string                                                       | Returns the first argument of the current command. In the case of `C_ARITHMETIC`, the command itself (`add`, `sub`, etc.) is returned. Should not be called if the current command is `C_RETURN |
  | `arg2`                      | -                   | integer                                                      | Returns the second argument of the current command. Should be called only if the current command is `C_PUSH`, `C_POP`, `C_FUNCTION`, or `C_CALL`. |

* **`CodeWriter`**

  | Routine                     | Arguments                                                    | Returns | Function                                                     |
  | --------------------------- | ------------------------------------------------------------ | ------- | ------------------------------------------------------------ |
  | `Constructor`/`initializer` | Output file / stream                                         | -       | Opens an output file / stream, and gets ready to write into it. |
  | `writeArithmetic`           | `command` (String)                                           | -       | Writes to the output file the assembly code that implements the given arithmetic-logical `command`. |
  | `writePushPop`              | `command` (`C_PUSH` or `C_POP`), `segment` (string), `index` (integer) | -       | Writes to the output file the assembly code that implements the given push or pop `command`. |
  | `close`                     | -                                                            | -       | Closes the output file / stream.                             |