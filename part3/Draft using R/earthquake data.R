library("rgl")
library("maptools")
library("leaflet")

path <- "/Users/yiling10/Downloads/3d_Py+R/data3/"
eq2013 <- read.csv(paste(path,"eq2013.csv",sep =""))
pnt <- rgdal::readOGR(paste(path,"world.shp",sep =""))
kline <- rgdal::readOGR(paste(path,"eqKernel.shp",sep =""))

klineZ <- kline@data$Contour

pz <- vector(length = length(pnt))
pz[] <-0

cl <-c(ifelse(eq2013$z<60,'red',ifelse(eq2013$z<300,'green','blue')))


rgl.bbox(emission='grey40',color='grey40',xlen = 0,ylen = 0,zlen = 0)


plot3d(eq2013$x,eq2013$y,eq2013$z*-1,col=cl,lit=T,xlab='X',ylab = 'Y',zlab = 'Z')


points3d(pnt$coords.x1,pnt$coords.x2,pz,color='#DAB96E',alpha=0.7)


pal <- colorNumeric(c("darkgreen", "yellow", "orangered"),klineZ)

for(i in 1:length(kline)){
  klxy <-slot(slot(kline@lines[[i]],"Lines")[[1]],"coords")
  lines3d(klxy[,1],klxy[,2],klineZ[i]*20,col=pal(kline@data$Contour[i]))
}

rgl.postscript("3dplot.ps",fmt = 'ps')
rgl.snapshot('3dplot.png',fmt = 'png')
rgl.postscript("3dplot.pdf",fmt = 'pdf')
play3d(spin3d())
