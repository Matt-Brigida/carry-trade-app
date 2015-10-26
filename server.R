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
    
## Interest Rates, Government Securities, Treasury Bills for Japan:    INTGSTJPM193N
    
## Interest Rates, Government Securities, Treasury Bills for United Kingdom:  INTGSTGBM193N
    
    IfundingSym <- switch(input$funding,
                          "1" = "INTGSTJPM193N",
                          "2" = "INTGSTGBM193N")
    
    IinvestingSym <- switch(input$investing,
                          "1" = "INTGSTJPM193N",
                          "2" = "INTGSTGBM193N")
    
    Cfunding <- getSymbols(fxFundingSym, auto.assign = FALSE, src = "FRED")
    Cinvesting <- getSymbols(fxInvestingSym, auto.assign = FALSE, src = "FRED")
    Ifunding <- getSymbols(IfundingSym, auto.assign = FALSE, src = "FRED")
    Iinvesting <- getSymbols(IinvestingSym, auto.assign = FALSE, src = "FRED")
    
    allData <- merge.xts(Cfunding, Cinvesting, Ifunding, Iinvesting, join = "inner")
    
    ## put calculations here
      
  })
  
  ### uncomment this to see an interactive plot via dygraphs
  output$plot <- renderDygraph({
    
    allData1 <- dataInput()
    
## TODO: Now we need to input the carry trade profit calculation here ---- 
    
    dygraph(allData1) %>%
      dyRangeSelector()
  })
    })
