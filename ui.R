### UI ####

ui <- material_page(
  title = "Endangered Species Act Threatened Corals",
  # Typically the image will be placed in a folder labeled 'www' 
  # at the same level as the application (server.R & ui.R)
  includeCSS("style.css"),
  material_parallax(
    image_source =
      "elkhornNOAA.jpg"
  ),
  material_row(
    material_column(
      width=3,
      material_dropdown(
        input_id = "species_dropdown",
        label = "Species",
        choices = c(
          "Elkhorn Coral" = "ACRPAL",
          "Staghorn Coral" = "ACRCER",
          "Lobed Star Coral" = "ORBANN",
          "Boulder Star Coral" = "ORBFRA",
          "Mountainous Star Coral" = "ORBFAV",
          "Pillar Coral" = "DENCYL",
          "Rough Cactus Coral" = "MYCFER"
        ),
        selected = c("ACRPAL"),
        multiple = TRUE
       )
    ),
    material_column(
      width=3,
      material_slider(
          input_id = "year_min",
          label = "From Year",
          min_value = 1996,
          max_value = 2011,
          initial_value = 1996,
          color = "#ef5350"
        )
    ),
  material_column(
    width=3,
    material_slider(
      input_id = "year_max",
      label = "To Year",
      min_value = 2012,
      max_value = 2016,
      initial_value = 2016,
      color = "#ef5350"
    )
  )
),
  material_row(
    material_column(
      width = 9,
      material_card(
        title = "",
        leafletOutput("map", height = 700)#,
        #DTOutput('table')
        #textOutput('text')
      )
    ),
    material_column(
      width = 2,
      material_card(
        title = "",
        depth = 4,
        material_switch(
          input_id = "hapc",
          label = "HAPCs",
          off_label = "",
          on_label = ""
        ),

        DTOutput('tbl')
        )
      )
    )

  )
  
