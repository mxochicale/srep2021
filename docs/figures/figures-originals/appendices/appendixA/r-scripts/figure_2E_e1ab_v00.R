#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:           DataTidiedInterpolatedSmoothed_p01_to_p22.R
# FileDescription:
#
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(signal)# for butterworth filter and sgolay
library(ggplot2)


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Defining paths for main_path, r_scripts_path, ..., etc.
setwd("../")
main_path <- getwd()
setwd("../")
main_outcomesdata_path <- getwd()

r_scripts_path <- paste(main_path,"/r-scripts/",sep="")
data_path <-  paste(main_path,"/data/second_experiment/muse/",sep="")
outcomes_path <- paste(main_path,"/outcomes",sep="")


############################################################################
###   Reading RAW Data from Participants
###

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Setting DataSets paths
setwd(data_path)


details = file.info(list.files(pattern=""))
details = details[with(details, order(as.POSIXct(mtime))), ]
files = rownames(details)

e1a <- fread(files[ 1 ] )
e1a <- cbind(experiment="e1a", e1a)
e1a[,sample:=seq(.N)]
setcolorder(e1a, c(20,1:19))


e1b <- fread(files[ 2 ] )
e1b <- cbind(experiment="e1b", e1b)
e1b[,sample:=seq(.N)]
setcolorder(e1b, c(20,1:19))

e2a <- fread(files[ 3 ] )
e2a <- cbind(experiment="e2a", e2a)
e2a[,sample:=seq(.N)]
setcolorder(e2a, c(20,1:19))


e2b <- fread(files[ 4 ] )
e2b <- cbind(experiment="e2b", e2b)
e2b[,sample:=seq(.N)]
setcolorder(e2b, c(20,1:19))




### Deleting Columns
deleteThisColumns = c("TimestampRx", "TimestampTx", "MagnX", "MagnY", "MagnZ", "qW", "qX", "qY", "qZ", "HDR_AccX", "HDR_AccY", "HDR_AccZ")
e1a[, (deleteThisColumns):=NULL]
e1b[, (deleteThisColumns):=NULL]
e2a[, (deleteThisColumns):=NULL]
e2b[, (deleteThisColumns):=NULL]


################################################################################
### (4.2) Smoothing data with Savitzky-Golay Filter
SavitzkyGolayCoeffs <- sgolay(p=5,n=25 ,m=0)
### FUNCTON TO SMOOTH THE DATA
SGolay <- function(xinput,sgCoeffs){
  output <- filter(sgCoeffs, xinput)
  return(output)
}


e1a[,c('sgAccX', 'sgAccY', 'sgAccZ','sgGyroX', 'sgGyroY', 'sgGyroZ') :=
       lapply(.(AccX, AccY, AccZ, GyroX, GyroY, GyroZ), function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))]

e1b[,c('sgAccX', 'sgAccY', 'sgAccZ','sgGyroX', 'sgGyroY', 'sgGyroZ') :=
       lapply(.(AccX, AccY, AccZ, GyroX, GyroY, GyroZ), function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))]

e2a[,c('sgAccX', 'sgAccY', 'sgAccZ','sgGyroX', 'sgGyroY', 'sgGyroZ') :=
      lapply(.(AccX, AccY, AccZ, GyroX, GyroY, GyroZ), function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))]

e2b[,c('sgAccX', 'sgAccY', 'sgAccZ','sgGyroX', 'sgGyroY', 'sgGyroZ') :=
      lapply(.(AccX, AccY, AccZ, GyroX, GyroY, GyroZ), function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))]


################################################################################
################################################################################
# Creating Preprossede Data Path
fe_path <- paste(outcomes_path,"/figure_second_experiment",sep="")
if (file.exists(fe_path)){
  setwd(file.path(fe_path))
} else {
  dir.create(fe_path, recursive=TRUE)
  setwd(file.path(fe_path))
}


image_width =  1654 #3508 #595 #877
image_height = 1240#2480 #842 #620
resolution = 300


