library(tidyverse)
library(stringr)
library(readr)
library(readxl)
library(haven)
library(lubridate)
library(tidyr)

# q_01
colors <- c("Red", "green", "bluE")
str_to_upper(colors)

# q_02

read_excel(character_excel,
    sheet = 3,
    col_names = c("weight", "feed"),
    skip = 1
)

# q_03
sales %>%
    mutate(
        day =
            as.numeric(day)
    ) %>%
    head()

# q_04

left_join(df1, df2, by = "customer_id")

# q_05
read_sav(survey_sav)

# q_06
plants %>% 
  mutate(sales_price = as.numeric(sales_price)
)

# q_07
numbers_as_chars <- c("1000", "10.2", "178")
as.numeric(numbers_as_chars)

# q_08
costs %>%
  mutate(
    date_format = as_date(date_chr)
  )

# q_09
movie_reviews %>%
  pivot_longer(
    everything(),
    names_to = "movie",
    values_to = "rating"
  )

#q_10
library(stringr)

x <- c("A", "BC", "DEF")

str_pad(x, width = 4, side = "left", pad = "_")



# q_11
excel_sheets(character_excel)

# q_12
plants %>%
  mutate(
    water_requirement = str_trim(water_requirement)
)

# q_13

read_csv(
  character_chart,
  col_names=c("numbers", "letters", "symbols")
 )


# q_14
unite(df, country_iso, countries, iso, sep = "/")


x <- c(7, 1, 5)
x %>%
 mean()