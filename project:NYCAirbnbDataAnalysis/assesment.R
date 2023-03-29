library(tidyverse)
library(stringr)
library(readr)
library(readxl)


# Convert the character strings in the vector colors to all upper case.
Complete the code to return the output
colors <- c("Red", "green", "bluE")
str_to_upper(colors)

library(readxl)
library(readxl)
read_excel(character_excel,
    sheet = 3,
    names = c("weight", "feed"),
    skip = 1
)

read_excel(character_excel, sheet = 3, col_names, skip = 1)


sales %>%
    mutate(
        day =
            as.numeric
            (day)
    ) %>%
    head()

> df1
  customer_id order_id
1          20        5
2          21        6
3          22        7

> df2
  customer_id customer_name
1          20          Jane
2          21          John
3          23           Joe
Complete the code to return the output

rigth_joint(df1, df2, by = "customer_id")


The survey_sav file is an SPSS file whose file extension is .sav. Import this file using an appropriate function.
Complete the code to return the output
library(haven)
read_sas
(survey_sav)

The preview of the plants data frame shows that the sales_price has been stored as a character string. Convert the sales_price to a numeric variable.

# A tibble: 5 x 3
  name     binomial_name      sales_price
  <chr>    <chr>              <chr>      
1 Alfredo  Monstera Deliciosa 24.95      
2 Isabella Calathea Orbifolia 28.95      
3 Marty    Areca              44.95      
4 Ollie    Alocasia Zebrina   29.95      
5 Howerd   Kentiapalm         49.95   
Complete the code to return the output
library(dplyr)

plants %>% 
  mutate(sales_price = 
as.numeric(sales_price)
)

Convert the elements in the vector numbers_as_chars into numeric data.
Complete the code to return the output
library(readr)

numbers_as_chars <- c("1000", "10.2", "178")

write code here
(numbers_as_ch

library(readr)

numbers_as_chars <- c("1000", "10.2", "178")

as.numeric(numbers_as_chars)

###
# A tibble: 3 x 2
  date_chr   value   
  <chr>      <chr>   
1 2019-09-01 USD-1275
2 2019-09-03 GBP-995 
3 2019-08-30 EUR-1050

library(dplyr)
library(lubridate)

costs %>%
    mutate(
        date_format =
            as_date(date_chr)
    )


##
The data movie_reviews has been imported in the format shown below. Convert this to a suitable structure so that it can be used for plotting using ggplot2.

# A tibble: 3 x 3
  `Casino Royale` `Despicable Me` `Harry Potter`
            <dbl>           <dbl>          <dbl>
1              10               4              8
2               2               9              8
3               5               8              6
Complete the code to return the output
library(tidyr)

movie_reviews %>% 
	
pivot_longer
(everything(), 
               names_to = "movie", 
               values_to = "rating")


Before each of the strings in the vector x, add underscores (_) so they are all a width of 4 characters.
Complete the code to return the output

library(stringr)

x <- c("A", "BC", "DEF")

str_glue(x, width = 4, side = "left", pad = "_")

List all of the sheets of the character_excel excel workbook.
Complete the code to return the output

library(readxl)
getSheetsNames(character_excel)


## Some mistakes were made during data entry of plant inventory for Green Friend Nursery. Remove the leading spaces from all entries in the water_requirement column of the plants data.

# A tibble: 5 x 3
  name     binomial_name      water_requirement
  <chr>    <chr>              <chr>            
1 Alfredo  Monstera Deliciosa moderate         
2 Isabella Calathea Orbifolia   moderate     
3 Marty    Areca                high         
4 Ollie    Alocasia Zebrina   high             
5 Howerd   Kentiapalm         moderate  
Complete the code to return the output
library(stringr)
library(dplyr)

plants %>% 
  mutate(water_requirement = 
str_remove
(water_requirement))

## Complete the code to import the character_chart csv, using column headers "numbers", "letters", and "symbols" in that order.
Complete the code to return the output
library(tidyverse)
read_csv(character_chart, col_names =  
col_names=c("numbers", "letters", "symbols" )
 )
Expected Output
# A tibble: 5 × 3
  numbers letters symbols
    <dbl> <chr>   <chr>  
1       1 a       !      
2       2 b       @      
3       3 c       #      
4       4 d       $      
5       5 e       %      


The data, df shown below, contains information about bmi for a number of countries over time. For presentation purposes you want to join the countries and iso columns into a single column, country_iso.

    countries iso  year      bmi
1 Afghanistan  AF Y1980 21.48678
2     Albania  AL Y1980 25.22533
3     Algeria  DZ Y1980 22.25703
Complete the code to return the output
library(tidyr)

nest
(df, country_iso, countries, iso, sep = "/")



x <- c(7, 1, 5)
x %>%
 mean()