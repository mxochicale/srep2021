#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#
# FileName:
# FileDescription:
#
#
#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Miguel P. Xochicale [http://mxochicale.github.io]
# Doctoral Researcher in Human-Robot Interaction
# University of Birmingham, U.K. (2014-2018)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


library(data.table)
library(deSolve)
library(plot3D)
library("RColorBrewer")


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
state <- c(X=1, Y=1, Z=1)
# state <- c(X=20, Y=41, Z=20)


# define integrations times
# times <- seq(0,100, by=0.001)
times <- seq(0,100, by=0.01)


#perform the integration and assign it to variable 'out'
out <- ode(y=state, times= times, func=Lorenz, parms=parameters)


LorenzStateSpace <- as.data.table(out)


fsNNtmp <-function(x) {list("Lorenz")}
LorenzStateSpace[,c("type"):=fsNNtmp(), ]
LorenzStateSpace[,Sample:=seq(.N)]
setcolorder(LorenzStateSpace, c(5,6,1:4))



# ################################################################################
# # Plotting State Spaces
#

png(filename="Aa.png",
  bg = "transparent",
  type="cairo",
  width = 800, height = 800, units = "px",
  pointsize=20,
  res=75
  )
        # type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)
        #

cols <- colorRampPalette(brewer.pal(11, "PRGn"))

scatter3D(
  LorenzStateSpace$X, LorenzStateSpace$Y, LorenzStateSpace$Z,
  # theta = 0,
  # phi = 0,
  colvar = LorenzStateSpace$time,
  bty = "f", # boxtype
  #b white background
  #b2 white background and gray lines
  #f transparent
  #g grid
  #bl black
  #bl2 black with white lines
  #u white
  #n none
  #   'arg' should be one of “b”, “b2”, “f”, “g”, “bl”, “bl2”, “u”, “n”
  type = "l", lwd=15,
	axis.scales = TRUE,
  main = "",
  xlab = '', ylab ='', zlab = '',
  colkey = FALSE
  # border=NA,
  )

# xlab = 'x(n)', ylab ='y(n)', zlab = 'z(n)',
# xlim=c(-1,1),ylim= c(-1,1),zlim=c(-10,30),
# colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)


dev.off()


png(filename="Ab.png",
  bg = "transparent",
  type="cairo",
  width = 800, height = 800, units = "px",
  pointsize=20,
  res=75
  )
        # type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)
        #

cols <- colorRampPalette(brewer.pal(11, "PRGn"))

scatter3D(
  LorenzStateSpace$X, LorenzStateSpace$Y, LorenzStateSpace$Z,
  # theta = 0,
  # phi = 0,
  colvar = LorenzStateSpace$time,
  bty = "n", # boxtype n none
  type = "l", lwd=15,
	axis.scales = TRUE,
  main = "",
  xlab = 'x', ylab ='y', zlab = 'z',
  colkey = FALSE
  # border=NA,
  )

# xlab = 'x(n)', ylab ='y(n)', zlab = 'z(n)',
# xlim=c(-1,1),ylim= c(-1,1),zlim=c(-10,30),
# colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)


dev.off()
