### GLOBAL ###
## Working Directory = X:\Claire\shiny\ESACorals ##
library(devtools)
library(shiny)
library(shinymaterial)
library(leaflet)
library(DT)
library(magrittr)
library(highcharter)
library(rgdal)
library(sf)
library(png)
library(plyr)


allHAPCs <-readOGR (dsn="X:/Claire/Management Strategy Evaluation/GIS/allHAPCs.shp",
                    layer="allHAPCs")
# acerv <- read_sf (dsn="X:/Claire/shiny/ESACorals/acroporaCervicornisOccur.shp",
#                   layer="acroporaCervicornisOccur")
# apalm <- read_sf (dsn="X:/Claire/shiny/ESACorals/acroporaPalmataOccur.shp",
#                   layer="acroporaPalmataOccur")
# dcyli <- read_sf (dsn="X:/Claire/shiny/ESACorals/dendrogyraCylindrusOccurx.shp",
#                   layer="dendrogyraCylindrusOccur")
# mfero <- read_sf (dsn="X:/Claire/shiny/ESACorals/mycetophylliaFeroxOccur.shp",
#                   layer="mycetophylliaFeroxOccur")
# oannu <- read_sf (dsn="X:/Claire/shiny/ESACorals/orbicellaAnnularisOccur.shp",
#                   layer="orbicellaAnnularisOccur")
# ofave <- read_sf (dsn="X:/Claire/shiny/ESACorals/orbicellaFaveolataOccur.shp",
#                   layer="orbicellaFaveolataOccur")
# ofran <- read_sf (dsn="X:/Claire/shiny/ESACorals/orbicellaFranksiOccur.shp",
#                   layer="orbicellaFranksiOccur")

allESA <- read_sf(dsn="X:/Claire/shiny/ESACorals/allESA.shp", layer="allESA")
#allESA$num <- 1
#  <- 
# allESA <- rbind(acerv,apalm,dcyli,mfero,oannu,ofave,ofran)
# 
# 
# 
# allESA$color <- 0
# 

#allESA$name <- 0

# allESA$name<-ifelse(allESA$sppcode=="ACRPAL", print('Elkhorn'),
#                             ifelse(allESA$sppcode=="ACRCER",print('Staghorn'),
#                                    ifelse(allESA$sppcode=="DENCYL",print('Pillar'),
#                                    ifelse(allESA$sppcode=="MYCFER",print('Rough Cactus'),
#                                    ifelse(allESA$sppcode=="ORBANN", print('Lobed Star'),
#                                    ifelse(allESA$sppcode=="ORBFAV",print('Mountainous Star'),print('Boulder Star')))))))
#                      
# 

# 
# allESA$color<-ifelse(allESA$sppcode=="ACRPAL", print('#e41a1c'),
#        ifelse(allESA$sppcode=="ACRCER",print('#4daf4a'),
#               ifelse(allESA$sppcode=="DENCYL",print('#984ea3'),
#               ifelse(allESA$sppcode=="MYCFER",print('#ff7f00'),
#               ifelse(allESA$sppcode=="ORBANN", print('#ffff33'),
#               ifelse(allESA$sppcode=="ORBFAV",print('#a65628'),print('#ffffbf')))))))



# allESA$shape <- ifelse(allESA$present==1, print(20), print(4))
# pinkO <- readPNG("pinkO.png")
# pinkX <- readPNG("pinkX.png")
# tealO <- readPNG("tealO.png")
# tealX <- readPNG("tealX.png")
# yellowO <- readPNG("yellowO.png")
# yellowX <- readPNG("yellowX.png")
# orangeO <- readPNG("orangeO.png")
# orangeX <- readPNG("orangeX.png")
# greenO <- readPNG("greenO.png")
# greenX <- readPNG("greenX.png")
# blueO <- readPNG("blueO.png")
# blueX <- readPNG("blueX.png")
# brownO <- readPNG("brownO.png")
# brownX <- readPNG("brownX.png")
# 
# allESA$icon<-ifelse(allESA$sppcode=="ACRCER"&allESA$present==1, print('tealO'),
#                     ifelse(allESA$sppcode=="ACRCER"&allESA$present==0, print('tealX'),
#                            
#                      ifelse(allESA$sppcode=="ACRPAL"&allESA$present==1,print('orangeO'),
#                             ifelse(allESA$sppcode=="ACRPAL"&allESA$present==0,print('orangeX'),
#                                    
#                             ifelse(allESA$sppcode=="DENCYL"&allESA$present==1,print('blueO'),
#                                    ifelse(allESA$sppcode=="DENCYL"&allESA$present==0,print('blueX'),
#                                           
#                                    ifelse(allESA$sppcode=="MYCFER"&allESA$present==1,print('pinkO'),
#                                           ifelse(allESA$sppcode=="MYCFER"&allESA$present==0,print('pinkX'),
#                                                  
#                                           ifelse(allESA$sppcode=="ORBANN"&allESA$present==1, print('greenO'),
#                                                  ifelse(allESA$sppcode=="ORBANN"&allESA$present==0, print('greenX'),
#                                                  
#                                                   ifelse(allESA$sppcode=="ORBFAV"&allESA$present==1,print('yellowO'),
#                                                          ifelse(allESA$sppcode=="ORBFAV"&allESA$present==0,print('yellowX'),
#                                                                 
#                                                                 ifelse(allESA$sppcode=="ORBFRA"&allESA$present==1,print('brownO'),print('brownX')
#                                                                 )
#                                                          )
#                                                   )
#                                                  )
#                                           )
#                                           )
#                                    )
#                                    )
#                             )
#                             )
#                      )
#                     )
# )
# 
# write_sf(allESA, "X:/Claire/shiny/ESACorals/allESA.shp","allESA.shp",driver='ESRI Shapefile')
#                                           
#                                                          
#                                                          
#                                                     


