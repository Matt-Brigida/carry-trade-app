library(quantmod)
library(dygraphs)

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    
    fxFundingSym <- switch(input$funding, 
                        "1" = "EXJPUS",
                        "2" = "EXUSUK")
    
    fxInvestingSym <- switch(input$investing,
                          "1" = "EXJPUS",
                          "2" = "EXUSUK")
    
    IfundingSym <- switch(input$funding,
                          "1" = "",
                          "2" = "")
    
    IinvestingSym <- switch(input$investing,
                          "1" = "",
                          "2" = "")
    
    Cfunding <- getSymbols(input$funding, auto.assign = FALSE)
    Cinvesting <- getSymbols(input$investing, auto.assign = FALSE)
    Ifunding <- getSymbols(input$Ifunding, auto.assign = FALSE)
    Iinvesting <- getSymbols(input$Iinvesting, auto.assign = FALSE)
    
    allData <- merge.xts(Cfunding, Cinvesting, Ifunding, Iinvesting, join = "inner")
      
    })
    
  })
  
  ### uncomment this to see an interactive plot via dygraphs
  output$plot <- renderDygraph({
    
    allData1 <- dataInput()
    
    dygraph(Ad(prices)) %>%
      dyRangeSelector()
  })
})