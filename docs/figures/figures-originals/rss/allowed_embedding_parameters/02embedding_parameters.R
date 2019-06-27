#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# source(paste(getwd(),"/02embedding_parameters.R", sep=""), echo=TRUE)
# Execution Time
#
# Create Plots for 10, 20... 80... 160, etc window size lenght
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

require(ggplot2)


################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()


# setwd("../")
# setwd("../")
# setwd("../")
# setwd("../")
# main_repository_path <- getwd()
#
#
#
# outcomes_path <- paste(main_repository_path,"/DataSets/hwum_repository/outcomes",sep="")
# feature_path <- '/stateSpaceReconstruction'
#
# setwd(file.path(outcomes_path))
#




################################################################################
# Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
options(digits=15)
source('~/mxochicale/github/r-code_repository/functions/ollin_cencah.R')



# Time series parameters
MinTimeSeriesLenght <- 100  ##<<<<<<<<<<<<<<<<<<<<<<<<<
WindowInterval <- 100       ##<<<<<<<<<<<<<<<<<<<<<<<<<
MaxTimeSeriesLenght <- 100  ##<<<<<<<<<<<<<<<<<<<<<<<<<


for_window_lenght_index <- seq(from= MinTimeSeriesLenght, to=MaxTimeSeriesLenght, by=WindowInterval)

TEM <- NULL #TimeSeries Embedding MAtrix

################################################################################
################################################################################
################################################################################
###[timeseriesK]################################################################
for (k in  for_window_lenght_index ){
    timeseriesK <- 1:k
    L <- length(timeseriesK)


### Embedding Parameters
MaxDimension <- 200
MaxDelay <- 200
dimension_k <- c(1:MaxDimension)
embedding_k <- c(1:MaxDelay)


C <- data.table()
################################################################################
######State Space Reconstruction [for(dim_i... and for(tau_j...]################
        for (dim_i in (1:500)[dimension_k]){

            N <- data.table()

                for (tau_j in (1:500)[embedding_k]){
                # message('        State Space Reconstruction.  ', 'dimension: ', dim_i, ' delay: ', tau_j)
                n <- L - (dim_i-1)*tau_j
                N <- rbind(N,n)

                }#>>for(tau_j...

           N[,tau:=seq(.N)]
           N[,c("m"):= dim_i, ]

          C <- rbind(C,N)

      }#>>for(dim_i...
######State Space Reconstruction [for(dim_i... and for(tau_j...]################
################################################################################



C[,c("WLength"):= L, ]
TEM <- rbind(TEM,C)



}
###[timeseriesK]################################################################
################################################################################
################################################################################
################################################################################



names(TEM) <- gsub("x", "EMatrixDim", names(TEM) )
setcolorder( TEM, c(4,2,3,1) )

#replace negative numbers by O   or "TEM[EMatrixDim <= 0] <- 0"
TEM[, EMatrixDim := ifelse(EMatrixDim < 0, 0, EMatrixDim)]


P<- ggplot(TEM, aes(m, tau, fill = EMatrixDim)) +
  geom_tile(colour = "white") +
  facet_wrap( ~ WLength ) +
  scale_fill_gradient2( low = "white", mid = "white",
  high = "darkblue", midpoint = 0, guide = "colourbar")


# geom_text(aes( label = EMatrixDim), size=.1 ) +
# facet_wrap( ~ WLength,  nrow=20, ncol=10 ) +



image_width <- 3508
image_height <- 2480
image_dpi <- 300
image_bg <- "white" #image_bg <- "transparent"


filenameimage <- paste("AllowedEmbeddingParameters", ".png",sep="")
png(filenameimage, width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
P
dev.off()




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time



################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
