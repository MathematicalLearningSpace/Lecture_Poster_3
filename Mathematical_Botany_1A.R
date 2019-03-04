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

plant.Apiaceae.trait<-BIEN_trait_family(plant.genera[1])
plant.Araceae.trait<-BIEN_trait_family(plant.genera[2])
plant.Arecaceae.trait<-BIEN_trait_family(plant.genera[3])
plant.Asteraceae.trait<-BIEN_trait_family(plant.genera[4])
plant.Brassicaceae.trait<-BIEN_trait_family(plant.genera[5])
plant.Commelinaceae.trait<-BIEN_trait_family(plant.genera[6])
plant.Ericaceae.trait<-BIEN_trait_family(plant.genera[7])
plant.Liliaceae.trait<-BIEN_trait_family(plant.genera[8])
plant.Amaryllidoideae.trait<-BIEN_trait_family(plant.genera[9])
plant.Clusiaceae.trait<-BIEN_trait_family(plant.genera[10])
plant.Euphorbiaceae.trait<-BIEN_trait_family(plant.genera[11])
plant.Phyllanthaceae.trait<-BIEN_trait_family(plant.genera[12])
plant.Picrodendraceae.trait<-BIEN_trait_family(plant.genera[13])
plant.Apocynaceae.trait<-BIEN_trait_family(plant.genera[14])
plant.Orchidaceae.trait<-BIEN_trait_family(plant.genera[15])
plant.Poaceae.trait<-BIEN_trait_family(plant.genera[16])
plant.Rosaceae.trait<-BIEN_trait_family(plant.genera[17])
plant.Rubiaceae.trait<-BIEN_trait_family(plant.genera[18])
plant.Rutaceae.trait<-BIEN_trait_family(plant.genera[19])
plant.Sapindaceae.trait<-BIEN_trait_family(plant.genera[20])
plant.tree.trait<-BIEN_trait_family(plant.genera[21])

plant.brassica.trait.df<-as.data.frame(plant.brassica.trait)


Japan.df<-as.data.frame(BIEN_list_country("Japan"))
china.df<-as.data.frame(BIEN_list_country("China"))
Nepal.df<-as.data.frame(BIEN_list_country("Nepal"))
Italy.df<-as.data.frame(BIEN_list_country("Italy")) 
France.df<-as.data.frame(BIEN_list_country("France"))
England.df<-as.data.frame(BIEN_list_country("England"))
Arizona.df<-as.data.frame(BIEN_list_country("Arizona"))
Mexico.df<-as.data.frame(BIEN_list_country("Mexico"))
Argentina.df<-as.data.frame(BIEN_list_country("Argentina"))
Brazil.df<-as.data.frame(BIEN_list_country("Brazil"))
Chile.df<-as.data.frame(BIEN_list_country("Chile"))
Peru.df<-as.data.frame(BIEN_list_country("Peru"))
Venezuela.df<-as.data.frame(BIEN_list_country("Venezuela"))

#--------------------------------Formatted Students Notes for the Classroom--------------------
Brassicaceace_Genera_Copy_Plant_Immune_System <- read_csv("Brassicaceace Genera Copy Plant Immune System.txt", col_names = FALSE)
View(Brassicaceace_Genera_Copy_Plant_Immune_System)
Brassica.df<-data.frame(Brassicaceace_Genera_Copy_Plant_Immune_System)

plant.Apiaceae.trait.df<-as.data.frame(plant.Apiaceae.trait)
plant.Araceae.trait.df<-as.data.frame(plant.Araceae.trait)
plant.Arecaceae.trait.df<-as.data.frame(plant.Arecaceae.trait)
plant.Asteraceae.trait.df<-as.data.frame(plant.Asteraceae.trait)
plant.Brassicaceae.trait.df<-as.data.frame(plant.Brassicaceae.trait)
plant.Commelinaceae.trait.df<-as.data.frame(plant.Commelinaceae.trait)
plant.Ericaceae.trait.df<-as.data.frame(plant.Ericaceae.trait)
plant.Liliaceae.trait.df<-as.data.frame(plant.Liliaceae.trait)
plant.Amaryllidoideae.trait.df<-as.data.frame(plant.Amaryllidoideae.trait)
plant.Clusiaceae.trait.df<-as.data.frame(plant.Clusiaceae.trait)
plant.Euphorbiaceae.trait.df<-as.data.frame(plant.Euphorbiaceae.trait)
plant.Phyllanthaceae.trait.df<-as.data.frame(plant.Phyllanthaceae.trait)
plant.Picrodendraceae.trait.df<-as.data.frame(plant.Picrodendraceae.trait)
plant.Apocynaceae.trait.df<-as.data.frame(plant.Apocynaceae.trait)
plant.Orchidaceae.trait.df<-as.data.frame(plant.Orchidaceae.trait)
plant.Poaceae.trait.df<-as.data.frame(plant.Poaceae.trait)
plant.Rosaceae.trait.df<-as.data.frame(plant.Rosaceae.trait)
plant.Rubiaceae.trait.df<-as.data.frame(plant.Rubiaceae.trait)
plant.Rutaceae.trait.df<-as.data.frame(plant.Rutaceae.trait)
plant.Sapindaceae.trait.df<-as.data.frame(plant.Sapindaceae.trait)
plant.tree.trait.df<-as.data.frame(plant.tree.trait)

plant.Species.Collection<-list(
  plant.Apiaceae.trait.df,
  plant.Araceae.trait.df,
  plant.Arecaceae.trait.df,
  plant.Asteraceae.trait.df,
  plant.Brassicaceae.trait.df,
  plant.Commelinaceae.trait.df,
  plant.Ericaceae.trait.df,
  plant.Liliaceae.trait.df,
  plant.Amaryllidoideae.trait.df,
  plant.Clusiaceae.trait.df,
  plant.Euphorbiaceae.trait.df,
  plant.Phyllanthaceae.trait.df,
  plant.Picrodendraceae.trait.df,
  plant.Apocynaceae.trait.df,
  plant.Orchidaceae.trait.df,
  plant.Rosaceae.trait.df,
  plant.Rubiaceae.trait.df,
  plant.Rutaceae.trait.df,
  plant.Sapindaceae.trait.df,
  plant.tree.trait.df)
  

#--------------------------------Tables-----------------------------------


#--------------------------------Figures-----------------------------------

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
