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
plots_path <- paste(r_scripts_path,"/plots_path",sep="")

setwd("../../../../../")
main_repository_path <- getwd()
setwd("../")
github_path <- getwd()






##################################################################
# Time Domain setup

windowLenght <- 2000



# acq.freq <- 50  # 50 Hertz
# dt <- 1/acq.freq # 0.02 seconds or 20 miliseconds
#
# T <- 40   ## Maximum Time in seconds
# df <- 1/T
# n <- T/dt
# t <- seq(0,T,by=dt)



################################################################################
# Create Waveforms in a data.table object

allSDnoise <- 0.00

rts <- data.table(
  n=0:windowLenght,
  xn= rnorm(windowLenght+1)
  # xn= runif(windowLenght+1)
  )



################################################################################
## Plotting time series
pts <- ggplot(rts) +
  geom_line(  aes(x=n,y=xn), lwd = 2, alpha=0.7)+      # line
  geom_point( aes(x=n,y=xn), shape=21, size=2.5, stroke =0.5 ) + # stem type end
  # geom_segment(  aes(x=n,y=xtn, xend=n, yend= xtn-xtn), size=0.1 ) + # stem
  # facet_wrap(~type, scales = 'free', nrow = 4)+
  labs( x = 'n', y='x(n)' )+
  theme(axis.text=element_text(size=20),
        axis.title=element_text(size=25))+
  theme(legend.position="none")+
  theme(
        panel.grid.major = element_line(colour = 'gray'),
        panel.grid.minor = element_line(colour = 'gray'),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA)
   )



### Save Picture
width = 500
height = 500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi


filenameimage <- paste("timeseries_", "windowLenght", windowLenght, ".png",sep="")


ggsave(filename = filenameimage,
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png"
             , pts)



###############################################################################
###############################################################################
################################################################################
## CAO's Algorithm
##
source(paste(github_path,'/tavand/functions/embedding_parameters/withCao1997/cao97_functions.R', sep=''))

maxtau <- 20
maxdim <- 21
delta_ee <- 0.05
inputtimeseries<-rts$xn


E <- data.table()
for (tau_i in 1:maxtau){
    message( 'tau: ', tau_i )
    Et<- as.data.table(cao97sub(inputtimeseries,maxdim,tau_i) )
    func <-function(x) {list( tau_i )}
    Et[,c("tau"):=func(), ]
    Et[,dim:=seq(.N)]
    setcolorder(Et, c(3,4,1:2))
    E <- rbind(E, Et )
}

names(E) <- gsub("V1", "E1", names(E))
names(E) <- gsub("V2", "E2", names(E))



################################################################################
### Plot E values

e1 <- plotE1values(E,maxdim,maxtau,delta_ee)
e2 <- plotE2values(E,maxdim,maxtau,delta_ee)





####################
#saving images

## Setting up plots_path
if (file.exists(plots_path)){
     setwd(file.path(plots_path))
 } else {
   dir.create(plots_path, recursive=TRUE)
   setwd(file.path(plots_path))
 }

## setting parameters for images
plotlinewidtg <- 0.7
image_width <- 3000
image_height <- 1700
image_dpi <- 300
# image_bg <- "white" #
image_bg <- "transparent"



filenameimage <- paste("e1_", "windowLenght", windowLenght, ".png",sep="")
png(filenameimage, width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(e1)
dev.off()

filenameimage <- paste("e2_", "windowLenght", windowLenght,  ".png",sep="")
png(filenameimage, width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(e2)
dev.off()




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
