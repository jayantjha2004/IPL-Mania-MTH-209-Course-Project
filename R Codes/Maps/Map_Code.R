library(maps)
library(leaflet)
library(dplyr)
library(shiny)



load("C:/Users/asus/Desktop/Project-Group 11/Maps/CoordCountBat23.RData")
load("C:/Users/asus/Desktop/Project-Group 11/Maps/CoordCountBowl23.RData")

ui <- fluidPage(
  titlePanel("My first shiny app"),
  leafletOutput("mymap"),
  fluidRow(column(2, selectInput("inputid", h3("Select Batters or Bowlers"), choices = c("Batters","Bowlers"),selected="Batters"),
                  
                  radioButtons("radio", h3("Select the country"),
                               choices = list("India"="India","England"="England","Zimbabwe"="Zimbabwe","Afghanistan"="Afghanistan","Australia"="Australia","New Zealand"="New Zealand","South Africa"="South Africa","Sri Lanka"="Sri Lanka","Bangladesh"="Bangladesh","West Indies"="West Indies"), selected = "Australia"))
  )
)


server <- function(input, output, session) {
  
  dataset <- reactive({
    switch(input$inputid,
           "Batters" = batmap23,
           "Bowlers" = bowlmap23)
  })
  output$mymap <- renderLeaflet({
    leaflet(dataset() %>%
              dplyr::filter(
                Country == input$radio,
              )) %>%
      addTiles() %>%
      addMarkers(lat = ~Lat, lng=~Long) %>%
      addLabelOnlyMarkers(lat = ~Lat, lng=~Long, label = ~Player, labelOptions = labelOptions(noHide = T, direction = 'top', textOnly = T))
    
  })
  
  
}

shinyApp(ui, server)
