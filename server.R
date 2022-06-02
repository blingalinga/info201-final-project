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
#   
  output$climate_plot2 <- renderPlotly({

    climate_df_mean <- climate_df %>% mutate(Year = str_sub(string = Date, 1, 4)) %>%
      filter(Average != -99.99 & Year > 1958) %>% group_by(Year) %>% summarize(mean_co2 = mean(Average))

    climate_df_mean <- climate_df_mean %>% summarize(annual_change = mean_co2 - lag(mean_co2))

    co2_plot2 <- ggplot(data = filtered_df) +
      geom_line(mapping = aes(x = year, y = change)) +
      labs(title = "CO2 Trends", x = "Year", y = "Annual Change in CO2 Emissions")

    return(co2_plot2)
  })
#   
  output$climate_plot3 <- renderPlotly({

    filtered_df <- climate_df %>%
      mutate(DateConverted = as.Date(Date)) %>%
      filter(DateConverted >= input$slider3[1] & DateConverted <= input$slider3[2])

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
