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
library(ggplot2)
library(deSolve)
require(pals) # for colours
# library("RColorBrewer")



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







################################################################################
# Plotting time series



plotlinewidth <- 6




################################
### (4.2) Windowing Data
windowframe = 4500:5700
Ba <- LorenzStateSpace[,.SD[windowframe]]


# png(filename="Ba.png",
#     type="cairo",
#     width = image_width, height = image_height,units = "px", bg = image_bg,
#     pointsize=25,
#     res=75
# )
# dev.off()

p <- ggplot(Ba) +
   geom_line(aes(x=time,y=X),colour='red',lwd = plotlinewidth,alpha=0.6)+
  #  facet_wrap(~type, scales = 'free', nrow = 4)+
   labs( x = 't', y='x(t)' )+
   theme(axis.text=element_text(size=20),
         axis.title=element_text(size=25))+
   theme(legend.position="none")+
   theme(panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         panel.background = element_rect(fill = "transparent",colour = NA),
         plot.background = element_rect(fill = "transparent",colour = NA),
         axis.line = element_line(colour = "black")
         )


width = 1000
height = 600
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

ggsave(filename = "Ba.png",
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png"
             )


# http://ggplot2.tidyverse.org/reference/ggsave.html
# https://stackoverflow.com/questions/26551359/r-ggsave-save-thumbnail-size-200-x-200-scaled-image







plotlinewidth <- 2
width = 500
height = 500
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

# image_bg <- "transparent" #image_bg <- "white"




################################
### (4.2) Windowing Data
# windowframe = 00:5700
# windowframe = 00:10000
# Bb <- LorenzStateSpace[,.SD[windowframe]]

lenvec <- length(LorenzStateSpace$time)
colorvec <- gnuplot(lenvec)
# colorvec <- inferno(lenvec)


p <- ggplot(LorenzStateSpace) +
   geom_line(aes(x=Sample,y=X ), colour=colorvec, lwd = plotlinewidth,alpha=0.6)+
  #  facet_wrap(~type, scales = 'free', nrow = 4)+
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




ggsave(filename = "Bb.png",
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png"
             , p)
