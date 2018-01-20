library(xtable)
library(sampling)
library(igraph)
library(Matrix)
library(RCurl)
library(XML)
library(CHNOSZ)
library(rpubchem)
library(ChemmineR)
library(readr)

#---------------------------------Data-----------------------------------------------------
data(thermo)
Basil.notes<-c("Basil is an antioxidant.",
               "Twelve basil plants produce 4 to 6 cups of leaves per week.",
               "The soil temperature approximately 70 degrees F for best growth.",
               "Plant the seeds/seedlings about 10 to 12 inches apart.", 
               "Grow to about 12 to 24 inches in height.",
               "Every time a branch has six to eight leaves, repeat pruning.",
               "Harvest when the plant starts to bud-before flowersbloom.",
               "3 Months to harvest, Dry in Oven at 40 degrees C for 5 days.",
               "High variation in the chemical composition of basil essential oil.",
               "phytochemicals like Caffeic acid in basil",
               "caffeic acid is 3,4-dihydroxycinnamic acid",
               "Hydroxycinnamic acids,e.g.hydroxycinnamates are 
               phenolic compounds from non-flavonoid polyphenols.",
               "High antioxidant activity dependent on hydroxylation pattern of the 
                aromatic ring."
               )
               
Basil.categories<-c('Sweet Basils', 'Purple Basils', 'Amethyst', 
                    'Red Rubin','Purple Ruffles','Dark Opel','Lemon Basils','Genovese Pesto',
                    'Cinnamon Basil','Anise Basil','Fine Leaf Basils','Bush Basils')
Nutrient.composition.Minerals<-c('Ca',
                                 'Fe',
                                 'P',
                                 "K",
                                 'Na',
                                 'Zn',
                                 'Cu',
                                 'Mn')
Nutrient.composition.Vitamins<-c('Thiamin',
                                 'Riboflavin',
                                 'Niacin',
                                 'Panthothenic Acid',
                                 'B6')
Nutrient.composition.lipids<-c('FattyAcids.Saturated.Total',
                               'FattyAcids.Monounsaturated',
                               'FattyAcids.Polyunsaturated.Total')
phytochemicals<-c("a-Cyano-4-hydroxycinnamic acid",
                  "Caffeic acid - burdock, hawthorn, artichoke, pear, basil, thyme, oregano, apple",
                  "Cichoric acid",
                  "Cinnamic acid - aloe",
                  "Chlorogenic acid - echinacea, strawberries, pineapple, coffee, sunflower, blueberries",
                  "Diferulic acids",
                  "Coumaric acid",
                  "Coumarin - citrus fruits, maize",
                  "Ferulic acid (3-methoxy-4-hydroxycinnamic acid) - oats, rice, artichoke, orange, pineapple, apple, peanut",
                  "Sinapinic acid 3,5-dimethoxy-4-hydroxycinnamic acid or sinapic acid",
                  "Rosmarinic acid is found in big quantities in oregano, lemon balm, sage, marjoram, rosemary.")

#-------------------------------------------------UN World Data---------------------------

WDI.Data <- as.data.frame(read_csv("WDI_Data.csv"))
View(WDI.Data)

Nepal.Economy<-WDI.Data[grep("Nepal",WDI.Data$`Country Name`),]
Peru.Economy<-WDI.Data[grep("Peru",WDI.Data$`Country Name`),]
#--------------------------------Tables---------------------------------------------------



#--------------------------------Figures--------------------------------------------------


#-------------------------------References------------------------------------------------

Reference.1<-c('de la Rosa L.A., Alvarez-Parrilla E., Gonzàlez-Aguilar G.A.',
                'Fruit and vegetable phytochemicals: chemistry, nutritional value, and stability.',
                '1th Edition. Wiley J. & Sons, Inc., Publication, 2010')

Reference.2<-c("Manach C., Scalbert A., Morand C., Rémésy C., and Jime´nez L.", 
               "Polyphenols: food sources and bioavailability.", 
                "Am J Clin Nutr 2004;79(5):727-47.")

Reference.3<-c("Preedy V.R. Coffee in health and disease prevention.", "Academic Press,2014") 
Reference.4<-c("Zhao Z., Moghadasian M.H.",
               "Bioavailability of hydroxycinnamates: a brief review of in vivo and in vitro studies.", 
               "Phytochem Rev2010;9(1):133-145.")

#--------------------------------Function Library------------------------------------------