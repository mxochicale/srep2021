# Data as datable files
Datable files include 
* curated [dataset](dataset/README.md) with a file size of 46MB,
* [rqa](rqa/README.md) files for three participants and four windows length (each file is around ~26MB), 
* [timeseries](timeseries/README.md) for a tidied interpolated raw data set, and 
* [utde](utde/README.md) for embedding parameters to create uniform time delay embeddings (utde).   


All files have the extension `*.dt` which stands for `datatable` files.


## Organisation of data files
```
~/srep2020/data$ tree --si
.
├── [4.1k]  dataset
│   └── [ 46M]  xdata_v00.dt
├── [1.2k]  README.md
├── [4.1k]  rqa
│   ├── [ 24M]  RQAs_p01w100.dt
│   ├── [ 26M]  RQAs_p01w250.dt
│   ├── [ 26M]  RQAs_p01w500.dt
│   ├── [ 27M]  RQAs_p01w750.dt
│   ├── [ 24M]  RQAs_p02w100.dt
│   ├── [ 26M]  RQAs_p02w250.dt
│   ├── [ 27M]  RQAs_p02w500.dt
│   ├── [ 27M]  RQAs_p02w750.dt
│   ├── [ 24M]  RQAs_p03w100.dt
│   ├── [ 26M]  RQAs_p03w250.dt
│   ├── [ 26M]  RQAs_p03w500.dt
│   ├── [ 26M]  RQAs_p03w750.dt
│   └── [180k]  rqa_w10.dt
├── [4.1k]  timeseries
│   └── [ 40M]  TidiedInterpolatedRawData-v06.dt
└── [4.1k]  utde
    ├── [8.4k]  aMED-H-w10.dt
    ├── [8.4k]  aMED-V-w10.dt
    ├── [5.1M]  AMI-w10.dt
    ├── [6.3M]  EE-w10.dt
    ├── [356k]  MED-w10.dt
    └── [ 34k]  MTD-w10.dt

4 directories, 22 files
```
