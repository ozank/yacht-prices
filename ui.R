library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Compare Yacht Prices"),
  
  sidebarPanel(
    checkboxGroupInput("brands", "Select yacht brands to compare:",
                       c("Bavaria" = "bavaria", 
                         "Beneteau" = "beneteau", 
                         "Dufour" = "dufour",
                         "Elan" = "elan",
                         "Hanse" = "hanse",
                         "Jeanneau" = "jeanneau"), selected=c("Bavaria")),
    # Simple integer interval
    sliderInput("length", "Length Range (feet):", 
                min=30, max=50, value=c(34,37)),
    sliderInput("year", "Year Range:", 
                min=1980, max=2014, value=c(1990,2014),format="####")
    ),
  
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    
    tabsetPanel(
      tabPanel("Plot", h3(textOutput("caption")),plotOutput("yachtplot")), 
      tabPanel("Table", dataTableOutput("table"))
    )
    
    
  )
  
))