library(readr)
library(ggplot2)
library("dplyr")
library(coronavirus)
# update_dataset()
# Read datasets/confirmed_cases_worldwide.csv into confirmed_cases_worldwide
wd_path <- getwd()
path <- file.path(wd_path, "datasets", "confirmed_cases_worldwide.csv")
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
path <- file.path(wd_path, "datasets", "confirmed_cases_china_vs_world.csv")
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