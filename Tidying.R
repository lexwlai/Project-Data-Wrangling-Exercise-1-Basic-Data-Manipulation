library("tidyverse")
View(refine_original)
library("magrittr")


#Making company names all lowercase and sorting in alphabetical order
refine_original$company <- tolower(refine_original$company)
refine_original <- arrange(refine_original, company)













