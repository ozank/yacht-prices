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
    sliderInput("length", "Length (feet):", 
                min=30, max=50, value=c(34,37))
    ),
  
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    
    tabsetPanel(
      tabPanel("Plot", h3(textOutput("caption")),plotOutput("yachtplot")), 
      tabPanel("Table", dataTableOutput("table"))
    )
    
    
  )
  
))