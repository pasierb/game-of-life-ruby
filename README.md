# Conway's Game of Life
Ruby implementation of Conway's Game of Life (https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

Rules
-----

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead, or "populated" or "unpopulated". Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:
- Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

Usage
-----

```
bin/cli fixtures/glider.txt
```

Other setups can be found in fixtures folder

![alt text](/game-of-life.png)

Test
----

```
ruby -Ilib:test test/game_of_life_test.rb
```


Note
----

Lack of classes is by design (inspired by Jack Diederich talk - https://youtu.be/o9pEzgHorH0)

