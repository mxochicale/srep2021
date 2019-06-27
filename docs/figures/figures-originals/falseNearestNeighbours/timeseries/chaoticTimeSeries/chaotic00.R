##################################################
#
#  Generate a data.table of time series with the following attractors
# Rossler
# Lorenz
# henon
# ikeda

# Miguel P Xochicale <http://mxochicale.github.io/>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2018)
#

##Reference
# https://clouds.eos.ubc.ca/~phil/numeric/html_files/lab6.html
# http://www.sixhat.net/lorenz-attractor-in-r.html
# http://grrrraphics.blogspot.co.uk/2012/06/coding-dynamic-systems-and-controlling.html
# http://gg-hogehoge.hatenablog.com/entry/2013/07/04/203544


library(data.table)
library(ggplot2)
library(deSolve)


################################################################################
## Rossler Attractor
#dx / dt = - y - z
#dy / dt = x + a y
#dz / dt = b + z ( x - c )
Rossler_func <-function(t, state, parameters) {
    with(as.list(c(state, parameters)),{
        dX <- -Y - Z
        dY <- X + a * Y
        dZ <- b + Z * (X - c)
        list(c(dX, dY, dZ))
      }
)
}


################################################################################
# ##
# Lorenz <- function(t, state, parameters) {
#   with(as.list(c(state, parameters)), {
#     dX <- s * (Y - X)
#     dY <- X * (r - Z) - Y
#     dZ <- X * Y - b * Z
#     list(c(dX, dY, dZ))
#   })
# }
# out <- ode(y = yini, times = timeserie, func = Lorenz, parms = parameters)

Lorenz_func <-function(t, state, parameters) {
    with(as.list(c(state, parameters)),{
        # 微分方程式を書く (xの時間微分) = f(x)の形
        dX <- a*X + Y*Z
        dY <- b * (Y-Z)
        dZ <- -X*Y + c*Y - Z
        # listに入れる
        list(c(dX, dY, dZ))
      }
)
}



################################################################################
#### Henon Attractor

#reference
#http://www.stat.cmu.edu/~cshalizi/462/lectures/03/03.R

henon.map = function(x,a,b){
  x.new=x
  x.new[1,] = 1 - a*x[1,]*x[1,] + x[2,]
  x.new[2,] = b*x[1,]
  x=x.new
  return(x.new)
}


henon.map.ts = function(timesteps,x,a,b) {
  x.ts = matrix(nrow=2,ncol=timesteps)
  x.ts[,1] = x[,1]
  for (t in (2:timesteps)) {
    x = henon.map(x,a,b)
    x.ts[,t] = x
  }
  return(x.ts)
}



################################################################################
#### Ikeda Attractor

ikeda.map = function(X,p,u,k,alpha){
  X.new=X


  X.new[1,] = p + (u * ( X[1,]*cos(X[3,]) - X[2,]*sin(X[3,]) )) ## x
  X.new[2,] = u * ( X[1,]*sin(X[3,]) - X[2,]*cos(X[3,]) ) ##y

  X.new[3,] = (k) - ((alpha) / (1 + X[1,]*X[1,] + X[2,]*X[2,]))   ##t

  X=X.new
  return(X.new)
}


 ikeda.map.ts = function(timesteps,x,p,u,k,alpha) {
   x.ts = matrix(nrow=3,ncol=timesteps)
   x.ts[,1] = x[,1]
   for (t in (2:timesteps)) {
     x = ikeda.map(x,p,u,k,alpha)
     x.ts[,t] = x
  }
   return(x.ts)
 }





# # In initial state
# yini <- c(X = 0.01, Y = 0.001, Z = 0.001)
# #yini <- c(X = 10, Y = 10, Z = 10)


Lorenz_state <- c(X = 1, Y = 1, Z = 1)
Lorenz_parameters <- c(a = -8/3, b = -10, c = 28)


Rossler_state <- c(X = 1, Y = 1, Z = 1)
Rossler_parameters <- c(a = 0.2, b = 0.2, c = 5.7)


