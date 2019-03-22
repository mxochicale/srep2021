



# `source(  paste( getwd(), '/0_rqa_test.R', sep=''), echo=TRUE )`


3D plot for  one participant and one axis



```


##########################
##### one window lenght
windowsl <- c(100)
windowsn <- c('w2')



```




# `source(  paste( getwd(), '/A_3Drqa_datatable.R', sep=''), echo=TRUE )`


```


#
#file_ext <- paste('RQAs_p01w100.dt',sep='')
#W100 <- fread( file_ext, header=TRUE)
#
#file_ext <- paste('RQAs_p01w250.dt',sep='')
#W250 <- fread( file_ext, header=TRUE)
#
#file_ext <- paste('RQAs_p01w500.dt',sep='')
#W500 <- fread( file_ext, header=TRUE)
#
#file_ext <- paste('RQAs_p01w750.dt',sep='')
#W750 <- fread( file_ext, header=TRUE)
#
#W <- rbind(W100, W250, W500, W750)
#

#file_ext <- paste('RQAs_p02w500.dt',sep='')
#W <- fread( file_ext, header=TRUE)
#

file_ext <- paste('RQAs_p03w500.dt',sep='')
W <- fread( file_ext, header=TRUE)
```





```
## (4.2.1) Activities Selection
	activities <- c('HN', 'HF', 'VN', 'VF')
```



```
> ################################################################################
> ################################################################# .... [TRUNCATED] 

> end.time - start.time
Time difference of 3.418769 hours

> # message('Execution Time: ', end.time - start.time)
> 
> ################################################################################
> setwd(r .... [TRUNCATED] 

```




```

/srep2019/data/rqa$ tree -s
.
├── [   26043425]  RQAs_p03w500.dt

```











# `source(  paste( getwd(), '/B_3Drqa_plots_thesis.R', sep=''), echo=TRUE )`



```
file_ext <- paste('RQAs_p03w500.dt',sep='')
W <- fread( file_ext, header=TRUE)
```



```
> ################################################################################
> ################################################################# .... [TRUNCATED] 

> end.time - start.time
Time difference of 46.64574 secs

> # message('Execution Time: ', end.time - start.time)
> 
> ################################################################################
> setwd(r .... [TRUNCATED] 

```


