library("dplyr")
library("readr")
library("stringr")

path <- file.path("datasets", "airbnb_price.csv")
df_price <- read_csv(path)
glimpse(df_price)

avg_price <- df_price %>%
    mutate(price = as.numeric(str_remove(price, " dollars"))) %>%
    summarize(mean_price = mean(price))
print(avg_price)