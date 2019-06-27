###############################################################################	
#
# Recurrence plot fo the x solution of the lorenz system
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

setwd("../../../")
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
# (2) Lorez Time Series
## `emailing-authors/lorenz.m` LINE 6-12:
#r = 28;
#b = 8/3;
#s = 10;
#dy(1) = -s * (y(1) - y(2));
#dy(2) = -y(1)*y(3) + r*y(1) -y(2);
#dy(3) = y(1)*y(2) - b*y(3);
#
## `emailing-authors/exrps.m` LINE 4-5:
## [t, x] = ode45('lorenz',[1 50], [1.6186 1.8792 17.617]);
## X=crp2([x(1:1500,1),x(1:1500,2),x(1:1500,3)],1,1,5,'euc','non','sil');

Lorenz <- function(t, state, parameters){
	  with(as.list( c(state,parameters)),
	      {
	      #rate of change
	      dX <- sigma*(Y-X)
	      dY <- rho*X - X*Z - Y
	      dZ <- X*Y - beta*Z

	      # return the rate of change
	      list( c(dX, dY, dZ) )
	      }
	  )# end with(as.list...
}

#define controlling parameters
# rho     - Scaled Rayleigh number.
# sigma   - Prandtl number.
# beta   - Geometry ascpet ratio.
parameters <- c(rho=28, sigma= 10, beta=8/3)

#define initial state
state <- c(X=1.6186, Y=1.8792, Z=17.617)


# define integrations times
# times <- seq(0,100, by=0.001)
#times <- seq(0,100, by=0.01)
#times <- seq(0,5, by=0.01)
#times <- seq(0,50, by=0.1)#501 samples
times <- seq(1,50, by=0.01)#5001 samples

N <- length(times)-1


#perform the integration and assign it to variable 'out'
out <- ode(y=state, times= times, func=Lorenz, parms=parameters)


lorenzdt <- as.data.table(out)

fsNNtmp <-function(x) {list("Lorenz")}
lorenzdt[,c("type"):=fsNNtmp(), ]
lorenzdt[,sample:=seq(.N)]
setcolorder(lorenzdt, c(5,6,1:4))


#window data to 1500 samples
maxN <- 2000
windowframe = (N-maxN):N;
#windowframe = 0:maxN
lorenzdt <- lorenzdt[,.SD[windowframe]]




################################################################################
# (3) Plotting State Spaces

imagesversion <- 'v02'

plot_path <- paste(figures_path, '/', imagesversion,sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}


filenametag <- paste('lorenz-',(maxN*3), '-', imagesversion,'.png',sep='')
png(filename=  paste('ss-',filenametag,sep='')  ,
  bg = "transparent",
  type="cairo",
  width = 800, height = 800, units = "px",
  pointsize=20,
  res=75
  )
	# type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)

scatter3D(
  lorenzdt$X, lorenzdt$Y, lorenzdt$Z,
  colvar = lorenzdt$sample, bty = "u", type = "l", lwd=4,
	axis.scales = TRUE,
  main = "",
  xlab = 'x(n)', ylab ='y(n)', zlab = 'z(n)',
  colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)
  )

dev.off()



#################################################################################
## (4) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
#lorenz.ts <- lorenzdt$X
lorenz.ts <- c(lorenzdt$X,lorenzdt$Y,lorenzdt$Z)
rqa.analysis=rqa(time.series = lorenz.ts, embedding.dim=1, time.lag=1,
                radius=5,lmin=2,vmin=2,do.plot=FALSE,distanceToBorder=2)



#################################################################################
## (5) Plotting Recurrence Plot
##

## Calling `functions_extra_nonlinearTseries` 
source( paste(functions_path,'/functions/functions_extra_nonlinearTseries.R',sep='') )


rm <- as.matrix(rqa.analysis$recurrence.matrix)
maxsamplerp <- dim(rm)[1]

RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )


filenametag <- paste('lorenz-',(maxsamplerp), '-', imagesversion,'.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000


rplot <- plotRecurrencePlot(RM,maxsamplerp)
savePlot(filename_extension,width,height,rplot)


#rplot2 <-  plotOnlyRecurrencePlot(RM,maxsamplerp)
#savePlot('rp2.png',width,height,rplot2)



#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time





################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
