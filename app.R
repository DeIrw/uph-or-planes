library(shiny)
library(leaflet)

planeData <- read.csv(url("https://raw.githubusercontent.com/jamesadhitthana/UPH_OR_Planes/master/JamesAircraftList%20March31%20CONVERTED.csv"))
#Using jamesadhitthana's csv file

ui <- fluidPage(
  br(),
  headerPanel("2000 Airplane Flights Mapping", align = "center"),
  br(),
  leafletOutput("flightmap")
)

server <- function(input, output, session) {
  output$flightmap <- renderLeaflet({
    leaflet(data = planeData[1:2000,]) %>% addTiles() %>% #Only 2000 because anymore than this makes my PC lag	
      addMarkers(~JamesLong, ~JamesLat, popup = ~as.character(JamesPlaneModel), label=~as.character(JamesPlaneAirlines))
    
  })
}

shinyApp(ui, server)
