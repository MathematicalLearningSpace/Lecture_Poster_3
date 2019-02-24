
library(xtable);library(readxl);library(readr)

#-------------------------------------Data---------------------------------------------------------------

#-------------------------------------FAOSTAT_Data for Recipes-------------------------------------------------------
Production.Crops.All<-read_csv("Production_Crops_E_All_Data.csv")
View(Production.Crops.All)

#-------------------------------------Transformations and Filters for Recipes----------------------------------------

Production.Crops.All.df<-as.data.frame(Production.Crops.All)
Production.Crops.Peru.df<-Production.Crops.All.df[grep('Peru',Production.Crops.All.df$Area),]

Ingredients.Recipes<-unique(Production.Crops.Peru.df$Item)
Ingredients.Recipes.DryBeans<-grep("Beans, dry",Production.Crops.Peru.df$Item)

Ingredients.Recipes.DryBeans.ts<-as.ts(t(Production.Crops.Peru.df[30,9:length(Production.Crops.Peru.df)]))
Ingredients.Recipes.DryBeans.ts.Filtered<-Ingredients.Recipes.DryBeans.ts[!is.na(Ingredients.Recipes.DryBeans.ts)]
Ingredients.Recipes.DryBeans.Activity<-Production.Crops.Peru.df[Ingredients.Recipes.DryBeans,6]

Ingredients.Recipes.df<-as.data.frame(Ingredients.Recipes)

#-------------------------------------Tables-------------------------------------------------------------

Table.1<-xtable(Ingredients.Recipes.df)

#-----------------------------------Figures-------------------------------------------------------------

Figure.1<-plot(Ingredients.Recipes.DryBeans.ts.Filtered,type = 'l', 
            col = "black", lwd = 2, lty=1,
            xaxt='n',
            main = "Dry Bean Production Peru")
grid()
Axis(side=1, at=1:length(Ingredients.Recipes.DryBeans.ts.Filtered), 
     labels=seq(1962,2016,1),cex.axis=0.5)
legend("bottomright", col = c("black"), 
       lty = 1:1, cex=0.75,
       legend = c(Ingredients.Recipes.DryBeans.Activity[3]))

#-----------------------------------Function Library----------------------------------------------------

