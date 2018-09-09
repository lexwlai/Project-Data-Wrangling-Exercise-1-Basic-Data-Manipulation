library(tidyverse)
library(magrittr)
library(dplyr)
library(tidyr)
library(stringr)

##Loading the Data
library(readxl)
refine_original <- read_excel("C:/Users/lexla/Desktop/refine_original.csv")
View(refine_original)

#Company Names
refine_original <- 
  refine_original %>% mutate(company = tolower(company)) %>%
  mutate(company = str_replace(company,"a.*o", "akzo")) %>% 
  mutate(company = str_replace(company, "0", "o")) %>% 
  mutate(company = str_replace(company, "p.*s", "phillips")) %>% 
  mutate(company = str_replace(company, "f", "ph")) %>%
  mutate(company = str_replace(company,"u.*r", "unilever"))

#Product Code/Number
refine_original <- 
  separate(refine_original, `Product code / number`, into = c("Product Code", "Number"), sep = "-")
refine_original$`Product Code` <- sub("p", replacement = "Smartphone", refine_original$`Product Code` )
refine_original$`Product Code` <- sub("v", replacement = "TV", refine_original$`Product Code` )
refine_original$`Product Code` <- sub("x", replacement = "Laptop", refine_original$`Product Code` )
refine_original$`Product Code` <- sub("q", replacement = "Tablet", refine_original$`Product Code` )

#Address/Geocoding
refine_original <-
  unite(refine_original, full_address, address, city, country, sep = ", ")




refine_clean <- refine_original
View(refine_clean)





