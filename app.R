library(shiny)

source("ui.R")
source("server.R")

#Let’s try to make a Shiny app with a sidebar layout that shows a data visualization of co2 over time for any country or countries that a user selects


shinyApp(ui = ui, server = server)