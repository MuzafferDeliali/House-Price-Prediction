library(readr)
house <- read_csv("C:/Users/Muzaffer/Desktop/Veri_Bilimi/SourceForUdemy/DataSets/kc_house_data.csv")

shinyApp(
  ui = fluidPage(
    sidebarLayout(
      sidebarPanel(sliderInput("range", "Budget:",min = 75000, max = max(house$price), value = c(2000000,5000000)),textOutput("SliderText"),
                   dateRangeInput("daterange1", "Date range:", format = "mm/yyyy" ,start = 1900, end   = 2020)),
      mainPanel(tableOutput("house")
                )
    ),
  
  
  server = function(input, output) {
    output$hist <- renderPlot( 
      hist(faithful[[2]], breaks = input$n,
           col = "skyblue", border = "white") 
    )
  })
)

shinyApp(ui = ui, server = server)
