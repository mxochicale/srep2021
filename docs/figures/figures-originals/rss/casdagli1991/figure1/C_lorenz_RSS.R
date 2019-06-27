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
library(plot3D)
require(tseriesChaos)

require(pals)


library(devtools)
load_all('~/mxochicale/github/r-code_repository/rpackages/nonlinearTseries')



library(deSolve)


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
################################################################################
################################################################################
################################################################################
# Emdedding
xinput <- LorenzStateSpace$X


# TimeDelayEmbedding <- embedd(xinput, m=6, d=10)
# TimeDelayEmbedding <- as.data.table(TimeDelayEmbedding)


tm <- buildTakens(xinput,embedding.dim=5,time.lag=6)
TM <- as.data.table(tm)
TimeDelayEmbedding <- as.data.table(tm)


TimeDelayEmbedding[,Sample:=seq(.N)]

setcolorder(TimeDelayEmbedding,c(ncol(TimeDelayEmbedding),1:(ncol(TimeDelayEmbedding)-1)))
colnames(TimeDelayEmbedding)[2:4] <- c("xt1", "xt2", "xt3")



lenvec <- length(LorenzStateSpace$time)

# colorvec <- plasma(lenvec)
colorvec <- gnuplot(lenvec)


# colorvec <- inferno(lenvec)
# colorvec <- magma(lenvec)
# colorvec <- linearlhot(lenvec)

# colorvec <- coolwarm(lenvec)
# colorvec <- warmcool(lenvec)
# colorvec <- (lenvec)

# colorvec <- kovesi.diverging_linear_bjy_30_90_c45(lenvec)
# colorvec <- kovesi.linear_bmy_10_95_c71(lenvec)


# > p1 <- coolwarm(255)
# > cool2 <- pal.compress(coolwarm)
# > p2 <- colorRampPalette(cool2)(255)



# colorvec <- colorRampPalette(brewer.pal(11, "YlOrRd"))(lenvec)


# ################################################################################
# # Plotting State Spaces
#

png(filename="Ca.png",
  bg = "transparent",
  type="cairo",
  width = 800, height = 800, units = "px",
  pointsize=20,
  res=75
  )
        # type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)


scatter3D(
  TimeDelayEmbedding$xt1, TimeDelayEmbedding$xt2, TimeDelayEmbedding$xt3,
  colvar = TimeDelayEmbedding$Sample,
  col = colorvec,
  bty = "f", # boxtype
  type = "l", # l-lines, p-points, h-stem , o, b
  lwd=15, axis.scales = TRUE,
  d=1,
  main = "",
  xlab = '', ylab ='', zlab = '',
  colkey = FALSE
  )

  # xlab = 'x(t-T)', ylab ='x(t-2T)', zlab = 'x(t-3T)',
# xlim=c(-1,1),ylim= c(-1,1),zlim=c(-10,30),
# xlab = 'x(t-T)', ylab ='x(t-2T)', zlab = 'x(t-3T)',
# colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)

dev.off()





png(filename="Cb.png",
  bg = "transparent",
  type="cairo",
  width = 800, height = 800, units = "px",
  pointsize=20,
  res=75
  )
        # type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)


scatter3D(
  TimeDelayEmbedding$xt1, TimeDelayEmbedding$xt2, TimeDelayEmbedding$xt3,
  colvar = TimeDelayEmbedding$Sample,
  col = colorvec,
  bty = "n", # boxtype n none
  type = "l", # l-lines, p-points, h-stem , o, b
  lwd=15, axis.scales = TRUE,
  d=1,
  main = "",
  xlab = '', ylab ='', zlab = '',
  colkey = FALSE
  )

  # xlab = 'x(t-T)', ylab ='x(t-2T)', zlab = 'x(t-3T)',
# xlim=c(-1,1),ylim= c(-1,1),zlim=c(-10,30),
# xlab = 'x(t-T)', ylab ='x(t-2T)', zlab = 'x(t-3T)',
# colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)

dev.off()





################################################################################
################################################################################
################################################################################
################################################################################
# Plotting time series



lenvec_main <- length(TimeDelayEmbedding$Sample)
colorvec_main <- gnuplot(lenvec_main)


plotlinewidth <- 5
################################
### (4.2) Windowing Data
windowframe = 2400:2800
TDE <- TimeDelayEmbedding[,.SD[windowframe]]




ts <- ggplot(TDE) +
   geom_line(aes(x=Sample,y=xt1), colour=colorvec_main[windowframe],lwd = plotlinewidth,alpha=0.6)+
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


width = 800
height = 350
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

ggsave(filename = "Da.png",
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png",
             ts
             )






ts <- ggplot(TDE) +
  geom_line(aes(x=Sample,y=xt2), colour=colorvec_main[windowframe],lwd = plotlinewidth,alpha=0.6)+
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


width = 800
height = 350
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

ggsave(filename = "Db.png",
            dpi = dpi,
            width = width.calc,
            height = height.calc,
            units = 'in',
            bg = "transparent",
            device = "png",
            ts
            )










ts <- ggplot(TDE) +
  geom_line(aes(x=Sample,y=xt3), colour=colorvec_main[windowframe],lwd = plotlinewidth,alpha=0.6)+
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


width = 800
height = 350
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

ggsave(filename = "Dc.png",
            dpi = dpi,
            width = width.calc,
            height = height.calc,
            units = 'in',
            bg = "transparent",
            device = "png",
            ts
            )




################################################################################
################################################################################
################################################################################
################################################################################
### SVD

# xinput <- LorenzStateSpace$X
# TimeDelayEmbedding <- embedd(xinput, m=6, d=10)


svd <- svd( t(TM))

u <- svd$u
d <- svd$d
v <- svd$v

n <- 1:length(v[,1])


colorvec <- gnuplot(length(v[,1]))



# ################################################################################
# # Plotting State Spaces
#

png(filename="Ea.png",
  bg = "transparent",
  type="cairo",
  width = 800, height = 800, units = "px",
  pointsize=20,
  res=75
  )
        # type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)


scatter3D(
  v[,1], v[,2], v[,3],
  # v[,2], v[,1], v[,3],
  # v[,3], v[,1], v[,2],
  # v[,2], v[,3], v[,1],
  # phi=180,
  theta=220,
  colvar = n,
  col = colorvec,
  bty = "f", # boxtype
  type = "l", # l-lines, p-points, h-stem , o, b
  lwd=15,
  axis.scales = TRUE,
  d=1,
  main = "",
  xlab = '', ylab ='', zlab = '',
  colkey = FALSE
  )

  # xlab = 'x(t-T)', ylab ='x(t-2T)', zlab = 'x(t-3T)',
# xlim=c(-1,1),ylim= c(-1,1),zlim=c(-10,30),
# xlab = 'x(t-T)', ylab ='x(t-2T)', zlab = 'x(t-3T)',
# colkey = list(length = 0.3, width = 0.8, cex.clab = 0.75)

dev.off()
