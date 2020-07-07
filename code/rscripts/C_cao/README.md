# cao

## `> source(paste(getwd(), "/B_cao.R", sep=""), echo=TRUE)`



```
##########################
## (4.2.1) Activities Selection
#movement_variables <- c('HN','HF')
#movement_variables <- c('VN','VF')
movement_variables <- c('HN', 'HF', 'VN', 'VF')

```


```
#########################
#### one window lenght
windowsl <- c(500)
windowsn <- c('w10')

```


computation time for time series with 100sample window
```


> #################
> # Stop the clock!
> end.time <- Sys.time()

> end.time - start.time
Time difference of 15.31478 mins
```


files at `~/srep2019/data/utde` 


```
6.0M Feb 19 22:01 EE-w10.dt
348K Feb 19 22:01 MED-w10.dt

```



## `> source(paste(getwd(), "/CA_cao_mm_H.R", sep=""), echo=TRUE)`

```
#acts <- 'H'
#windowl<-'w2'
#wdata <- fread('MED-w2.dt', header=TRUE)
#
#
#acts <- 'H'
#windowl<-'w5'
#wdata <- fread('MED-w5.dt', header=TRUE)

acts <- 'H'
windowl<-'w10'
wdata <- fread('MED-w10.dt', header=TRUE)

#acts <- 'H'
#windowl<-'w15'
#wdata <- fread('MED-w15.dt', header=TRUE)
```




> end.time - start.time
Time difference of 0.8402872 secs



```
8.3K Feb 20 11:27 aMED-H-w10.dt

```

at /srep2019/data/utde




## `> source(paste(getwd(), "/CB_cao_mm_V.R", sep=""), echo=TRUE)`

comment and uncomment the following lines of code
```
#acts <- 'V'
#windowl<-'w2'
#wdata <- fread('MED-w2.dt', header=TRUE)


#acts <- 'V'
#windowl<-'w5'
#wdata <- fread('MED-w5.dt', header=TRUE)

acts <- 'V'
windowl<-'w10'
wdata <- fread('MED-w10.dt', header=TRUE)

#acts <- 'V'
#windowl<-'w15'
#wdata <- fread('MED-w15.dt', header=TRUE)
```



```
> end.time - start.time
Time difference of 0.6102109 secs
```




```
8.3K Feb 20 11:27 aMED-V-w10.dt

```

at /srep2019/data/utde




## `> source(paste(getwd(), "/EA_plotcao_avMED_H.R", sep=""), echo=TRUE)`

```

#
#windowl<-'w2'
#aMED <- fread('aMED-H-w2.dt', header=TRUE)


#windowl<-'w5'
#aMED <- fread('aMED-H-w5.dt', header=TRUE)


windowl<-'w10'
aMED <- fread('aMED-H-w10.dt', header=TRUE)

#windowl<-'w15'
#aMED <- fread('aMED-H-w15.dt', header=TRUE)


```
> end.time - start.time
Time difference of 0.7096527 secs




## `> source(paste(getwd(), "/EB_plotcao_avMED_V.R", sep=""), echo=TRUE)`


```
#windowl<-'w2'
#aMED <- fread('aMED-V-w2.dt', header=TRUE)
#
#
#windowl<-'w5'
#aMED <- fread('aMED-V-w5.dt', header=TRUE)


windowl<-'w10'
aMED <- fread('aMED-V-w10.dt', header=TRUE)


#windowl<-'w15'
#aMED <- fread('aMED-V-w15.dt', header=TRUE)

```

> end.time - start.time
Time difference of 0.7334752 secs


## images files



```
/srep2019/docs/figures/caoami/src$ tree -s
.
├── [      18059]  bp_avMED-HS01-w10-HF.png
├── [      18913]  bp_avMED-HS01-w10-HN.png
├── [      18870]  bp_avMED-HS01-w10-VF.png
├── [      19200]  bp_avMED-HS01-w10-VN.png
├── [      18348]  bp_avMED-RS01-w10-HF.png
├── [      17132]  bp_avMED-RS01-w10-HN.png
├── [      18011]  bp_avMED-RS01-w10-VF.png
└── [      18252]  bp_avMED-RS01-w10-VN.png

0 directories, 8 files
```


