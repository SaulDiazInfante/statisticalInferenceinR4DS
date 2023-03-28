library("tidyverse")
library("readxl")
library("stringr")

path <- file.path("datasets", "airbnb_room_type.xlsx")
df_room_type <- read_excel(path, sheet = 1)
glimpse(df_room_type)

nb_private_rooms <- df_room_type %>%
    mutate(room_type = str_to_lower(room_type)) %>%
    filter(room_type == "private room") %>%
    count()

print(nb_private_rooms)