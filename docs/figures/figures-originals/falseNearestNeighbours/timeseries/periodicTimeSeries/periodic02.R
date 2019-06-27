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
timeinterval     <- 31         # measuring time interval (seconds)
nT       <- seq(0,timeinterval-1/sampling_frequency, 1/sampling_frequency ) # vector of sampling time-points (s)

noise <- rnorm( length(nT), 0, .1)



sin_ts <- data.table(
    n=0:(length(nT)-1),
    nT=nT,
    xn=sin(w1*nT + phase)
    )
sin_ts <- cbind(type="sine",sin_ts) # Addind type column


sinnoise_ts <- data.table(
    n=0:(length(nT)-1),
    nT=nT,
    xn=sin(w1*nT + phase) + noise
    )
sinnoise_ts <- cbind(type="sinenoise",sinnoise_ts) # Addind type column


sincos_ts <- data.table(
    n=0:(length(nT)-1),
    nT=nT,
    xn=sin(w1*nT + phase) +  cos(w2*nT + phase)
    )
sincos_ts <- cbind(type="sinecosine",sincos_ts) # Addind type column



sincosnoise_ts <- data.table(
    n=0:(length(nT)-1),
    nT=nT,
    xn=sin(w1*nT + phase) +  cos(w2*nT + phase) + noise
    )
sincosnoise_ts <- cbind(type="sinecosinenoise",sincosnoise_ts) # Addind type column



pts <- rbind(sin_ts, sinnoise_ts, sincos_ts, sincosnoise_ts)


################################################################################
## Plotting time series
plotting <- ggplot(pts) +
   geom_line(aes(x=n,y=xn, col=type),lwd = 1.5,alpha=0.7)+
   facet_wrap(~type, scales = 'free', nrow = 4)
   theme_bw(20)


dev.new(xpos=1000,ypos=200,width=20, height=8)
plot(plotting)


# write.table(ts, "periodic.dt", row.name=FALSE)





#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
