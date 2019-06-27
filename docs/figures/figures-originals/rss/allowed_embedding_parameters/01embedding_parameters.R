#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# source(paste(getwd(),"/01embedding_parameters.R", sep=""), echo=TRUE)
# Execution Time
#
# Create a representation for a 1 to 190 window lenght for the embedding parameters
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
# Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
options(digits=15)
source('~/mxochicale/github/r-code_repository/functions/ollin_cencah.R')




################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()



# Time series parameters
MinTimeSeriesLenght <- 1
MaxTimeSeriesLenght <- 190


TEM <- NULL #TimeSeries Embedding MAtrix

################################################################################
################################################################################
################################################################################
###[timeseriesK]################################################################
for (k in MinTimeSeriesLenght:MaxTimeSeriesLenght){
    timeseriesK <- 1:k
    L <- length(timeseriesK)



### Embedding Parameters

MaxDimension <- 50
MaxDelay <- 50
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


                # tt1 <- Takens_Theorem(timeseriesK, dim_i, tau_j,1)
                # tt2 <- Embed(timeseriesK, dim_i, tau_j, as.embed=FALSE) ## as.embed reverse the embedding

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
  geom_text(aes( label = EMatrixDim), size=.1 ) +
  facet_wrap( ~ WLength,  nrow=20, ncol=10 ) +
  scale_fill_gradient2( low = "white", mid = "white",
  high = "red", midpoint = 0, guide = "colourbar")

P




#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
