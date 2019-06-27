##################################################
#
#
#
# Miguel P Xochicale <http://mxochicale.github.io/>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2018)
#


library(data.table)
library(ggplot2)
library(deSolve)
require(pals) # for colours
library(plot3D) # for scatter2D() and scatter3D()



######################
### Lorenz Function
###
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

########################
### define controlling parameters
# rho     - Scaled Rayleigh number.
# sigma   - Prandtl number.
# beta   - Geometry ascpet ratio.
parameters <- c(rho=28, sigma= 10, beta=8/3)

########################
### define initial state
state <- c(X=1, Y=1, Z=1)
# state <- c(X=20, Y=41, Z=20)

########################
### define integrations times
# times <- seq(0,100, by=0.001)
times <- seq(0,100, by=0.01)

########################
### perform the integration and assign it to variable 'out'
out <- ode(y=state, times= times, func=Lorenz, parms=parameters)

########################
### Lorenz State Space lss DATA TABLE
lss <- as.data.table(out)

fsNNtmp <-function(x) {list("Lorenz")}
lss[,c("type"):=fsNNtmp(), ]
lss[,sample:=seq(.N)]
setcolorder(lss, c(5,6,1:4))


################################
### (4.2) Windowing Data
windowframe = 2000:8000
# windowframe = 00:10000
lss <- lss[,.SD[windowframe]]





################################################################################
## Plotting time series



lenvec <- length(lss$time)
colorvec <- gnuplot(lenvec)
plotlinewidth <- 3
# colorvec <- inferno(lenvec)


p <- ggplot(lss) +
   geom_line(aes(x=sample,y=X ), colour=colorvec, lwd = plotlinewidth,alpha=0.75)+
  #  geom_line(aes(x=sample,y=Y ), colour=colorvec, lwd = plotlinewidth,alpha=0.7)+
  # geom_line(aes(x=sample,y=Z ), colour=colorvec, lwd = plotlinewidth,alpha=0.7)+
    # facet_wrap(~type, scales = 'free', nrow = 4)+
   labs( x = 't', y='x(t)' )+
   theme(axis.text=element_text(size=20),
         axis.title=element_text(size=25))+
   theme(legend.position="none")+
   theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "transparent",colour = NA),
      plot.background = element_rect(fill = "transparent",colour = NA)
      # axis.line = element_line(colour = "black")
      )



# # # dev.new(xpos=10,ypos=1100,width=11, height=8)
# dev.new(xpos=1000,ypos=200,width=20, height=8)
# plot(p)


### Save Picture
width = 1000
height = 500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

ggsave(filename = "timeseries.png",
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png"
             , p)








#
# # ################################################################################
# # ## Plotting State Spaces
#
# par(mfrow = c(2, 2) )
#
# sslinewidth <- 5
# scatter3D(
#   lss$X, lss$Y, lss$Z, colvar = lss$sample, bty = "u", type = "l", lwd=sslinewidth,
#  	axis.scales = TRUE,
#    main = "XYZ", xlab = 'x', ylab ='y', zlab = 'z'
#    )
#    #  colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)
#
# scatter2D(
#     lss$X, lss$Y, colvar = lss$sample, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "x~y", xlab = 'x', ylab ='y'
#     )
#
# scatter2D(
#     lss$X, lss$Z, colvar = lss$sample, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "x~z", xlab = 'x', ylab ='z'
#     )
#
# scatter2D(
#     lss$Y, lss$Z, colvar = lss$sample, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "y~z", xlab = 'y', ylab ='z'
#     )
