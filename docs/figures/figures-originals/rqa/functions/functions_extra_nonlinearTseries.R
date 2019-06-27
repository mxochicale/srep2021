#------------------------------------------------------------
#   Extra Functions For nonlinearTseries
#   v0.0.0 - 28april2018.13h29m 
#
#
#                        miguel [http://mxochicale.github.io]
#
#
#------------------------------------------------------------


############
## To use `functions_extra_nonlinearTseries.R` add the following line to your main script:
## github_path <- getwd()
## source( paste(github_path,'/tavand/functions/functions_extra_nonlinearTseries.R',sep='') )


#################################################################################
#mirror_repo <- 'https://www.stats.bris.ac.uk/R/'
#if (!require("ggplot2")) {
#install.packages('ggplot2', repos=mirror_repo, dependencies = TRUE) 
#library(ggplot2)
#}



################################################################################
plotRecurrencePlot <-function (RM,maxsamplerp)
{

ggplot(RM)+
	geom_raster( aes(x=a,y=b,fill=Recurrence) ) +  
	scale_fill_manual( values = c("#ffffff", "#000000") ) + # black and white colours
	labs(x="Sample", y="Sample") +
	scale_x_continuous(limits = c(0,maxsamplerp), expand = c(0, 0)) + # remove space between axis and area plot	
	scale_y_continuous(limits = c(0,maxsamplerp), expand = c(0, 0)) + # remove space between axis and area plot
	theme_bw(base_size=20) + 
	theme(legend.position="none",
	plot.margin=grid::unit(c(10,10,10,10), "mm"), # increase the border between axis and the image
	axis.line = element_line(colour = "black")
	)
}

# Usage of plotRecurrencePlot <-function (RM,maxsamplerp)
# Example: plotRecurrencePlot(RM,maxsamplerp)



################################################################################
plotOnlyRecurrencePlot <-function (RM,maxsamplerp)
{

ggplot(RM)+
	geom_raster( aes(x=a,y=b,fill=Recurrence) ) +  
	scale_fill_manual( values = c("#ffffff", "#000000") ) + # black and white colours
	theme_void()+	
	theme(legend.position="none")+
	scale_x_continuous(limits = c(0,maxsamplerp), expand = c(0, 0)) + # remove space between axis and area plot	
	scale_y_continuous(limits = c(0,maxsamplerp), expand = c(0, 0)) # remove space between axis and area plot

}

# Usage of plotOnlyRecurrencePlot <-function (RM,maxsamplerp)
# Example: plotOnlyRecurrencePlot(RM,maxsamplerp)


################################################################################
savePlot <-function (filename_extension,width,height,ggplotobject)
{

### Save Picture
#width = 1000
#height = 1000

text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

ggsave(filename = filename_extension,
             dpi = dpi,
             width = width.calc,
             height = height.calc,
             units = 'in',
             bg = "transparent",
             device = "png"
             , ggplotobject)


}
# Usage of savePlot <-function (filename,width,height,ggplotobject)
# Example: 




