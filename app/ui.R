library(shinythemes)
library(shiny)

shinyUI(fluidPage(theme = shinytheme("darkly"),
                  css = "style.css",
  navbarPage("Mortality", 
    tabPanel("Analysis",
      sidebarLayout(
        mainPanel(
          plotOutput("quartersPlot", height = "80vh")
        ),
        sidebarPanel(
          fluidRow(
            column(6,
                   checkboxGroupInput("checkQuarters", "Quarters to view", choiceNames = c("1", "2", "3", "4"),
                                    choiceValues = c("1", "2", "3", "4"), selected = c("1", "2", "3", "4"))
            )          
          )           
        )
      )
    ),
    tabPanel("Analysis Pt.2",
      sidebarLayout(
        mainPanel(
          plotOutput("linePlot", height = "80vh")
        ),
        sidebarPanel(
          column(12,
                 checkboxGroupInput("checkIndicators", "Indicators to view",
                               choices = c("All Causes" ,"Alzheimer's disease","Cancer","Chronic liver disease and cirrhosis",
                                      "Chronic lower respiratory diseases","Diabetes","Drug overdose",
                                      "Falls, ages 65 and over","Firearm-related injury","Heart disease",      
                                      "HIV disease","Homicide","Hypertension","Influenza and pneumonia",  
                                      "Kidney disease","Parkinson's disease","Pneumonitis due to solids and liquids",
                                      "Septicemia","Stroke","Suicide","Unintentional injuries"), 
                                selected = "All Causes")
            
          )
        )
      )
    )
  )
)
)

