# `B_timeseries`
Terminal outputs on Tue Feb 19 19:38:43 GMT 2019

## Running script
Open a terminal and copy/paste or type:
```
R
source(  paste( getwd(), '/B_timeseries.R', sep=''), echo=TRUE )
```

## Plotting vertical and horizontal arm movements
Comment and uncomment the following lines to get plots for vertical or horizontal time-series data
```
#################
####HORIZONTAL
data <- data[,.(
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample,Time)]

movementtag <- 'H' 
setkey(data, Activity)
data <- data[.(c('HN', 'HF'))]


#############
###VERTICAL
#data <- data[,.(
#	sg0zmuvGyroY, sg1zmuvGyroY, sg2zmuvGyroY
#	), by=. (Participant,Activity,Sensor,Sample,Time)]
#
#movementtag <- 'V' 
#setkey(data, Activity)
#data <- data[.(c('VN', 'VF'))]
```

## Figures path output
The path for figure output is `~/srep2019/docs/figures/timeseries/src`.
See figures [here](../../../docs/figures/timeseries/src).
