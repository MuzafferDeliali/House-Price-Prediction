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
    if (input$yr_Range != "All") {
      data <- data[house$yr_built == input$yr_Range,]
    }
    if (input$ren == "Any") {data <- house}
    
      else if (input$ren != "Any" & input$ren == "Yes") {
      inds <- which( house$yr_renovated == '0') 
      data <- house[-inds , ]
      
    } else if (input$ren != "Any" & input$ren == "No") {
      inds <- which( house$yr_renovated == '0') 
      data <- house[inds , ]
    }
    

      
    data
  }))
  output$plot <- renderPlot({
    data <- ggplot(data = house , aes(x = sqft_living , y = cond)) +
      geom_point(size = 2) +
      xlab("Sqft Living") + ylab("Prices")
  })
  
  
}