```

/srep2019/docs/figures/rqa/src/3drqa_thesis$ tree -s
.
├── [     247628]  w500_DET_HS01_VF_sg0zmuvGyroY.png
├── [     324175]  w500_DET_HS01_VF_sg1zmuvGyroY.png
├── [     337725]  w500_DET_HS01_VF_sg2zmuvGyroY.png
├── [     268863]  w500_DET_HS01_VN_sg0zmuvGyroY.png
├── [     276465]  w500_DET_HS01_VN_sg1zmuvGyroY.png
├── [     299732]  w500_DET_HS01_VN_sg2zmuvGyroY.png
├── [     253147]  w500_DET_RS01_VF_sg0zmuvGyroY.png
├── [     312647]  w500_DET_RS01_VF_sg1zmuvGyroY.png
├── [     344504]  w500_DET_RS01_VF_sg2zmuvGyroY.png
├── [     239399]  w500_DET_RS01_VN_sg0zmuvGyroY.png
├── [     265119]  w500_DET_RS01_VN_sg1zmuvGyroY.png
├── [     312301]  w500_DET_RS01_VN_sg2zmuvGyroY.png
├── [     313547]  w500_ENTR_HS01_VF_sg0zmuvGyroY.png
├── [     340439]  w500_ENTR_HS01_VF_sg1zmuvGyroY.png
├── [     310159]  w500_ENTR_HS01_VF_sg2zmuvGyroY.png
├── [     314816]  w500_ENTR_HS01_VN_sg0zmuvGyroY.png
├── [     313628]  w500_ENTR_HS01_VN_sg1zmuvGyroY.png
├── [     283265]  w500_ENTR_HS01_VN_sg2zmuvGyroY.png
├── [     305618]  w500_ENTR_RS01_VF_sg0zmuvGyroY.png
├── [     326615]  w500_ENTR_RS01_VF_sg1zmuvGyroY.png
├── [     329413]  w500_ENTR_RS01_VF_sg2zmuvGyroY.png
├── [     296456]  w500_ENTR_RS01_VN_sg0zmuvGyroY.png
├── [     296019]  w500_ENTR_RS01_VN_sg1zmuvGyroY.png
├── [     281181]  w500_ENTR_RS01_VN_sg2zmuvGyroY.png
├── [     344191]  w500_RATIO_HS01_VF_sg0zmuvGyroY.png
├── [     351587]  w500_RATIO_HS01_VF_sg1zmuvGyroY.png
├── [     372038]  w500_RATIO_HS01_VF_sg2zmuvGyroY.png
├── [     376588]  w500_RATIO_HS01_VN_sg0zmuvGyroY.png
├── [     358165]  w500_RATIO_HS01_VN_sg1zmuvGyroY.png
├── [     389752]  w500_RATIO_HS01_VN_sg2zmuvGyroY.png
├── [     353537]  w500_RATIO_RS01_VF_sg0zmuvGyroY.png
├── [     375033]  w500_RATIO_RS01_VF_sg1zmuvGyroY.png
├── [     329074]  w500_RATIO_RS01_VF_sg2zmuvGyroY.png
├── [     349209]  w500_RATIO_RS01_VN_sg0zmuvGyroY.png
├── [     353198]  w500_RATIO_RS01_VN_sg1zmuvGyroY.png
├── [     360728]  w500_RATIO_RS01_VN_sg2zmuvGyroY.png
├── [     321911]  w500_REC_HS01_VF_sg0zmuvGyroY.png
├── [     320602]  w500_REC_HS01_VF_sg1zmuvGyroY.png
├── [     302862]  w500_REC_HS01_VF_sg2zmuvGyroY.png
├── [     308944]  w500_REC_HS01_VN_sg0zmuvGyroY.png
├── [     307921]  w500_REC_HS01_VN_sg1zmuvGyroY.png
├── [     307238]  w500_REC_HS01_VN_sg2zmuvGyroY.png
├── [     318200]  w500_REC_RS01_VF_sg0zmuvGyroY.png
├── [     323484]  w500_REC_RS01_VF_sg1zmuvGyroY.png
├── [     316563]  w500_REC_RS01_VF_sg2zmuvGyroY.png
├── [     317439]  w500_REC_RS01_VN_sg0zmuvGyroY.png
├── [     317440]  w500_REC_RS01_VN_sg1zmuvGyroY.png
└── [     317191]  w500_REC_RS01_VN_sg2zmuvGyroY.png

0 directories, 48 files

```







# `> source(  paste( getwd(), '/C_3Drqa_plots_epsilons.R', sep=''), echo=TRUE )`


lines to tweak
```
rqas <- c('ENTR')

#rqas <- c('REC','DET', 'RATIO', 'ENTR')
selectParticipant <- 'p03'

selectWindow <- 'w500'

activities <- c('HN','HF')
#activities <- c('VN','VF')

axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
#axis <- c('sg0zmuvGyroY', 'sg1zmuvGyroY', 'sg2zmuvGyroY')


zlim_max<-10
#EPS<-c (0.1,0.2,0.5,0.7,1.0,1.2,1.5,1.7,2,3.0)
EPS<-c (0.5)

```





