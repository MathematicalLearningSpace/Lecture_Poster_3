#Title: Food Nutrition Examples for the Classroom

library(readr)
library(dplyr)
setwd("BFPD_csv_07132018")
#---------------------------------Data-----------------------------------------------------------------------------------------------#
#---https://data.nal.usda.gov/dataset/usda-branded-food-products-database/resource/c929dc84-1516-4ac7-bbb8-c0c191ca8cec--------------#
Nutrients.df <- as.data.frame(read_csv("Nutrients.csv"))
Products.df <- as.data.frame(read_csv("Products.csv"))
Derivation_Code_Description.df <- as.data.frame(read_csv("Derivation_Code_Description.csv"))
Serving_size.df <- as.data.frame(read_csv("Serving_size.csv"))

#-------------------------------------Example of Function for Classroom--------------
f.1<-function(X,Y,keyword,keyword.2,Visualization=FALSE)
{
  nutrients<-Y$Nutrient_name[1:50]
  index<-grep(keyword,X$long_name)
  #------------------------------------Search Results--------------------------------
  search.results<-X[index,]
  search.results.2<-Y[match(search.results$NDB_Number,Y$NDB_No),]
  search.results.3<-Nutrients.df[grep(keyword.2,Nutrients.df$Nutrient_name),]
  search.results.4<-Products.df[match(search.results.3$NDB_No,Products.df$NDB_Number),]
  
  #-----------------------------------Table Design------------------------------------
  test.df<-cbind(search.results$NDB_Number,search.results$long_name,search.results$ingredients_english)
  test.2.df<-cbind(search.results.2$NDB_No,search.results.2$Nutrient_name,search.results.2$Output_value)
  test.3.df<-as.data.frame(cbind(search.results.4$long_name,search.results.3$Nutrient_name,as.numeric(search.results.3$Output_value)))
  
  if(Visualization)
  {
    hist(as.numeric(test.3.df$V3),main=stringr::str_c(keyword.2),xlab="value")
    
  }
  #-------------------Table and Figure Presentation----------------------------------
 output<-list()
 output$Table.1<-xtable::xtable(test.df)
 output$Table.2<-xtable::xtable(test.2.df)
 #output$Table.3<-xtable::xtable(test.3.df)
 return(output)
  
}
test.f.1<-f.1(Products.df,Nutrients.df,"Coffee",Nutrients.df$Nutrient_name[7],TRUE)
test.f.1

