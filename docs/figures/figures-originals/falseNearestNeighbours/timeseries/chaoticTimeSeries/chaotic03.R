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

library(fNonlinear)
library(plot3D)

# times <- seq(0, 100, by = 0.001)
tn <- seq(0, 50, by = 0.03)
NN <- length(tn)


## 3D
## Roessler Attractor
r <- roesslerSim(
  times = tn,
  parms = c(a = 0.2, b = 0.2, c = 8.0),
  start = c(-1.894, -9.920, 0.0250),
  doplot = FALSE)
r <- as.data.table(r)

fsNNtmp <-function(x) {list("Rossler")}
r[,c("type"):=fsNNtmp(), ]
r[,n:=seq(.N)]
setcolorder(r, c(5,6,1:4))




## 3D
## Lorenz Attractor
l <- lorentzSim(
times = tn,
parms = c(sigma = 16, r = 45.92, b = 4),
start = c(-14, -13, 47),
doplot = FALSE)
l <- as.data.table(l)

fsNNtmp <-function(x) {list("Lorenz")}
l[,c("type"):=fsNNtmp(), ]
l[,n:=seq(.N)]
setcolorder(l, c(5,6,1:4))



cts3d <- rbind(r,l)


# # ################################################################################
# # ## Plotting State Spaces
# par(mfrow = c(2, 2) )
#
# sslinewidth <- 2
# scatter3D(
#   l$x, l$y, l$z, colvar = l$t, bty = "u", type = "l", lwd=sslinewidth,
#  	axis.scales = TRUE,
#    main = "XYZ", xlab = 'x', ylab ='y', zlab = 'z'
#    )
#    #  colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)
#
# scatter2D(
#     l$x, l$y, colvar = l$t, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "x~y", xlab = 'x', ylab ='y'
#     )
#
# scatter2D(
#     l$x, l$z, colvar = l$t, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "x~z", xlab = 'x', ylab ='z'
#     )
#
# scatter2D(
#     l$y, l$z, colvar = l$t, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "y~z", xlab = 'y', ylab ='z'
#     )
#

# # ################################################################################
# # ## Plotting State Spaces
# par(mfrow = c(2, 2) )
#
# sslinewidth <- 2
# scatter3D(
#   r$x, r$y, r$z, colvar = r$t, bty = "u", type = "l", lwd=sslinewidth,
#  	axis.scales = TRUE,
#    main = "XYZ", xlab = 'x', ylab ='y', zlab = 'z'
#    )
#    #  colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)
#
# scatter2D(
#     r$x, r$y, colvar = r$t, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "x~y", xlab = 'x', ylab ='y'
#     )
#
# scatter2D(
#     r$x, r$z, colvar = r$t, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "x~z", xlab = 'x', ylab ='z'
#     )
#
# scatter2D(
#     r$y, r$z, colvar = r$t, bty = "n", pch = ".", type='l', lwd=sslinewidth,
#     cex = 5, colkey = TRUE, col= jet.col(n=50, alpha=0.9),
#     main = "y~z", xlab = 'y', ylab ='z'
#     )



################################################################################
## Plotting time series
pts <- ggplot(cts3d) +
   geom_line(aes(x=n,y=y,col=type),lwd = 1,alpha=0.8)+
   facet_wrap(~type, scales = 'free', nrow = 4)
   theme_bw(20)

# dev.new(xpos=10,ypos=1100,width=11, height=8)
dev.new(xpos=1000,ypos=200,width=20, height=8)
plot(pts)
