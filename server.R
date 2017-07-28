# dataset(sunspot.year)
# This is a very simply Shiny web app that shows the time-series data of yearly
# sun spots numbers since year 1700 thru 1988
# The slider bar is used to select the year range of the data shown on the graph
# Also, there is a checkbox for showing the regression line

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$sunspotPlot <- renderPlot({
    
    set.seed(1223)

    minYear <- input$SliderYear[1]
    maxYear <- input$SliderYear[2]

    newsunspot <- window(sunspot.year, minYear, maxYear)
    
    x <- time(newsunspot)
    y <- newsunspot
    
    plot(x, y, xlab="Year", ylab="Number of Sun Spots")
    
    if (input$show_lm) {
        abline(lm(y ~ x), col="red", lwd=2)
    }
  })
})
