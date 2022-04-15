# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- house
    if (input$bed != "All") {
      data <- data[house$bedroom == input$bed,]
    }
    if (input$cond != "All") {
      data <- data[house$condition == input$cond,]
    }
    if (input$grd != "All") {
      data <- data[house$grade == input$grd,]
    }
    if (input$yr_Range != "ALL") {
      data <- data[house$yr_built == input$yr_Range,]
    }
      
    data
  }))
  
}