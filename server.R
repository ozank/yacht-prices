library(shiny)
library(ggplot2)

#Load DataSet
load("datasets.RData")
yachts$price<-yachts$price/1e3 #convert to thousand euros

shinyServer(function(input, output) {
  
  brands<-reactive({input$brands})
  modelminlength<-reactive({min(input$length)})
  modelmaxlength<-reactive({max(input$length)})
  modelminyear<-reactive({min(input$year)})
  modelmaxyear<-reactive({max(input$year)})
  
  subset_data<-reactive({subset(yachts,(make %in% brands()) & length>=modelminlength() & length<=modelmaxlength() & year<=modelmaxyear() & year>=modelminyear())})
  
  output$yachtplot <- renderPlot({
    
    plot_data<-subset_data()
    selected_brands<-brands()
    
    if(length(selected_brands)>1){
      #Group by brand
      whole_plot<- ggplot(plot_data, aes(y=price, x=year, colour=factor(make)))+ 
                    stat_smooth(level=0.9,size=1,method="loess",aes(fill = factor(make)))
    }
    else{
      #Group by length
  whole_plot<- ggplot(plot_data, aes(y=price, x=year, colour=factor(length))) + 
                stat_smooth(level=0.9,size=1,method="loess",aes(fill = factor(length)))
    }
  
    whole_plot<-whole_plot + 
      geom_point(shape=3)+xlab("Year") + 
      scale_x_reverse() + 
      ylab("Price (kEuro)") +
      theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16), legend.position="top")
    
    print(whole_plot)
    
})
  
  # Generate an HTML table view of the data
  output$table <- renderDataTable({
    subset_data()
  })
  
})