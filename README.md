[![Snakemake](https://img.shields.io/badge/snakemake-≥6.0.2-brightgreen.svg)](https://snakemake.github.io)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

Author: Sherine Awad 

Rare Variants Association Analysis  
=======================================================================================

A snakemake pipeline to run various types of rare variants association analysis tests, including burden test, adaptive burden test, and more. 
Instead of testing whether a single variant is associated with a specific phenotype, we can study the cummulative effect of a group of variants in a gene or region on a specific phenotype. Rare variants association analysis has lots of categories, we will summarize here a few categories:

**Burden test** is prefered when we have variants in the same direction and the same effect, i.e. variants are risk increasing or risk decreasing. Many methods fall under this category including **CMC**, **CMAT**, etc. 

**Adaptive burden** test is more robust than Burden test as it allows for adjusting weights. **KBAC** is famous approach that fall under the Adaptive burden test category.  

**Variance Components** tests are powerful if there exist both trait-increasing and trait-decreasing variants or a small fraction of causal variants.

These types of tests are less powerful when the variants are in the same direction. A famous approach under this category is **SKAT**.

When we don't have any prior information about the variants we have, we can use **combined test**. These approaches are robust regardless of the percentage of causal variants and
the existence of both trait-increasing and trait-decreasing variants. A famous approach under this category is **SKATO**. 




### How to run the pipeline 

The pipeline requires snakemake and conda installed. 

You will need to have a .vcf and .ped file in your directory named as the COHORT field in the config file. You can edit this name in the configfile.  You will need to edit the path of the gene file in the config file, as well as the output name and minimum frequency threshold required. 

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