# y <- c(3:5) # AccX AccY AccZ
# y <- c(6:8) # GyroX GyroY GyroZ
# y <- c(3:8) # AccX AccY AccZ GyroX GyroY GyroZ


# y <- c(9:11) # sgAccX sgAccY sgAccZ
y <- c(3:5,9:11) # AccX AccY AccZ # sgAccX sgAccY sgAccZ



experiments_tags <- c( 'e1a', 'e1b', 'e2a', 'e2b')

for (k in 1: length(experiments_tags))
{

message( experiments_tags[k] )
temp <- get(experiments_tags[k])

windowframe = 450:1500;
temp <- temp[,.SD[windowframe],];

pts <- ggplot(temp) +
  geom_line( aes(x = sample, y=sgAccX, colour = "Ax"),   size=0.6, alpha=0.7, linetype='solid' )+#,colour='red'
  geom_line( aes(x = sample, y=sgAccY , colour = "Ay" ), size=0.8, alpha=0.7 ) + #colour=''
  geom_line( aes(x = sample, y=sgAccZ, colour = "Az" ),  size=0.6, alpha=0.7 )+ #,colour='green4'
  labs(x='samples',y='sgAcc')+
  theme( axis.title.x = element_text(size = rel(1.5), angle = 0),
          axis.text.x = element_text(size = rel(1), angle = 0),
          axis.title.y = element_text(size = rel(1.5), angle = 90),
          axis.text.y = element_text(size = rel(1), angle = 00)
          )+
          scale_colour_manual("",
                    breaks = c("Ax", "Ay", "Az"),
                    values = c("tomato", "limegreen", "dodgerblue"))+
      theme_bw()+
      theme(legend.position = c(0.9, 0.8))+
      scale_y_continuous(limits=c(-1050,1050), breaks=seq(-1000,1000, by = 500))+
      scale_x_continuous(limits=c(450,1500), breaks=seq(500,1500, by = 100))


  imagefilename <- paste('ts_', experiments_tags[k], '.jpeg', sep='')
  jpeg(filename=imagefilename,
   width=image_width, height=image_height, units="px", res = resolution, bg="white")
   print(pts)
   dev.off()

}




### ZOOM

image_width =  1654 #3508 #595 #877
image_height = 800#2480 #842 #620
resolution = 300

experiments_tags <- c( 'e1a')

for (k in 1: length(experiments_tags))
{

message( experiments_tags[k] )
temp <- get(experiments_tags[k])

startwindowframe = 640
endwindowframe = 780
windowframe = startwindowframe:endwindowframe;
temp <- temp[,.SD[windowframe],];

pts <- ggplot(temp) +
  # geom_line( aes(x = sample, y=sgAccX ),   size=0.6, alpha=0.7, linetype='solid', colour = "tomato")+#,colour='red'
  geom_line( aes(x = sample, y=sgAccY ), size=3, alpha=0.7, colour = "limegreen" ) + #colour=''
  # geom_line( aes(x = sample, y=sgAccZ, colour = "Az" ),  size=0.6, alpha=0.7 )+ #,colour='green4'
  labs(x='samples',y='sgAcc')+
  theme( axis.title.x=element_blank(), #axis.title.x = element_text(size = rel(0.5), angle = 0),
          axis.text.x = element_text(size = rel(2), angle = 0),
          axis.title.y = element_blank(),#axis.title.y = element_text(size = rel(1.5), angle = 90),
          axis.text.y =  element_text(size = rel(1.5), angle = 90)
          )+
      scale_y_continuous(breaks=seq(-1000,1000, by = 200))+
      scale_x_continuous(limits=c(startwindowframe,endwindowframe), breaks=seq(500,1500, by = 20))


  imagefilename <- paste('ts_zoom_', experiments_tags[k], '.jpeg', sep='')
  jpeg(filename=imagefilename,
   width=image_width, height=image_height, units="px", res = resolution, bg="white")
   print(pts)
   dev.off()

}





#############################################
setwd(r_scripts_path) ## go back to the r-script source path
