# Chess
### About
This is a two-player, command-line game of chess.

### Getting Started
A live version of this program is hosted on this [Repl.it IDE](https://repl.it/@coped/chess). Otherwise, you can download this repository, navigate to its root directory, and run the program with the command:
```
ruby lib/main.rb
```

### How To Play
A description of chess and its rules can be found on the [Wikipedia entry for chess](https://en.wikipedia.org/wiki/Chess).

Making a move in this game is done by defining the algebraic notation coordinate of the piece you want to move, and following it with the coordinate you want to move it to. For example:
```

   |-----|-----|-----|-----|-----|-----|-----|-----|
 8 |  ♜  |  ♞  |  ♝  |  ♛  |  ♚  |  ♝  |  ♞  |  ♜  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 7 |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 6 |     |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 5 |     |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 4 |     |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 3 |     |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 2 |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 1 |  ♖  |  ♘  |  ♗  |  ♕  |  ♔  |  ♗  |  ♘  |  ♖  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
      A     B     C     D     E     F     G     H

```
To move the pawn located on a2 up two spaces, one would input:
```
a2 a4
```
Resulting in:
```

   |-----|-----|-----|-----|-----|-----|-----|-----|
 8 |  ♜  |  ♞  |  ♝  |  ♛  |  ♚  |  ♝  |  ♞  |  ♜  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 7 |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 6 |     |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 5 |     |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 4 |  ♙  |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 3 |     |     |     |     |     |     |     |     |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 2 |     |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
 1 |  ♖  |  ♘  |  ♗  |  ♕  |  ♔  |  ♗  |  ♘  |  ♖  |
   |-----|-----|-----|-----|-----|-----|-----|-----|
      A     B     C     D     E     F     G     H

```
# Author
Dennis Cope, [GITHUB](https://github.com/coped).
