library(readr)
library(ggplot2)
library("dplyr")
library(coronavirus)
# update_dataset()
# Read datasets/confirmed_cases_worldwide.csv into confirmed_cases_worldwide
wd_path <- getwd()
path <- file.path(
  wd_path,
  "covid19-visualization-Project",
  "datasets",
  "confirmed_cases_worldwide.csv"
)
confirmed_cases_worldwide <- read_csv(path)
# See the result
confirmed_cases_worldwide

# Draw a line plot of cumulative cases vs. date
# Label the y-axis
confirmed_cases_worldwide %>%
    ggplot(
        aes(
            x=date,
            y=cum_cases
        )
    ) +  geom_line() + ylab("Cumulative confirmed cases")

# Read in datasets/confirmed_cases_china_vs_world.csv
path <-
    file.path(
        wd_path,
        "covid19-visualization-Project",
        "datasets",
        "confirmed_cases_china_vs_world.csv"
    )
confirmed_cases_china_vs_world <- read_csv(path)

# See the result
glimpse(confirmed_cases_china_vs_world)
# Draw a line plot of cumulative cases vs. date, colored by is_china
# Define aesthetics within the line geom
plt_cum_confirmed_cases_china_vs_world <-
  ggplot(
    data = confirmed_cases_china_vs_world) +
  geom_line(
    aes(
      x = date,
      y = cum_cases,
      color = is_china
    )
  ) +
  ylab("Cumulative confirmed cases")

# See the plot
plt_cum_confirmed_cases_china_vs_world

who_events <- tribble(
  ~ date, ~ event,
  "2020-01-30", "Global health\nemergency declared",
  "2020-03-11", "Pandemic\ndeclared",
  "2020-02-13", "China reporting\nchange"
) %>%
  mutate(date = as.Date(date))
# Using who_events, add vertical dashed lines with an xintercept at date
# and text at date, labeled by event, and at 100000 on the y-axis

plt_cum_confirmed_cases_china_vs_world +
  geom_vline(data= who_events,
    aes(xintercept=date)
  ) +
  geom_text(data=who_events,
    aes(x=date, label=event, y=100000)
  )
#5
# Filter for China, from Feb 15
china_after_feb15 <- confirmed_cases_china_vs_world %>%
  filter(date > "2020-02-15")

# Using china_after_feb15, draw a line plot cum_cases vs. date
# Add a smooth trend line using linear regression, no error bars
ggplot(china_after_feb15,
       aes(
           x = date,
           y = cum_cases
       )
) +
    geom_line() +
    geom_smooth(method = lm, se = FALSE) +
    ylab("Cumulative confirmed cases")

# 6

not_china <- confirmed_cases_china_vs_world %>%
  filter( is_china == "Not China")

# Using china_after_feb15, draw a line plot cum_cases vs. date
# Add a smooth trend line using linear regression, no error bars
plt_not_china_trend_lin <- ggplot(not_china,
       aes(
           x = date,
           y = cum_cases
       )
) +
    geom_line() +
    geom_smooth(method = lm, se = FALSE) +
    ylab("Cumulative confirmed cases")

plt_not_china_trend_lin +
    scale_y_log10() +
    annotation_logticks(sides="lb")

# 8
# Run this to get the data for each country

path <-
    file.path(
        wd_path,
        "covid19-visualization-Project",
        "datasets",
        "confirmed_cases_by_country.csv"
    )
confirmed_cases_by_country <-
    read_csv(path)
glimpse(confirmed_cases_by_country)

# Group by country, summarize to calculate total cases, find the top 7
top_countries_by_total_cases <- confirmed_cases_by_country %>%
  group_by(country) %>%
    summarise(total_cases = max(cum_cases)) %>%
    arrange(desc(total_cases)) %>%
    top_n(7, total_cases)

# See the result
top_countries_by_total_cases
#
# Read in the dataset from datasets/confirmed_cases_top7_outside_china.csv
path <-
    file.path(
        wd_path,
        "covid19-visualization-Project",
        "datasets",
        "confirmed_cases_top7_outside_china.csv"
    )

confirmed_cases_top7_outside_china <-
    read_csv(path)


# Glimpse at the contents of confirmed_cases_top7_outside_china
glimpse(confirmed_cases_top7_outside_china)
# Using confirmed_cases_top7_outside_china, draw a line plot of
# cum_cases vs. date, colored by country
ggplot(confirmed_cases_top7_outside_china,
       aes(
           x=date,
           y=cum_cases,
           color=country)
) +
    geom_line()