#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# FileDescription:
#
##* Create a embedding using different signal frequencies, sampling frequencies
##* with different embeddcing parameters
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


############
# Libraries
library(data.table)
library(ggplot2)

library(plot3D)
require(tseriesChaos)



##################################################################
# Time Domain setup
acq.freq <- 50
dt <- 1/acq.freq # 0.02 seconds or 20 miliseconds


# Nyquist Theorem said that the frequency of the signal
# should be the double as the sampling frequency to recover the signal
# and avoid problems with aliasing. For instance, for the
# maximum hearning frequency of  20Hz, the
# sampling rate for those signals should be 40 Hz.
# FSampling > 2*F max

# Fmax=5
# 50 > 2*5
# 50 > 10

# For our case, the Maximum Frequencies shohould be
# Fmapling/2 which is a maximum freqneices of 25
#


T <- 4
df <- 1/T
n <- T/dt
t <- seq(0,T,by=dt)

dc.component <- 0
component.strength <- c(1,1,1)      # strength of signal components
component.freqs <- c(4,2,0)       # frequency of signal components (Hz)
# component.freqs <- c(1,0,0)       # frequency of signal components (Hz)

component.delay <- c(0,0,0)         # delay of signal components (radians)


f   <- function(t) {
  dc.component + sum( component.strength * sin(2*pi*component.freqs*t + component.delay))
}


sd.additivenoise <- 0.03      # additive noise standard deviation
mean.amplitude <- 0

out <- sapply(t, function(t) f(t)) +  rnorm(length(t), mean = mean.amplitude, sd = sd.additivenoise)


################################################################################
# Create data table

signal <- data.table(
  tn=t,
  xtn=out)

fsNNtmp <-function(x) {list("sine")}
signal[,c("type"):=fsNNtmp(), ]
signal[,n:=seq(.N)]
setcolorder(signal, c(3,4,1,2))




################################################################################
# Ploting time-series


segmentlinewidth <- 0.7
point_linewidth <- 1
point_diameter <- 3
image_width <- 800
image_height <- 500# scatter3D(
#   timeDelayEmbedding$xt1, timeDelayEmbedding$xt2, timeDelayEmbedding$xt3,
#   # timeDelayEmbedding$xt2, timeDelayEmbedding$xt1, timeDelayEmbedding$xt3,
#   # timeDelayEmbedding$xt3, timeDelayEmbedding$xt1, timeDelayEmbedding$xt2,
#   colvar = timeDelayEmbedding$sample,
#   bty = "u", type = "l", lwd=15, axis.scales = TRUE,
#   d=1,
#   main = "",
#   xlab = '', ylab ='', zlab = '',
#   colkey = TRUE,
#   plot=TRUE
#  )

image_dpi <- 300
image_bg <- "white" #image_bg <- "transparent" #image_bg <- "white"


png(filename="plot_periodicTimeSeries.png",
  bg = image_bg,
  type="cairo",
  width = image_width , height = image_height, units = "px",
  pointsize=20,
  res=75
  )

plot <- ggplot(data=signal) +
  geom_segment(  aes(x=tn,y=xtn, xend=tn, yend= xtn-xtn), size=segmentlinewidth )+
  geom_point(  aes(x=tn,y=xtn), shape=21, size=point_diameter , stroke = point_linewidth )+
  labs( x = 'tn (s)', y='x[tn]' )+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=25))



print(plot)

dev.off()













################################################################################
# Emdedding

m_dimension = 5
tau_delay = 20

xinput <- signal$xtn
timeDelayEmbedding <- embedd(xinput, m=m_dimension, d=tau_delay)


timeDelayEmbedding <- as.data.table(timeDelayEmbedding)
message(colnames(timeDelayEmbedding))
# colnames(timeDelayEmbedding) <- gsub("V1/","X", colnames(timeDelayEmbedding))
colnames(timeDelayEmbedding) <- c(letters[1:ncol(timeDelayEmbedding)])

timeDelayEmbedding[,sample:=seq(.N)]
setcolorder(timeDelayEmbedding,  c( ncol(timeDelayEmbedding), 1:(ncol(timeDelayEmbedding)-1) )   )



################################################################################
# Plotting State Spaces

image_width_ss <- 800
image_height_ss <- 800
image_dpi <- 300
image_bg <- "white" #image_bg <- "transparent" #image_bg <- "white"


png(filename="plot_periodicTimeSeries_2DEmbedding.png",
  bg = image_bg,
  type="cairo",
  width = image_width_ss , height = image_height_ss, units = "px",
  pointsize=20,
  res=75
  )

scatter2D(
  timeDelayEmbedding$a, timeDelayEmbedding$b,
  colvar = timeDelayEmbedding$sample,
  bty = "u", type = "l", lwd=15,
  main = "",
  xlab = '', ylab ='',
  colkey = TRUE
)

dev.off()


png(filename="plot_periodicTimeSeries_3DEmbedding.png",
  bg = image_bg,
  type="cairo",
  width = image_width_ss , height = image_height_ss, units = "px",
  pointsize=20,
  res=75
  )

scatter3D(
  timeDelayEmbedding$a, timeDelayEmbedding$b, timeDelayEmbedding$c,
  colvar = timeDelayEmbedding$sample,
  bty = "u", type = "l", lwd=15, axis.scales = TRUE,
  d=1,
  main = "",
  xlab = '', ylab ='', zlab = '',
  colkey = TRUE,
  plot=TRUE
)

dev.off()

















# persp3D(
#   x=timeDelayEmbedding$xt1, y=timeDelayEmbedding$xt2, z=1, plot=TRUE)
# scatter2D(XY$x, XY$y, colvar = Volcano[10,], type = "l" ...
# add =TRUE
# plot=FALSE
