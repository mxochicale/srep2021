# Creation of curated time-series data

## `*.m` scripts 
See [README](code_raw2aligned/A_mscripts/README.md) for further instructions on how to do time alignment of time series for 22 participants.
You might also be interested in checking [few notes](code_raw2aligned/A_mscripts/MATLAB_TO_OCTAVE_MIGRATION.md) on the migration from matlab to octave.

## Raw data of 22 participants
Considering participant 01 , e.g. `p01`, data of raw time-seres for 22 participants is organised as follows:
```
├── p01-HII
│   ├── Capture.PNG
│   ├── clocks.txt
│   ├── s01
│   ├── s02
│   ├── s03
│   └── s04
└── p01-HRI
    ├── Capture.PNG
    ├── clocks.txt
    ├── s01
    ├── s02
    ├── s03
    └── s04
2 directories, 12 files
```
where HII is Human-Image Interaction, HRI is Human-Robot Interaction, Capture.PNG is a screenshot of the delay times of four sensor which then were used in `clocks`. 
Raw time-series data of each sensor is presented as s01, s02, s04 and s04.