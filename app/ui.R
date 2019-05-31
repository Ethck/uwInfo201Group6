shinyUI(fluidPage(
	titlePanel("Analysis"),
	sidebarLayout(
		mainPanel(
		  fluidRow(
		    column(12,
			plotOutput("plot")))
		),
		sidebarPanel(
		  fluidRow(
		    column(6,
  			radioButtons("plotChoice", "Choose a plot to view", choices = c("1", "2"), selected = "1")
		    ),
  			column(6,
  			  checkboxGroupInput("checkQuarters", "Quarters to view", choiceNames = c("1", "2", "3", "4"), choiceValues = c("1", "2", "3", "4"), selected = c("1", "2", "3", "4"))
  			)		  
  			)
		)
	)
)
)