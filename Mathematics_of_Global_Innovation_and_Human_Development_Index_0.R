library(readr)


#----------------------------------------------Data------------------------------------------

Analysis_2019mar13205242.df <- as.data.frame(read_csv("Global Innovation Index/Analysis_2019mar13205242.csv"))

GII.Categories<-Analysis_2019mar13205242.df$X2
GII.Categories

#---------------------------------------------Tables-----------------------------------------

Table.1.df<-cbind(GII.Categories,
                  Analysis_2019mar13205242.df$Nepal,
                  Analysis_2019mar13205242.df$Japan,
                  Analysis_2019mar13205242.df$China,
                  Analysis_2019mar13205242.df$`Korea, Republic of`,
                  Analysis_2019mar13205242.df$Italy,
                  Analysis_2019mar13205242.df$France,
                  Analysis_2019mar13205242.df$Spain)

colnames(Table.1.df)<-c("GII","Nepal","Japan","China","Korea","Italy","France","Spain")

#---------------------------------------------Figures---------------------------------------


#---------------------------------------------Function Library-----------------------------



