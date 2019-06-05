library(shinythemes)
library(shiny)

shinyUI(fluidPage(theme = "style.css",
  div(class = "nav", 
  navbarPage("Mortality", 
    tabPanel("Averages",
      div(class = "side",
      sidebarLayout(
        div(class = "main",
        mainPanel(
          plotOutput("quartersPlot", height = "80vh")
        )
        ),
        
        sidebarPanel(
          div(class = "bar",
          fluidRow(
            column(12,
                   checkboxGroupInput("checkQuarters", "Quarters to view", choiceNames = c("1", "2", "3", "4"),
                                    choiceValues = c("1", "2", "3", "4"), selected = c("1", "2", "3", "4"))
            )          
          )
          )
        )
      )
      )
    ),
    tabPanel("Compare",
      div(class = "side",
      sidebarLayout(
        div(class = "main",
        mainPanel(
          plotOutput("linePlot", height = "80vh")
        )
        ),
        sidebarPanel(
          div(class = "bar",
          fluidRow(
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
    ),
    tabPanel("About",
      sidebarLayout(
        mainPanel(
          column(12,
          img(src = 'med1.jpg', width = "500px", height = "500px"),
          img(src = 'med2.jpg', width = "500px", height = "500px")
          )
        ),
        div(class = "summ",
        sidebarPanel(
          fluidRow(
            p("Our group has worked with the ,", strong('Quarterly provisional estimates for selected indicators of mortality'),
               'from the Center for Disease Control. We found this dataset on data.cdc.gov and it was collected and published by
               the National Center for Health Statistics. The data collected runs from the first quarter of 2017 to the end of 2018,
               with data points for every quarter and every indicator of mortality within the top 15 causes of death.
               These are provisional estimates, so this data is not meant for extreme accuracy, but instead to look at trends. 
               The data was collected for people with deaths attributed to drug overdose, falls falls (for persons aged 65 and over),
               human immunodeficiency virus (HIV) disease, homicide, and firearms-related deaths'),
            p('We homed our focus towards medical research centers because right now they are very reactive to the issues
               they face, and this way they can be pro-active in facing them. This means they will be able to look at old data and
               predict on what to invest their time and money into.')
          )
        )
        )
      )
    ),
    tabPanel("References",
      verticalLayout(
        div(class = "summ",
        mainPanel(
          fluidRow(
            p("Data source : ", a("https://www.cdc.gov/nchs/nvss/vsrr/mortality.htm"), href = "https://www.cdc.gov/nchs/nvss/vsrr/mortality.htm"),
            p("Photo 1 : ", a('https://www.shutterstock.com/image-vector/medical-flat-vector-backgroundhealth-carefirst-aidinternational-211435294'), 
              href = 'https://www.shutterstock.com/image-vector/medical-flat-vector-backgroundhealth-carefirst-aidinternational-211435294'),
            p("Photo 2 : ", a('https://st.depositphotos.com/1001941/1231/v/950/depositphotos_12311431-stock-illustration-abstract-medical-background-eps-10.jpg'),
              href = 'https://st.depositphotos.com/1001941/1231/v/950/depositphotos_12311431-stock-illustration-abstract-medical-background-eps-10.jpg'),
            p("Link to Shiny App : ", a('https://sagnikshaggy.shinyapps.io/MortalityData/'), href = 'https://sagnikshaggy.shinyapps.io/MortalityData/')
          )
        )
        )
      )
    )
        
  )
  )
)
)