# times <- seq(0, 100, by = 0.001)
times <- seq(0, 100, by = 0.01)
NN <- length(times)

Lorenz_out <- ode(y = Lorenz_state, times = times, parms = Lorenz_parameters,
  func = Lorenz_func)

Rossler_out <- ode(y = Rossler_state, times = times , parms = Rossler_parameters,
    func = Rossler_func, method = "rk4")



x <- matrix(c(.0,.0),ncol=1) ## initial conditions
hmts <- henon.map.ts(NN,x,1.4,0.3)
hmts <- as.data.table(  t(hmts)  )




x <- matrix(c(0,0,0),ncol=1) ## initial conditions
ikedats<-ikeda.map.ts(NN,x,1.0,0.9,0.4,6.0)
ikedats <- as.data.table(  t(ikedats)  )


cts <- cbind(as.data.table(Lorenz_out), as.data.table(Rossler_out), hmts, ikedats)
colnames(cts) <-c("time","Xl","Yl","Zl","timer","Xr","Yr","Zr", 'Xh', 'Yh',"Xi","Yi","Zi")
cts[,timer:=NULL]



pXYl<-ggplot(cts) +geom_path(aes(Xl, Yl, col=time, alpha=Zl), lwd = 1)
pZYl<-ggplot(cts) +geom_path(aes(Zl, Yl, col=time, alpha=Xl), lwd = 1)
pXZl<-ggplot(cts) +geom_path(aes(Xl, Zl, col=time, alpha=Yl), lwd = 1)
p3Dl<-ggplot(cts)+
  geom_path(aes(Xl*Yl, Xl*Zl, col=time, alpha=Yl*Zl)) +
  scale_alpha(range = c(0.4, 0.8))

# plot(pXYl)
# plot(pZYl)
# plot(pXZl)
# plot(p3Dl)


pXYr<-ggplot(cts) +geom_path(aes(Xr, Yr, col=time, alpha=Zr), lwd = 1)
pZYr<-ggplot(cts) +geom_path(aes(Zr, Yr, col=time, alpha=Xr), lwd = 1)
pXZr<-ggplot(cts) +geom_path(aes(Xr, Zr, col=time, alpha=Yr), lwd = 1)
p3Dr<-ggplot(cts)+
  geom_path(aes(Xr*Yr, Xr*Zr, col=time, alpha=Yr*Zr)) +
  scale_alpha(range = c(0.4, 0.8))

# plot(pXYr)
# plot(pZYr)
# plot(pXZr)
# plot(p3Dr)
# # multiplot(pXY,pZY,pXZ, cols=2)


# pXYh<-ggplot(cts,aes(Xh, Yh)) +geom_path( )


plotctsl <- ggplot(cts,aes(x=time,y=Xl)) +
  geom_line(lwd = 1, colour = "blue",alpha=0.7)+
  # geom_point(size=1,alpha=0.2,shape=1)+
  geom_line(mapping = aes(y = Yl),lwd = 1, colour = "red",alpha=0.5) +
  geom_line(mapping = aes(y = Zl),lwd = 1, colour = "green",alpha=0.6) +
  labs(x= "Sample", y="Measure")+
  theme_bw(20)

plotctsr <- ggplot(cts,aes(x=time,y=Xr)) +
  geom_line(lwd = 1, colour = "blue",alpha=0.7)+
  # geom_point(size=1,alpha=0.2,shape=1)+
  geom_line(mapping = aes(y = Yr),lwd = 1, colour = "red",alpha=0.5) +
  geom_line(mapping = aes(y = Zr),lwd = 1, colour = "green",alpha=0.6) +
  labs(x= "Sample", y="Measure")+
  theme_bw(20)


plotctsH <- ggplot(cts,aes(x=time,y=Xh)) +
  geom_line(lwd = 1, colour = "blue",alpha=0.7)+
  geom_line(mapping = aes(y = Yh),lwd = 1, colour = "red",alpha=0.5)
  labs(x= "Sample", y="Measure")+
  theme_bw(20)

# plot(plotctsl)
# plot(plotctsr)
# plot(plotctsH)
