library(xtable)
library(stringi)
library(stringr)
library(readr)
library(readxl)
#------------------------------------------Data---------------------------------------------------------------
recipe.actions<-c("Boil","Bake","Mix","Stir","Slice","Serve")
ingredient.list<-c("water","quinoa")
measurement<-c("teaspoon","tablespoon","cup")
measurement.time<-c("minute","hour")
measurement.temperature<-c("degrees F","degrees C")
recipe.steps<-c(stri_join("Step 1 ",recipe.actions[3]," ","2"," ",measurement[3]," ",ingredient.list[2], " ","1"," ",measurement[3]," ",ingredient.list[1],".",
                          "Step 2 ",recipe.actions[1], " ",ingredient.list[1],".",
                          "Step 3 ",recipe.actions[6],"." ))
ABBREV <- read_excel("sr28abxl/ABBREV.xlsx")
View(ABBREV)
Nutrition.df<-as.data.frame(ABBREV)
Nutrition.Quinoa.df<-t(Nutrition.df[grep("QUINOA,CKD",Nutrition.df$Shrt_Desc),])
Nutrition.Quinoa.Vitamins.df<-Nutrition.Quinoa.df[21:44]
Nutrition.Quinoa.Names.df<-rownames(Nutrition.Quinoa.df)
#-----------------------------------------Tables--------------------------------------------------------------
Table.1<-xtable(Nutrition.Quinoa.df)
Table.2<-recipe.assembly(ingredient.list,recipe.steps,"Quinoa Recipe 1")

#----------------------------------------Figures--------------------------------------------------------------
Figure.1<-barplot(as.numeric(Nutrition.Quinoa.Vitamins.df), xaxt='n',color="blue")
Axis(side=1, at=1:length(Nutrition.Quinoa.Names.df[21:44]), 
     labels=Nutrition.Quinoa.Names.df[21:44],cex.axis=0.35)
#----------------------------------------References-----------------------------------------------------------
#----------------------------------------Function Library-----------------------------------------------------

recipe.assembly<-function(ingredient,recipe.steps,recipe.name){
  doc.type<-c("documentclass{recipecard}")
  doc.tag.begin<-c("begin{document}")
  ingredient.tag.begin<-c("ingredient{")
  ingredient.tag.end<-c("}")
  recipe.tag.begin<-c("begin{recipe}")
  container.1<-NULL;container.1[1]<-""
  container.2<-NULL;container.2[1]<-""
  container.3<-NULL;container.3[1]<-""
  container.main<-NULL
  container.1[1]<-stri_join(doc.type,doc.tag.begin)
  for(i in 1:length(ingredient.list))
  {
    container.2[1]<-stri_join(container.2[1],ingredient.tag.begin,ingredient.list[i], ingredient.tag.end)
  }
  container.3[1]<- stri_join(recipe.tag.begin,"{",recipe.name,"}")
  for(i in 1:length(recipe.steps))
  {
    container.3[1]<-stri_join(container.3[1]," ",recipe.steps[i])
  }
  recipe.tag.end<-c("end{recipe}")
  doc.tag.end<-c("end{document}")
  container.3[1]<-stri_join(container.3[1],recipe.tag.end)
  container.main<-stri_join(container.1[1],container.2[1],container.3[1], doc.tag.end)
  return(container.main)
}