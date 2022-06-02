library(plotly)
library(bslib)

# Load climate data
climate_df <- read.csv("https://datahub.io/core/co2-ppm/r/0.csv", stringsAsFactors = FALSE)

# Home page tab
intro_tab <- tabPanel(
  # Title of tab
  "Introduction",
  fluidPage(
    theme = bs_theme(version = 4, bootswatch = "minty"),
    h1("The Trends and Implications of Atmospheric CO2 Emissions over Time"),
    p("The primary objective of this project is to analyze trends in CO2 emissions over time including their rate of change and their aggregate levels. The secondary objective of this project is to use auxiliary research to discuss the implications of these trends."),
    img(src = "https://img.theweek.in/content/dam/week/news/sci-tech/images/2019/4/1/co2-gas-pollution-carbon-dioxide-emission-gas-shut.jpg"),
    p("There is an abundance of issues contributing to global warming, one of the them being rising CO2 levels in our atmosphere. CO2 is known to absorb less heat than other greenhouse gasses, however, it is also known to be more abundant and stay in our atmosphere for much longer. The increase in atmospheric carbon dioxide is responsible for a significant portion of the total energy imbalance that is causing Earth's temperatures to rise. This led our group to consider analyzing the trends and implications of atmospheric CO2 emissions over time. In the analysis of our project, we plan to determine the rate of change of CO2 levels over time as well as their aggregate levels. Additionally, we plan to explore the average change and whether or not there are any trends in CO2 levels through different timespans from 1958-2018. This investigation of CO2 data will also determine when CO2 levels were the highest within the time period of the dataset. Another question we plan to address is what impact these trends in CO2 emissions have on Earth and our society. Environmental Health is a large concern during recent times and the continuous emissions of CO2 into our atmosphere will eventually contribute to irreversible damage and conducting this environmental analysis will better inform ourselves as well as our peers on the trends over time, and hopefully educate decisions to live more sustainable lives."),
    h2("Data Information"),
    tags$a(href="https://datahub.io/core/co2-ppm#readme", 
           "This is where we sourced our data source"),
    p("This dataset was found on datahub.io. The CO2 PPM trend data was collected by the United States Government Earth System Research Laboratory, Global Monitoring Division at Mauna Loa. The method of data collection over time may have changed due to developing filtration and measurement technologies. This data is collected by sampling the air atop the Hawaiian volcano Mauna Loa and the CO2 levels are monitored mainly through the use of spectroscopy. This data was collected since the 1950s for the purpose of monitoring atmospheric CO2, these measurements can reflect truths about the global atmosphere. In our data, there are 727 observations collected beginning in 1958. This data also has 5 unique columns including date/decimal date, average CO2 PPM, interpolated, trend, and number of days. This dataset contains data about our atmospheric CO2 trends which would affect the population on a global scale but a question a power we could consider is how certain countries have resources to respond to the trends that can be seen in the dataset while some countries may lack the same resources. Limitations to this data set include one location for sampling. The data found here only considers CO2 levels measured a a single location(Mauna Loa) and it is possible that the levels vary in various locations despite being atmospheric levels.")
  )
)
climate_df <- climate_df %>% 
  mutate(DateConverted = as.Date(Date))

# We want our next tab to have a sidebar layout
# So we're going to create a sidebarPanel() and a mainPanel() and then add them together

# Create sidebar panel for widget
sidebar_panel_widget1 <- sidebarPanel(
  sliderInput(inputId = "slider1",
              label = h4("Select Date Range"),
              min = min(climate_df$DateConverted),
              max = max(climate_df$DateConverted),
              sep = "",
              value = (c(min(climate_df$DateConverted, max(climate_df$DateConverted))))
  )
)

# Put a plot in the middle of the page
main_panel_plot1 <- mainPanel(
  plotlyOutput(outputId = "climate_plot1"),
  fluidPage(
    p("This chart looks to highlight the trends in average CO2 emissions month over month from 1958 through 2018. This aims to answer if CO2 emissions have increased in the last sixty years and at what magnitude they have or have not increased. The user has the option to adjust the date range in question and the average CO2 emission level will be plotted using a line plot showing the trend of the data over time.")
  )
)

# Interactive tab #1
interactive_tab1 <- tabPanel(
  "Average Emissions Over Time",
  sidebarLayout(
    sidebar_panel_widget1,
    main_panel_plot1
  )
)


sidebar_panel_widget2 <- sidebarPanel(
  sliderInput(inputId = "slider2",
              label = h4("Select Year Range"),
              min = min(climate_df$DateConverted),
              max = max(climate_df$DateConverted),
              sep = "",
              value = (c(min(climate_df$DateConverted, max(climate_df$DateConverted))))
  )
)

# Put a plot in the middle of the page
main_panel_plot2 <- mainPanel(
  plotlyOutput(outputId = "climate_plot2"),
  fluidPage(
    p("Filler Text")
  )
)
# Interactive tab #2
interactive_tab2 <- tabPanel(
  "Christopher",
  sidebarLayout(
    sidebar_panel_widget2,
    main_panel_plot2
  )
)

sidebar_panel_widget3 <- sidebarPanel(
  sliderInput(inputId = "slider3",
              label = h4("Select Year Range"),
              min = min(climate_df$DateConverted),
              max = max(climate_df$DateConverted),
              sep = "",
              value = (c(min(climate_df$DateConverted, max(climate_df$DateConverted))))
  )
)

# Put a plot in the middle of the page
main_panel_plot3 <- mainPanel(
  plotlyOutput(outputId = "climate_plot3"),
  fluidPage(
    p("Filler Text")
  )
)
# Interactive tab #3  — combine sidebar panel and main panel
interactive_tab3 <- tabPanel(
  "Henry",
  sidebarLayout(
    sidebar_panel_widget3,
    main_panel_plot3
  )
)

# Conclusion Tab
conclusion_side_bar <- sidebarPanel(
  img(src = "https://www.holcim.com/sites/holcim/files/styles/teaser_2cols/public/images/holcim_icon_sustainability_gradient_srgb_climate_1-3teaser_v2_1.png?h=a8249c90&itok=prtjvSbV", height="100%", width="100%")
)

conclusion_main_panel <- mainPanel(
  p("Filler Text")
)

conclusion_tab <- tabPanel(
  "Conclusion",
  conclusion_side_bar,
  conclusion_main_panel
  )


ui <- navbarPage(
  # Home page title
  "Climate Change",
  intro_tab,
  interactive_tab1,
  interactive_tab2,
  interactive_tab3,
  conclusion_tab
)

