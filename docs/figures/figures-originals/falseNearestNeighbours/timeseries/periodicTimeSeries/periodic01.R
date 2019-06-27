#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
#
#
#
#
#@article{England2007,
#         author = {England, Scott A. and Granata, Kevin P.},
#         title = {{The influence of gait speed on local dynamic stability of walking}}
#}
#
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#################
# Start the clock!
start.time <- Sys.time()


### Load libraries
library(data.table)
library(ggplot2)


################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()



freq1 <- 1;
period1 <- 1 / freq1;
w1 <- 2 * pi * freq1;

freq2 <- 1/2;
period2 <- 1 / freq2;
w2 <- 2 * pi * freq2;

phase <- 0

sampling_frequency <- 50
timeinterval     <- 20         # measuring time interval (seconds)
n       <- seq(0,timeinterval-1/sampling_frequency, 1/sampling_frequency ) # vector of sampling time-points (s)

noise <- rnorm( length(n), 0, .1)


# xn <- sin(w1*n + phase)
# xn <- sin(w1*n + phase) + noise
# xn <- sin(w1*n + phase) +  cos(w2*n + phase)
# xn <- sin(w1*n + phase) +  cos(w2*n + phase) + noise

ts <- data.table(
  n=0:(length(n)-1),
  xn=n,
  xnsin=sin(w1*n + phase),
  xnsinnoise= sin(w1*n + phase) + noise,
  xnsincos=sin(w1*n + phase) +  cos(w2*n + phase),
  xnsincosnoise=sin(w1*n + phase) +  cos(w2*n + phase) + noise
  )



plot1 <- ggplot(ts,aes(x=n,y=xnsin)) +
  geom_line(lwd = 3, colour = "blue",alpha=0.25)+
  geom_point(size=3,alpha=0.4,shape=1)+
  geom_line(mapping = aes(y = xnsinnoise),lwd = 1, colour = "blue",alpha=1) +
  labs(x= "Sample", y="Measure")+
  theme_bw(20)
plot1


plot2 <- ggplot(ts,aes(x=n,y=xnsincos)) +
  geom_line(lwd = 3, colour = "red",alpha=0.25)+
  geom_point(size=3,alpha=0.4,shape=1)+
  geom_line(mapping = aes(y = xnsincosnoise),lwd = 1, colour = "red",alpha=1) +
  labs(x= "Sample", y="Measure")+
  theme_bw(20)
plot2


# write.table(ts, "periodic.dt", row.name=FALSE)




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time



################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
