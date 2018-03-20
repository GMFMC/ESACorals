#### Server #####

server <- function(input, output) {
output$mymap <- renderLeaflet ({
      leaflet() %>% 
        addTiles() %>%  # Add default OpenStreetMap map tiles
        addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
    })
    
  }
  
