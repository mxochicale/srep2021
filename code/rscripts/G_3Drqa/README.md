# Scripts to compute and to plot 3D Recurrence Quantification Analysis

## [`0_rqa_test.R`](0_rqa_test.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/0_rqa_test.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
```
##########################
##### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```

## [`A_3Drqa_datatable.R`](A_3Drqa_datatable.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/A_3Drqa_datatable.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
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


* Computation time
```
> end.time - start.time
Time difference of 3.418769 hours
```

* Output of data table 
```
/srep2019/data/rqa$ tree -s
.
├── [   26043425]  RQAs_p03w500.dt
```


* Window length and computation time
```
windowsl <- c(100)
windowsn <- c('w2')

> end.time - start.time
Time difference of 22.43518 mins

├── [   23650692]  RQAs_p03w100.dt

```


* Window length and computation time
```
windowsl <- c(250)
windowsn <- c('w5')

> end.time - start.time
Time difference of 50.06543 mins

├── [   25682915]  RQAs_p03w250.dt
```

* Window length and participant number
```
windowsl <- c(100,250,500)
windowsn <- c('w2', 'w5', 'w10')
		pNN <- c('p01')
```

* Running times: 
```
#run A for "p03w750" on Sun 26 Apr 12:47:39 BST 2020
windowsl <- c(750)
windowsn <- c('w15')
...
	if (number_of_participants == 1) {
		setkey(awdata, Participant)
		pNN <- c('p03')
		pawdata <- awdata[.(
				pNN
				)]

```
```
start: Sun 26 Apr 12:54:40 BST 2020
> end.time - start.time
Time difference of 5.656155 hours
```

* Running times: 
```
* run A for "p01w250" on Sun 26 Apr 21:09:32 BST 2020
Time difference of 27.29116 mins

* run A for "p01w500" on Tue 28 Apr 14:25:42 BST 2020
Time difference of 1.860006 hours

* run A for "p01w750" started on Tue 28 Apr 17:16:44 BST 2020
Time difference of 5.526684 hours
```

* Running times: 
```
* run A for "p02w100" started on 
Wed 29 Apr 13:33:29 BST 2020
Time difference of 10.69237 mins

* run A for "p02w750" started on 
Wed 29 Apr 17:50:18 BST 2020
~ 6hrs

* run A for "p02w500" started on 
Thu 30 Apr 17:30:53 BST 2020
Time difference of 1.812537 hours

* run A for "p02w250" started on 
Thu 30 Apr 21:54:31 BST 2020
Time difference of 37.14682 mins
```

* Files at [`~/srep2019/data/rqa`](../../../data/rqa)
```
/srep2019/data/rqa$ tree -D
.
├── [Nov 11 21:58]  RQAs_p01w100.dt
├── [Apr 26 21:36]  RQAs_p01w250.dt
├── [Apr 28 16:17]  RQAs_p01w500.dt
├── [Apr 28 22:48]  RQAs_p01w750.dt
├── [Apr 29 13:43]  RQAs_p02w100.dt
├── [Apr 30 22:31]  RQAs_p02w250.dt
├── [Apr 30 19:19]  RQAs_p02w500.dt
├── [Apr 30  5:25]  RQAs_p02w750.dt
├── [Nov 11 21:58]  RQAs_p03w100.dt
├── [Nov 11 21:58]  RQAs_p03w250.dt
├── [Nov 11 21:58]  RQAs_p03w500.dt
├── [Apr 26 18:34]  RQAs_p03w750.dt
└── [Nov 11 21:58]  rqa_w10.dt

0 directories, 13 files
```

## [`C_3Drqa_plots_epsilons.R`](C_3Drqa_plots_epsilons.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
> source(  paste( getwd(), '/C_3Drqa_plots_epsilons.R', sep=''), echo=TRUE )
```


* Commenting/uncommenting lines for types of metric and window length
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


R script
```
## example of lines to uncomment 
file_ext <- paste('RQAs_p02w250.dt',sep='')
selectParticipant <- 'p02'
selectWindow <- 'w250'
selectActivity <- 'Horizontal'; activities <- c('HN','HF'); axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
```

## Output image files
Generated images from the above scripts are available [here](../../../docs/figures/rqa/src/3drqa_epsilons)
```
~/srep2019/docs/figures/rqa/src/3drqa_epsilons$ tree -d
.
├── p01-w100-Horizontal
├── p01-w100-Vertical
├── p01-w250-Horizontal
├── p01-w250-Vertical
├── p01-w500-Horizontal
├── p01-w500-Vertical
├── p01-w750-Horizontal
├── p01-w750-Vertical
├── p02-w100-Horizontal
├── p02-w100-Vertical
├── p02-w250-Horizontal
├── p02-w250-Vertical
├── p02-w500-Horizontal
├── p02-w500-Vertical
├── p02-w750-Horizontal
├── p02-w750-Vertical
├── p03-w100-Horizontal
├── p03-w100-Vertical
├── p03-w250-Horizontal
├── p03-w250-Vertical
├── p03-w500-Horizontal
├── p03-w500-Vertical
├── p03-w750-Horizontal
└── p03-w750-Vertical

24 directories
```

## [`D_3Drqa_plots_sensors_activities.R`](D_3Drqa_plots_sensors_activities.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/D_3Drqa_plots_sensors_activities.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
```
	## (4.2.1) Activities Selection
	#activities <- c('HN','HF')
	activities <- c('VN','VF')


				### (4.2.4) Axis Selection
				#axis <- c('sg0zmuvGyroZ', 'sg1zmuvGyroZ', 'sg2zmuvGyroZ')
				axis <- c('sg0zmuvGyroY', 'sg1zmuvGyroY', 'sg2zmuvGyroY')

```

## Output images files
Generated images from the above scripts are available [here](../../../docs/figures/rqa/src/3drqa_sensors_activities)
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

## Issues
* Reported on Sat 23 Mar 07:47:02 GMT 2019
```
                                        epsilon_k: 3
#### axis:sg2zmuvGyroZ
>> Embedding parameters:  m=1 tau=1
                                        epsilon_k: 0.2
                                        epsilon_k: 0.3

                                        epsilon_k: 3
Error in rbindlist(l, use.names, fill, idcol) : 
  Answer requires 30 columns whereas one or more item(s) in the input list 
has only 19 columns. This could be because the items in the list may not 
all have identical column names or some of the items may have duplicate names. 
In either case, if you're aware of this and would like to fill those missing columns, set the argument 'fill=TRUE'.
```