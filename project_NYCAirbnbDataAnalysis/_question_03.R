library("dplyr")
library("readr")
library("stringr")

path <- file.path("datasets", "airbnb_last_review.tsv")
df_last_review <- read_tsv(path)
glimpse(df_last_review)
fmt_date <- "%B %d %Y"
review_dates <- df_last_review %>%
    mutate(
        last_review = parse_date(last_review, format = fmt_date)
    ) %>%
    summarize(
        first_reviewed = min(last_review),
        last_reviewed = max(last_review)
    )

print(review_dates)