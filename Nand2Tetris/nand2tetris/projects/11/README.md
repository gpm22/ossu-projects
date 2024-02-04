# 11 - Compiler II: Code Generation

The objective of this project is to first extend the Syntax Analyzer built in chapter 10 ([`JackAnalyzer`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/10/JackAnalyzer)) into a full-scale Jack compiler. Then apply your compiler to all the test programs described below. Execute each translated program, and make sure that it operates according to its given documentation. This version of the compiler assumes that the source Jack code is error-free.

More information about this project is available on https://www.nand2tetris.org/course

The files of the Compiler are in [`JackCompiler`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/11/JackCompiler).

## Compiler Usage

This Jack Compiler accepts a single command-line argument, as follows,

  ```bash
prompt> ruby JackCompiler.rb source
  ```

* Where **`source`** is either a **file name** of the form `Xxx.jack` (the extension is mandatory and the first character in the file name must be an uppercase letter) or the **name of a folder** (in which case there is no extension) containing one or more .jack files.

  * The file/folder name may contain a file path.
  * If no path is specified, the translator operates on the current folder.

* **Output** of the Jack Compiler.
* For each `Xxx.jack` file, the Jack Compiler creates an output file `Xxx.vm` and writes the compiled output into it.

* The output file is created in the same folder as that of the input.

* If there is a file by this name in the folder, it will be overwritten.

## Definitions of the Compiler components

The API's for the Compiler components are:

* **`CompilationEngine`**

  | Routine                   | Arguments                                 | Returns | Function                                                     |
  | ------------------------- | ----------------------------------------- | ------- | ------------------------------------------------------------ |
  | Constructor / initializer | Input - file/Stream, Output - file/Stream | -       | Creates a new compilation engine with the given input and output. The next routine called (by the `JackAnalyzer`module) must be `compileClass`. |
  | `compileClass`            | -                                         | -       | Compiles a complete class.                                   |
  | `compileClassVarDec`      | -                                         | -       | Compiles a static variable declaration, or a field declaration. |
  | `compileSubroutine`       | -                                         | -       | Compiles a complete method, function or constructor.         |
  | `compileParameterList`    | -                                         | -       | Compiles a (possible empty) parameter list. Does not handle the enclosing parentheses tokens `(` and `)` |
  | `compileSubroutineBody`   | -                                         | -       | Compiles a subroutine's body.                                |
  | `compileVarDec`           | -                                         | -       | Compiles a `var` declaration.                                |
  | `compileStatements`       | -                                         | -       | Compiles a sequence of statements. Does not handle the enclosing curly bracket token `{` and `}`. |
  | `compileLet`              | -                                         | -       | Compiles a `let` statement.                                  |
  | `compileIf`               | -                                         | -       | Compiles an `if` statement, possibly with a trailing `else`clause. |
  | `compileWhile`            | -                                         | -       | Compiles a `while` statement.                                |
  | `compileDo`               | -                                         | -       | Compiles a `do` statement.                                   |
  | `compileReturn`           | -                                         | -       | Compiles a `return` statement.                               |
  | `compileExpression`       | -                                         | -       | Compiles an `expression`.                                    |
  | `compileTerm`             | -                                         | -       | Compiles a `term`. If the current token is an `identifier`, the routine must resolve it into a `variable`, an `array element`, or a `subroutine call`. A single lookahead token, which may be `[`, `(`, or, `.`, suffices to distinguish between the possibilities. Any other token is not part of this term and should not be advanced over. |
  | `compileExpressionList`   | -                                         | `int`   | Compiles a (possible empty) comma-separated list of expressions. Returns the number of expressions in the list. |

* **`JackTokenizer`**

  | Routine                  | Arguments          | Returns                                                      | Function                                                     |
  | ------------------------ | ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | Constructor/ initializer | Input file/ stream | -                                                            | Opens the input .jack file / stream and gets ready to tokenize it |
  | `hasMoreTokens`          | -                  | `boolean`                                                    | Are there more tokens in the input?                          |
  | `advance`                | -                  | -                                                            | Gets the next token from the input, and makes it the current token. This method should be called only if `hasMoreTokens` is true. Initially there is no current token. |
  | `tokenType`              | -                  | `KEYWORD`, `SYMBOL`, `IDENTIFIER`, `INT_CONST`, `STRING_CONST` | Returns the type of the current token, as a constant.        |
  | `keyWord`                | -                  | `CLASS`, `METHOD`, `FUNCTION`, `CONSTRUCTOR`, `INT`, `BOOLEAN`, `CHAR`, `VOID`, `VAR`, `STATIC`, `FIELD`, `LET`, `DO`, `IF`, `ELSE`, `WHILE`, `RETURN`, `TRUE`, `FALSE`, `NULL`, `THIS` | Returns the keyword which is the current token, as a constant. This method should be called only if `tokenType` is `KEYWORD`. |
  | `symbol`                 | -                  | `char`                                                       | Returns the character which is the current token. Should be called only if `tokenType`is `SYMBOL`. |
  | `identifier`             | -                  | `string`                                                     | Returns the string which is the current token. Should be called only if `tokenType` is `INDETIFIER`. |
  | `intVal`                 | -                  | `int`                                                        | Returns the integer value of the current token. Should be called only if `tokenType` is `INT_CONST`. |
  | `stringVal`              | -                  | `string`                                                     | Returns the string value of the current token, without the opening and closing double quotes. Should be called only if `tokenType` is `STRING_CONST`. |

