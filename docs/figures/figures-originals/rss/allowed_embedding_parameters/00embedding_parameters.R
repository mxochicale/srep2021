#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# source(paste(getwd(),"/00embedding_parameters.R", sep=""), echo=TRUE)
# Execution Time
#
# MATRIX STYLE
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#################
# Start the clock!
start.time <- Sys.time()


################################################################################
# Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
options(digits=15)
source('~/mxochicale/github/r-code_repository/functions/ollin_cencah.R')




################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.
r_scripts_path <- getwd()






# Time series parameters
MinTimeSeriesLenght <- 10
MaxTimeSeriesLenght <- 10


TEM <- NULL #TimeSeries Embedding MAtrix

################################################################################
################################################################################
################################################################################
###[timeseriesK]################################################################
for (k in MinTimeSeriesLenght:MaxTimeSeriesLenght){
    timeseriesK <- 1:k
    L <- length(timeseriesK)



### Embedding Parameters

MaxDimension <- 5
MaxDelay <- 5
dimension_k <- c(1:MaxDimension)
embedding_k <- c(1:MaxDelay)


C <- NULL # Cummulative dimensionality
################################################################################
######State Space Reconstruction [for(dim_i... and for(tau_j...]################
        for (dim_i in (1:500)[dimension_k]){

            N <- NULL # Cummulative delay

                for (tau_j in (1:500)[embedding_k]){
                # message('        State Space Reconstruction.  ', 'dimension: ', dim_i, ' delay: ', tau_j)


                n <- L - (dim_i-1)*tau_j
                N <- rbind(N,n)


                # tt1 <- Takens_Theorem(timeseriesK, dim_i, tau_j,1)
                # tt2 <- Embed(timeseriesK, dim_i, tau_j, as.embed=FALSE) ## as.embed reverse the embedding

                }#>>for(tau_j...

          C <- cbind(C,N)

      }#>>for(dim_i...
######State Space Reconstruction [for(dim_i... and for(tau_j...]################
################################################################################

 EM <- as.data.table(C)
 EM[,tau:=seq(.N)]
 setcolorder( EM,c(MaxDimension+1,1:MaxDimension)  )
 EM[,c("WLength"):= L, ]
 setcolorder( EM,c(MaxDimension+2, 1:(MaxDimension+1))  )
 names(EM) <- gsub("V", "m", names(EM) )



# ggplot(data=EM, aes(x=,y=))

TEM <- rbind(TEM,EM)


}
###[timeseriesK]################################################################
################################################################################
################################################################################
################################################################################






#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
