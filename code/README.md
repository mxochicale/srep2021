# Code

## Content 
1. [Anthropometrics](anthropometrics/README.md) contains scripts to compute statistics for Participant, Gender, Age, Handeness, MusicTraining, RightArmLenght, Height and weight.
2. [Creation of curated time-series](creation_of_curated_timeseries/README.md) contains `*.m` scripts to do time alignment of data of 22 participants.

## Guidelines 
1. Installation of software and its dependencies. See [README](installation-dependencies/README.md) for further details.
2. Demo 
3. Provide a DOI link to the code (once is available)
4. Software is under the license [Open Software License v. 3.0 (OSL-3.0)](OSL-3.0.md)



## Notes.
* Code has been tested by other persons but only by the main author.
* R code was tested under Ubuntu 16.04x64 which might need to be refactored in users would like to use an updated version of Ubuntu or R.

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
