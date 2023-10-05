---
title: PyFlowBAT
date: 2023-07-12
summary: An Open-Source Software Package for Performing High-Throughput Batch Analysis of Flow Cytometry Data. Developed for the Leonard Lab. Jun 2022–Present.
---

## IMPORTANT

Paper writing in progress!

---

## Abstract

Synthetic biologists frequently utilize flow cytometry to evaluate gene expression output of engineered biological systems because flow cytometry enables single-cell measurements of many samples at a time.
Although large and highly dimensional datasets can be collected using flow cytometry, analyzing said data presents a barrier to high-throughput experiments.
Currently, open-source and high-throughput flow cytometry analysis tools have not been extensively developed nor widely adopted.
The field’s reliance on closed-source, expensive, and low-throughput tools presents a steep barrier to entry and limits the potential of synthetic biology.
To address these challenges, we present the Python Flow cytometry Batch Analysis Tool (PyFlowBAT), an open-source Python package enabling rapid batch analysis of large flow cytometry datasets.
PyFlowBAT is designed to accelerate and standardize analysis workflows by performing vectorized batch operations on collections of samples instead of individually operating on each sample.
PyFlowBAT provides features for conducting the entirety of the “processing, analysis, visualization” pipeline in one application.
PyFlowBAT is both accessible to researchers with limited coding experience through its plug-and-play Jupyter Notebook templates and appropriate for advanced programmers as a library to be used in more complex programs.
We validate PyFlowBAT’s effectiveness by analyzing inducible fluorescent protein expression data in mammalian cells and comparing the quantitative metrics produced by PyFlowBAT to those produced manually using FlowJo, the field’s standard analysis tool.
PyFlowBAT adds crucial missing functionality to the growing corpus of open-source synthetic biology tools developed in recent years.
Furthermore, PyFlowBAT fills a largely ignored yet increasingly important niche within the synthetic biologist’s toolkit: software for efficient, high-throughput flow cytometry analysis and visualization.
