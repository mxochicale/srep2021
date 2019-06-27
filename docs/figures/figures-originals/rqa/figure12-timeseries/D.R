###############################################################################	
#
# Recurrence plot for disrupted (Brownian motion)
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

version <- '01'
plots_path <- paste(r_scripts_path,'/v', version,sep="")




################################################################################
# (0) Loading Functions and Libraries


library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt
library(nonlinearTseries)





################################################################################
# (1) Disrupted brownian motion
## `emailing-authors/exrps.m` LINE 55-59:
##x=0; 
##for i=1:2000; 
##   x(i+1)=x(i)+(2*rand-1);
##end
##X=crp(x,1,1,.2,'sil');

N <- 400
M <- 2000
x<- 0
for (i in (1:M) ){
	#x[i+1] <- x[i] + ( (2*rnorm(1))-1  )
	#x[i+1] <- x[i] +  ( 2*rnorm(1)-1   )
	x[i+1] <- x[i] +  ( 2*rnorm(1)  )
}
dis <- x[1:N]

#N = 2000
#dis = rnorm(N, 0, 1)
#dis = cumsum(dis)
### REF https://www.stat.berkeley.edu/~aldous/Research/Ugrad/ZY1.pdf



tsn <- as.data.table(dis)

tsn [,n:= 0:(.N-1),]
setcolorder(tsn, c(2,1))


#################################################################################
## (3) Create 
##
if (file.exists(plots_path)){
    setwd(file.path(plots_path))
} else {
  dir.create(plots_path, recursive=TRUE)
  setwd(file.path(plots_path))
}



pts <- ggplot(tsn,aes(x = n, y = dis)) + 
	geom_line(size = 1)+
	labs(x = "Samples, n", y = 'x(n)')+
	theme_bw(20) 
	

### Save Picture
width = 1000
height = 500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

file_ext <- paste('D.png', sep='')
ggsave(filename = file_ext,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pts)




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
