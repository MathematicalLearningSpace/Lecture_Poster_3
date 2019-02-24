#----------------------To Be Updated and Work in Progress for Classroom Examples---------------------------
library(xtable);library(readxl);library(readr)
#-------------------------------------Data---------------------------------------------------------------

#-------------------------------------USDA Data Set-------------------------------------------------------
ABBREV <- read_excel("sr28abxl/ABBREV.xlsx")
View(ABBREV)
Nutrition.df<-as.data.frame(ABBREV)
Nutrition.Beans.df<-Nutrition.df[grep('BEANS,BLACK',Nutrition.df$Shrt_Desc),]
#----------------------------------Transformations-------------------------------------------------------
Nutrition.df<-Nutrition.df[with(Nutrition.df, order(Nutrition.df$Vit_A_IU,decreasing=TRUE)),]
Nutrition.Beans.Protein.df<-Nutrition.Beans.df[with(Nutrition.Beans.df, order(Nutrition.Beans.df$`Protein_(g)`,decreasing=TRUE)),]
Nutrition.Protein.df<-Nutrition.df[with(Nutrition.df, order(Nutrition.df$`Protein_(g)`,decreasing=TRUE)),]
#----------------------------------Tables----------------------------------------------------------------
Table.1<-xtable(Nutrition.Beans.df)
#---------------------------------Figures---------------------------------------------------------------

Figure.1<-hist(Nutrition.Protein.df$`Protein_(g)`)
Figure.2<-plot(Nutrition.df$Vit_A_IU)
#---------------------------------Function Library------------------------------------------------------
