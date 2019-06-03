source("graphGen.R")

server <- function(input, output) {
	output$plot <- renderPlot({
	  quarterList <- input$checkQuarters
	  deathList <- input$checkIndicators
	  if(input$plotChoice == "1") {
	    print(genQuarterBar(quarterList))
	  } else {
	    print(genLine(deathList))
	  }
	})
}