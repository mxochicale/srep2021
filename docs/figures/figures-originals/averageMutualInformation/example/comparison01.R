require(tseriesChaos)
library(data.table)
library(ggplot2)



temp <- NULL;
temp<-read.csv("datafile", header=FALSE, sep=' ');
lts <-temp[,]
temp <- NULL;

maxtau <- 100
b  <- 100

tsmitemp <- mutual(lts, partitions= b , lag.max = maxtau, plot=FALSE)
tsmi <- as.data.table(unname(tsmitemp[]))


ctsmi <- fread("r.mi", header=FALSE)



MI <- cbind(ctsmi,tsmi)
colnames(MI) <- c('Tau', 'c', 'R')


pmi <- ggplot(MI,aes(x=Tau,y=c)) +
    geom_line(colour = "red",linetype = 'solid', size=2)+
    geom_line(mapping = aes(y = R),colour = "blue",linetype = 'solid', size=2)+
    labs(x= "Delay", y="Mutual Information")+
    theme_bw(20)


plot(pmi)
# e1 <- ggplot(E, aes(x=dim, y=E1, colour=TAU, group=TAU)) + geom_line() +theme_bw(20)





#
# m1 <- xyplot( tsmi[1:maxtau+1] ~ (1:maxtau+1),
#         pch=16, col.line = c('royalblue'), type = c("l","g"), lwd=5,
#         xlab=list(label="samples", cex=4),
#         ylab=list(label="", cex=4),
#         scales=list(font=1, cex=2.5)
# )
#
#
#
# m2 <- xyplot( X[,2] +  tsmi[1:maxtau+1] ~ X[,1],
#   pch=16, col.line = c('royalblue'), type = c("l","g"), lwd=5,
#   xlab=list(label="samples", cex=4),
#   ylab=list(label="", cex=4),
#   scales=list(font=1, cex=2.5)
# )
#
# plot(m2)
