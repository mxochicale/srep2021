# Average Mutual Information to compute delay embeddings

## [`B_ami.R`](B_ami.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(paste(getwd(),"/B_ami.R", sep=""), echo=TRUE)
```

* Commenting/uncommenting lines for types of activities and window length
```
######################################
## w2, 2-second window (100 samples) ## 100 to 200
#wstar=100
#windowlengthnumber=100
#windowltag <- 'w2'
#
######################################
## w5, 5-second window (250 samples) # 100 to 350
#wstar=100
#windowlengthnumber=250
#windowltag <- 'w5'

#####################################
## w10, 10-second window (500 samples) ## 100 to 600
wstar=100
windowlengthnumber=500
windowltag <- 'w10'

######################################
## w15, 15-second window (750 samples) ## 100 to 850
#wstar=100
#windowlengthnumber=750
#windowltag <- 'w15'
```


* Computation time
```
> end.time - start.time
Time difference of 10.43898 secs
```

* Files at [`~/srep2019/data/utde`](../../../data/utde)
```
4.9M Oct 16 18:48 AMI-w10.dt
34K Oct 16 18:48 MTD-w10.dt
```


## [`CA_plotamiH.R`](CA_plotamiH.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(paste(getwd(),"/CA_plotamiH.R", sep=""), echo=TRUE)
```

* Commenting/uncommenting lines for types of activities and window length
```
#AMI <- fread('AMI-w2.dt', header=TRUE)
#MTD <- fread('MTD-w2.dt', header=TRUE)
#windowl<-'w2'
#

#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#
#
AMI <- fread('AMI-w10.dt', header=TRUE)
MTD <- fread('MTD-w10.dt', header=TRUE)
windowl<-'w10'

#
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#
```

* Computation time
```
> end.time - start.time
Time difference of 2.365328 secs
```

## [`CB_plotamiV.R`](CB_plotamiV.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(paste(getwd(),"/CB_plotamiV.R", sep=""), echo=TRUE)
```

* Commenting/uncommenting lines for types of activities and window length
```
#AMI <- fread('AMI-w2.dt', header=TRUE)
#MTD <- fread('MTD-w2.dt', header=TRUE)
#windowl<-'w2'
#

#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#

AMI <- fread('AMI-w10.dt', header=TRUE)
MTD <- fread('MTD-w10.dt', header=TRUE)
windowl<-'w10'

##
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'
#
#
```

* Computation time
```
> end.time - start.time
Time difference of 0.7130244 secs
```

## Image files
Generated images from the above scripts are available [here](../../../docs/figures/caoami/src)

```
/srep2019/docs/figures/caoami/src$ tree -s
.
├── [      28509]  boxplots_HS01_HF-window-w10.png
├── [      27047]  boxplots_HS01_HN-window-w10.png
├── [      28131]  boxplots_HS01_VF-window-w10.png
├── [      28052]  boxplots_HS01_VN-window-w10.png
├── [      26825]  boxplots_RS01_HF-window-w10.png
├── [      25493]  boxplots_RS01_HN-window-w10.png
├── [      24098]  boxplots_RS01_VF-window-w10.png
├── [      26478]  boxplots_RS01_VN-window-w10.png
├── [      18059]  bp_avMED-HS01-w10-HF.png
├── [      18913]  bp_avMED-HS01-w10-HN.png
├── [      18870]  bp_avMED-HS01-w10-VF.png
├── [      19200]  bp_avMED-HS01-w10-VN.png
├── [      18348]  bp_avMED-RS01-w10-HF.png
├── [      17132]  bp_avMED-RS01-w10-HN.png
├── [      18011]  bp_avMED-RS01-w10-VF.png
└── [      18252]  bp_avMED-RS01-w10-VN.png

0 directories, 16 files
```

## TODO
* automatically select the window  
added: Fri 31 Aug 13:42:24 BST 2018  
