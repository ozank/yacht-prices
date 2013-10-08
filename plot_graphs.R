library(scatterplot3d)
attach(table)
scatterplot3d(length,year,price, main="3D Scatterplot")

library(ggplot2)

table<-dufour
#with(subset(table,length==38), plot(2013-year,price))
plot_data<-subset(table,length==39)
plot(price~year, plot_data)


ggplot(plot_data, aes(year,price)) + geom_point()+ geom_smooth(method="loess",level=0.9,size=1)

c <- ggplot(table, aes(y=price, x=year, colour=factor(length)))
c + stat_smooth(method=loess) + geom_point()
c +stat_smooth(method=loess) + geom_point() +ylim(0,3e5)
c +stat_smooth(method=loess) +ylim(0,3e5)

plot_data<-subset(table,length>32 & length<37)
c<-ggplot(plot_data, aes(y=price, x=year, colour=factor(length)))
c +stat_smooth(method=loess) + geom_point() +ylim(0,2e5)


qplot(data=table,x=length,main="Histogram of BodyMass", binwidth=0.1)

qplot(data=table,x=year,y=price,color=as.character(length))

qplot(data=plot_data,x=year,y=price,geom="jitter")+ stat_smooth(method="loess")

qplot(data=plot_data, x=year, y=price, colour=as.character(length)) + geom_line() + geom_errorbar(aes(ymin = price- 10000, ymax = price + 10000))

qplot(year,price,data=plot_data, main="Bavaria 32ft") +scale_x_reverse() + xlab("Model")+ylab("Fiyat (Euro)")+ stat_smooth(level=0.9,size=1)+ylim(0,9e4) 
+ geom_boxplot() + stat_smooth(aes(group=1))