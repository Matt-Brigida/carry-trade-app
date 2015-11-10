library(shiny)
library(dygraphs)

shinyUI(fluidPage(
  titlePanel("Carry Trade Profit"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select Funding and Investing Currency"),
      
      selectizeInput("funding", label = h3("Select Funding Currency"), choices= c("JPY" = "1", "GBP" = "2"), selected = "JPY") ,
      
      selectizeInput("investing", label = h3("Select Investing Currency"), choices= c("JPY" = "1", "GBP" = "2"), selected = "GBP"),

      dateRangeInput("dates", "Date Range", start = "2000-01-01", end = Sys.Date())      
      
## TODO: Input a date range input so you can specify the carry trade interval ----
    ),
    
    ### uncomment for static chart    
    ## mainPanel(plotOutput("plot"))
    
    ### uncomment for dygraphs chart
    mainPanel(dygraphOutput("plot"))
  )
))
