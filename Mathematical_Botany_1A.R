library(readr)
library(recommenderlab)
library(BIEN)
library(ape) 
library(maps) 
library(sp) 
library(ecolMod)

library(sqldf)
library(plyr)

library(FD)
library(aqp)
library(vegan)
library(vegetarian)
library(primer)
library(popbio)
library(soiltexture)
library(qualV)

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
plant.brassica.trait<-BIEN_trait_family(plant.genera[6])

plant.brassica.trait.df<-as.data.frame(plant.brassica.trait)