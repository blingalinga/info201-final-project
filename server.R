library(ggplot2)
library(plotly)
library(dplyr)

climate_df <- read.csv("https://datahub.io/core/co2-ppm/r/0.csv", stringsAsFactors = FALSE)


server <- function(input, output) {
  
  output$climate_plot1 <- renderPlotly({
    
    filtered_df <- climate_df %>% 
      mutate(DateConverted = as.Date(Date)) %>% 
      filter(DateConverted >= input$slider1[1] & DateConverted <= input$slider1[2])
    
    co2_plot1 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = DateConverted, y = Average)) +
      labs(title = "CO2 EmissionTrends", x = "Date", y = "Average CO2 Emissions")
    
    return(co2_plot1)
  })
  
  output$climate_plot2 <- renderPlotly({
    
    filtered_df <- climate_df %>% 
      mutate(DateConverted = as.Date(Date)) %>% 
      filter(DateConverted >= input$slider1[1] & DateConverted <= input$slider1[2])
    
    co2_plot2 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = DateConverted, y = Average)) +
      labs(title = "CO2 Trends", x = "Date", y = "CO2 Emissions")
    
    return(co2_plot2)
  })
  
  output$climate_plot3 <- renderPlotly({
    
    filtered_df <- climate_df %>% 
      mutate(DateConverted = as.Date(Date)) %>% 
      filter(DateConverted >= input$slider3[1] & DateConverted <= input$slider3[2])
    
    co2_plot3 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = DateConverted, y = Average)) +
      labs(title = "CO2 Trends", x = "Date", y = "CO2 Emissions")
    
    return(co2_plot3)
  })
}

%