#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:          cao.R
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




x<- temp$sgAccY
# x<- temp$sgAccX
# x<- temp$sgAccZ
# x<- temp$AccY


### Embedding Creating Preprossede Data Path
embedding_path <- paste(tde_path,"/embeddings",sep="")
if (file.exists(embedding_path)){
setwd(file.path(embedding_path))
} else {
dir.create(embedding_path, recursive=TRUE)
setwd(file.path(embedding_path))
}




##############################################################################
##############################################################################
###############################################################################
# (4) CAO's algorithm
source( paste(github_path,'/tavand/functions/embedding_parameters/withCao1997/cao97_functions.R',sep='') )

delta_ee<-0.1
eemin_h <- data.table()
MinEmdDim_h <- data.table()



maxdim <- 30
maxtau <- 20
E <- data.table()
for (tau_i in 1:maxtau){
    Et<- as.data.table(cao97sub(x,maxdim,tau_i) )

	########################################    	
	## Minimum Embedding Dimension
	e <- Et	
	ee <- data.table()

	fi <- 0
	for (di in 1:(maxdim-2) ){
	#message( 'dim: ', (di+1), 'diff:', (abs(e$V1[di+1] - e$V1[di]) <= delta_ee)    )
	
	if (   ( ( abs( e$V1[di+1]-e$V1[di]) )< delta_ee  ) # absolute substraction betweent the e[di+1] and e[di]
		&&  (   (  e$V1[di] > (1-delta_ee)  )  &&  ( e$V1[di] < (1+delta_ee) )   )    # is e[di] between 1 +/- delta_ee
		&&  (   (  e$V1[di+1] > (1-delta_ee)  )  &&  ( e$V1[di+1] < (1+delta_ee) )   )    # is e[di+1] between 1 +/- delta_ee
	   ) 
	{
		fi <- fi+1
		if (fi == 1)
		{
		minEmdDim_h <- as.data.table(di+1)	
		}
	}
		
	ee <- rbind(ee,  cbind( abs( e$V1[di+1] - e$V1[di] )  , (abs( e$V1[di+1]-e$V1[di]))< delta_ee )  )
	
	}
	ee[,dim:=seq(2,(maxdim-1))]
	names(ee) <- gsub("V1", "diff", names(ee))
	names(ee) <- gsub("V2", "mindim", names(ee))

	func <-function(x) {list( tau_i )}
    	ee[,c("tau"):=func(), ]
 	setcolorder(ee, c(3,4,1,2))
    	eemin_h<- rbind(eemin_h, ee )

    	minEmdDim_h[,c("tau"):=func(), ]
	MinEmdDim_h <- rbind(MinEmdDim_h, minEmdDim_h)
	##
	########################################    	



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

e1<-plotE1values(E,maxdim,maxtau,delta_ee)
#e1

e2 <- plotE2values(E,maxdim,maxtau)
#e2



}#for (k in signals )
################################################################################




#### mean of minimum embedding dimension for tau from 1 to 20
mean( MinEmdDim_h$V1 )




#############################################
setwd(r_scripts_path) ## go back to the r-script source path
