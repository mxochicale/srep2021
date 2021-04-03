# r-scripts

## Creating and setting up the raw data into aligned data
1. Generate aligned data with `/A_mscripts/A_rawData_TO_TimeAlignedDataForSeparateActivities15_p01_to_p22_octave_linux.m`
which creates this output path:
`/home/map479/tmp/phdtmpdata/time_aligned_different_length_data_for_separate_activities_p01_to_p22_octave_linux`
   
## Generating data.table files

```
cd ~/B_rscripts
R
```

## 2. Create 'TidiedInterpolatedData.datatable'
`source(paste(getwd(),"/BA_creating_TidiedInterpolatedDATA_p01p22.R", sep=""), echo=TRUE)`

```
~/tmp/phdtmpdata/outcomes/preProcessedDataTable_p01_to_p22 
158M Feb 18 10:33 TidiedInterpolatedData.datatable
```



## 3. Create only raw data for AccX AccY AccZ GyroX GyroY GyroZ for HS01 and RS01
`source(paste(getwd(),"/BB_preprocessed_TidiedInterpolatedDATA_p01p22-v06.R", sep=""), echo=TRUE)`


* names of xdata object for 'TidiedInterpolatedTHENpreprocessedData-v06.dt'
```
> names(xdata)
 [1] "Participant" "Activity"    "Sensor"      "Sample"      "AccX"       
 [6] "AccY"        "AccZ"        "GyroX"       "GyroY"       "GyroZ"      
> head(xdata)
   Participant Activity Sensor Sample      AccX        AccY      AccZ
1:         p01       HN   HS01      1 -1.000000  4.00000000 -978.0000
2:         p01       HN   HS01      2 -3.994159  6.08593402 -981.7004
3:         p01       HN   HS01      3 -3.051809  0.05725664 -991.3705
4:         p01       HN   HS01      4 -1.921741  2.71938601 -969.3355
5:         p01       HN   HS01      5 -6.917193  5.22073518 -971.6132
6:         p01       HN   HS01      6  2.505496 -1.94244414 -975.2334
        GyroX    GyroY    GyroZ
1: -2.2500000 3.062500 1.937500
2: -2.1778894 2.549903 2.007128
3: -2.2152526 3.313847 1.499128
4: -0.7921632 3.185006 1.562309
5: -0.6829491 3.540080 1.505756
6: -0.6333563 3.374851 1.436897

```

`~/data/timeseries`
```
39M Feb 18 10:41 TidiedInterpolatedRawData-v06.dt
```

