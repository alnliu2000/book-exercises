# Load libraries so they are available
library("shiny")

# Define a `ui` variable, assigning it a `navbarPage()` layout.
#   You will use `shinyUI()` to render this variable (bottom of the script)
# Give the layout a title of "Income Inequality".
# The layout should include the following elements:
ui <- navbarPage(
  title = "Income Inequality",
  # A `tabPanel()` with a title "Introduction" to represent the first tab.
  # This layout will contain the following elements:
  tabPanel(
    title = "Introduction",
    # A `titlePanel()` with the text "Income Inequality"
    titlePanel("Income Inequality"),
    mainPanel(
      # A paragraph `p()` describing with the text: "The below diagram was created
      # by the New York Times to illustrate the increasing level of inequality in
      # the US."
      p("The below diagram was created by the New York Times to illustrate the increasing level of inequality in the US."),
      # An image `img()` to display. This content should have a `src` attribute of
      # "inequality.png" (which will refer to the file in the `www/` folder).
      img("inequality", src = 'www/inequality.png'),
      # A paragraph containing a hyperlink `a()` to the source of the article at
      # https://www.nytimes.com/interactive/2017/08/07/opinion/leonhardt-income-inequality.html
      a("source", href = "https://www.nytimes.com/interactive/2017/08/07/opinion/leonhardt-income-inequality.html"),
      # A paragraph containing a 1-2 sentence description of what the diagram
      # shows. Your paragraph should include both `strong()` and emphasized `em()`
      # text.
      p("This diagram shows that",
        strong("poor and middle class people"), 
        "used to have the most number of income growth within the population in",
        em("1980"),
        "but the",
        strong("most affluent saw the most increase in income by"),
        em("2014")
      )
    )
  ),
  # The navbarPage layout should have a second `tabPanel()` titled "Growth Chart"
  # This layout should contain the following elements:
  tabPanel(
    title = "Growth Chart",
    # A `titlePanel()` with the text "Income growth 1980-2014"
    titlePanel("Income growth 1980-2014"),
    # A `sidebarLayout()` to create two columns.
    # The sidebar layout will contain elements:
    sidebarLayout(
      # A `sidebarPanel()` layout to organize the side bar. The sidebar contains:
      sidebarPanel(
        # A `sliderInput()` for the 'percentile' value, labeled "Income Percentile".
        # This slider should let the user pick a range between 0 and 100
        sliderInput(inputId = "percentile", label = "Income Percentile", min = 0, max = 100, value = 0)
      ),
        # The `sidebarLayout` also contains a `mainPanel()` for the main content.
        # The `mainPanel` contains
      mainPanel(
        # A `plotOutput()` element showing the 'plot' output
        plotOutput(outputId = "plot"),
        # A paragraph with a hyperlink to the data source http://gabriel-zucman.eu/usdina/
        a("source", href = "http://gabriel-zucman.eu/usdina/")
      )
    )
  )
)

