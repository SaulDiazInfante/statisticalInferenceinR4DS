library(shiny)
library(toastui)

df_calendar <- cal_demo_data()
df_calendar <- df_calendar[1, ]
event_01 <- list(
  calendarId = 1,
  title = "Introduction to R",
  body = "Couse from Data Camp, skill track R programming",
  recurrenceRule = NA,
  start = "2023-02-03 20:00:00",
  end = "2023-02-13 20:00:00",
  category = "time",
  location = NA,
  bgColor = NA,
  color = NA,
  borderColor = NA
)

df_calendar[1, ] <- event_01
event_02 <- list(
  calendarId = 1,
  title = "Intermediate R",
  body = "Couse from Data Camp, skill track R programming",
  recurrenceRule = NA,
  start = "2023-02-14 20:00:00",
  end = "2023-02-28 20:00:00",
  category = "time",
  location = NA,
  bgColor = "forestgreen",
  color = NA,
  borderColor = NA
)
df_calendar[2, ] <- event_02

ui <- fluidPage(
  tags$h2("DataCamp excersices"),
  fluidRow(
    column(
      width = 8,
      calendarOutput("my_calendar")
    ),
    column(
      width = 4,
      tags$b("Dates:"),
      verbatimTextOutput("dates"),
      tags$b("Clicked schedule:"),
      verbatimTextOutput("click")
    )
  )
)

server <- function(input, output, session) {
  
  output$my_calendar <- renderCalendar({
    calendar(df_calendar, navigation = TRUE) %>%
      cal_props(
        list(
          id = 1,
          name = "Javier Verdugo",
          color = "white",
          bgColor = "firebrick",
          borderColor = "firebrick"
        ),
        list(
          id = 2,
          name = "WORK",
          color = "white",
          bgColor = "forestgreen",
          borderColor = "forestgreen"
        )
      )
  })
  
  output$dates <- renderPrint({
    input$my_calendar_dates
  })
  
  output$click <- renderPrint({
    input$my_calendar_click
  })
  
}

if (interactive())
  shinyApp(ui, server)
