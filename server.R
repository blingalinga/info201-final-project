library(ggplot2)
library(plotly)
library(dplyr)

climate_df <- read.csv("https://datahub.io/core/co2-ppm/r/0.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  output$climate_plot1 <- renderPlotly({
    
    filtered_df <- climate_df %>% 
      filter(Date >= input$slider1[1] & Date <= input$slider1[2])
    
    co2_plot1 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = Date, y = Average)) +
      labs(title = "CO2 EmissionTrends", x = "Date", y = "Average CO2 Emissions")
    
    return(co2_plot1)
  })
  
  output$climate_plot2 <- renderPlotly({
    
    filtered_df <- climate_df %>% 
      filter(country %in% input$country_selection) %>% 
      filter(year >= input$slider1[1] & year <= input$slider1[2])
    
    co2_plot2 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = year, y = co2, color = country)) +
      labs(title = "CO2 Trends", x = "Year", y = "CO2 Emissions")
    
    return(co2_plot2)
  })
  
  output$climate_plot3 <- renderPlotly({
    
    filtered_df <- climate_df %>% 
      filter(country %in% input$country_selection) %>% 
      filter(year >= input$slider1[1] & year <= input$slider1[2])
    
    co2_plot3 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = year, y = co2, color = country)) +
      labs(title = "CO2 Trends", x = "Year", y = "CO2 Emissions")
    
    return(co2_plot3)
  })

  
    
    henry_co2data <- climate_df %>% 
      filter(Number.of.Days > -1) %>% 
      filter(Date >= input$slider1[1] & Date <= input$slider1[2])
   
    output$climateplot4 <- renderPlotly({
      
   co2_plot4 <- ggplotly(
     ggplot(data = co2data) +
       geom_point(mapping = aes(x = Date, 
                               y = Number.of.Days,
                               color = Average)) +
      labs(title = "Number of Daily Readings Contributed in Each Month",
           x = "Month",
           y= "Number of Readings",
           color = "Number of Days"))
   return(co2_plot4)
  })
}