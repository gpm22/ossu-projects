# Project 9: High-Level Language

The objective of this project is to write a program in Jack: A simple, Java-like, object-based programming language. You will invent or adopt a simple computer game or some other interactive program, and implement it in the Jack language. The chosen game is **tic-tac-toe**.

More information about this project is available on https://www.nand2tetris.org/course

The files of the tic-tac-toe game are in [TicTacToe](https://github.com/gpm22/ossu-projects/tree/main/Nand2Tetris/nand2tetris/projects/09/TicTacToe).

## Game Usage

To play the game you need first to compile it to vm code, which can be done using the **JackCompiler** available on https://www.nand2tetris.org/software.

Then you can run the vm file using the **VMEmulator**, which is also available on https://www.nand2tetris.org/software.

Now you can play the game!

To play it you use the keys q, w, e, a, s, d, z, x, and c, which each one represents one of the following squares:

```
  Q  |  W  |  E
-----------------
  A  |  S  |  D
-----------------
  Z  |  X  |  C
```

The game starts with crosses and each turn is a different symbol.

The games ends when someone wins or draws.