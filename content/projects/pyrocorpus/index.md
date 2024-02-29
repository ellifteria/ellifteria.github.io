---
title: pyro-corpus
summary: "Recursive virtual robot body generation. Created as part of my final project for COMP_SCI 396: Artificial Life @ NU. Feb 2023–Mar 2023."
template: page
---

Check out the [GitHub repo here!](https://github.com/ellifteria/pyro-corpus)

# pyro-corpus: recursive virtual robot body generation

v 0.2.0

---

Simulating and evolving random robot body plans using a recursive method.

To run, clone and run `python search.py` in the terminal.

## Motivation

Natural evolution features mutations and adaptations to not only the brains of organisms, but also their bodies.
Hence, simulated evolution should also seek to optimize virtual creatures morphologies in addition to their intelligence systems.
This requires being able to generate virtual robot body plans algorithmically.

Additionally, saving the entire body plan of an organism is inefficient, especially since parts are often replicated.
Consider biological organisms.
Each one is made of up collections of myriads of almost identical cells.
The organism does not explicitly store each and every cell separately.
Rather, there is a large set of instructions that is repeated several times.

Towards this goal, here I present a recursive method of generating and evolving simulated robot body plans.
To demonstrate the capabilities of the method, I started with a single cube body piece and evolved random bodies with the goal of moving as far forward in the `y` direction as possible.
Evolution occurred using the FAERYvPyrCor1 algorithm, a Family Aware EvolutionaRY (FAERY) algorithm derived from my [pyroFAE1](https://github.com/alexeberes/pyro-faery) algorithm.
Each evolutionary run was run for a total of `50` generations with `20` individuals per generation for a total of `1000` simulated robots.
The video shows an example of the results of this optimization.

[![recursive body generation video](https://img.youtube.com/vi/1nszsIci9XQ/0.jpg)](https://www.youtube.com/watch?v=1nszsIci9XQ)

The best fitness of each of the five evolutionary runs at each generation is also plotted here to demonstrate the evolution over time.

![Best fitness per generation](data/output/fitness_curves.png)

Each run in the above figure used a different random seed.

## The pyro-corpus body generation method

pyro-corpus consists of two parts:

1. a definition scheme for building virtual robots recursively and
2. the algorithm for converting these definitions into URDF files to be simulated.

The URDF files are then used by [PyBullet](https://pybullet.org/wordpress/) to run the virtual robot simulation.

### pyro-corpus pure recursive instructions format (PRIF) specifications

Instructions for building virtual robots are encoded in a format&mdash;a format I call pure recursive instructions format (PRIF)&mdash;that can be directly read by the PRIF to URDF algorithm discussed below.

PRIF instructions consist of a single set made up of three portions:

1. the current body part to build (`body_part`),
2. the specifications for how to build the current body part&mdash;where to build it off of the previous piece, how many to build, and what axis to build the joint on&mdash;as a three element list (`build_specs`), and
3. a dictionary with the the next PRIF instruction or `None` (`next_instruction`) and the direction in which to build it

put together like so:

`(body_part, build_specs, next_instruction)`.

Suppose we wanted to make a single cube with a body type defined by the `B()` class.
The PRIF instructions for this would be `(B(), [FRONT, 1, X], None)`.
Note that since we are only building one cube, the choice of `FRONT` and `X` were arbitrary.

Now let's say we wanted to build 3 cubes attached to each others left sides able to rotate along the x-axis, all type `B()` again.
The PRIF for this would be `(B(), [LEFT, 3, X], None)`.
Changing `build_specs` allows users to make chains of single types of body parts, similar to bones in many animals including humans.

Now what if we wanted to build two two-cube chains off of the left and top sides, going left and rotating along the z-axis and going up and rotating along the y-axis respectively, of the final cube in the three-cube chain we already made?
In this case, the PRIF becomes `(B(), [LEFT, 3, X], {LEFT: (B(), [LEFT, 2, Z], None), TOP: (B(), [TOP, 2, Y], None)})`.

To see how this could generate even more complicated bodies, consider the PRIF:

```python
(B(1), [RIGHT, 3, X], {
    BOTTOM: (B(2), [BOTTOM, 2, X], {
        RIGHT: (B(3), [RIGHT, 2, X], None),
        BOTTOM: (B(4), [BOTTOM, 2, X], None),
        LEFT: (B(5), [LEFT, 2, X], None)
    })
})
```

This would build the following body plan:
![PRIF example body plan](media/diagram1.png)

### pyro-corpus PRIF to URDF method

The robot bodies were simulated using the [pyrosim](https://github.com/jbongard/pyrosim) library.

As explained above, the recursive body generation method takes in a body plan encoded in the following format:

`(body_part, build_specs: [direction, repetitions, axis], next_instruction: {direction: PRIF})`.

The recursive method follows the below steps to turn this PRIF instruction into an actual body:

0. Check to see if adding the next piece would build an invalid body (see below).
1. If this is not the first piece, build a joint attaching to the previous piece defined by `direction` in `build_specs`.
2. Build the current piece, `body_part`.
3. Decrement `repetitions`
4. Check the value of `repetitions`; if 0, go to 6.; else go to 5.
5. Recursively call the function with `(body_part, build_specs: [direction, repetitions, axis], next_instruction: {direction: PRIF})` as the arguments now that `repetitions = repetitions - 1`.
6. Check if the `next_instruction` is `None`; if so, exit recursion; if not, continue.
7. Go through the dictionary, recursively call the function with `(next_instruction[direction].body_part, next_instruction[direction].build_specs, next_instruction[direction].next_instruction)` as the arguments.

The robot's brain is built by looping through the joints and sensor parts built in body construction to add the proper neurons and synapses.
It was necessary to split this into two functions because pyrosim is only able to write to one file type at a time.

## Mutating PRIFs and random body generation

As mentioned in the video, random body PRIFs were generated by starting with a single cube and mutating it.

The mutation function works by randomly changing one part of the PRIF definition, either the `body_part`, `build_specs`, or `next_instruction`.

To change the `body_part`, a new, random body part class is chosen to replace `body_part`.
In the video, four body part classes are shown:

- standard body part (blue)
- sensor body part (green)
- fixed joint/not rotating body part (purple)
- fixed joint sensor part (orange)
- unchangeable "brain" CPG part (black)

The fixed joint parts are important to be able to build bodies with non-linearly shaped rigid sections.
This is because each body part is identically-sized; they are all geometrically identical cubes.
To build shapes with other shapes and sized, therefore, it is necessary to connect multiple fixed joint parts since these are unable to rotate.

The black [CPG](https://en.wikipedia.org/wiki/Central_pattern_generator) "brain" provides two functions.

1. It ensures that there will always be at least one sensor neuron so valid neural networks can be constructed.
2. Like natural CPGs, it provides a constant repeating pattern to promote oscillatory movement such as walking.

To change the `build_specs`, either the direction is randomly changed to a new one, the repetitions are randomly incremented or decremented (a check is in place to ensure that the repetitions is greater than `0`), or the axis is randomly changed to a new one.

To change the `next_instruction`, either a new PRIF is added to an unused direction or the PRIF in a direction already in `next_instructions` is mutated.

Randomly mutating the base PRIF like so a number of types results in random body generation as demonstrated in the video.

## Evolution: FAERYvPyrCor1

Evolution occurred using one of my Family Aware EvolutionaRY (FAERY) algorithms (see [here](https://github.com/alexeberes/pyro-faery) for further information).
FAERYvPyrCor1 differs from previous FAERY algorithms in that no crossover occurs between parents when producing children.
Besides this, however, the method is largely identical to pyroFAE1.

## Checking invalid bodies

Invalid bodies are defined as bodies which, by their definition, feature overlapping parts.
Note that all bodies generated by the pyro-corpus algorithm are necessarily connected.

To prevent overlapping body parts, pyro-corpus takes advantage of the fact that each body part is an identically-shaped cube.
Because of this, overlapping body parts have identical centers.
Therefore, as pyro-corpus converts a PRIF into a URDF file, it keeps track of the center of each cube in a list.
Before a new cube is added, pyro-corpus checks to see if the center of this new cube is already in the list of centers.
If it is, the body plan features overlapping parts and the model is declared invalid.
Currently, pyro-corpus raises an error and deletes the in-progress URDF in this scenario.

Note that this is a relatively unlikely occurrence if a single mutation is made to an already existing valid PRIF.
It is only after repeated random mutations are made where the likelihood of running into invalid PRIFs increases.

## Future work

Future work includes:

- creating a file format to more easily define recursive robot body plans

## Special thanks to

- Artificial Life @ Northwestern University taught by [Dr. Sam Kriegman](https://www.mccormick.northwestern.edu/research-faculty/directory/profiles/kriegman-sam.html)
- [ludobots online course](https://www.reddit.com/r/ludobots/) by [Dr. Josh Bongard](https://jbongard.github.io)
