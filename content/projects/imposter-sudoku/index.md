---
draft: true
title: Imposter Sudoku
summary: Fun script for solving imposter sudoku problems. Written for a (cursed) CTF challenge. Apr 2023.
template: page
---

Have you ever run into a sudoku puzzles that you couldn't solve because you realized there were too many characters?
In other words, a puzzle you couldn't solve because there were imposters?

No? Just me? Oh, ok.

Well, I ran into one of these when [my team](https://2023.cursedc.tf/profile/587d0d12-7b80-484c-8ab5-5fb79fbbda20) competed in [cursedCTF 2023](https://2023.cursedc.tf).

So, I wrote a [quick script](https://github.com/ellifteria/ImposterSudoku.py) in Python to solve it!
The algorithm is a simple search across the given characters to determine which characters are the imposters.
It does this by figuring out the number of characters that would need to be removed to solve the puzzle correctly.
For example, if you are given a sudoku puzzle with 11 characters, 2 would need to be removed to solve a regular 9×9 board.
Then, the algorithm would get all combinations of that many characters, remove each combination from the character set, and try to solve the puzzle.
If the puzzle can be solved with that combination removed, then those two might be the imposters!
If is can't, you know for a fact that they're not.

The algorithm can almost certainly be improved; however, it was a fun, simple project for solving a challenge under a time crunch.
