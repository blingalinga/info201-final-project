library(ggplot2)
library(plotly)
library(dplyr)
library(stringr)

climate_df <- read.csv("https://datahub.io/core/co2-ppm/r/0.csv", stringsAsFactors = FALSE)


server <- function(input, output) {
  
  output$climate_plot1 <- renderPlotly({

    filtered_df <- climate_df %>%
      mutate(Year = str_sub(string = Date, 1, 4)) %>% 
      filter(Year >= input$slider1[1] & Year <= input$slider1[2])
    
    climate_df_mean <- filtered_df  %>%
      filter(Average != -99.99 & Year > 1958) %>% group_by(Year) %>% mutate(mean_co2 = mean(Average))

    co2_plot1 <- ggplot(data = climate_df_mean) +
      geom_line(mapping = aes(x = Decimal.Date, y = mean_co2)) +
      labs(title = "CO2 EmissionTrends", x = "Year", y = "Average CO2 Emissions")

    return(co2_plot1)
  })
   
  output$climate_plot2 <- renderPlotly({
    
    filtered_df <- climate_df %>% mutate(Year = str_sub(string = Date, 1, 4)) %>% 
      filter(Year >= input$slider2[1] & Year <= input$slider2[2])

    climate_df_mean <- filtered_df  %>%
      filter(Average != -99.99 & Year > 1958) %>% group_by(Year) %>% summarize(mean_co2 = mean(Average))

    climate_df_mean <- climate_df_mean %>% mutate(annual_change = mean_co2 - lag(mean_co2))

    co2_plot2 <- ggplot(data = climate_df_mean) +
      geom_point(mapping = aes(x = Year, y = annual_change, color = annual_change)) +
      labs(title = "CO2 Trends", x = "Year", y = "Annual Change in CO2 Emissions")

    return(co2_plot2)
  })
#   
  output$climate_plot3 <- renderPlotly({

    filtered_df <- climate_df %>%
      mutate(DateConverted = as.Date(Date)) %>%
      filter(DateConverted >= as.Date(input$slider3[1]) & DateConverted <= as.Date(input$slider3[2]))

    co2_plot3 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = DateConverted, y = Average)) +
      labs(title = "CO2 Trends", x = "Date", y = "CO2 Emissions")

    return(co2_plot3)
  })

# <<<<<<< HEAD




    output$climateplot4 <- renderPlotly({
      
      henry_co2data <- climate_df %>%
        filter(Number.of.Days > -1) %>%
        filter(Date >= input$slider1[1] & Date <= input$slider1[2])

   co2_plot4 <- ggplot(data = henry_co2data) +
       geom_point(mapping = aes(x = Date,
                               y = Number.of.Days,
                               color = Average)) +
      labs(title = "Number of Daily Readings Contributed in Each Month",
           x = "Month",
           y= "Number of Readings")
   return(co2_plot4)
  })
}
# =======
# %
# >>>>>>> 285a96e539320d1e7b6719f33135b3a663b1acbe
