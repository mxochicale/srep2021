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



#################
# Start the clock!
start.time <- Sys.time()


### Load libraries
library(data.table)
library(ggplot2)
require(tseriesChaos)
library(plot3D)

################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()



################################################################################
# Nyquist Theorem
# said that the frequency of the signal
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



################################################################################
## SineWaves Function
# dc.component <- 0
# amplitudes <- c(1,1,1)  # strength of signal components
# frequencies <- c(4,2,0) # frequency of signal components (Hz)
# delays <- c(0,0,0)      # delay of signal components (radians)
sinewaves.func <- function(t,dc.component,amplitudes,frequencies,delays, mean.additivenoise, sd.additivenoise ) {
    dc.component +
    sum( amplitudes * sin(2*pi*frequencies*t + delays) +
    rnorm(length(t), mean = mean.additivenoise, sd = sd.additivenoise  )
    )
}



##################################################################
# Time Domain setup
acq.freq <- 50  # 50 Hertz
dt <- 1/acq.freq # 0.02 seconds or 20 miliseconds

# T <- 4   ## Maximum Time in seconds
T <- 8   ## Maximum Time in seconds

df <- 1/T
n <- T/dt
t <- seq(0,T,by=dt)



################################################################################
# Create Waveforms in a data.table object


WindowLength <- (length(t)-1)
allSDnoise <- 0.00
# allSDnoise <- 0.05
# allSDnoise <- 0.1




s1 <- data.table(
  n=0:(length(t)-1),
  tn=t,
  xtn=sapply(t, sinewaves.func, dc.component=0, amplitudes=c(1,1,1),frequencies=c(1/2,1/4,0),delays=c(0,0,0), mean.additivenoise=0, sd.additivenoise=allSDnoise)
  )
s1 <- cbind(type="s1",s1) # Addind type column

s2 <- data.table(
  n=0:(length(t)-1),
  tn=t,
  xtn=sapply(t, sinewaves.func, dc.component=0, amplitudes=c(1,1,1),frequencies=c(1,1/2,0),delays=c(0,0,0), mean.additivenoise=0, sd.additivenoise=allSDnoise)
  )
s2 <- cbind(type="s2",s2)

s3 <- data.table(
  n=0:(length(t)-1),
  tn=t,
  xtn=sapply(t, sinewaves.func, dc.component=0, amplitudes=c(1,1,1),frequencies=c(2,1,0),delays=c(0,0,0), mean.additivenoise=0, sd.additivenoise=allSDnoise)
  )
s3 <- cbind(type="s3",s3)


s4 <- data.table(
  n=0:(length(t)-1),
  tn=t,
  xtn=sapply(t, sinewaves.func, dc.component=0, amplitudes=c(1,1,1),frequencies=c(4,2,0),delays=c(0,0,0), mean.additivenoise=0, sd.additivenoise=allSDnoise)
  )
s4 <- cbind(type="s4",s4)

ts <- rbind(s1,s2,s3,s4)







####################
#saving images

plots_path <- paste(r_scripts_path,'/plots_path4signals__WL', WindowLength, 'S',allSDnoise ,sep="")


## Setting up plots_path
if (file.exists(plots_path)){
     setwd(file.path(plots_path))
 } else {
   dir.create(plots_path, recursive=TRUE)
   setwd(file.path(plots_path))
 }


################################################################################
## Plotting time series
plot <- ggplot(ts) +
  geom_line(     aes(x=n,y=xtn, col=type), lwd = 3, alpha=0.7)+      # line
  geom_point(    aes(x=n,y=xtn), shape=21, size=2.5, stroke =0.5 ) + # stem type end
  geom_segment(  aes(x=n,y=xtn, xend=n, yend= xtn-xtn), size=0.1 ) + # stem
  labs(x='samples (n)',y='')+
  facet_wrap(~type, scales = 'free_y', nrow = 4,  strip.position="right")+
  theme_bw(20)+
  theme( axis.title.x = element_text(size = rel(2), angle = 0),
         axis.text.x = element_text(size = rel(1.5), angle = 0),
         axis.title.y = element_text(size = rel(2.5), angle = 90),
         axis.text.y = element_text(size = rel(1.5), angle = 90)
         )+
  theme(legend.position="none")

# dev.new(xpos=0,ypos=0,width=15, height=6)
# plot(plot)





 image_width_ss <- 800
 image_height_ss <- 800
 image_dpi <- 300
 image_bg <- "white" #image_bg <- "transparent" #image_bg <- "white"



 #########################
 ### Embedding Parameters
 m_dimensions <- c(3:10)# c(60)# c(10,20,30,40)
 tau_delay_embeddings <- c(1:10)#c(5)#c(1,2,3,4,5)



################################################################################
# signals s1...s4
signals <- c('s1','s2','s3','s4')
for (sk in signals){
  message('signal: ', sk)

  # Filtering data from the data.table
  setkey(ts, type)
  tmp <- ts[.(sk) ]




  #-----------------------------------------------------------------------------
  # Emdedding

  ######State Space Reconstruction [for(dim_i... and for(tau_j...]##############
  for (dim_i in (1:500)[m_dimensions]){
  for (tau_j in (1:500)[tau_delay_embeddings]){


  embedding_path <- paste(plots_path,'/m',dim_i,'t',tau_j,sep="")

  ## Setting up plots_path
  if (file.exists(embedding_path)){
       setwd(file.path(embedding_path))
   } else {
     dir.create(embedding_path, recursive=TRUE)
     setwd(file.path(embedding_path))
   }


  xinput <- tmp$xtn
  timeDelayEmbedding <- embedd(xinput, m=dim_i, d=tau_j)


  timeDelayEmbedding <- as.data.table(timeDelayEmbedding)
  message(colnames(timeDelayEmbedding))
  # colnames(timeDelayEmbedding) <- gsub("V1/","X", colnames(timeDelayEmbedding))
  colnames(timeDelayEmbedding) <- c(letters[1:ncol(timeDelayEmbedding)])

  timeDelayEmbedding[,sample:=seq(.N)]
  setcolorder(timeDelayEmbedding,  c( ncol(timeDelayEmbedding), 1:(ncol(timeDelayEmbedding)-1) )   )

  # Emdedding
  #-----------------------------------------------------------------------------



  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Plotting State Spaces
  filename2Dimage <- paste("plot_2DEmbedding_", '(m',dim_i,',t',tau_j,')_', sk, '_SD', allSDnoise, '_WL',WindowLength,".png",sep="")
  png(filename=filename2Dimage,
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

  filename3Dimage <- paste("plot_3DEmbedding_", '(m',dim_i,',t',tau_j,')_', sk, '_SD', allSDnoise, '_WL',WindowLength,".png",sep="")
  png(filename=filename3Dimage,
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
  # Plotting State Spaces
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





    }
    }
    ######State Space Reconstruction [for(dim_i... and for(tau_j...]##############




}
# signals s1...s4
################################################################################


















#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
