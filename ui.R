library(plotly)
library(bslib)
library(stringr)

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
    p("This dataset was found on datahub.io. The CO2 PPM trend data was collected by the United States Government Earth System Research Laboratory, Global Monitoring Division at Mauna Loa. The method of data collection over time may have changed due to developing filtration and measurement technologies. This data is collected by sampling the air atop the Hawaiian volcano Mauna Loa and the CO2 levels are monitored mainly through the use of spectroscopy. This data was collected since the 1950s for the purpose of monitoring atmospheric CO2, these measurements can reflect truths about the global atmosphere. In our data, there are 727 observations collected beginning in 1958. This data also has 5 unique columns including date/decimal date, average CO2 PPM, interpolated, trend, and number of days. This dataset contains data about our atmospheric CO2 trends which would affect the population on a global scale but a question a power we could consider is how certain countries have resources to respond to the trends that can be seen in the dataset while some countries may lack the same resources. Limitations to this data set include one location for sampling. The data found here only considers CO2 levels measured a a single location(Mauna Loa) and it is possible that the levels vary in various locations despite being atmospheric levels."),
    h2("Limitations"),
    p("Challenges and limitations that might arise during our project relating to the trends in CO2 emissions reading over time would be interpreting the levels that would have effects towards the environment such as global temperature increasing resulting in snow and ice to melt making water levels increase around the coast of many countries. Additionally wildlife being affected by this due to suitable temperature zones has changed due to an increase in global temperature and possible extinction to many species. Lastly we also look at human health implications and drawbacks to our health from the CO2 emissions. As our field of focus does not specialize in this realm so we would have to utilize external resources to get a grasp of this section of interpretation of the data. Another limitation that we face in this project is the location of the data collection (Mauna Loa) which does not account for the emission readings across the world which limits the generalizations we can make globally."),
    h2("Implications"),
    p("CO2 emissions, according to NASA, are the leading cause of climate change, which through global warming, shortened harvest seasons, and more extreme weather, has significantly harmful effects on the quality of life on Earth. By identifying the causes that lead to potential increases in CO2 emissions, we hope that this dataset can spark some level of urgency in policymakers across all levels of government. Furthermore, with this dataset, city planners and civil engineers can redesign cities throughout the United States to decrease the overreliance on private vehicles, one of the largest contributors to CO2 emissions in the country. Because the United States is the second largest contributor to CO2 emissions, only after China, and while recognizing trends in CO2 emissions in just the U.S. may lead to solutions on a local scale, our government overhauling our policies on energy such that we rely less on fossil fuels would speak volumes to the rest of the world, which would also likewise be a stepping stone to reduce climate change.")
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
              min = 1959,
              max = 2018,
              sep = "",
              value = (c(1959, 2018))
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
  "Annual Change in CO2 Emissions Per Year",
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
main_panel_plot4 <- mainPanel(
  plotlyOutput(outputId = "climate_plot4"),
  fluidPage(
    p("This chart depicts the amount of readings collected a month that contributes to the mobthly average of CO2 mole fraction. The amount of daily readings started in May of 1974 which aims to allows to user to see the if there has been a change of varience over the past 44 years. The user has the option to adjust the date range in question and the daily emission readings will be plotted for the selected month using a scatter plot showing the trend of the data over time")
  )
)
sidebar_panel_widget4 <- sidebarPanel(
  # sliderInput(inputId = "slider4",
  #             label = h4("Select Date Range"),
  #             min = min(climate_df$Date),
  #             max = max(climate_df$Date),
  #             sep = "",
  #             value = c(1974-05-01, 2018-09-01)
  # )
)
# Interactive tab #3  — combine sidebar panel and main panel
interactive_tab3 <- tabPanel(
  "Daily CO2 Reading Contribution to Monthly Average",
  sidebarLayout(
    sidebar_panel_widget3,
    main_panel_plot4
  )
)
 
# Conclusion Tab
conclusion_side_bar <- sidebarPanel(
  img(src = "https://www.holcim.com/sites/holcim/files/styles/teaser_2cols/public/images/holcim_icon_sustainability_gradient_srgb_climate_1-3teaser_v2_1.png?h=a8249c90&itok=prtjvSbV", height="100%", width="100%")
)

conclusion_main_panel <- mainPanel(
  h2("So what did we find?"),
  p("Our analysis of this data through visualizations and calculations have show us that there is a trend in this CO2 as shown in the plot on page: Average Emissions Over Time. Over time, CO2 levels have been rising which could have drastic effects on our environment and our health."),
  p("These rising CO2 emissions will affect our climate through rising temperatures"),
  p("Since we are dealing with CO2 emission reading and interpretation since 1958 we can observe the correlation of emissions to environmental and health outcomes. In 1950 the world emitted 6 billion tonnes of CO2, meanwhile, we emit about 34 billion tonnes each year in the past decade.1 This is vital since we can compare the data to fossil fuel usage and see that it is the main reason for the spike in emissions into the atmosphere. This increase in CO2 in the atmosphere has led to a .14 degree Fahrenheit increase each decade since 1880.2 The amount of increase does seem small but since Earth is so large it needs more energy to be generated to increase the temperature. In perspective, the 10 warmest years that have been recorded have occurred since 2005 and the small amount of increased temperature could be a large factor in the changes that we have observed. Although the amount of temperature change seems minimal, there have been drawbacks and projected drawbacks. Normal levels of CO2 are 400-1,000 ppm; anything above that range will cause drowsiness, headaches, nausea, increased heart rate, and over time could lead to serious health outcomes.3 As we monitor emission trends from 1958-2018 that has already impacted our planet and eventually will reach a point where the damages are irreversible consider the outcomes that are caused by these emissions. This information was informed from the following sources:"),
  tags$a(href="https://ourworldindata.org/co2-emissions", 
         "Our world in data"),
  tags$a(href="https://www.climate.gov/news-features/understanding-climate/climate-change-global-temperature#:~:text=Earth's%20temperature%20has%20risen%20by,land%20areas%20were%20record%20warm", 
         "Climate.gov"),
  tags$a(href="https://www.dhs.wisconsin.gov/chemical/carbondioxide.htm#:~:text=400%E2%80%931%2C000%20ppm%3A%20typical%20level,stagnant%2C%20stale%2C%20stuffy%20air", 
         "DHS"),
  h2("Summary Information"),
  p("The summary paragraph in our findings conducted simple calculations to find the mean CO2 level, median CO2 level, highest measured CO2 level, lowest measured CO2 level, and the largest difference in the measured CO2 levels. The mean CO2 value was 353.93 while the median was slightly higher at the value of 351.31. The highest measured CO2 level was 351.58 while the lowest was 313.2 which excludes the value of -99.99 as this is what they input for any data they did not collect, this would have affected the average levels if we did not filter -99.99 out of our table. Additionally, this would have affected the value calculated for the largest difference in the measured CO2 level which was calculated to be 98.04 without the value of -99.99. These summary statistics can give us insight into how much CO2 levels have fluctuated and around what value they usually were throughout the time period of 19588-2018.")
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