* **`VMWriter`**

  | Routine                  | Arguments                                                    | Returns | Function                                                     |
  | ------------------------ | ------------------------------------------------------------ | ------- | ------------------------------------------------------------ |
  | Constructor/ initializer | Output file/ stream                                          | -       | Creates a new output `.vm` file/stream, and prepares it for writing. |
  | `writePush`              | `segment` (`CONSTANT`, `ARGUMENT`, `LOCAL`, `STATIC`, `THIS`, `THAT`, `POINTER`, `TEMP`), `index` (`int`) | -       | Writes a VM `push` command.                                  |
  | `writePop`               | `segment` (`ARGUMENT`, `LOCAL`, `STATIC`, `THIS`, `THAT`, `POINTER`, `TEMP`), `index` (`int`) | -       | Writes a VM `pop` command.                                   |
  | `writeArithmetic`        | `command` (`ADD`, `SUB`, `NEG`, `EQ`, `GT`, `LT`, `AND`, `OR`, `NOT`) | -       | Writes a VM arithmetic-logical command.                      |
  | `writeLabel`             | `label` (String)                                             | -       | Writes a VM `label` command.                                 |
  | `writeGoto`              | `label` (String)                                             | -       | Writes a VM `goto` command.                                  |
  | `writeIf`                | `label` (String)                                             | -       | Writes a VM `if-goto` command.                               |
  | `writeCall`              | `name` (String), `nArgs` (`int`)                             | -       | Writes a VM `call` command.                                  |
  | `writeFunction`          | `name` (String), `nArgs` (`int`)                             | -       | Writes a VM `function` command.                              |
  | `writeReturn`            | -                                                            | -       | Writes a VM `return` command.                                |
  | `close`                  | -                                                            | -       | Closes the output file/stream.                               |

  

* **`SymbolTable`**

  | Routine                 | Arguments                                                    | Returns                                   | Function                                                     |
  | ----------------------- | ------------------------------------------------------------ | ----------------------------------------- | ------------------------------------------------------------ |
  | Constructor/initializer | -                                                            | -                                         | Creates a new symbol table.                                  |
  | `reset`                 | -                                                            | -                                         | Empties the symbol table, and resets the four indexes to 0. Should be called when starting to compile a subroutine declaration. |
  | `define`                | `name`(String), `type` (String), `kind` (`STATIC`, `FIELD`, `ARG`, or `VAR`) | -                                         | Defines (adds to the table) a new variable of the given `name`, `type`, and `kind`. Assigns to it the index value of that `kind`, and adds 1 to the index. |
  | `varCount`              | `kind` (`STATIC`, `FIELD`, `ARG`, or `VAR`,)                 | `int`                                     | Returns the number of variables of the given `kind` already defined in the table. |
  | `kindOf`                | `name` (String)                                              | (`STATIC`, `FIELD`, `ARG`, `VAR`, `NONE`) | Returns the `kind` of the named identifier. If the identifier is not found, returns `NONE`. |
  | `typeOf`                | `name` (String)                                              | String                                    | Returns the `type` of the named variable.                    |
  | `indexOf`               | `name` (String)                                              | `int`                                     | Returns the `index` of the named variable.                   |

## Test Programs

### [`Seven`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/11/Seven)

Tests how the compiler handles a simple program containing an arithmetic expression with integer constants but without variables, a do statement, and a return statement. Specifically, the program computes the expression `1 + (3 * 2)` and prints its value at the top left of the screen.

### [`ConvertToBin`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/11/ConvertToBin)

Tests how the compiler handles all the procedural elements of the Jack language:

* **expressions** (without arrays or method calls)
* **functions**
* The statements **`if`**, **`while`**, **`do`**, **`let`** and **`return`**.

The program does not test the handling of methods, constructors, arrays, strings, static variables, and field variables. Specifically, the program gets a 16-bit decimal value from RAM[8000], converts it to binary, and stores the individual bits in RAM[8001],...,RAM[8016] (each location will contain 0 or 1). Before the conversion starts, the program initializes RAM[8001],...,RAM[8016] to -1.

### [`Square`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/11/Square)

Tests how the compiler handles the object-based features of the Jack language:

* **constructors**
* **methods**
* **fields**,
* **expressions** that include **method calls**.

Does not test the handling of static variables. Specifically, the program launches a simple interactive
"game" that enables moving a black square around the screen, using the keyboard’s four arrow
keys. While moving, the size of the square can be increased and decreased anytime by pressing the
'z' and 'x' keys, respectively. To quit the game, press the 'q' key. 

### [`Average`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/11/Average)

Tests how the compiler handles arrays, and strings. This is done by computing the average of a user-supplied sequence of integers. 

### [`Pong`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/11/Pong)

A complete test of how the compiler handles an object-based application, including the handling of **objects** and **static variables**. In the classical Pong game, a ball is moving randomly, bouncing off the screen "walls." The user tries to hit the ball with a small paddle which can be moved by pressing the keyboard’s left and right arrow keys. Each time the paddle hits the ball, the user scores a point and the paddle shrinks a little, making the game increasingly more challenging. If the user misses and the ball hits the “floor”, the game is over.

### [`ComplexArrays`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/11/ComplexArrays)

Tests how the compiler handles **complex array** references, and **expressions**. To that end, the program performs five complex calculations using arrays. For each such calculation, the program prints on the screen the expected result, along with the actual result, as performed by the compiled program.