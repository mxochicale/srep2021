# Code
## Content 
1. [Installation-dependencies](installation-dependencies) contains instructions on software versions and requirements for the current manuscript.
2. [Anthropometrics](anthropometrics) contains scripts to compute statistics for Participant, Gender, Age, Handeness, MusicTraining, RightArmLenght, Height and weight.
3. [Creation of curated time-series](creation_of_curated_timeseries) contains `*.m` scripts to do time alignment of data of 22 participants.
4. [Libraries and functions](libraries_functions) contains instructions to install `nonlinearTseries` package and to call different R functions.
5. [`R-scripts`](rscripts) contains scripts for time-series data creation. 
   Similarly, it contains scripts for postprocessing of embedded parameters, reconstructed state spaces, recurrence plots, recurrence quantification analysis (RQAs) and 3D RQAs.

## Guidelines 
1. Installation of software and its dependencies. See [README](installation-dependencies/README.md) for further details.
2. See [README](rscripts/B_timeseries) for a demo on how to run R scripts that generate time-series data plots.    
3. Provide a DOI link to the code (once is available)
4. Software is under the license [Open Software License v. 3.0 (OSL-3.0)](OSL-3.0.md)

## Licence
Code is under [Open Software Licence](OSL-3.0.md).

## Notes.
* Code has only been tested by main author by making sure [guidelines for code and data publication](../docs/submission/code-data/GuidelinesCodePublication.pdf) are addressed. 
  However, if there are issues in the replication of the work please [open an issue](https://github.com/mxochicale/srep2021/issues)
* R code was tested under Ubuntu 16.04x64. That said, scripts which might need to be refactored if users would like to use it with the latests versions of Ubuntu and R.

## Directories distribution in form of a tree
```
~/Desktop/srep2020/code$ tree -d
.
├── anthropometrics
│   ├── data
│   └── rscript
├── creation_of_curated_timeseries
│   ├── code_raw2aligned
│   │   ├── A_mscripts
│   │   └── B_rscripts
│   └── data_raw_p01-p22
│       ├── p01
│       │   ├── p01-HII
│       │   └── p01-HRI
│       ├── p02
│       │   ├── p02-HII
│       │   └── p02-HRI
│       ├── p03
│       │   ├── p03-HII
│       │   └── p03-HRI
│       ├── p04
│       │   ├── p04-HII
│       │   └── p04-HRI
│       ├── p05
│       │   ├── p05-HII
│       │   └── p05-HRI
│       ├── p06
│       │   ├── p06-HII
│       │   └── p06-HRI
│       ├── p07
│       │   ├── p07-HII
│       │   └── p07-HRI
│       ├── p08
│       │   ├── p08-HII
│       │   └── p08-HRI
│       ├── p09
│       │   ├── p09-HII
│       │   └── p09-HRI
│       ├── p10
│       │   ├── p10-HII
│       │   └── p10-HRI
│       ├── p11
│       │   ├── p11-HII
│       │   └── p11-HRI
│       ├── p12
│       │   ├── p12-HII
│       │   └── p12-HRI
│       ├── p13
│       │   ├── p13-HII
│       │   └── p13-HRI
│       ├── p14
│       │   ├── p14-HII
│       │   └── p14-HRI
│       ├── p15
│       │   ├── p15-HII
│       │   └── p15-HRI
│       ├── p16
│       │   ├── p16-HII
│       │   └── p16-HRI
│       ├── p17
│       │   ├── p17-HII
│       │   └── p17-HRI
│       ├── p18
│       │   ├── p18-HII
│       │   └── p18-HRI
│       ├── p19
│       │   ├── p19-HII
│       │   └── p19-HRI
│       ├── p20
│       │   ├── p20-HII
│       │   └── p20-HRI
│       ├── p21
│       │   ├── p21-HII
│       │   └── p21-HRI
│       └── p22
│           ├── p22-HII
│           └── p22-HRI
├── dependencies
│   └── machineinfo
├── libraries_functions
│   ├── nonlinearTseries
│   │   ├── inst
│   │   ├── man
│   │   ├── R
│   │   ├── rfunctions
│   │   │   └── embedding_parameters
│   │   │       ├── mututalInformation
│   │   │       │   └── plots_path
│   │   │       └── withCao1997
│   │   │           ├── examples
│   │   │           └── references
│   │   ├── src
│   │   │   └── ANN
│   │   ├── tests
│   │   │   ├── testdata
│   │   │   ├── testextra
│   │   │   │   └── rqa
│   │   │   └── testthat
│   │   └── vignettes
│   └── rfunctions
│       └── embedding_parameters
│           ├── mututalInformation
│           │   └── plots_path
│           └── withCao1997
│               ├── examples
│               └── references
└── rscripts
    ├── A_dataset
    ├── B_timeseries
    ├── C_cao
    ├── D_ami
    ├── E_rss
    ├── F_rps
    └── G_3Drqa

111 directories
```
