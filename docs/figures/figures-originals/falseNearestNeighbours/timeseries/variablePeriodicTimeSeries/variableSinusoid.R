##################################################
#
#
#
# Miguel Perez-Xochicale <http://mxochicale.github.io/>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2018)
#

#@article{England2007,
#         author = {England, Scott A. and Granata, Kevin P.},
#         title = {{The influence of gait speed on local dynamic stability of walking}}
#}



#
#  the 12th April 2017
#  the 1st of February 2016
#
#
##################################################


#source('/home/map479-admin/mxochicale/phd/r-code/functions/ollin_cencah.R')
library(lattice) ##xyplot



timeserie.structural.noise <- function(time.serie.function, number.of.cycles, timesamples, sd.additivenoise, basefrequency, sd.fundamental.frequency, baseamplitude, sd.amplitude) {

  S_i <- character()
  for (i in 1:number.of.cycles)
  {

    random.amplitude <- abs (rnorm(1, mean = baseamplitude, sd = sd.amplitude) )
    random.frequency <- abs (rnorm(1, mean = basefrequency, sd = sd.fundamental.frequency) )
    #random.frequency <- 0.15
    w.random <- 2*pi*random.frequency


    random.period <- (1/random.frequency)
    #print(random.period)

    #
    #  1 sample@50Hz  = 0.02
    #  x samples      = random.period
    period.lenght <-  round (random.period / 0.02 )
    #print ( period.lenght  )

    additive.noise <-  rnorm(period.lenght , mean = 0, sd = sd.additivenoise)

    S_i <- append( S_i, ( random.amplitude*sapply(timesamples[1:period.lenght], function(n) time.serie.function(n,w.random)) + additive.noise)  )

  }

  S_i <- as.numeric(S_i) # convert data from chart to numeric
  S_i <- as.vector(S_i)  # convert data from numeric to vector

  return(S_i)
}


plot.timeseries <- function(time.series) {
plot <- xyplot(time.series ~ 1: length(time.series),
  pch=16, col.line = c('royalblue'), type = c("o"), lwd=1,
  xlab=list(label="", cex=3),
  ylab=list(label="", cex=3),
  scales=list(font=1, cex=2,
                   y=list(at=seq(-2,2,1),limits=c(-1.5,1.5))
                   #x=list(at=seq(-2,2,1),limits=c(-2.1,2.1))
       ),

  ##function to modify the grid pattern
  panel=function(...) {
    panel.xyplot(...)
    panel.grid(h=-20, v=-1, col.line="blue", lwd=0.5, lty=3 )
  }

  )
print(plot)
}




################################################################################
sampling.frequency <- 50        # data acquisition (sample) frequency (Hz)
timeinterval     <- 100000      # measuring time interval (seconds)
timesamples       <- seq(0,timeinterval-1/sampling.frequency, 1/sampling.frequency) # vector of sampling time-points (s)


sd.additivenoise <- 0.00000000000001    # additive noise standard deviation

fundamental.frequency <- 1      # frequency of signal component (Hz)
baseamplitude <- 1
sd.amplitude <- 0.000000000000001
dc.component <- 0
delay <- 0          # delay of signal component (radians)


signal.function   <- function(n,w) {
   dc.component +   sin(w*n + delay)
}


number.of.cycles <- c(10)
sd.fundamental.frequency <- c(0.8)


tts <- timeserie.structural.noise(signal.function, number.of.cycles, timesamples, sd.additivenoise, fundamental.frequency, sd.fundamental.frequency,  baseamplitude, sd.amplitude )
plot.timeseries(tts)


# mainDir <- getwd()
# subDir <- "artificial_data"
#
#
# # http://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist
# if (file.exists(subDir)){
#   setwd(file.path(mainDir, subDir))
# } else {
#   dir.create(subDir)
#   setwd(file.path(mainDir, subDir))
# }
#













#
# #sd.fundamental.frequency <- c(0,0.1,0.2,0.3)
# #number.of.cycles <- c(10,100,1000)
#
# sd.fundamental.frequency <- c(0,0.1,0.2,0.3)
# number.of.cycles <- c(10,100,1000)
#
#
# NC <- length(number.of.cycles)
# NF <- length(sd.fundamental.frequency)
#
# #Mappend <- matrix(, nrow = 0, ncol = NF)
# # for loop for different window lenghts
# for (j in 1: NC  ){
#   #print(number.of.cycles[j])
#
#   # create four sequence with different standard deviation for the fundamental frequency
#   for (k in 1: NF ){
#
#     #print( sd.fundamental.frequency[k] )
#     tts <- timeserie.structural.noise(signal.function, number.of.cycles[j], timesamples, sd.additivenoise, fundamental.frequency, sd.fundamental.frequency[k],  baseamplitude, sd.amplitude )
#     LN <- length(tts)
#     write.table(tts,paste("timeseries_cycles_", number.of.cycles[j],  "_sdfreq_", sd.fundamental.frequency[k], "_lenght_", LN, ".csv", sep="") , row.names=FALSE, col.names=FALSE)
#
#
#     #plot.timeseries(tts)
#
#     #Mcurrent <- matrix(tts)
# #      N <- dim(Mcurrent)[1]
# #      print(N)
# #
# #     Mcurrent <- matrix(Mcurrent,N,1)
# #     Mappend <- matrix(Mappend,N,1)
# #
# #     print(dim(Mcurrent) )
# #     print(dim(Mappend) )
# #
# #
# #     Mappend <- cbind(Mcurrent,Mappend)
# #     View(Mappend)
#
#
#   }
# }




# setwd("../")
