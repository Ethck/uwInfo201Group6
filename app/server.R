source("graphGen.R")

server <- function(input, output) {
	output$plot <- renderPlot({
	  quarterList <- input$checkQuarters
	  if(input$plotChoice == "1") {
	    print(genQuarterBar(quarterList))
	  } else {
	    print(plot2(quarterList))
	  }
	})
}