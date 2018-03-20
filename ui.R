### UI ####
library(devtools)
library(shiny)
library(shinymaterial)
library(leaflet)


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
          "Elkhorn Coral" = "elk",
          "Staghorn Coral" = "stag",
          "Lobed Star Coral" = "lobe",
          "Boulder Star Coral" = "bould",
          "Mountainous Star Coral" = "mount",
          "Pillar Coral" = "pill",
          "Rough Cactus Coral" = "rough"
        ),
        selected = c("elk"),
        multiple = TRUE,
        color = "#ef5350"
       )
    ),
    material_column(
      width=3,
      material_slider(
          input_id = "year_min",
          label = "From Year",
          min_value = 5,
          max_value = 15,
          initial_value = 10,
          color = "#ef5350"
        )
    ),
  material_column(
    width=3,
    material_slider(
      input_id = "year_max",
      label = "To Year",
      min_value = 5,
      max_value = 15,
      initial_value = 10,
      color = "#ef5350"
    )
  )
),
  material_row(
    material_column(
      width = 9,
      material_card(
        title = "Power vs Efficiency",
        depth = 4,
        leafletOutput("mymap")
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
        material_switch(
          input_id = "pres",
          label = "Presence only",
          off_label = "",
          on_label = ""
        ),
        material_radio_button(
          input_id = "plot_theme",
          label = "Theme",
          choices = 
            c("Default" = "default",
              "Classic" = "classic",
              "Light" = "light",
              "Dark" = "dark")
        )
      )
    )

  )
  
)