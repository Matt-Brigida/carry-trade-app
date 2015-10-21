library(shiny)
library(dygraphs)

shinyUI(fluidPage(
  titlePanel("Simple Stock Charting App"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input a ticker and see the stock's chart."),
      
      selectizeInput("funding", label = h3("Select Funding Currency"), choices= c("JPY" = "1", "GBP" = "2"), value = "JPY") ,
      
      selectizeInput("investing", label = h3("Select Funding Currency"), choices= c("JPY" = "1", "GBP" = "2"), value = "GBP") 
    ),
    
    ### uncomment for static chart    
    ## mainPanel(plotOutput("plot"))
    
    ### uncomment for dygraphs chart
    mainPanel(dygraphOutput("plot"))
  )
))