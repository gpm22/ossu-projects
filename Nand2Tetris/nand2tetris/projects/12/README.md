# 12 - Jack Standard Library

The objective of this project is to implement the Jack standard library, which consists of eight .Jack class files, each realizing a library of commonly used OS services such as input / output drivers, math operations, string processing, and memory management.

More information about this project is available on https://www.nand2tetris.org/course.

Each class is in its respective test directory and all can be found in [`FinalTest`](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/12/FinalTest).

## Standard Classes

### [`Math`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/MathTest/Math.jack)

Provides mathematical operations.

#### API

| Routine         | Arguments                | Returns | Function                                                     |
| --------------- | ------------------------ | ------- | ------------------------------------------------------------ |
| `Math.max`      | `a` (`int`), `b` (`int`) | `int`   | Returns the greater number.                                  |
| `Math.min`      | `a` (`int`), `b` (`int`) | `int`   | Returns the smaller number.                                  |
| `Math.pow`      | `x` (`int`), `n` (`int`) | `int`   | Returns $x^n$.                                               |
| `Math.sqrt`     | `x` (`int`)              | `int`   | Returns the integer part of the square root of $x$.          |
| `Math.divide`   | `x` (`int`), `y` (`int`) | `int`   | Returns the integer part of $\frac xy$.  When a Jack compiler detects the multiplication operator `/` in the program's code, it handles it by invoking this method. In other words, the Jack expressions `x/y` and `Math.divide(x,y)` return the same value. |
| `Math.multiply` | `x` (`int`), `y` (`int`) | `int`   | Returns the product of $x$ and $y$.  When a Jack compiler detects the multiplication operator '*' in the program's code, it handles it by invoking this method. In other words, the Jack expressions `x*y` and `Math.multiply(x,y)` return the same value. |
| `Math.abs`      | `x` (`int`)              | `int`   | Returns the absolute value of $x$.                           |



### [`String`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/StringTest/String.jack)

Implements the String type.

#### API

