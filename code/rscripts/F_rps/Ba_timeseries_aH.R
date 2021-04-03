###############################################################################	
#
# 
#
#
#
#
#
#
###############################################################################	
	# OUTLINE:
 	# (0) Defining paths
	# (1) Loading libraries and functions
	# (2) Reading 
	# (3) Creating paths
	# (4) Selecting Variables in data.table
		# (4.1)	Selecting Participants
	# (5) Adding vectors
		# (5.1) Deleting some Magnetomer and quaternion data
		# (5.2) zero mean and unit variance
		# (5.3) Savitzky-Golay filter
	# (6) Selecting Axis after postprocessing
	# (7) Creating preprocessed data path
	# (8) Writing data.table object to a file



#################
# Start the clock!
start.time <- Sys.time()




################################################################################
# (0) Defining paths for main_path, r_scripts_path, ..., etc.

r_scripts_path <- getwd()

setwd("../../../")
github_repo_path <- getwd()
libfun_path <- '/code/libraries_functions'
rfunctions_extra_rqa_R <- '/rfunctions/extra_rqa.R'



##VERSION 
version <- '00'
feature_path <- '/docs/figures/rps/src'
dataset_path <- '/data/dataset'


## Outcomes Plot Path
outcomes_plot_path <- paste(github_repo_path, feature_path, sep="")

## Data Path
data_path <- paste(github_repo_path, dataset_path, sep="")
setwd(file.path(data_path))



################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(signal)# for butterworth filter and sgolay
source( paste(github_repo_path, libfun_path, rfunctions_extra_rqa_R , sep='') )

################################################################################
# (2) Reading data
file_ext <- paste('xdata_v', version, '.dt',sep='')
data <- fread( file_ext, header=TRUE)



# axis for horizontal movments
data <- data[,.(
	sg0zmuvGyroZ, sg1zmuvGyroZ, sg2zmuvGyroZ
	), by=. (Participant,Activity,Sensor,Sample,Time)]


setkey(data, Participant)
pNN <- c('p01')
#pNN <- 		c(	'p01', 'p02', 'p03', 'p04', 'p05', 'p06', 'p07', 'p08', 'p09', 'p10',
#			'p11', 'p12', 'p13', 'p14', 'p15', 'p16', 'p17', 'p18', 'p19', 'p20')	
data <- data[.(pNN)]









################################################################################
################################################################################
################################################################################
################################################################################
### (4.1) Windowing Data [xdata[,.SD[1:2],by=.(Participant,Activity,Sensor)]]

#
############################
####### one window lenght
#windowsl <- c(100)
#windowsn <- c('w2')
#

###########################
###### one window lenght
windowsl <- c(500)
windowsn <- c('w10')


##########################
##### two windows lenght
#windowsl <- c(500, 750)
#windowsn <- c('w10', 'w15')



############################
###### four window lenghts
#windowsl <- c(100,250,500,750)
#windowsn <- c('w2', 'w5', 'w10', 'w15')
########################################
#### w2, 2-second window (100 samples) ## 100 to 200
########################################
#### w5, 5-second window (250 samples) # 100 to 350
#######################################
#### w10, 10-second window (500 samples) ## 100 to 600
########################################
#### w15, 15-second window (750 samples) ## 100 to 850


for ( wk in 1:(length(windowsl)) ) {

xdata <- data

windowlengthnumber <- windowsl[wk]

windowksams <- paste('w', windowlengthnumber, sep='')
windowksecs <- windowsn[wk]

message('****************')
message('****************')
message('****************')
message('****************')
message('*** window:', windowksams)



# general variables for window legnth
wstar=100
wend=wstar+windowlengthnumber
windowlength=wend-wstar
windowframe =wstar:wend
wkdata <- xdata[,.SD[windowframe],by=.(Participant,Activity,Sensor)];


#################################################################################
#################################################################################
################################################################################
#################################################################################
################################
#### (4.2.2) Sensor Selection

#sensors <- c('HS01') # HumanSensor01
sensors <- c('RS01','HS01')# RobotSensor01  and HumanSensor01	

#########################################################
for (sensor_k in 1:length(sensors) ) {

swkdata <- wkdata

sensork <- sensors[sensor_k]
message(sensork)

if (sensork == 'RS01' ) {
setkey(swkdata, Sensor)
skwkdata <- swkdata[.(c('RS01'))]
} else if (sensork == 'HS01' ) {
setkey(swkdata, Sensor)
skwkdata <- swkdata[.(c('HS01'))]
} else {
message('no valid movement_variable')
}



##########################
## (4.2.3) Activities Selection


setkey(skwkdata, Activity)

activityMovement <- 'aH'
skwkdata <- skwkdata[.(c('HN', 'HF'))]

################# Reorder Factor:
skwkdata$Activity <- factor(skwkdata$Activity)
skwkdata$Activity <- factor(skwkdata$Activity, levels= levels (skwkdata$Activity)[c(2,1)] )



#################################################################################
#################################################################################
#################################################################################
#################################################################################
				### (4.2.4) Axis Selection
			
		################################################################################
		# (3) Outcomes Plots Path
		if (file.exists(outcomes_plot_path)){
		  setwd(file.path(outcomes_plot_path))
		} else {
		  dir.create(outcomes_plot_path, recursive=TRUE)
		  setwd(file.path(outcomes_plot_path))
		}

	
	
				axis <- names(skwkdata)[6: (  length(skwkdata))  ]
				####### Axisk
				for (axis_k in c(1:length(axis)  )){ #for (axis_k in c(1:length(axis))){
				
				
				axisk<- axis[axis_k]
				message('#### axis:' , axisk )


				################################################################################
				# (5.0) Creating  and Changing to PlotPath
				plot_path <- paste(outcomes_plot_path, '/timeseries_plots',sep="")
				if (file.exists(plot_path)){
				    setwd(file.path(plot_path))
				} else {
				  dir.create(plot_path, recursive=TRUE)
				  setwd(file.path(plot_path))
				}




		plotlinewidtg <- 1.5
		basefontsize <- 18
		pts <- ggplot(skwkdata)+ 
			geom_line( aes(x=Sample,y=get(axisk), color=Sensor), size=plotlinewidtg )+
			facet_grid(Participant~Activity)+
			scale_y_continuous()+
			#geom_segment(aes(x = 100, y = -125, xend = 100, yend = 125)) +
			coord_cartesian(xlim=c(wstar,wend), ylim=c(-5,5)) +
			theme_bw(base_size=basefontsize)+
			theme(legend.position='none')+
			labs(y=axisk, x='Sample')


		### Save Picture
		width = 800
		height = 1200
		text.factor = 1
		dpi <- text.factor * 100
		width.calc <- width / dpi
		height.calc <- height / dpi

		file_ext <- paste(activityMovement, '-', axisk,'-', sensork, '-', windowksams, '.png', sep='')
		ggsave(filename = file_ext,
			dpi = dpi,
			width = width.calc,
			height = height.calc,
			units = 'in',
			bg = "transparent",
			device = "png",
			pts)







				}##end##for (axis_k in c(1:length(axis)  )){ 
#################################################################################
#################################################################################
#################################################################################
#################################################################################




}##end##for (sensor_k in 1:length(sensors) ) {
#################################################################################
#################################################################################
#################################################################################
#################################################################################


} ##end## for ( wk in 1:(length(windowsl)) ) { 
################################################################################
################################################################################
################################################################################
################################################################################














#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time
# message('Execution Time: ', end.time - start.time)

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
