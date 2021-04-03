# Scripts to compute Recurrence Plots and Recurrence Quantification Analysis

## [`Ba_timeseries_aH.R`](Ba_timeseries_aH.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/Ba_timeseries_aH.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
```
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```

* Computation time
```
> end.time - start.time
Time difference of 9.531469 secs
```

## [`Bb_timeseries_aV.R`](Bb_timeseries_aV.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/Bb_timeseries_aV.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
```
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```

* Computation time
```
> end.time - start.time
Time difference of 7.474365 secs
```

## [`Ca_rp_aH.R`](Ca_rp_aH.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/Ca_rp_aH.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
```
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```

```
#number_of_participants <- 1
number_of_participants <- 3
#number_of_participants <- 12
#number_of_participants <- 20
```


* Computation time
```
Time difference of 4.164965 mins
for all the participants
```



* Commenting/uncommenting lines for types of activities and window length
```
##########################
##### one window lenght
windowsl <- c(500)
windowsn <- c('w10')
```


* Computation time
```
> end.time - start.time
Time difference of 20.71266 secs
```


## [`Cb_rp_aV.R`](Cb_rp_aV.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/Cb_rp_aV.R', sep=''), echo=TRUE )
```


* Commenting/uncommenting lines for types of activities and window length
```
###########################
###### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
```

```
#number_of_participants <- 1
number_of_participants <- 3
#number_of_participants <- 12
#number_of_participants <- 20
```

```
##########################
##### one window lenght
windowsl <- c(500)
windowsn <- c('w10')
```

* Computation time
```
> end.time - start.time
Time difference of 21.6059 secs
```

## output images files
Generated images from the above scripts are available [here](../../../docs/figures/rps/references/rp_plots/)
```
/srep2019/docs/figures/rps/src/rp_plots$ tree -s
.
├── [       4096]  H
│   ├── [       9789]  w500HFp01HS01sg0zmuvGyroZ_m006t008.png
│   ├── [       9651]  w500HFp01HS01sg1zmuvGyroZ_m006t008.png
│   ├── [       9369]  w500HFp01HS01sg2zmuvGyroZ_m006t008.png
│   ├── [       9081]  w500HFp01RS01sg0zmuvGyroZ_m006t008.png
│   ├── [       8912]  w500HFp01RS01sg1zmuvGyroZ_m006t008.png
│   ├── [       9135]  w500HFp01RS01sg2zmuvGyroZ_m006t008.png
│   ├── [       9348]  w500HNp01HS01sg0zmuvGyroZ_m006t008.png
│   ├── [       8992]  w500HNp01HS01sg1zmuvGyroZ_m006t008.png
│   ├── [       8987]  w500HNp01HS01sg2zmuvGyroZ_m006t008.png
│   ├── [      11737]  w500HNp01RS01sg0zmuvGyroZ_m006t008.png
│   ├── [      10670]  w500HNp01RS01sg1zmuvGyroZ_m006t008.png
│   └── [       8862]  w500HNp01RS01sg2zmuvGyroZ_m006t008.png
└── [       4096]  V
    ├── [       9659]  w500VFp01HS01sg0zmuvGyroY_m006t008.png
    ├── [       9461]  w500VFp01HS01sg1zmuvGyroY_m006t008.png
    ├── [       9333]  w500VFp01HS01sg2zmuvGyroY_m006t008.png
    ├── [       8936]  w500VFp01RS01sg0zmuvGyroY_m006t008.png
    ├── [       8742]  w500VFp01RS01sg1zmuvGyroY_m006t008.png
    ├── [       8755]  w500VFp01RS01sg2zmuvGyroY_m006t008.png
    ├── [       9832]  w500VNp01HS01sg0zmuvGyroY_m006t008.png
    ├── [       8905]  w500VNp01HS01sg1zmuvGyroY_m006t008.png
    ├── [       9376]  w500VNp01HS01sg2zmuvGyroY_m006t008.png
    ├── [       9950]  w500VNp01RS01sg0zmuvGyroY_m006t008.png
    ├── [       9007]  w500VNp01RS01sg1zmuvGyroY_m006t008.png
    └── [       8897]  w500VNp01RS01sg2zmuvGyroY_m006t008.png
