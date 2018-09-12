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
  mutate(company = str_replace(company, "f", "ph")) %>%
  mutate(company = str_replace(company, "ph.*s", "philips")) %>% 
  mutate(company = str_replace(company,"u.*r", "unilever")) %>% 
  mutate(company = str_replace(company, "v.*n", "van houten")) 
  
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
  mutate(company_philips = 
           ifelse(refine$company == "philips", "1", "0")) %>%
  mutate(company_akzo = 
           ifelse(refine$company == "akzo", "1", "0")) %>%
  mutate(company_van_houten = 
           ifelse(refine$company == "van houten", "1", "0")) %>%
  mutate(company_unilever = 
           ifelse(refine$company == "unilever", "1", "0"))
#Products
refine <-
  refine %>%
  mutate(product_smartphone = 
           ifelse(refine$`Product Code` == "Smartphone", "1", "0")) %>%
  mutate(product_tv = 
           ifelse(refine$`Product Code` == "TV", "1", "0")) %>%
  mutate(product_laptop = 
           ifelse(refine$`Product Code` == "Laptop", "1", "0")) %>%
  mutate(company_tablet = 
           ifelse(refine$`Product Code` == "Tablet", "1", "0"))


View(refine)





