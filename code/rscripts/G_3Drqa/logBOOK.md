



# `source(  paste( getwd(), '/F0_rqa_test.R', sep=''), echo=TRUE )`


3D plot for  one participant and one axis



```


##########################
##### one window lenght
windowsl <- c(100)
windowsn <- c('w2')



```




# `source(  paste( getwd(), '/Fa_3Drqa_datatable.R', sep=''), echo=TRUE )`


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











# `source(  paste( getwd(), '/Fb_3Drqa_plots.R', sep=''), echo=TRUE )`



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

/srep2019/docs/figures/rqa/src/3drqa$ tree -s
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









# REVIEW THE CODE FROM HERE!
Mon 25 Feb 19:25:22 GMT 2019
Fri 31 Aug 19:58:41 BST 2018







# `source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )`


select axis
```
data <- data[,.(
	sg0zmuvGyroZ
	#sg0zmuvGyroZ, sg1zmuvGyroZ
	#sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]
```

select window
```
###########################
##### four window lenghts
windowsl <- c(100,250,500,750)
windowsn <- c('w2', 'w5', 'w10', 'w15')
```

select activity
```
#activities <- c( 'HN' )
activities <- c( 'HN', 'HF' )
#activities <- c('HN', 'HF', 'VN', 'VF')
```


select number of participants
```
#number_of_participants <- 1
#number_of_participants <- 3
#number_of_participants <- 12
number_of_participants <- 20
```

select sensors
```
#sensors <- c('HS01') # HumanSensor01
sensors <- c('HS01','RS01')# RobotSensor01  and HumanSensor01	
```

select embedding parameters
```
#dimensions <- seq(1,10)
#delays <- seq(1,10)
```

select recurrence threshold
```
epsilons <- seq(0.2,3.0,0.1)
```





Unfortunatelly, the machine has been fresed after closing and open brave internet browser
for which the computation of three days has been lost. However, we have learnt that 
memory resources has to be well used to avoid memory problems. Therefore, using top
is good tool. 
Similarly, creating different RQAs files for each participant would help us to get
results from one to one, without waiting for the completion of all particpants.
added: Wed 18 Jul 15:49:03 BST 2018



machine has been frozen for the second time on the day, which is a bit strage!
However, this time I will separeate the RQA of particpant01
with four windows  and avoid exesive use of the machine  resources!
added: Wed 18 Jul 22:50:25 BST 2018



* output files path:  `/home/map479/mxochicale/github/hwum-dataset/data-output/rqa/v03/rqa`


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
















# SORTED 

* [x] New plots to compare, smootheness, windolength in different sensors 
	and for different participatns


	sg0zmuvAccX, sg1zmuvAccX, sg2zmuvAccX, sg3zmuvAccX,
	sg0zmuvAccY, sg1zmuvAccY, sg2zmuvAccY, sg3zmuvAccY,
	sg0zmuvAccZ, sg1zmuvAccZ, sg2zmuvAccZ, sg3zmuvAccZ,
	sg0zmuvGyroX, sg1zmuvGyroX, sg2zmuvGyroX, sg3zmuvGyroX,
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY, sg3zmuvGyroY,
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ, sg3zmuvGyroZ

*NOTE* When running `C0_rp` for all axis, particpants, sensors, and activities.
	it takes Time difference of 30.18849 mins

Then we only select the axis AccY and GyroZ as being the axis which show 
better consistency in the patters for all the posibilities int he time series.

RP for 
```
> names(xpa)
 [1] "Participant"  "Activity"     "Sensor"       "Sample"       "sg0zmuvAccY" 
 [6] "sg1zmuvAccY"  "sg2zmuvAccY"  "sg3zmuvAccY"  "sg0zmuvGyroZ" "sg1zmuvGyroZ"
[11] "sg2zmuvGyroZ" "sg3zmuvGyroZ"
```
were computed in Time difference of 10.66991 mins

	added: Tue 19 Jun 20:26:27 BST 2018  

Main issues has been solved with:
```
source(  paste( getwd(), '/A_dataset.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Ba_timeseries_aH.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Bb_timeseries_aV.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Ca_rp_aH.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Cb_rp_aV.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/D_rqa.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Ea_rqa_plots_aH.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Eb_rqa_plots_aV.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/F0_rqa_topology.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )
source(  paste( getwd(), '/Fb_rqa_topology_plots.R', sep=''), echo=TRUE )
```
	sorted: Fri 20 Jul 16:59:36 BST 2018  







* [x] Create a 3d surface as figure 1.16 in \cite{marwan2015} with three parameters: 
	- RQA metric, embedding dimension, recurrence threshold
	- RQA metric, delay embedding, recurrence threshold

