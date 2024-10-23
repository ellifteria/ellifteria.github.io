---
draft: true
title: ESRoCKit
summary: An open-source library collection for simulated robotics. Created during my time in the Xenobot lab. Jun 2023–Present.
template: page
---

## Details

- **Type**: Open-source library collection
- **Languages**: Julia, Python
- **Affiliated with**: Xenobot Lab
- **Purpose**: Simulated robotics
- **Start**: June 2023
- **End**: Ongoing

## Overview

ESRoCKit, or the **E**SRoCKit **S**imulated **R**obotic **C**reatures tool**Kit**, is a collection of (currently) 2 open-source software libraries on Github:

- [**ESRoCKit-LachesisPy**](https://github.com/ellifteria/ESRoCKit-LachesisPy): A Python library for controlling simulated robots in PyBullet.
- [**ESRoCKit-ClothoJl**](https://github.com/ellifteria/ESRoCKit-ClothoJl): A Julia library for generating simulated robot specification XML files.

## Background

While working as an undergraduate researcher in the [Xenobot Lab](https://xenobot.group) on a project simulating virtual evolutionary robots in Julia and Python, I realized that the ecosystem for doing simulated robotics in both languages had a lot of room for improvement.
Specifically, I needed libraries for two different tasks:

1. Creating simulated robot specification files in Julia
2. Controlling simulated robots in Python

Enter, ESRoCKit.

## ClothoJl

[ESRoCKit-ClothoJl](https://github.com/ellifteria/ESRoCKit-ClothoJl) is a native Julia library for generating simulated robot specification XML files.
The name is inspired by [Clotho](https://wikipedia.org/wiki/Clotho), the youngest of the [Moirai](https://wikipedia.org/wiki/Moirai), aka the Three Fates, and is responsible for spinning the thread of mortals' lives.
Currently, ClothoJl is capable of creating:

- [URDF](http://wiki.ros.org/urdf) files: a standard format for defining robot bodies
- [ENNF]() files: a novel format I developed for defining robot neural networks

ClothoJl runs on a native Julia XML file writer I created for this project, also found on GitHub [here](https://github.com/ellifteria/JuliaXMLWriter).

### Future steps

ClothoJl can still be improved by incorporating alternate definition file specifications.
Specifically, Mujoco files are a logical next step for ClothoJl to be able to create.

Additionally, ClothoJl can and should be translated into Python to allow for a Python-only workflow.

## LachesisPy

[ESRoCKit-LachesisPy](https://github.com/ellifteria/ESRoCKit-LachesisPy) is a Python library for controlling simulated robots in the [PyBullet physics engine](https://pybullet.org/).
Like ClothoJl, LachesisPy is also named after one of the Moirai, [Lachesis](https://wikipedia.org/wiki/Lachesis).
Just as Lachesis measures the thread of life spun by Clotho and determines destiny, LachesisPy controls the movement of the simulated robots defined by ClothoJl in the physics engine.
