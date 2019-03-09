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