```
@incollection{marwan2015,
  author    = {Norbert Marwan and Charles L. Webber}, 
  title={Mathematical and Computational Foundations of Recurrence Quantifications}, 
  editor = {Charles L. Webber and Norbert Marwan}, 
  booktitle = {Recurrence Quantification Analysis: Theory and Best Practices},
  publisher = {Springer, Cham},
  edition   = 1,
  isbn      = {978-3-319-07154-1},
  year= 2015, 
  pages       = "3-43",
  chapter     = 1
}
```
	added: Wed 20 Jun 08:11:06 BST 2018
	sorted:  Wed 18 Jul 15:49:33 BST 2018 with `source(  paste( getwd(), '/F0_rqa_topology.R', sep=''), echo=TRUE )`



* [x] testing epsilon parameters:


```

		#epsilon<-0.2#all rp almost white	
		#epsilon <- 0.8#well distinguished rp
		epsilon <- 1#well distinguished rp
		#epsilon <- 1.2#well distinguished rp
		#epsilon<-2# rp p02HN white
		#epsilon<-3# p01HNsg1>black then p01HNsg2>white	
                rqa.analysis=rqa(time.series = xn, embedding.dim= dim_i, time.lag=tau_j,
                                   radius=epsilon,lmin=2,vmin=2,do.plot=FALSE,distanceToBorder=2)

```


added: Thu 31 May 10:01:46 BST 2018
sorted:  Wed 18 Jul 15:50:05 BST 2018 with `source(  paste( getwd(), '/Fa_rqa_topology.R', sep=''), echo=TRUE )`



* [x] adding vertical arm movements!

added: Thu  5 Jul 16:42:31 BST 2018
sorted: Mon  9 Jul 22:16:24 BST 2018



* [x]  Delete `xdata_v03.dt` which size is 145MB before comit the repo!

```
> names(xpa)
 [1] "Participant"  "Activity"     "Sensor"       "Sample"       "sg0zmuvAccX" 
 [6] "sg1zmuvAccX"  "sg2zmuvAccX"  "sg3zmuvAccX"  "sg0zmuvAccY"  "sg1zmuvAccY" 
[11] "sg2zmuvAccY"  "sg3zmuvAccY"  "sg0zmuvAccZ"  "sg1zmuvAccZ"  "sg2zmuvAccZ" 
[16] "sg3zmuvAccZ"  "sg0zmuvGyroX" "sg1zmuvGyroX" "sg2zmuvGyroX" "sg3zmuvGyroX"
[21] "sg0zmuvGyroY" "sg1zmuvGyroY" "sg2zmuvGyroY" "sg3zmuvGyroY" "sg0zmuvGyroZ"
[26] "sg1zmuvGyroZ" "sg2zmuvGyroZ" "sg3zmuvGyroZ"
```

`xdata_v03.dt` 53MB for 

```
> names(xpa)
 [1] "Participant"  "Activity"     "Sensor"       "Sample"       "sg0zmuvAccY" 
 [6] "sg1zmuvAccY"  "sg2zmuvAccY"  "sg3zmuvAccY"  "sg0zmuvGyroZ" "sg1zmuvGyroZ"
[11] "sg2zmuvGyroZ" "sg3zmuvGyroZ"
```
	added: Tue 19 Jun 20:25:26 BST 2018


Data only for the following sensors with two smotthed normalised valuyes
```

polynomial_degree <- 5
SavitzkyGolayCoeffs1 <- sgolay(p=polynomial_degree, n=29 ,m=0)
SavitzkyGolayCoeffs2 <- sgolay(p=polynomial_degree, n=159 ,m=0)


...

xpa <- xdata[,.(
	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY,
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample)]

```
	sorted: Sun  8 Jul 20:42:20 BST 2018




# TODO

* [ ] Modify the dimensions of the plot as well as the limits in each of the axis
	to show with more detail of the fluctuations of the 3d surfaces and its maxima
	and minima int them.   
	added: Fri 20 Jul 17:04:33 BST 2018  



* [ ]  Test the changes in RQA values when using different sources of datatables:
* /home/map479/mxochicale/github/hwum-dataset/r-scripts/rqa/v01 
* /home/map479/mxochicale/github/hwum-dataset/r-scripts/rqa/v02

```
preprossededata_path <- paste(github_path,'/DataSets/hwum_repository/outcomes/preProcessedDataTable_p01_to_p22',sep='')
data <- fread("TidiedInterpolatedData.datatable", header=TRUE)

rawdata_path <- paste(github_path,'/hwum-dataset/data-output/rawdata',sep='')
xdata <- fread("TidiedInterpolatedRawData-v06.dt", header=TRUE)

```

	added: Fri 15 Jun 22:40:02 BST 2018



* [ ]  Lmax values distrubution of values are a very suspicipuos for all the
participants which require more investgations about the calculations 

added: Fri 15 Jun 21:36:23 BST 2018




