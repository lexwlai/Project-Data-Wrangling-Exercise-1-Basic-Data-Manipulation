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
  mutate(company = str_replace(company, "p.*s", "phillips")) %>% 
  mutate(company = str_replace(company, "f", "ph")) %>%
  mutate(company = str_replace(company,"u.*r", "unilever"))


#Product Code/Number
refine <- 
  separate(refine_original, `Product code / number`, into = c("Product Code", "Number"), sep = "-")
refine$`Product Code` <- sub("p", replacement = "Smartphone", refine$`Product Code` )
refine$`Product Code` <- sub("v", replacement = "TV", refine$`Product Code` )
refine$`Product Code` <- sub("x", replacement = "Laptop", refine$`Product Code` )
refine$`Product Code` <- sub("q", replacement = "Tablet", refine$`Product Code` )

#Address/Geocoding
refine <-
  unite(refine, full_address, address, city, country, sep = ", ")


View(refine)





