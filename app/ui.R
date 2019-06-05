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
        )),
        
        sidebarPanel(
          div(class = "pan",
          fluidRow(
            column(12,
                   checkboxGroupInput("checkQuarters", "Quarters to view", choiceNames = c("1", "2", "3", "4"),
                                    choiceValues = c("1", "2", "3", "4"), selected = c("1", "2", "3", "4")),
                   br(),
                   p("Some notable insights:"),
                   p("- There appears to be an uptick in deaths during Winter (Quarter 4, Quarter 1"),
                   p("We speculate that this uptick may have its roots in the fact that during the
                     winter the weather goes sour in America, which is where our data is gathered.
                     This dip in quality of weather can have a multitude of implications. For example,
                     with the increase in snow, ice may cause more slips and falls. Furthermore,
                     research has shown that when weather is cloudy there is a higher chance in depression
                     and other mental conditions. Physical activity can take a dip as well, which can
                     cause a multitude of cardiovascular issues.")
               )
            
          )
          )
        )
      )
      )
    ),
    tabPanel("Compare",
      div(class = "pan",
      sidebarLayout(
        div(class = "pan",
        mainPanel(
          plotOutput("linePlot", height = "80vh"),
          br(),
          p("Some notable insights:"),
          p("- Here we can see a much clearer uptick especially in quarter 4 and 1 during both cycles."),
          p("An interesting statistic that caught our eye is that falls for people above the age of 65,
            is astonishingly high. Things like unintentional injuries, HIV disease, or Heart disease 
            is has a relatively constant rate throughout the year. But we see an exceptionally strong spike
            in Falls, Influenza, and Pneumonitis during quarter 1, indicating a high rate of death in the 
            January - March months. We theorize that due to the poor weather disease and accidental slips
            and falls are much more likely to occur during these months.")
        )
        ),
        sidebarPanel(
          div(class = "pan",
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
               predict on what to invest their time and money into.'),
            p('Our first graph under the Averages tab displays the quarterly mean values for all of the different mortality causes
               and the user can choose which quarters to view and compare.'),
            p('Our second graph under the compare tab allows you to view various death rates for different indicators, and all quarters
               and compare them all in one graph.')
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