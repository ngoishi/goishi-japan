library(dplyr)

shinyServer(function(input, output, session) {

  # Provide explicit colors for regions, so they don't get recoded when the
  # different series happen to be ordered differently from year to year.
  # http://andrewgelman.com/2014/09/11/mysterious-shiny-things/
  defaultColors <- c("#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477","#3377FF")
  series <- structure(
    lapply(defaultColors, function(color) { list(color=color) }),
    names = levels(dat$region)
  )

  yearData <- reactive({
    # Filter to the desired year, and put the columns
    # in the order that Google's Bubble Chart expects
    # them (name, x, y, color, size). Also sort by region
    # so that Google Charts orders and colors the regions
    # consistently.
    df <- dat %.%
      filter(year == input$year) %.%
      select(prefecture, social_assistant, education_expenditure,
        region,population) %.%
      arrange(region)
  })

  #output$chart <- reactive({
    # Return the data and options
  #  list(
    #  dat = googleDataTable(yearData()),
   #   options = list(
   #     title = sprintf(
   #       "教育費と生活保護率, %s",
   #       dat$year),
   #     series = series
  #    )
#    )
#  })
#})
