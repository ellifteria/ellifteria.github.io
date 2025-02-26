---
draft: true
title: Munin
summary: "Execution-Time Space Complexity Analysis. Created in COMP_SCI 335: Theory of Computation @ NU. Nov 2023–Dec 2023."
template: page
---

Munin allows users to measure the amount of memory used by algorithms on different input sizes.
It can be used to study or visualize the memory complexity of algorithms.

At the moment, programs needs to be written in muninASM (an assembly-inspired language) or in muninSBasic (a BASIC inspired language).
A scripting language and web UI are currently in development!

Check out the [GitHub repo here!](https://github.com/ellifteria/munin)

Read more about Munin below!

---

# Munin: Execution-Time Space Complexity Analysis

![munin logo](logo.png)

Analyzing the time complexity is a common task in theory computer science, computational complexity theory, and the design of algorithms. Just as important, although less well-understood, is analyzing algorithms’ space complexity. That is, understanding how much memory is used in the execution of algorithms compared to the size of their inputs.

Space complexity analysis is often theoretically performed with multi-tape Turing Machines—space complexity has the nice feature that multi-tape and single-tape Turing Machines computing the same algorithm fall into the same space complexity class. Using multi-tape Turing Machines also allows for sublinear space usages; i.e., algorithms that use a less-than-linear amount of memory in their execution as a function of their input sizes. Consider a Turing Machine trying to determine if a binary integer x is a palindrome that does the following:

1.  Writes down the length l of x

2.  Starts a counter i at 0

3.  Stores the index l − i − 1 as j

4.  Writes down the ith bit of x as a

5.  Writes down the jth bit of x as b

6.  Compares a and b; if these are not equal, we reject; otherwise, we continue

7.  Increments i by 1

8.  Compares i to l; if i is less than l, go to line 3; otherwise, we’ve checked the entire binary integer and found it to be a palindrome so we accept

We will give this Turing Machine five tapes. The first tape will have the input written on it. The second will be where we write down l, the third where we write down i, the fourth where we write down j, and the fifth will be where we write down a and b. Note that the fifth tape always used 2 bits. Tapes two through four will write down numbers between 0 and the length of x, l. As the length of l in binary is bounded by log (l), so is the length of what’s written on these tapes. Therefore, the space complexity of this algorithm—not counting tape one—is 4log (l) + 2. In other words, this algorithm uses sublinear—logarithmic in this case—space.

Measuring such usage in actual code is either very difficult or nearly impossible. For one, there is often no way to separate the size of the input from the amount of memory used by the algorithm. Additionally, since, in most languages, values are stored in variables with constant sizes—for example, u32s in Rust—the memory usage of the code will depend not on the size of the inputs, but instead on the size of the variables chosen. This makes measuring space complexity a much more challenging endeavor than measuring time complexity despite its value for understanding the execution-time requirements of algorithms and for teaching theoretical computer science.

Therefore, I present Munin, a tool for measuring the execution-time space complexity of algorithms. Munin works by separating inputs from the rest of its memory and by storing values in raw bit-vectors, enabling it to easily measure the exact number of bits used by an algorithm during its execution.

Here, I describe Munin and use it to analyze the space complexity of four algorithms:

1.  the algorithm for deciding if an input is a palindrome described above: PAL

2.  an algorithm for deciding if x + y = z in linear space: LIN-ADD

3.  an algorithm for the same problem in sublinear logarithmic space: ADD

4.  an algorithm for deciding if x + y is a palindrome in logarithmic space: PAL-ADD

Munin

Munin is a Rust program that comes with the ability to run complexity analysis on 4 different Munin assembly programs. Munin can be downloaded from the GitHub repository at http://www.github.com/ellifteria/munin. The repository contains instructions for installing and running Munin.

Munin creates a virtual machine with sets of input, single-bit, and regular variables and three operating phases: IDLE, INPUT, and EXECUTION. The default and start phase is the IDLE phase. During the IDLE phase, the Munin device can take four actions. It can be moved into either the INPUT or EXECUTION phase, it can print out the most recently stored variable values, it can load a program, or it can clear the device memory. However, no memory can be written during the IDLE phase.

If the device is moved into the INPUT phase, users can either manually set input variables or run an input program that sets input variable values. This is the only phase of the Munin device in which input variables can be written; during EXECUTION, the device will use these input variables as its inputs. During the INPUT phase, users can also read or write to the bit and regular variables. However, these values will be cleared once the device enters the EXECUTION phase.

Munin programs are written in the Munin assembly language provided in Appendix 7. Additional information on the Munin assembly language is provided in the Munin GitHub repository.

In the EXECUTION phase, the device runs the program loaded by the user in the IDLE phase. While the program runs, it can read from the input, bit, and regular variables but can only write to the bit and regular variables. This allows Munin to separate the input and execution-time memory usage, allowing users to determine exactly how much input and execution-time memory is used separately. Once a program has finished execution, the device can count up the total number and size of variables to determine how much space was used by the program; the sizes or variables are determined by the maximum number of bits that were stored in the variable throughout program execution.

By separating memory in this way, Munin can separately determine the size of the inputs and write memory. Since all variables are either a bit or a vector of bits—as opposed to being constant-sized values such as u32s in Rust—Munin is able to count exactly the number of bits required by algorithms without the overhead required by other programming languages.

---

For results and more information, check out [the write-up here](https://github.com/ellifteria/munin/blob/8641e4e901234eeab4e0c219fe8bafe83deacdd0/writeup/eberes-final-335.pdf)!
