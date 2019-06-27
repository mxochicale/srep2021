#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# FileDescription:
#
#
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


T <- 2
df <- 1/T
n <- T/dt
t <- seq(0,T,by=dt)

dc.component <- 0
component.strength <- c(1,1,1)      # strength of signal components
component.freqs <- c(2,0,0)       # frequency of signal components (Hz)
component.delay <- c(0,0,0)         # delay of signal components (radians)


f   <- function(t) {
  dc.component + sum( component.strength * sin(2*pi*component.freqs*t + component.delay))
}

sd.additivenoise <- 0    # additive noise standard deviation
mean.amplitude <- 0

out <- sapply(t, function(t) f(t)) +  rnorm(length(t), mean = mean.amplitude, sd = sd.additivenoise)

out <- as.data.table(out)


fsNNtmp <-function(x) {list("Sine")}
out[,c("type"):=fsNNtmp(), ]
out[,Sample:=seq(.N)]
setcolorder(out, c(2,3,1))
colnames(out) <- c('Type',"Sample","xt")


plot <- ggplot(data=out) +
  geom_segment(  aes(x=Sample,y=xt, xend=Sample,yend= xt-xt))+
  geom_point(  aes(x=Sample,y=xt), shape=1, size=3 )


print(plot)
