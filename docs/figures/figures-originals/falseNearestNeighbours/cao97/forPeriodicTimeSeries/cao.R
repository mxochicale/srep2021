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
library(RColorBrewer)


################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()
plots_path <- paste(r_scripts_path,"/plots_periodic_path",sep="")


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

T <- 40   ## Maximum Time in seconds
df <- 1/T
n <- T/dt
t <- seq(0,T,by=dt)



################################################################################
# Create Waveforms in a data.table object

allSDnoise <- 0.00

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

# ts <- rbind(s1,s2,s3,s4)

ts <- rbind(s1)



################################################################################
## Plotting time series
pts <- ggplot(ts) +
  geom_line(     aes(x=n,y=xtn), lwd = 2, alpha=0.7)+      # line
  geom_point(    aes(x=n,y=xtn), shape=21, size=2.5, stroke =0.5 ) + # stem type end
  # geom_segment(  aes(x=n,y=xtn, xend=n, yend= xtn-xtn), size=0.1 ) + # stem
  # facet_wrap(~type, scales = 'free', nrow = 4)+
  labs( x = 'n', y='x(n)' )+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=25))+
  theme(legend.position="none")+
  theme(
     panel.grid.major = element_blank(),
     panel.grid.minor = element_blank(),
     panel.background = element_rect(fill = "transparent",colour = NA),
     plot.background = element_rect(fill = "transparent",colour = NA)
     # axis.line = element_line(colour = "black")
     )



### Save Picture
width = 1000
height = 500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


windowLenght <- length(t)-1
filenameimage <- paste("timeseries_", "windowLenght", windowLenght, ".png",sep="")


ggsave(filename = filenameimage,
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png"
             , pts)






# ###############################################################################
# ###############################################################################
# ################################################################################
# ## CAO's Algorithm
# ##
# source('~/mxochicale/github/r-code_repository/functions/embedding_parameters/withCao1997/cao97_functions.R')
#
#
# maxtau <- 20
# maxdim <- 21
# inputtimeseries<-ts$xtn
#
#
# E <- data.table()
# for (tau_i in 1:maxtau){
#     message( 'tau: ', tau_i )
#     Et<- as.data.table(cao97sub(inputtimeseries,maxdim,tau_i) )
#     func <-function(x) {list( tau_i )}
#     Et[,c("tau"):=func(), ]
#     Et[,dim:=seq(.N)]
#     setcolorder(Et, c(3,4,1:2))
#     E <- rbind(E, Et )
# }
#
# names(E) <- gsub("V1", "E1", names(E))
# names(E) <- gsub("V2", "E2", names(E))
#
#
#
#
# ################################################################################
# ### Plot E values
#
# e1 <- ggplot(E) +
#     geom_line( aes(x=dim,y=E1, colour=factor(tau) ),lwd = 3,alpha=0.5)+
#     geom_point( aes(x=dim,y=E1, shape=factor(tau), colour=factor(tau)), size=5, stroke =1 )+
#     scale_color_manual(values = colorRampPalette(brewer.pal(n = 8, name="Greens"))(maxtau) ) +
#     scale_shape_manual(values= 1:(maxtau))+
#     labs(x='Embedding dimension')+
#     coord_cartesian(xlim = c(0, (maxdim-1) ), ylim = c(0, 2 ) )+
#     theme( axis.title.x = element_text(size = rel(2.5), angle = 0),
#            axis.text.x = element_text(size = rel(2), angle = 0),
#            axis.title.y = element_text(size = rel(2.5), angle = 90),
#            axis.text.y = element_text(size = rel(2), angle = 90)
#            )+
#     theme(legend.title = element_text(size = rel(1.5)),
#           legend.text = element_text(size = rel(1.5))
#           )
#     # theme(legend.position = c(0.9, 0.3) )+
#     # theme(legend.position = 'none' )
#
#
# e2 <- ggplot(E) +
#     geom_line( aes(x=dim,y=E2, colour=factor(tau) ),lwd = 3,alpha=0.5)+
#     geom_point( aes(x=dim,y=E2, shape=factor(tau), colour=factor(tau)), size=5, stroke =1 )+
#     scale_color_manual(values = colorRampPalette(brewer.pal(n = 8, name="Blues"))(maxtau) ) +
#     scale_shape_manual(values= 1:(maxtau))+
#     labs(x='Embedding dimension')+
#     coord_cartesian(xlim = c(0, (maxdim-1) ), ylim = c(0, 2 ) )+
#     theme( axis.title.x = element_text(size = rel(2.5), angle = 0),
#            axis.text.x = element_text(size = rel(2), angle = 0),
#            axis.title.y = element_text(size = rel(2.5), angle = 90),
#            axis.text.y = element_text(size = rel(2), angle = 90)
#            )+
#     theme(legend.title = element_text(size = rel(1.5)),
#           legend.text = element_text(size = rel(1.5))
#           )
#   #  theme(legend.position = c(0.9, 0.3) )
#   #  theme(legend.position = 'none' )
#
#
#
#
#
# ####################
# #saving images
#
# ## Setting up plots_path
# if (file.exists(plots_path)){
#      setwd(file.path(plots_path))
#  } else {
#    dir.create(plots_path, recursive=TRUE)
#    setwd(file.path(plots_path))
#  }
#
# ## setting parameters for images
# plotlinewidtg <- 0.7
# image_width <- 3000
# image_height <- 1700
# image_dpi <- 300
# image_bg <- "white" #image_bg <- "transparent"
#
#
#
# filenameimage <- paste("e1_", "windowLenght", windowLenght, ".png",sep="")
# png(filenameimage, width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
# print(e1)
# dev.off()
#
# filenameimage <- paste("e2_", "windowLenght", windowLenght,  ".png",sep="")
# png(filenameimage, width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
# print(e2)
# dev.off()
#
#
#








#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
