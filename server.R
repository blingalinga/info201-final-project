library(ggplot2)
library(plotly)
library(dplyr)

climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  output$climate_plot <- renderPlotly({
    
    filtered_df <- climate_df %>% 
      filter(country %in% input$country_selection) %>% 
      filter(year >= input$slider1[1] & year <= input$slider1[2])
    
    co2_plot <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = year, y = co2, color = country)) +
      labs(title = "CO2 Trends", x = "Year", y = "CO2 Emissions")
    
    return(co2_plot)
  })
  
}