```
/srep2019/docs/figures/rqa/src/3drqa_epsilons$ tree -s
.
├── [     365469]  w500_ENTR_HS01_HF_sg0zmuvGyroZ_eps_0.5.png
├── [     373562]  w500_ENTR_HS01_HF_sg0zmuvGyroZ_eps_1.5.png
├── [     359294]  w500_ENTR_HS01_HF_sg0zmuvGyroZ_eps_1.png
├── [     365900]  w500_ENTR_HS01_HF_sg0zmuvGyroZ_eps_2.5.png
├── [     369970]  w500_ENTR_HS01_HF_sg0zmuvGyroZ_eps_2.png
├── [     369932]  w500_ENTR_HS01_HF_sg0zmuvGyroZ_eps_3.png
├── [     370291]  w500_ENTR_HS01_HF_sg1zmuvGyroZ_eps_0.5.png
├── [     377152]  w500_ENTR_HS01_HF_sg1zmuvGyroZ_eps_1.5.png
├── [     372114]  w500_ENTR_HS01_HF_sg1zmuvGyroZ_eps_1.png
├── [     364867]  w500_ENTR_HS01_HF_sg1zmuvGyroZ_eps_2.5.png
├── [     370981]  w500_ENTR_HS01_HF_sg1zmuvGyroZ_eps_2.png
├── [     369276]  w500_ENTR_HS01_HF_sg1zmuvGyroZ_eps_3.png
├── [     369653]  w500_ENTR_HS01_HF_sg2zmuvGyroZ_eps_0.5.png
├── [     360392]  w500_ENTR_HS01_HF_sg2zmuvGyroZ_eps_1.5.png
├── [     368396]  w500_ENTR_HS01_HF_sg2zmuvGyroZ_eps_1.png
├── [     358959]  w500_ENTR_HS01_HF_sg2zmuvGyroZ_eps_2.5.png
├── [     362542]  w500_ENTR_HS01_HF_sg2zmuvGyroZ_eps_2.png
├── [     360178]  w500_ENTR_HS01_HF_sg2zmuvGyroZ_eps_3.png
├── [     364681]  w500_ENTR_HS01_HN_sg0zmuvGyroZ_eps_0.5.png
├── [     372244]  w500_ENTR_HS01_HN_sg0zmuvGyroZ_eps_1.5.png
├── [     377260]  w500_ENTR_HS01_HN_sg0zmuvGyroZ_eps_1.png
├── [     375468]  w500_ENTR_HS01_HN_sg0zmuvGyroZ_eps_2.5.png
├── [     364119]  w500_ENTR_HS01_HN_sg0zmuvGyroZ_eps_2.png
├── [     373317]  w500_ENTR_HS01_HN_sg0zmuvGyroZ_eps_3.png
├── [     368428]  w500_ENTR_HS01_HN_sg1zmuvGyroZ_eps_0.5.png
├── [     370704]  w500_ENTR_HS01_HN_sg1zmuvGyroZ_eps_1.5.png
├── [     371700]  w500_ENTR_HS01_HN_sg1zmuvGyroZ_eps_1.png
├── [     369356]  w500_ENTR_HS01_HN_sg1zmuvGyroZ_eps_2.5.png
├── [     375486]  w500_ENTR_HS01_HN_sg1zmuvGyroZ_eps_2.png
├── [     366719]  w500_ENTR_HS01_HN_sg1zmuvGyroZ_eps_3.png
├── [     360747]  w500_ENTR_HS01_HN_sg2zmuvGyroZ_eps_0.5.png
├── [     372271]  w500_ENTR_HS01_HN_sg2zmuvGyroZ_eps_1.5.png
├── [     359893]  w500_ENTR_HS01_HN_sg2zmuvGyroZ_eps_1.png
├── [     367405]  w500_ENTR_HS01_HN_sg2zmuvGyroZ_eps_2.5.png
├── [     359223]  w500_ENTR_HS01_HN_sg2zmuvGyroZ_eps_2.png
├── [     382349]  w500_ENTR_HS01_HN_sg2zmuvGyroZ_eps_3.png
├── [     350348]  w500_ENTR_RS01_HF_sg0zmuvGyroZ_eps_0.5.png
├── [     368793]  w500_ENTR_RS01_HF_sg0zmuvGyroZ_eps_1.5.png
├── [     352403]  w500_ENTR_RS01_HF_sg0zmuvGyroZ_eps_1.png
├── [     355683]  w500_ENTR_RS01_HF_sg0zmuvGyroZ_eps_2.5.png
├── [     371116]  w500_ENTR_RS01_HF_sg0zmuvGyroZ_eps_2.png
├── [     361737]  w500_ENTR_RS01_HF_sg0zmuvGyroZ_eps_3.png
├── [     367172]  w500_ENTR_RS01_HF_sg1zmuvGyroZ_eps_0.5.png
├── [     364943]  w500_ENTR_RS01_HF_sg1zmuvGyroZ_eps_1.5.png
├── [     356649]  w500_ENTR_RS01_HF_sg1zmuvGyroZ_eps_1.png
├── [     366672]  w500_ENTR_RS01_HF_sg1zmuvGyroZ_eps_2.5.png
├── [     355555]  w500_ENTR_RS01_HF_sg1zmuvGyroZ_eps_2.png
├── [     364525]  w500_ENTR_RS01_HF_sg1zmuvGyroZ_eps_3.png
├── [     365256]  w500_ENTR_RS01_HF_sg2zmuvGyroZ_eps_0.5.png
├── [     345509]  w500_ENTR_RS01_HF_sg2zmuvGyroZ_eps_1.5.png
├── [     359082]  w500_ENTR_RS01_HF_sg2zmuvGyroZ_eps_1.png
├── [     363681]  w500_ENTR_RS01_HF_sg2zmuvGyroZ_eps_2.5.png
├── [     367123]  w500_ENTR_RS01_HF_sg2zmuvGyroZ_eps_2.png
├── [     354421]  w500_ENTR_RS01_HF_sg2zmuvGyroZ_eps_3.png
├── [     364364]  w500_ENTR_RS01_HN_sg0zmuvGyroZ_eps_0.5.png
├── [     362307]  w500_ENTR_RS01_HN_sg0zmuvGyroZ_eps_1.5.png
├── [     365274]  w500_ENTR_RS01_HN_sg0zmuvGyroZ_eps_1.png
├── [     363692]  w500_ENTR_RS01_HN_sg0zmuvGyroZ_eps_2.5.png
├── [     366132]  w500_ENTR_RS01_HN_sg0zmuvGyroZ_eps_2.png
├── [     370647]  w500_ENTR_RS01_HN_sg0zmuvGyroZ_eps_3.png
├── [     371134]  w500_ENTR_RS01_HN_sg1zmuvGyroZ_eps_0.5.png
├── [     372223]  w500_ENTR_RS01_HN_sg1zmuvGyroZ_eps_1.5.png
├── [     367259]  w500_ENTR_RS01_HN_sg1zmuvGyroZ_eps_1.png
├── [     378102]  w500_ENTR_RS01_HN_sg1zmuvGyroZ_eps_2.5.png
├── [     378222]  w500_ENTR_RS01_HN_sg1zmuvGyroZ_eps_2.png
├── [     378102]  w500_ENTR_RS01_HN_sg1zmuvGyroZ_eps_3.png
├── [     362189]  w500_ENTR_RS01_HN_sg2zmuvGyroZ_eps_0.5.png
├── [     374531]  w500_ENTR_RS01_HN_sg2zmuvGyroZ_eps_1.5.png
├── [     358989]  w500_ENTR_RS01_HN_sg2zmuvGyroZ_eps_1.png
├── [     378102]  w500_ENTR_RS01_HN_sg2zmuvGyroZ_eps_2.5.png
├── [     369959]  w500_ENTR_RS01_HN_sg2zmuvGyroZ_eps_2.png
└── [     378102]  w500_ENTR_RS01_HN_sg2zmuvGyroZ_eps_3.png

0 directories, 72 files
```



