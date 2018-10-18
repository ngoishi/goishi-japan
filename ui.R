
xlim <- list(
  min = min(dat$education_expenditure) ,
  max = max(dat$education_expenditure) 
)
ylim <- list(
  min = min(dat$social assistant),
  max = max(dat$social_assistant) 
)

shinyUI(fluidPage(
  # This line loads the Google Charts JS library
  googleChartsInit(),

  # Use the Google webfont "Source Sans Pro"
  tags$link(
    href=paste0("http://fonts.googleapis.com/css?",
                "family=Source+Sans+Pro:300,600,300italic"),
    rel="stylesheet", type="text/css"),
  tags$style(type="text/css",
    "body {font-family: 'Source Sans Pro'}"
  ),

  h2("都道府県別に見た生活保護率と教育費"),

  googleBubbleChart("chart",
    width="100%", height = "475px",
    # Set the default options for this chart; they can be
    # overridden in server.R on a per-update basis. See
    # https://developers.google.com/chart/interactive/docs/gallery/bubblechart
    # for option documentation.
    options = list(
      fontName = "Source Sans Pro",
      fontSize = 13,
      # Set axis labels and ranges
      hAxis = list(
        title = "教育費／地方税収入 (市町村、%)",
        viewWindow = xlim
      ),
      vAxis = list(
        title = "生活保護率 (%)",
        viewWindow = ylim
      ),
      # The default padding is a little too spaced out
      chartArea = list(
        top = 50, left = 75,
        height = "75%", width = "75%"
      ),
      # Allow pan/zoom
      explorer = list(),
      # Set bubble visual props
      bubble = list(
        opacity = 0.4, stroke = "none",
        # Hide bubble label
        textStyle = list(
          color = "none"
        )
      ),
      # Set fonts
      titleTextStyle = list(
        fontSize = 16
      ),
      tooltip = list(
        textStyle = list(
          fontSize = 12
        )
      )
    )
  ),
  fluidRow(
    shiny::column(4, offset = 4,
      sliderInput("year", "Year",
        min = min(dat$year), max = max(dat$year),
        value = min(dat$year), animate = TRUE)
    )
  )
))
