library(tidyverse)
library(googlesheets4)

# deactivate need for Google Auth since these sheets are accessible with link
gs4_deauth()

# read in sheet with metadata for all studies
study_all <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1cHSburUDg6CR4az5FZR82FI992h7cyv-22pLVTFLZvE/edit?pli=1#gid=726242842",
  sheet = "study_metadata_2023-03")

# get each study and write to csv
get_individual_study <- function(study_code){
  
  individual <- study_all %>% filter(`Study Code` == study_code)
  
  write_csv(individual, here::here("output", paste0(study_code, "_study.csv")))
  }

walk(study_all$`Study Code`, get_individual_study)
