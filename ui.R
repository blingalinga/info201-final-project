library(plotly)
library(bslib)

# Load climate data
climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

# Home page tab
intro_tab <- tabPanel(
  # Title of tab
  "Introduction",
  fluidPage(
    theme = bs_theme(version = 4, bootswatch = "minty"),
    h1("Let's Talk about Climate Change"),
    p("Filler Text"),
    p("Info about data"),
    h2("Summary Calculations"),
    p("Write summary calculations here"), 
    p("More information")
  )
)

# We want our next tab to have a sidebar layout
# So we're going to create a sidebarPanel() and a mainPanel() and then add them together

# Create sidebar panel for widget
sidebar_panel_widget <- sidebarPanel(
  checkboxGroupInput(
    inputId = "country_selection",
    label = h4("Select a Region"),
    choices = c("World", "United States", "China", "Asia"),
    selected = "United States"
  ),
  sliderInput(inputId = "slider1",
              label = h4("Select Year Range"),
              min = min(climate_df$year),
              max = max(climate_df$year),
              sep = "",
              value = c(2010, 2020)
  )
)

# Put a plot in the middle of the page
main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "climate_plot"),
  fluidPage(
    p("Filler Text")
  )
)

# Interactive tab #1
interactive_tab1 <- tabPanel(
  "Henry",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  )
)

# Interactive tab #2
interactive_tab2 <- tabPanel(
  "Christopher",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  )
)

# Climate tab  — combine sidebar panel and main panel
climate_tab <- tabPanel(
  "Charlie",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  )
)


ui <- navbarPage(
  # Home page title
  "Climate Change",
  intro_tab,
  climate_tab,
  interactive_tab1,
  interactive_tab2
)

