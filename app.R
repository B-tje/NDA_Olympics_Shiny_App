library("shiny")
library(igraph)

setwd("/Users/jeroenkoning/Desktop/own_projects/nda/NDA_Olympics_Shiny_App")
noc.regions <- read.csv('./data/noc_regions.csv')
athlete.events <- read.csv('./data/athlete_events.csv')
View(athlete.events)

athlete.name.games <- list(athlete.events$Name, athlete.events$Games)
g <- graph_from_data_frame(a, directed=TRUE, vertices = athlete.events$Name)

ui <- fluidPage(
  "Hello, world!",
  selectInput("dataset", label="Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table"),
  "hihoho"
)

server <- function(input, output, session){
  print(input, output)
  output$summary <- renderPrint({
    summary(noc.regions)  
  }) 
  
  output$table <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
  
  
  
}

options(shiny.autoreload.pattern = glob2rx("app.R"), shiny.launch.browser = TRUE)
shinyApp(ui, server)
