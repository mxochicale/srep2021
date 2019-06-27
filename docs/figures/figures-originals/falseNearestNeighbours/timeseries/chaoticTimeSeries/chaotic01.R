##################################################
#
#
#  Generate a data.table of time series with the following attractors
# Rossler
# Lorenz
# henon
# ikeda
#
#
# Miguel P Xochicale <http://mxochicale.github.io/>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2018)
#

##References
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




################################################################################
## Initialisation

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


################################################################################
## Creating of the data.table object

r <- as.data.table(Rossler_out)
fsNNtmp <-function(x) {list("Rossler")}
r[,c("type"):=fsNNtmp(), ]
setcolorder( r, c(    (ncol(r)) , 1:(ncol(r)-1)   ) )


l <- as.data.table(Lorenz_out)
fsNNtmp <-function(x) {list("Lorenz")}
l[,c("type"):=fsNNtmp(), ]
setcolorder( l, c(    (ncol(l)) , 1:(ncol(l)-1)   ) )


h <- hmts
fsNNtmp <-function(x) {list("Henon")}
h[,c("type"):=fsNNtmp(), ]
h[,time :=l$time]
fsNNtmp <-function(x) {list("NA")}
h[,c("V3"):=fsNNtmp(), ]
setcolorder(h, c(3,4,1,2,5))
colnames(h)[3:5] <- c('X', 'Y', 'Z')

i <- ikedats
fsNNtmp <-function(x) {list("Ikeda")}
i[,c("type"):=fsNNtmp(), ]
i[,time :=l$time]
setcolorder(i, c(4,5,1,2,3))
colnames(i)[3:5] <- c('X', 'Y', 'Z')

cts <- rbind(r,l,h,i)
# cts <- rbind(h,i)
# cts <- rbind(h)



# ################################################################################
# # Plotting State Spaces
#

pXYl<-ggplot(cts)+
  geom_point(aes(X, Y,colour=time),shape=19, size=0.5, fill="black" )+
  facet_wrap(~type, scales = 'free', nrow = 2)
plot(pXYl)


# pXYl<-ggplot(cts) +geom_path(aes(Xl, Yl, col=time, alpha=Zl), lwd = 1)
# p3Dl<-ggplot(cts)+
#   geom_path(aes(Xl*Yl, Xl*Zl, col=time, alpha=Yl*Zl)) +
#   scale_alpha(range = c(0.4, 0.8))


# ################################################################################
# # Plotting time series
pts <- ggplot(cts) +
   geom_line(aes(x=time,y=X),lwd = 1,alpha=0.7)+
   facet_wrap(~type, scales = 'free', nrow = 4)
   theme_bw(20)
plot(pts)





# write.table(cts, "chaotic.dt", row.name=FALSE)
