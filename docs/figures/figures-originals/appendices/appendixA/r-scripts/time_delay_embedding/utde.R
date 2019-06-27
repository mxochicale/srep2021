#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:          utde.R
# FileDescription:
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
source( paste(github_path,'/hwum-dataset/r-scripts/functions/ollin_cencah.R',sep='') )

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


# , "qW", "qX", "qY", "qZ"

###########
## Plot Time Series
pts <- ggplot(temp) +
geom_line( aes(x = sample, y=sgAccX, colour = "Ax"),   size=0.6, alpha=0.7, linetype='solid' )+#,colour='red'
geom_line( aes(x = sample, y=sgAccY , colour = "Ay" ), size=0.6, alpha=0.7 ) + #colour=''
geom_line( aes(x = sample, y=sgAccZ, colour = "Az" ),  size=0.6, alpha=0.7 )+ #,colour='green4'
# geom_line( aes(x = sample, y=qW, colour = "Ax"),   size=0.6, alpha=0.7, linetype='solid' )+#,colour='red'
# geom_line( aes(x = sample, y=qX , colour = "Ay" ), size=0.6, alpha=0.7 ) + #colour=''
# geom_line( aes(x = sample, y=qZ, colour = "Az" ),  size=0.6, alpha=0.7 )+ #,colour='green4'
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
 scale_y_continuous(limits=c(-1050,1050), breaks=seq(-1000,1000, by = 500)) +
 scale_x_continuous(limits=c(starwindowframe,endwindowframe), breaks=seq(starwindowframe,endwindowframe, by = 100))


imagefilename <- paste('ts_', experiments_tags[k], '.jpeg', sep='')
jpeg(filename=imagefilename,
width=image_width, height=image_height, units="px", res = resolution, bg="white")
print(pts)
dev.off()



################################################################################
################################################################################
# Nonlinear Dynamics
################################################################################
################################################################################
#library(nonlinearTseries)
#load_all('~/mxochicale/github/r-code_repository/rpackages/nonlinearTseries')

x<- temp$sgAccY
# x<- temp$sgAccX
# x<- temp$sgAccZ
# x<- temp$AccY




################################################################################
################################################################################
#  TIME_DELAY EMBEDDING
################################################################################
################################################################################
#### Embedding Creating Preprossede Data Path
embedding_path <- paste(tde_path,"/embeddings/multiple_embedding_parameters",sep="")
if (file.exists(embedding_path)){
setwd(file.path(embedding_path))
} else {
dir.create(embedding_path, recursive=TRUE)
setwd(file.path(embedding_path))
}



###############################################################################
## buildTakens

### Computed Embedding parameters:  m=7 tau=4
# delays <- tau
# dimensions <- dimension




################################################################################
################################################################################
################################################################################
# dim = 7 for tau from 5 to 13 `source(paste(getwd(),"/cao.R", sep=""), echo=TRUE)` 
# or mean= 7.1 for tau from 1 to 20 `mean(MinEmdDim_h$V1)`
dimensions <- c(7)
## `source(paste(getwd(),"/ami.R", sep=""), echo=TRUE)`
## `mintau_idx <- as.numeric(tauamilag)` 
delays <- c(11)
################################################################################
################################################################################
################################################################################


################################################################################
for (dim_i in (1:500)[dimensions]){
    for (tau_j in (1:500)[delays]){


	message('Embedding parameters:  m=',dim_i,' tau=',d=tau_j)
      	

#	#### Embedding Creating Preprossede Data Path
#      	TAU_embedding_path <- paste(embedding_path,"/tau_", tau_j,sep="")
#      	if (file.exists(TAU_embedding_path)){
#      	setwd(file.path(TAU_embedding_path))
#      	} else {
#      	dir.create(TAU_embedding_path, recursive=TRUE)
#      	setwd(file.path(TAU_embedding_path))
#      	}
#


       	temp_takens <- Takens_Theorem(  x,   dim_i,tau_j,1)
       	#RSS <- PCA( temp_takens ,0)


	#filenameimage <- paste(selected_participant_number[pNN_k], '_' ,activity_number[aNN_k] ,"_m",
	#		formatC(dim_i,digits=2,flag="0"),"t",formatC(tau_j,digits=1,flag="0"), '_WL', WindowLenght ,".png",sep="")
        #png(filenameimage,width=image_width_4ssr, height=image_height_4ssr, units="px", res=image_dpi, bg=image_bg)
        #plotRSS3D2D(RSS)
        #dev.off()





} # for (dim_i in (1:500)[dimensions]){
} # for (tau_j in (1:500)[delays]){
### buildTakens
#################################################################################




}#for (k in signals )
################################################################################



#############################################
setwd(r_scripts_path) ## go back to the r-script source path
