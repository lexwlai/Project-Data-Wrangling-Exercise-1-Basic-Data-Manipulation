library(tidyverse)
library(magrittr)
library(dplyr)
library(tidyr)
library(stringr)

##Loading the Data
library(readxl)
refine_original <- read_excel("C:/Users/lexla/Desktop/refine_original.csv")
View(refine_original)

refine <- tbl_df(refine_original)


#Company Names
refine <-
  refine %>%
  mutate(company = tolower(company)) %>%
  mutate(company = str_replace(company,"a.*o", "akzo")) %>% 
  mutate(company = str_replace(company, "0", "o")) %>% 
  mutate(company = str_replace(company, "ph.*s", "philips")) %>% 
  mutate(company = str_replace(company, "f", "ph")) %>%
  mutate(company = str_replace(company,"u.*r", "unilever"))

#Product Code/Number
refine <- 
  separate(refine, `Product code / number`, into = c("Product Code", "Number"), sep = "-")
refine$`Product Code` <- sub("p", replacement = "Smartphone", refine$`Product Code` )
refine$`Product Code` <- sub("v", replacement = "TV", refine$`Product Code` )
refine$`Product Code` <- sub("x", replacement = "Laptop", refine$`Product Code` )
refine$`Product Code` <- sub("q", replacement = "Tablet", refine$`Product Code` )

#Address/Geocoding
refine <-
  unite(refine, full_address, address, city, country, sep = ", ")

##Dummy Variables
#Company
refine <-
  refine %>%
  add_column(company_philips = c("1")) %>%
  add_column(company_akzo = 1:25) %>%
  add_column(company_van_houten = 1:25) %>%
  add_column(company_unilever = 1:25)
#Products
refine <-
  refine %>%
  add_column(product_smartphone = 1:25) %>%
  add_column(product_tv = 1:25) %>%
  add_column(product_laptop = 1:25) %>%
  add_column(company_tablet = 1:25)


View(refine)





