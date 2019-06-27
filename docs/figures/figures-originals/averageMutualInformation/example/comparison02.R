#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# FileDescription:
# The following times series are generated using /timeseries/periodicTimeSeries/periodic03.R
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
#
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



require(tseriesChaos)
library(data.table)
library(ggplot2)



temp <- NULL;
temp<-read.csv("datafile", header=FALSE, sep=' ');
lts <-temp[,]
temp <- NULL;

maxtau <- 100
b  <- 100

tsmitemp <- mutual(lts, partitions= b , lag.max = maxtau, plot=FALSE)
tsmi <- as.data.table(unname(tsmitemp[]))

fsNNtmp <-function(x) {list("R")}
tsmi[,c("Source"):=fsNNtmp(), ]
tsmi[, TAU := 0:(.N-1), ]
setcolorder(tsmi, c(3,2,1))
colnames(tsmi) <- c('TAU', 'Source', 'mi')

###### mi values computed with miinfo.c
ctsmi <- fread("r.mi", header=FALSE)
fsNNtmp <-function(x) {list("c")}
ctsmi[,c("Source"):=fsNNtmp(), ]
setcolorder(ctsmi,c(    1,(ncol(ctsmi)),(ncol(ctsmi)-1)   ))
colnames(ctsmi) <- c('TAU', 'Source', 'mi')

MI <- rbind(ctsmi,tsmi)


pmi <- ggplot(MI, aes(x=TAU, y=mi, colour=Source, group=Source))+
  geom_line(
      size=3)+
  geom_point(aes(shape=Source),   # Shape depends on Source
           fill = "white",    # White fill
           size = 2)  +       # Large points
  scale_shape_manual(values=c(21,24))+  # Shapes: Filled circle, triangle
  labs(x='TAU', y='AMI' )+
  theme_bw(20)+
  theme(leg\end.position = c(0.8, 0.8))

# plot(pmi)
