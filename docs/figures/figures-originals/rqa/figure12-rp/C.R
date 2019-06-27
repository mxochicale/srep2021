###############################################################################	
#
# Recurrence plot for drift (logistic map xi+1 = 4xi(1-xi) )
# 
#
#
#
#
# * If you have a question or comment that might be relevant 
#	to other people, please open an issue.
# * If you have any specific questions about the information 
#	of this repository, you can me by vising: https://mxochicale.github.io/
#
#
#
###############################################################################	
	# OUTLINE:
	# (0) Loading libraries and functions
 	# (1) Definifing paths
	# (2) Lorez Time Series
	# (3) Plotting State Spaces
	# (4) Computing Recurrence Quantification Parameters
	# (5) Plotting Recurrence Plot




#################
# Start the clock!
start.time <- Sys.time()

################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()
setwd('../')
functions_path <- getwd()

setwd("../../../../../")
github_path <- getwd()
figures_path <- r_scripts_path


################################################################################
# (0) Loading Functions and Libraries
library(deSolve) # call deSolve first to avoid (Error in .C("unlock_solver") : )
library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt
library(nonlinearTseries)


################################################################################
# (1) Logistic Map
## `emailing-authors/exrps.m` LINE 46-49:
##x=.617; 
##for i=2:500; 
##   x(i)=4*x(i-1)*(1-x(i-1)); 
##end
##X=crp(x(201:200+150)+.01*[1:150],1,1,.2,'sil');

#N=150
#epsilon 0.2 sigma


logistic.map <- function(r, x, N, M){
  ## r: bifurcation parameter
  ## x: initial value
  ## N: Number of iteration
  ## M: Number of iteration points to be returned
  z <- 1:N
  z[1] <- x
  for(i in c(1:(N-1))){
    z[i+1] <- r *z[i]  * (1 - z[i])
  }
  ## Return the last M iterations 
  z[c((N-M):N)]
}
#REF: https://www.r-bloggers.com/logistic-map-feigenbaum-diagram/

r <- 4
x <- 0.617
N <- 350
M <- 150
lm <- logistic.map(r, x, N, M)
lm <- lm  +  0.01*(1:(1+M))


#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
ts <- lm
rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
                radius=0.2,lmin=2,vmin=2,do.plot=FALSE,distanceToBorder=2)


#################################################################################
## (3) Plotting Recurrence Plot
##
imagesversion <- 'v01'
plot_path <- paste(figures_path, '/', imagesversion,sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}

## Calling `functions_extra_nonlinearTseries` 
source( paste(functions_path,'/functions/functions_extra_nonlinearTseries.R',sep='') )

rm <- as.matrix(rqa.analysis$recurrence.matrix)
maxsamplerp <- dim(rm)[1]
RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )

filenametag <- paste('C-',M, '-', imagesversion,'.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000


#rplot <- plotRecurrencePlot(RM,maxsamplerp)
#savePlot(filename_extension,width,height,rplot)

rplot2 <-  plotOnlyRecurrencePlot(RM,maxsamplerp)
savePlot(filename_extension,width,height,rplot2)




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
