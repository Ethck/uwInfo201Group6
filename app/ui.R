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
  			),
  			column(6,
  			  checkboxGroupInput("checkIndicators", "Indicators to view",
  			  	choices = c("All Causes" ,                          
							"Alzheimer's disease",                
							"Cancer",                   
							"Chronic liver disease and cirrhosis",
							"Chronic lower respiratory diseases",
							"Diabetes",       
							"Drug overdose",       
							"Falls, ages 65 and over",        
							"Firearm-related injury",       
							"Heart disease",      
							"HIV disease",     
							"Homicide",    
							"Hypertension",   
							"Influenza and pneumonia",  
							"Kidney disease", 
							"Parkinson's disease",
							"Pneumonitis due to solids and liquids",
							"Septicemia",
							"Stroke",
							"Suicide",
							"Unintentional injuries"),
  			  	selected = "all"
  			  	))		  
  			)
		)
	)
)
)