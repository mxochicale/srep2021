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


# times <- seq(0, 100, by = 0.001)
tn <- seq(0, 100, by = 0.01)
NN <- length(tn)



## 1D
## Tent Attractor
t <- tentSim(
  n = NN,
  n.skip = 100,
  parms = c(a = 2),
  start = runif(1),
  doplot = FALSE)
t <- as.data.table(t)

## 1D
## Logistic Attractor
lg <- logisticSim(
  n = NN,
  n.skip = 100,
  parms = c(r = 4),
  start = runif(1),
  doplot = FALSE)
lg <- as.data.table(lg)




## 2D
## Henon Attractor
h <- henonSim(
  n = NN,
  n.skip = 100,
  parms = c(a = 1.4, b = 0.3),
  start = runif(2),
  doplot = FALSE)
h <- as.data.table(h)

## 2D
## Ikeda Attractor
i <- ikedaSim(
  n = NN,
  n.skip = 100,
  parms = c(a = 0.4, b = 6.0, c = 0.9),
  start = runif(2),
  doplot = FALSE)
i <- as.data.table(i)



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
setcolorder(r, c(5,1:4))


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
setcolorder(l, c(5,1:4))



cts3d <- rbind(r,l)


################################################################################
## Plotting State Spaces
pXY<-ggplot(cts3d)+
  geom_path(aes(x, y, colour=t, alpha=z),size=0.5 )+
  facet_wrap(~type, scales = 'free', nrow = 2)

# dev.new(xpos=10,ypos=10,width=10, height=10)
# plot(pXY)



################################################################################
## Plotting time series
pts <- ggplot(cts3d) +
   geom_line(aes(x=t,y=y,col=type),lwd = 1,alpha=0.7)+
   facet_wrap(~type, scales = 'free', nrow = 4)
   theme_bw(20)

# dev.new(xpos=10,ypos=1100,width=11, height=8)
dev.new(xpos=1000,ypos=200,width=20, height=8)
plot(pts)



# write.table(cts3d, "chaotic.dt", row.name=FALSE)
