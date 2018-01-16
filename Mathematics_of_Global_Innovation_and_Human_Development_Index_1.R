library(xtable)
library(readxl)
library(readr)
#-------------------------------------Data---------------------------------------------------------------

#-------------------------------------Human Development Index-------------------------------------

X2016_Statistical_Annex_Table_2 <- as.data.frame(read_excel("2016_Statistical_Annex_Table_2.xls"))
View(X2016_Statistical_Annex_Table_2)
countries<-X2016_Statistical_Annex_Table_2$`Table 2. Human Development Index Trends, 1990-2015`[6:189]
Nepal <- read_delim("Nepal.csv", " ", escape_double = FALSE, trim_ws = TRUE)
HDI <- read_csv("HDI.csv")
View(HDI)

#--------------------------------------Read Article Notes----------------------------------------
article.summary<-NULL
article.HDI.files <- list.files(patt='*_HDI_*.*csv$')
for(i in 1:length(article.HDI.files))
{
  article.summary[i]<-read_csv(article.HDI.files[i],col_names = FALSE)
}
article.summary.df<-as.data.frame(article.summary)
View(article.summary.df)

#-------------------------------------Transformations--------------------------------------------
HDI.Nepal<-HDI[119,]
HDI.Nepal.ts<-as.ts(t(HDI.Nepal[3:length(HDI.Nepal)]))
#------------------------------------Compute Human Development Index (HDI) Components-------------------------------------
LEI.1<-73.5
LEI.2<-83.2
MYSI.1<-7.5
MYSI.2<-13.2
EYSI.1<-11.4
EYSI.2<-20.6
II.1<-7263
II.2<-108211
a<-20
b<-0.951
c<-163

HDI.Component.Compute<-HDI.Components(LEI.1,LEI.2,MYSI.1,MYSI.2,EYSI.1,EYSI.2,II.1,II.2,a,b,c)

Human_Development_Index.df<-data.frame()
Human_Development_Index.df<-rbind(c(HDI.Component.Compute$LEI,
                                    HDI.Component.Compute$MYSI,
                                    HDI.Component.Compute$EYSI,
                                    HDI.Component.Compute$EI,
                                    HDI.Component.Compute$II,
                                    HDI.Component.Compute$HDI))
colnames(Human_Development_Index.df)<-c("LEI","MYSI","EYSI","EI","II","HDI")

#-----------------------------Tables-------------------------------------------------------------

Table.1<-xtable(Human_Development_Index.df)

#-----------------------------Figures------------------------------------------------------------

Figure.1<-plot(X2016_Statistical_Annex_Table_2$X__22,type = 'l', col = "black", lwd = 2, lty=1,
               ylim = c(0, 6), 
               xaxt='n',
               main = "Human Development Index by Country, 2000-2010")
grid()
Axis(side=1, at=1:length(countries), labels=countries,cex.axis=0.5)
legend("bottomright", col = c("black"), 
       lty = 1:1, cex=0.75,
       legend = c("V1"))
Figure.2<-plot(HDI.Nepal.ts,type = 'l', col = "black", lwd = 2, lty=1,
               xaxt='n',
               main = "Human Development Index by Country, 2000-2010")
grid()
legend("bottomright", col = c("black"), 
       lty = 1:1, cex=0.75,
       legend = c("V1"))

op <- par(mfrow=c(1,2))
par(op)

#-----------------------------Function Library--------------------------------------------------

HDI.Components<-function(LEI.1,LEI.2,MYSI.1,MYSI.2,EYSI.1,EYSI.2,II.1,II.2,a,b,c)
{
  HDI<-c("LEI","MYSI","EYSI","EI","II")
  LEI<-(LEI.1-a)/(LEI.2-a)
  MYSI<-(MYSI.1-0)/(MYSI.2-0)
  EYSI<-(EYSI.1-0)/(EYSI.2-0)
  EI<-((MYSI*EYSI)^(1/2)-0)/(b-0)
  II<-(log(II.1)-log(c))/(log(II.2)-log(c))
  #Add a ratio :-)
  HDI<-(LEI * EI *II)^(1/3)
  return(list(LEI=LEI,MYSI=MYSI,EYSI=EYSI,EI=EI,II=II,HDI=HDI))
}