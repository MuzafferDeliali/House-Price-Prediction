# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
library(shiny)
library(shinyWidgets)

fluidPage(
  titlePanel("Basic DataTable"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("bed",
                       "Bedrooms:",
                       c("All",
                         unique(as.character(house$bedrooms))))
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
                          value = c(1900,2020)
    )
  ),
  # Create a new row for the table.
  DT::dataTableOutput("table")
))