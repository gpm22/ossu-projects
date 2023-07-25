# Project 8: VM II: Program Control

The objective of this project is to build a VM translator that implements the arithmetic-logical, push/pop, branching, and function commands of the VM language. For the purpose of this project, This version of the VM translator assumes that the source VM code is error-free. Error checking, reporting and handling can be added to later versions of the VM translator, but are not part of this project.

More information about this project is available on https://www.nand2tetris.org/course

The files of the VM Translator are in [VMTranslator](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/08/VMTranslator).

## VM Translator Usage

This VM Translator accepts a single command-line argument, as follows,

  ```bash
  prompt> ruby VMTranslator.rb source
  ```

* Where **`source`** is either a **file name** of the form `Xxx.vm` (the extension is mandatory and the first character in the file name must be an uppercase letter) or the **name of a folder** (in which case there is no extension) containing one or more .vm files.

  * The file/folder name may contain a file path.
  * If no path is specified, the translator operates on the current folder.

* The **output** of the VM translator is a single assembly file, named **`source.asm`**.

  * If `source` is a **folder name**, the single .asm file contains the translation of all the functions in all the .vm files in the folder, one after the other.
  * The output file is created in the **same folder** as the input file.
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
  | `Constructor`/`initializer` | Output file / stream                                         | -       | **Opens** an output file / stream, and gets ready to write into it. **Writes** the assembly instructions that effect the bootstrap code that starts the program's execution. this code must be placed at the beginning of the generated output file/stream. |
  | `setFileName`               | `fileName`(String)                                           | -       | Informs that the translation of a new VM file has started. (Called by the `VMTranslator`) |
  | `writeArithmetic`           | `command` (String)                                           | -       | Writes to the output file the assembly code that implements the given arithmetic-logical `command`. |
  | `writePushPop`              | `command` (`C_PUSH` or `C_POP`), `segment` (string), `index` (integer) | -       | Writes to the output file the assembly code that implements the given push or pop `command`. |
  | `writeLabel`                | `label` (string)                                             | -       | Write assembly code that effects the `label` command.        |
  | `writeGoto`                 | `label` (string)                                             | -       | Write assembly code that effects the `goto` command.         |
  | `writeIf`                   | `label` (string)                                             | -       | Write assembly code that effects the `if-goto` command.      |
  | `writeFunction`             | `functionName` (string), `nVars`(int)                        | -       | Write assembly code that effects the `function` command.     |
  | `writeCall`                 | `functionName` (string), `nArgs`(int)                        | -       | Write assembly code that effects the `call` command.         |
  | `writeReturn`               | -                                                            | -       | Write assembly code that effects the `return` command.       |
  | `close`                     | -                                                            | -       | Closes the output file / stream.                             |