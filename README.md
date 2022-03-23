[![Snakemake](https://img.shields.io/badge/snakemake-≥6.0.2-brightgreen.svg)](https://snakemake.github.io)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

Author: Sherine Awad 

Rare Variants Association Analysis  
=======================================================================================

A snakemake pipeline to run various types of rare variants association analysis tests, including burden test, adaptive burden test, and more. 


### How to run the pipeline 
The pipeline requires snakemake and conda installed. 

Then you use: 

    snakemake -jnumber_of_core

For example for 5 cores use:

    snakemake -j5 

For a dry run use: 

    snakemake -j1 -n 


To print the commands in a dry run use:

    snakemake -j1 -n -p 

For the sake reproducibility, use conda to pull same versions of tools. Snakemake and conda have to be installed in your system:

    snakemake --cores --use-conda

### TODO 

Add more tools as we go 