# `source(  paste( getwd(), '/D_3Drqa_plots_sensors_activities.R', sep=''), echo=TRUE )`


```
	## (4.2.1) Activities Selection
	#activities <- c('HN','HF')
	activities <- c('VN','VF')


				### (4.2.4) Axis Selection
				#axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
				axis <- c('sg0zmuvGyroY', 'sg1zmuvGyroY', 'sg2zmuvGyroY')


```



```
~/srep2019/docs/figures/rqa/src/3drqa_sensors_activities$ tree -s

.
├── [     359294]  w500_ENTR_HS01_HF_sg0zmuvGyroZ_eps_1.png
├── [     372114]  w500_ENTR_HS01_HF_sg1zmuvGyroZ_eps_1.png
├── [     368396]  w500_ENTR_HS01_HF_sg2zmuvGyroZ_eps_1.png
├── [     377260]  w500_ENTR_HS01_HN_sg0zmuvGyroZ_eps_1.png
├── [     371700]  w500_ENTR_HS01_HN_sg1zmuvGyroZ_eps_1.png
├── [     359893]  w500_ENTR_HS01_HN_sg2zmuvGyroZ_eps_1.png
├── [     373974]  w500_ENTR_HS01_VF_sg0zmuvGyroY_eps_1.png
├── [     373031]  w500_ENTR_HS01_VF_sg1zmuvGyroY_eps_1.png
├── [     355703]  w500_ENTR_HS01_VF_sg2zmuvGyroY_eps_1.png
├── [     374079]  w500_ENTR_HS01_VN_sg0zmuvGyroY_eps_1.png
├── [     366598]  w500_ENTR_HS01_VN_sg1zmuvGyroY_eps_1.png
├── [     381913]  w500_ENTR_HS01_VN_sg2zmuvGyroY_eps_1.png
├── [     352403]  w500_ENTR_RS01_HF_sg0zmuvGyroZ_eps_1.png
├── [     356649]  w500_ENTR_RS01_HF_sg1zmuvGyroZ_eps_1.png
├── [     359082]  w500_ENTR_RS01_HF_sg2zmuvGyroZ_eps_1.png
├── [     365274]  w500_ENTR_RS01_HN_sg0zmuvGyroZ_eps_1.png
├── [     367259]  w500_ENTR_RS01_HN_sg1zmuvGyroZ_eps_1.png
├── [     358989]  w500_ENTR_RS01_HN_sg2zmuvGyroZ_eps_1.png
├── [     365014]  w500_ENTR_RS01_VF_sg0zmuvGyroY_eps_1.png
├── [     365937]  w500_ENTR_RS01_VF_sg1zmuvGyroY_eps_1.png
├── [     361651]  w500_ENTR_RS01_VF_sg2zmuvGyroY_eps_1.png
├── [     363360]  w500_ENTR_RS01_VN_sg0zmuvGyroY_eps_1.png
├── [     359821]  w500_ENTR_RS01_VN_sg1zmuvGyroY_eps_1.png
└── [     369497]  w500_ENTR_RS01_VN_sg2zmuvGyroY_eps_1.png

0 directories, 24 files
```











## `source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )`



```
Time difference of 18.66111 mins 
for: 23M Jul 18 23:15 RQAs_p01w100.dt

p01
w100
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```




```
Time difference of 45.54471 mins
25M Jul 19 11:57 RQAs_p01w250.dt


p01
w250
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
`
```



```
Time difference of 3.272555 hours
for: 26M Jul 19 02:42 RQAs_p01w500.dt

p01
w500
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)

```



```
Time difference of 10.53419 hours
for: 26M Jul 19 23:01 RQAs_p01w750.dt

p01
w750
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```


```
Time difference of 3.196113 hours
for 26M Jul 20 02:29 RQAs_p02w500.dt

p02
w500
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```



```
Time difference of 3.262477 hours
for 25M Jul 20 12:10 RQAs_p03w500.dt

p03
w500
Activity: HN HF VN VF
Sensor: HS01 RS01
Axis: sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
dimensions <- seq(1,10)
delays <- seq(1,10)
epsilons <- seq(0.2,3.0,0.1)
```
















