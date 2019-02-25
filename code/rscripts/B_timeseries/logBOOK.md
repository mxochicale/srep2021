



# figures output
~/srep2019/docs/figures/timeseries/src 



# vertical/horizontal


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
#
#

```


added Tue Feb 19 19:38:43 GMT 2019