2 directories, 24 files
```

## [`D_rqa.R`](D_rqa.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/D_rqa.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
```
##########################
##### one window lenght
windowsl <- c(100)
windowsn <- c('w2')
dimensions <- c(4)
delays <- c(5)
```

* Computation time
```
> end.time - start.time
Time difference of 5.450736 secs
```

* Commenting/uncommenting lines for types of activities and window length
```
##########################
##### one window lenght
windowsl <- c(500)
windowsn <- c('w10')
dimensions <- c(6)
delays <- c(8)
```


* Computation time
```
> end.time - start.time
Time difference of 36.66901 secs
```

* Files at [`~/srep2019/data/rqa`](../../../data/rqa)
```
~/srep2019/data/rqa$ tree -s
.
└── [     179635]  rqa_w10.dt

0 directories, 1 file
```


## [`Ea_rqa_plots_aH.R`](Ea_rqa_plots_aH.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/Ea_rqa_plots_aH.R', sep=''), echo=TRUE )
```

* Commenting/uncommenting lines for types of activities and window length
```
#windowksecs <- c('w2')
#windowksecs <- c('w5')
windowksecs <- c('w10')
#windowksecs <- c('w15')
```

* Computation time
```
> end.time - start.time
Time difference of 3.093402 secs
```

## [`Eb_rqa_plots_aV.R`](Eb_rqa_plots_aV.R)
* Run script by opening a terminal and copying/pasting or typing:
```
R
source(  paste( getwd(), '/Eb_rqa_plots_aV.R', sep=''), echo=TRUE )
```

```
#windowksecs <- c('w2')
#windowksecs <- c('w5')
windowksecs <- c('w10')
#windowksecs <- c('w15')
```


* Computation time
```
> end.time - start.time
Time difference of 2.996256 secs
```

## Image files
Generated images from the above scripts are available [here](../../../docs/figures/rqa/src)
```
~/srep2019/docs/figures/rqa/src$ tree -s
.
├── [       4096]  H
│   ├── [      16637]  det_bp_HF_HS01.png
│   ├── [      17184]  det_bp_HF_RS01.png
│   ├── [      14484]  det_bp_HN_HS01.png
│   ├── [      14812]  det_bp_HN_RS01.png
│   ├── [      21795]  entr_bp_HF_HS01.png
│   ├── [      18058]  entr_bp_HF_RS01.png
│   ├── [      21585]  entr_bp_HN_HS01.png
│   ├── [      16410]  entr_bp_HN_RS01.png
│   ├── [      29440]  ratio_bp_HF_HS01.png
│   ├── [      20161]  ratio_bp_HF_RS01.png
│   ├── [      21831]  ratio_bp_HN_HS01.png
│   ├── [      16725]  ratio_bp_HN_RS01.png
│   ├── [      20152]  rec_bp_HF_HS01.png
│   ├── [      15735]  rec_bp_HF_RS01.png
│   ├── [      28842]  rec_bp_HN_HS01.png
│   └── [      17013]  rec_bp_HN_RS01.png
└── [       4096]  V
    ├── [      16609]  det_bp_VF_HS01.png
    ├── [      15556]  det_bp_VF_RS01.png
    ├── [      14966]  det_bp_VN_HS01.png
    ├── [      14437]  det_bp_VN_RS01.png
    ├── [      21592]  entr_bp_VF_HS01.png
    ├── [      18416]  entr_bp_VF_RS01.png
    ├── [      23743]  entr_bp_VN_HS01.png
    ├── [      17525]  entr_bp_VN_RS01.png
    ├── [      25718]  ratio_bp_VF_HS01.png
    ├── [      17601]  ratio_bp_VF_RS01.png
    ├── [      18039]  ratio_bp_VN_HS01.png
    ├── [      16176]  ratio_bp_VN_RS01.png
    ├── [      19044]  rec_bp_VF_HS01.png
    ├── [      15544]  rec_bp_VF_RS01.png
    ├── [      26441]  rec_bp_VN_HS01.png
    └── [      16814]  rec_bp_VN_RS01.png

2 directories, 32 files
```
