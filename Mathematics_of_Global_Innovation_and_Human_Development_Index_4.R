library(xtable)
library(readxl)
library(readr)
library(mosaic)
library(maps)

#-------------------------------------Data---------------------------------------------------------------
data(world.cities)
world.cities.df<-as.data.frame(world.cities)
View(world.cities.df)

#-------------------Data for Spatial Global Innovation Index Distribution-------------------------------
#-------------------Travel and Food Recipes-------------------------------------------------------------

world.cities.Peru<-world.cities.df[grep('Peru',world.cities.df$country.etc),]
world.cities.Nepal<-world.cities.df[grep('Nepal',world.cities.df$country.etc),]
world.cities.China<-world.cities.df[grep('China',world.cities.df$country.etc),]

#------------------------------------ Global Innovation Index Data--------------------------------------
GII.df <- as.data.frame(read_csv("Analysis_2018ene18051953.csv"))
View(GII.df)

#-------------------------------------Transformations and Filters----------------------------------------
GII.1.ts<-as.ts(t(GII.df[3,4:129]))
IER.ts<-as.ts(t(GII.df[4,4:129])) #Innovation Efficiency Ratio
IISI.ts<-as.ts(t(GII.df[5,4:129]))
IOSI.ts<-as.ts(t(GII.df[6,4:129]))

Peru.df<-cbind(GII.df$X2,GII.df$Peru)
Nepal.df<-cbind(GII.df$X2,GII.df$Nepal)

GII.Creativity.df<-GII.df[grep('creativity',GII.df$X2),]
GII.Creativity.ts<-as.ts(t(GII.Creativity.df[4:129]))
GII.TP.df<-GII.df[grep('technical publications',GII.df$X2),]
GII.TP.ts<-as.ts(t(GII.TP.df[4:129]))
GII.H.df<-GII.df[grep('Citable documents H index',GII.df$X2),]
GII.H.ts<-as.ts(t(GII.H.df[4:129]))

GII.Creativity.online.df<-data.frame()
GII.Creativity.online.df<-cbind(rownames(t(GII.Creativity.df[4:129])),
                                GII.Creativity.ts)
colnames(GII.Creativity.online.df)<-c("country","creativity")
#-------------------------------------Tables-------------------------------------------------------------

Table.1<-xtable(GII.Creativity.online.df)

#-----------------------------------Figures-------------------------------------------------------------

Figure.1<-plot(GII.Creativity.ts,type = 'l', 
               col = "black", lwd = 2, lty=1,
               xaxt='n',
               main = "Global Innovation Index for Creativity")
lines(GII.TP.ts,lty=2,col="red")
lines(GII.H.ts,lty=3,col="blue")
lines(GII.1.ts,lty=4,col="green",lwd = 4)
grid()
Axis(side=1, at=1:length(GII.Creativity.ts), 
     labels=rownames(t(GII.Creativity.df[4:129])),cex.axis=0.35)
legend("bottomright", col = c("black","red","blue","green"), 
       lty = 1:4, cex=0.75,
       legend = c("Online Creativity","Scientific and Technical Publications","Citable Documents H Index","Overall"))

Figure.2<-hist(as.numeric(GII.Creativity.ts))
Figure.3<-plot(GII.H.ts,type = 'l', 
               col = "black", lwd = 2, lty=1,
               xaxt='n',
               main = "Citable Documents H Index")

grid()
Axis(side=1, at=1:length(GII.H.ts), 
     labels=rownames(t(GII.H.df[4:129])),cex.axis=0.35)
legend("bottomright", col = c("black"), 
       lty = 1:4, cex=0.75,
       legend = c("Citable Documents H Index"))

Figure.4<-map("world", "Peru")
  map.cities(country="Peru",capitals=0)

#-----------------------------------Function Library----------------------------------------------------

