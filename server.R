#### Server #####

server <- function(input, output) {
  
  speciesSelect <- reactive({
    allESA <- subset(allESA,allESA$sppcode %in% input$species_dropdown)
    allESA
    
  })
  
  yearSelect <- reactive ({
    subset(speciesSelect(), speciesSelect()$survey_yea>=input$year_min
                       & speciesSelect()$survey_yea<=input$year_max)
  })
  
  output$text <- renderText ({
    speciesSelect()$latitude
  })
  # output$table <- renderDT(
  #   DT::datatable(speciesSelect()))
  
  output$map <- renderLeaflet({
    map<-leaflet() %>% 
      addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
               options = providerTileOptions(noWrap = TRUE)) %>%
      addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/Mapserver/tile/{z}/{y}/{x}',
               options = providerTileOptions(noWrap = TRUE)) %>%
      setView(-85, 27, zoom=7) %>% 
      addLegend(position="bottomleft", colors=c('#e41a1c','#4daf4a', '#984ea3','#ff7f00',
                                                                             '#ffff33','#a65628','#ffffvf'), 
                                             labels=c("Elkhorn Coral","Staghorn Coral","Pillar Coral", "Rough Cactus Coral",
                                                      "Lobed Star Coral", "Mountainous Star Coral", "Boulder Star Coral"))
  })
  
  observe({
    map <- leafletProxy('map')
    map <- map %>% leaflet::clearGroup(group='A')
    map <- map %>% addCircleMarkers(lat=yearSelect()$latitude,lng=yearSelect()$longitude, color=yearSelect()$color,
                                    stroke=FALSE, radius=3, group='A', opacity = 1)
    map<-map %>% leaflet::clearGroup(group='B')
    map <- if(input$hapc) return (map %>%
                                    addPolygons(data=allHAPCs, fillColor='pink', fillOpacity=0.7,color='pink',
                                                fill=TRUE, stroke=FALSE, group='B'))
    else return (map)
    # for(i in 1:length(speciesSelect())){
    #   map<- map %>%
    #     #addCircleMarkers(speciesSelect()[i],stroke=FALSE, radius=2, group='A')
    #     addCircleMarkers(lat=speciesSelect()[i]$latitude,lng=speciesSelect()[i]$longitude, color=speciesSelect()[i]$color,
    #                      stroke=FALSE, radius=2, group='A')
    #}
    map
  })
  

#   hapcMap <- reactive({
#   if(input$hapc) return (map %>%
#                            addPolygons(data=allHAPCs, fillColor='pink', fillOpacity=0.7,color='pink',
#                                     fill=TRUE, stroke=FALSE))
#                 else return (map)
# })

  
table <- reactive ({
  
  x<-ddply(yearSelect(), .(name),summarize, Depth=round(mean(depth_ft),2),
           N=sum(num))
  colnames(x)[colnames(x)=="name"]<- 'Species'
  colnames(x)[colnames(x)=="Depth"]<- 'Avg. Depth (ft)'


  x

})


# f <- ddply(allESA, .(sppcode), summarize, Depth=round(mean(depth_ft),3)
  
  output$tbl = renderDT(
    DT::datatable(table(), rownames=FALSE, style='material',
                  options=list(paging=FALSE, searching=FALSE))
    #DT::datatable(allESA[,c(18,23),drop=TRUE])
    # allESA, selection=list(selected=c(6,9,14,18,23),
    #                        target='column')
  )
  
    }
  
