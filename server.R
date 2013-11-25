library(shiny)
library(ggplot2)

#Load DataSet
load("datasets.RData")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  brands<-reactive({input$brands})
  modelminlength<-reactive({min(input$length)})
  modelmaxlength<-reactive({max(input$length)})
  
  subset_data<-reactive({subset(yachts,(make %in% brands()) & length>=modelminlength() & length<=modelmaxlength())})
  
 # formulaText <- reactive({
  #  paste("Model: ", input$make)
  #})
  
  # Return the formula text for printing as a caption
 # output$caption <- renderText({
#    formulaText()
 # })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$yachtplot <- renderPlot({
    
    plot_data<-subset_data()
    selected_brands<-brands()
    
    if(length(selected_brands)>1){
      #Group by brand
      whole_plot<- ggplot(plot_data, aes(y=price, x=year, colour=factor(make)))+ geom_point()+stat_smooth(level=0.9,size=1,method="loess",aes(fill = factor(make))) + xlab("Year") + scale_x_reverse()+ylab("Price (Euro)")
    }
    else{
      #Group by length
  whole_plot<- ggplot(plot_data, aes(y=price, x=year, colour=factor(length)))+ geom_point()+stat_smooth(level=0.9,size=1,method="loess",aes(fill = factor(length))) + xlab("Year") + scale_x_reverse()+ylab("Price (Euro)")
    }
    #  qplot(year,price,data=plot_data1) +scale_x_reverse() + xlab("Model")+ylab("Price (Euro)")+ stat_smooth(level=0.9,size=1,method="loess",group=length)

    print(whole_plot)
    #+ylim(0,9e4) 
    #+ geom_boxplot() + stat_smooth(aes(group=1))
    
})
  
  # Generate an HTML table view of the data
  output$table <- renderDataTable({
    subset_data()
  })
  
})