| Routine              | Arguments                 | Returns | Function                                                     |
| -------------------- | ------------------------- | ------- | ------------------------------------------------------------ |
| `String.new`         | `_maxLength`(`int`)       | String  | Constructor that returns a new string instance with a maximum length of `_maxLength` and initial length of 0. |
| `dispose`            | -                         | -       | Disposes the string instance.                                |
| `length`             | -                         | `int`   | Returns the current length of the string instance.           |
| `charAt`             | `j` (`int`)               | `char`  | Returns the character at the $j$-th location of the string instance. |
| `setCharAt`          | `i` (`int`), `c` (`char`) | -       | Sets the character at the $j$-th location of the string instance to `c`. |
| `appendChar`         | `c` (`char`)              | String  | Appends `c` to the end of the string instance and returns this string. |
| `eraseLastChar`      | -                         |         | Erases the last character from the string instance.          |
| `intValue`           | -                         | `int`   | Returns the integer value of the string instance, until a non-digit character is detected. |
| `setInt`             | `val`(`int`)              | -       | Sets the string instance to hold a representation of the given value. |
| `String.newLine`     | -                         | `char`  | Returns the new line character.                              |
| `String.backSpace`   | -                         | `char`  | Returns the backspace character.                             |
| `String.doubleQuote` | -                         | `char`  | Returns the double quote (") character.                      |



### [`Array`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/ArrayTest/Array.jack)

Implements the Array type. In the Jack language, arrays are instances of the Array class. Once declared, the array entries can be accessed and assigned using the usual syntax `arr[i]`. Each array entry can hold a primitive data type as well as any object type. Different array entries can have different data types.

#### API

| Routine     | Arguments     | Returns | Function                                           |
| ----------- | ------------- | ------- | -------------------------------------------------- |
| `Array.new` | `size`(`int`) | `Array` | Constructs a new array instance of the given size. |
| `dispose`   | -             | -       | Disposes the array instance.                       |



### [`Memory`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/MemoryTest/Memory.jack)

Handles memory operations.

#### API

| Routine          | Arguments                          | Returns | Function                                                     |
| ---------------- | ---------------------------------- | ------- | ------------------------------------------------------------ |
| `Memory.peek`    | `address` (`int`)                  | `int`   | Returns the value of the main memory at the given address.   |
| `Memory.poke`    | `address` (`int`), `value` (`int`) | -       | Sets the value of the main memory at this address to the given value. |
| `Memory.alloc`   | `size` (`int`)                     | `int`   | Finds and allocates from the heap a memory block of the specified size and returns a reference to its base address. |
| `Memory.deAlloc` | `object`(Array)                    | -       | De-allocates the given object and frees its space.           |



### [`Screen`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/ScreenTest/Screen.jack)

Handles graphics output to the screen.

#### API

| Routine                | Arguments                                              | Returns | Function                                                     |
| ---------------------- | ------------------------------------------------------ | ------- | ------------------------------------------------------------ |
| `Screen.clearScreen`   | -                                                      | -       | Erases the entire screen.                                    |
| `Screen.fillUpScreen`  | -                                                      | -       | Paints the whole screen with Black.                          |
| `Screen.setColor`      | `b` (`boolean`)                                        | -       | Sets the current color, to be used for all subsequent `Screen.drawXXX` commands. Black is represented by `true`, white by `false`. |
| `Screen.drawPixel`     | `x` (`int`), `y` (`int`)                               | -       | Draws the $(x,y)$ pixel, using the current color.            |
| `Screen.drawLine`      | `x1` (`int`), `x2` (`int`), `y1` (`int`), `y2` (`int`) | -       | Draws a line from pixel $(x_1,y_1)$ to pixel $(x_2,y_2)$, using the current color. |
| `Screen.drawRectangle` | `x1` (`int`), `x2` (`int`), `y1` (`int`), `y2` (`int`) | -       | Draws a filled rectangle whose top left corner is $(x_1, y_1)$ and bottom right corner is $(x_2,y_2)$, using the current color. |
| `Screen.drawCircle`    | `x` (`int`), `y` (`int`), `r` (`int`)                  | -       | Draws a filled circle of radius $r \leq 181$ around $(x,y)$, using the current color. |



### [`Output`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/OutputTest/Output.jack)

Handles character output to the screen.

#### API

| Routine              | Arguments                | Returns | Function                                                     |
| -------------------- | ------------------------ | ------- | ------------------------------------------------------------ |
| `Output.moveCursor`  | `i` (`int`), `j` (`int`) | -       | Moves the cursor to the $j$-th column of the $i$-th row, and erases the character displayed there. |
| `Output.printChar`   | `c` (`char`)             | -       | Displays the given char at the cursor location, and advances the cursor appropriately. |
| `Output.printString` | `s` (String)             | -       | Displays the given string starting at the cursor location, and advances the cursor appropriately. |
| `Output.printInt`    | `i` (`int`)              | -       | Displays the given integer starting at the cursor location, and advances the cursor appropriately. |
| `Output.println`     | -                        | -       | Advances the cursor to the beginning of the next line.       |
| `Output.backSpace`   | -                        | -       | Moves the cursor one column back.                            |



### [`Keyboard`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/KeyboardTest/Keyboard.jack)

Handles input from the keyboard.

#### API

| Routine               | Arguments          | Returns | Function                                                     |
| --------------------- | ------------------ | ------- | ------------------------------------------------------------ |
| `Keyboard.keyPressed` | -                  | `char`  | Returns the character of the currently pressed key on the keyboard. If no key is currently pressed, returns 0. |
| `Keyboard.readChar`   | -                  | `char`  | Waits until a key is pressed on the keyboard and released, then echoes the key to the screen, and returns the character of the pressed key. |
| `Keyboard.readLine`   | `message` (String) | String  | Displays the message on the screen, reads from the keyboard the entered text until a newline character is detected, echoes the text to the screen, and returns its value. Also handles user backspaces. |
| `Keyboard.readInt`    | `message` (String) | `int`   | Displays the message on the screen, reads from the keyboard the entered text until a newline character is detected, echoes the text to the screen, and returns its integer value (until the first non-digit character in the entered text is detected). Also handles user backspaces. |



### [`Sys`](https://github.com/gpm22/ossu-projects/blob/main/Nand2Tetris/nand2tetris/projects/12/SysTest/Sys.jack)

Provides execution-related services.

#### API

| Routine     | Arguments           | Returns | Function                                                     |
| ----------- | ------------------- | ------- | ------------------------------------------------------------ |
| `Sys.halt`  | -                   | -       | Halts the program execution.                                 |
| `Sys.wait`  | `duration` (`int`)  | -       | Waits approximately duration milliseconds and returns.       |
| `Sys.error` | `errorCode` (`int`) | -       | Displays the given error code in the form `ERR<errorCode>`, and halts the program's execution. |