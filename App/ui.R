# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
library(shiny)
library(shinyWidgets)
library(readr)

house <- read_csv("C:/Users/Muzaffer/Desktop/Veri_Bilimi/SourceForUdemy/DataSets/kc_house_data.csv")

fluidPage(
  titlePanel("Basic DataTable"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("bed",
                       "Bedrooms:",
                       c("All",
                         order(unique(as.character(house$bedrooms)))))
    ),
    column(4,
           selectInput("cond",
                       "condition level:",
                       c("All",
                         unique(as.character(house$condition))))
    ),
    column(4,
           selectInput("grd",
                       "Grade:",
                       c("All",
                         unique(as.character(house$grade))))
    ),
    column(4,
           numericRangeInput('yr_Range',
                             label = 'Date range input: yyyy-mm-dd',
                             value = c(2020,1900))
    ),
    column(4,
           selectInput("ren",
                       "renovated:",
                       c("Any","Yes","No"))
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot")), 
        tabPanel("Summary", verbatimTextOutput("summary")), 
        tabPanel("Table", DT::dataTableOutput("table"))
      )
    )
  )
)

