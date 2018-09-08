library("tidyverse")
View(refine_original)
library(magrittr)
library(dplyr)
library(tidyr)
library(stringr)

#Company Names
refine_original$company <- refine_original$company %>% tolower() %>% gsub(pattern = "0", replacement = "o") %>% gsub(pattern = "f", replacement = "ph") %>% arrange(company)
refine_original$company <- sub("a.*o", replacement = "akzo", refine_original$company)
refine_original$company <- sub("p.*s", replacement = "phillips", refine_original$company)

#Product Code/Number
refine_original <- separate(refine_original, `Product code / number`, into = c("Product Code", "Number"), sep = "-")
refine_original$`Product Code` <- sub("p", replacement = "Smartphone", refine_original$`Product Code` )
refine_original$`Product Code` <- sub("v", replacement = "TV", refine_original$`Product Code` )
refine_original$`Product Code` <- sub("x", replacement = "Laptop", refine_original$`Product Code` )
refine_original$`Product Code` <- sub("q", replacement = "Tablet", refine_original$`Product Code` )

refine_original











