#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:          ami.R
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
library(plot3D) #scatter3D

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Defining paths for main_path, r_scripts_path, ..., etc.

r_scripts_path <- getwd()
setwd("../")
setwd("../")
main_path <- getwd()
setwd("../")
setwd("../")
setwd("../")
setwd("../")
github_path <- getwd()


# r_scripts_path <- paste(main_path,"/r-scripts/",sep="")
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

image_width =  1654 #3508 #595 #877
image_height = 1240#2480 #842 #620
resolution = 300

image_width_p3d =  2000 #3508 #595 #877
image_height_p3d = 700#2480 #842 #620





# y <- c(3:5) # AccX AccY AccZ
# y <- c(6:8) # GyroX GyroY GyroZ
# y <- c(3:8) # AccX AccY AccZ GyroX GyroY GyroZ

# y <- c(9:11) # sgAccX sgAccY sgAccZ
# y <- c(3:5,9:11) # AccX AccY AccZ # sgAccX sgAccY sgAccZ


################################################################################
### (4.2) Smoothing data with Savitzky-Golay Filter
SavitzkyGolayCoeffs <- sgolay(p=5,n=55 ,m=0)
### FUNCTON TO SMOOTH THE DATA
SGolay <- function(xinput,sgCoeffs){
  output <- filter(sgCoeffs, xinput)
  return(output)
}

# experiments_tags <- c( 'e1a')
# experiments_tags <- c( 'e1b')
# experiments_tags <- c( 'e1a', 'e1b', 'e2a', 'e2b')
experiments_tags <- c( 'e1a', 'e1b', 'e2a', 'e2b', 'e3a', 'e3b')
# signals <- c(1:6)
signals <- c(1)





################################################################################
for (k in signals )
{

message( experiments_tags[k] )

### Read
setwd(data_path)
temp <- fread(files[ k ] )
temp <- cbind(experiment=experiments_tags[k], temp)
temp[,sample:=seq(.N)]
setcolorder(temp, c(20,1:19))


### Deleting Columns
deleteThisColumns = c("TimestampRx", "TimestampTx", "MagnX", "MagnY", "MagnZ", "qW", "qX", "qY", "qZ", "HDR_AccX", "HDR_AccY", "HDR_AccZ")
temp[, (deleteThisColumns):=NULL]

temp[,c('sgAccX', 'sgAccY', 'sgAccZ','sgGyroX', 'sgGyroY', 'sgGyroZ') :=
       lapply(.(AccX, AccY, AccZ, GyroX, GyroY, GyroZ), function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))]


## 1000 window lenght
starwindowframe=475
endwindowframe=1474


## 500 window lenght
# starwindowframe=600
# endwindowframe=1099


windowframe = starwindowframe:endwindowframe;
temp <- temp[,.SD[windowframe],];


x<- temp$sgAccY
# x<- temp$sgAccX
# x<- temp$sgAccZ
# x<- temp$AccY




################################################################################
################################################################################
# Creating Preprossede Data Path
tde_path <- paste(outcomes_path,"/timedelayembedding",sep="")
if (file.exists(tde_path)){
setwd(file.path(tde_path))
} else {
dir.create(tde_path, recursive=TRUE)
setwd(file.path(tde_path))
}



### Embedding Creating Preprossede Data Path
embedding_path <- paste(tde_path,"/embeddings",sep="")
if (file.exists(embedding_path)){
setwd(file.path(embedding_path))
} else {
dir.create(embedding_path, recursive=TRUE)
setwd(file.path(embedding_path))
}



################################################################################
################################################################################
# Nonlinear Dynamics
################################################################################
################################################################################
library(nonlinearTseries)

maxtau <- 100
numberOFpartitions <- 100

#Method used for selecting a concrete time lag. Available methods are "first.zero", "first.e.decay" (default), "first.minimum" and "first.value".
ami_timelag_selection_method <- 'first.minimum' # 'first.minimum'
#ami_timelag_selection_method <- 'first.value' # 'first.minimum'

## Numeric value indicating the value that the autocorrelation/AMI function 
## must cross in order to select the time lag. It is used only with the "first.value" selection method.
ami_numeric_value <- 1/exp(0)


	## tau-delay estimation based on the mutual information function
	tau.ami <- timeLag(time.series = x, technique = "ami",
                selection.method = ami_timelag_selection_method, value = ami_numeric_value,
		lag.max = maxtau,
                do.plot = F, n.partitions = numberOFpartitions,
                units = "Bits")

	tauamilag <- as.data.table(tau.ami[[1]])
	ami <- tau.ami[[2]]


	amidt <- as.data.table(ami)
	amidt[, tau := 0:(.N-1), ]
	

################################################################################
### (5) Plot Avarage Mutual Information 



plotlinewidth <- 0.9
mintau_idx <- as.numeric(tauamilag) 
mintau_val <- amidt$ami[ mintau_idx ]


pami <- ggplot(amidt ) + 
	geom_line(  aes(x=tau,y=ami)  ) +
	geom_point(  aes(x=tau,y=ami) ) + 
	#geom_point( aes(x=mintau_idx, y=mintau_val ), size=2, colour='blue', alpha=0.3 ) +
	geom_point( aes(x=mintau_idx, y=mintau_val, size=1.2, alpha=0.5),  colour='blue'  ) +
	annotate("text", x = mintau_idx, y = mintau_val+( mintau_val*(10/100)  ), label = paste('First Min=', mintau_idx, sep='') )+	
	ylab("Average Mutual Information") + 
	theme_bw(20) +	
       	theme(axis.text.x = element_text(colour="grey20",size=16,angle=90,hjust=.5,vjust=.5,face="plain")  )+
	theme(legend.position='none')


}#for (k in signals )
################################################################################



######################################
######################################
message('first minimum of AMI is at ', mintau_idx)





#############################################
setwd(r_scripts_path) ## go back to the r-script source path
