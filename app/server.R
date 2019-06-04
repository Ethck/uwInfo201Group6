source("graphGen.R")

server <- function(input, output) {
  
  output$quartersPlot <- renderPlot({
    
    quarterList <- input$checkQuarters
    print(genQuarterBar(quarterList))
  
  })
  
  output$linePlot <- renderPlot({
    deathList <- input$checkIndicators
    print(genLine(deathList))
  })
}