# 10 - Compiler I: Syntax Analysis

The objective of this project is to build a syntax analyzer that parses Jack programs according to the Jack grammar.
For the purpose of this project, this version of the syntax analyzer assumes that the source Jack code is error-free.

More information about this project is available on https://www.nand2tetris.org/course

The files of the Syntax Analyzer are in [`JackAnalyzer`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/10/JackAnalyzer).

## Syntax Analyzer Usage

This VM Translator accepts a single command-line argument, as follows,

  ```bash
  prompt> ruby JackAnalyzer.rb source
  ```

* Where **`source`** is either a **file name** of the form `Xxx.jack` (the extension is mandatory and the first character in the file name must be an uppercase letter) or the **name of a folder** (in which case there is no extension) containing one or more .jack files.

  * The file/folder name may contain a file path.
  * If no path is specified, the translator operates on the current folder.

* **Output** of the Syntax Analyzer.
* For each `Xxx.jack` file, the Syntax Analyzer creates an output file `Xxx.xml` and writes the parsed output into it.
  
* The output file is created in the same folder as that of the input.
  
* If there is a file by this name in the folder, it will be overwritten.


## Definitions of the Syntax Analyzer components

The API's for the components are

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
