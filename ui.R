# dataset(sunspot.year)
# This is a very simply Shiny web app that shows the time-series data of yearly
# sun spots numbers since year 1700 thru 1988
# The slider bar is used to select the year range of the data shown on the graph
# Also, there is a checkbox for showing the regression line

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Yearly Sun Spot Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("SliderYear",
                   "Slide to select year range",
                   min = 1700,
                   max = 1988,
                   value = c(1800,1900)),
       checkboxInput("show_lm", "Show/Hide Regression Line", value=FALSE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("sunspotPlot")
    )
  )
))
