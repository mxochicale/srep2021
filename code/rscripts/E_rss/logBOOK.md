
# `source( paste( getwd(), '/A_dataset.R',sep='' ), echo=TRUE  )`



# `source( paste( getwd(), '/BA_mean_caoH.R',sep='' ), echo=TRUE  )`


```
windowl<-'w2'
aMED <- fread('aMED-H-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)


#windowl<-'w5'
#aMED <- fread('aMED-H-w5.dt', header=TRUE)
#MED <- fread('MED-w5.dt', header=TRUE)
#EE <- fread('EE-w5.dt', header=TRUE)
#

#windowl<-'w10'
#aMED <- fread('aMED-H-w10.dt', header=TRUE)
#MED <- fread('MED-w10.dt', header=TRUE)
#EE <- fread('EE-w10.dt', header=TRUE)
#

#windowl<-'w15'
#aMED <- fread('aMED-H-w15.dt', header=TRUE)
#MED <- fread('MED-w15.dt', header=TRUE)
#EE <- fread('EE-w15.dt', header=TRUE)
```


window=w2 mean minEmdDim=4
window=w5 mean minEmdDim=5
window=w10 mean minEmdDim=6
window=w15 mean minEmdDim=6




# `source( paste( getwd(), '/BB_mean_caoV.R',sep='' ), echo=TRUE  )`

```

windowl<-'w2'
aMED <- fread('aMED-V-w2.dt', header=TRUE)
MED <- fread('MED-w2.dt', header=TRUE)
EE <- fread('EE-w2.dt', header=TRUE)

#
#windowl<-'w5'
#aMED <- fread('aMED-V-w5.dt', header=TRUE)
#MED <- fread('MED-w5.dt', header=TRUE)
#EE <- fread('EE-w5.dt', header=TRUE)
#

#windowl<-'w10'
#aMED <- fread('aMED-V-w10.dt', header=TRUE)
#MED <- fread('MED-w10.dt', header=TRUE)
#EE <- fread('EE-w10.dt', header=TRUE)
##
#
#windowl<-'w15'
#aMED <- fread('aMED-V-w15.dt', header=TRUE)
#MED <- fread('MED-w15.dt', header=TRUE)
#EE <- fread('EE-w15.dt', header=TRUE)
#
#



```




window=w2 mean minEmdDim=4
window=w5 mean minEmdDim=5
window=w10 mean minEmdDim=6
window=w15 mean minEmdDim=6








# `> source( paste( getwd(), '/BC_mean_amiH.R',sep='' ), echo=TRUE  )`


```


AMI <- fread('AMI-w2.dt', header=TRUE)
MTD <- fread('MTD-w2.dt', header=TRUE)
windowl<-'w2'


#
#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#
#
#AMI <- fread('AMI-w10.dt', header=TRUE)
#MTD <- fread('MTD-w10.dt', header=TRUE)
#windowl<-'w10'
#

#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'




```



window=w2 total mean minDelay=4
window=w5 total mean minDelay=6
window=w10 total mean minDelay=8
window=w15 total mean minDelay=10





# `> source( paste( getwd(), '/BD_mean_amiV.R',sep='' ), echo=TRUE  )`


```

AMI <- fread('AMI-w2.dt', header=TRUE)
MTD <- fread('MTD-w2.dt', header=TRUE)
windowl<-'w2'


#AMI <- fread('AMI-w5.dt', header=TRUE)
#MTD <- fread('MTD-w5.dt', header=TRUE)
#windowl<-'w5'
#

#AMI <- fread('AMI-w10.dt', header=TRUE)
#MTD <- fread('MTD-w10.dt', header=TRUE)
#windowl<-'w10'
#
#
#AMI <- fread('AMI-w15.dt', header=TRUE)
#MTD <- fread('MTD-w15.dt', header=TRUE)
#windowl<-'w15'





```




window=w2 total mean minDelay=6
window=w5 total mean minDelay=6
window=w10 total mean minDelay=8
window=w15 total mean minDelay=10







# `source( paste( getwd(), '/C_rss.R',sep='' ), echo=TRUE  )`





caoH window=w2 mean minEmdDim=4
caoV window=w2 mean minEmdDim=4
amiH window=w2 total mean minDelay=4
amiV window=w2 total mean minDelay=6
```
windowsl <- c(100)
windowsn <- c('w2')
dimensions <- c(4)
delays <- c(5)
```



caoH window=w5 mean minEmdDim=5
caoV window=w5 mean minEmdDim=5
amiH window=w5 total mean minDelay=6
amiV window=w5 total mean minDelay=6

```
windowsl <- c(250)
windowsn <- c('w5')
dimensions <- c(5)
delays <- c(6)
```




caoH window=w10 mean minEmdDim=6
caoV window=w10 mean minEmdDim=6
amiH window=w10 total mean minDelay=8
amiV window=w10 total mean minDelay=8

```
windowsl <- c(500)
windowsn <- c('w10')
dimensions <- c(6)
delays <- c(8)
```




caoH window=w15 mean minEmdDim=6
caoV window=w15 mean minEmdDim=6
amiH window=w15 total mean minDelay=10
amiV window=w15 total mean minDelay=10

```
windowsl <- c(750)
windowsn <- c('w15')
dimensions <- c(6)
delays <- c(10)
```





