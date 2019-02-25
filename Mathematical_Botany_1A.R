#-----------------------------R Code To Modify in the Classroom Lecture with Students-----------------------
#---------------------------------------------------R API 
library(readr);library(recommenderlab);library(BIEN);library(ape);library(maps);library(sp);library(ecolMod)
library(sqldf);library(plyr);library(FD);library(aqp);library(vegan);library(vegetarian);library(primer);library(popbio)
library(soiltexture);library(qualV)

plant.genera<-c("Apiaceae",
                "Araceae",
                "Arecaceae",
                "Asteraceae",
                "Brassicaceae",
                "Commelinaceae",
                "Ericaceae",
                "Liliaceae",
                "Amaryllidoideae",
                "Clusiaceae",
                "Euphorbiaceae",
                "Phyllanthaceae",
                "Picrodendraceae",
                "Apocynaceae",
                "Orchidaceae",
                "Poaceae",
                "Rosaceae",
                "Rubiaceae",
                "Rutaceae",
                "Sapindaceae",
                "tree")

BIEN_taxonomy_family(plant.genera[5])
plant.brassica.trait<-BIEN_trait_family(plant.genera[5])

plant.brassica.trait.df<-as.data.frame(plant.brassica.trait)






#-------------Function Template Library for Classroom Presentation and Modification---------------------
f.1<-function(X)
 {
  Z<-""
  a<-1
  W<-runif(length(X),0,1)
  for(i in 1:length(X))
  {  
	Z<-stringr::str_c(Z,X[i])
	W[i]<-a*W[i]
  }
  output<-list()
  output$X<-X
  output$a<-a
  output$Z<-Z
  output$W<-W
  return(output)
 } 
test.f.1<-f.1(letters)
test.f.1
