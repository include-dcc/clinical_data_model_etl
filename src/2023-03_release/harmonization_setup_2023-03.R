library(tidyverse)
library(synapser)
library(googlesheets4)

synLogin()

# deactivate need for Google Auth since these sheets are accessible with link
gs4_deauth()

# read in sheets
condition_codes_v3 <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1cHSburUDg6CR4az5FZR82FI992h7cyv-22pLVTFLZvE",
  sheet = "condition_codes_v3")

measure_codes_v3 <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1cHSburUDg6CR4az5FZR82FI992h7cyv-22pLVTFLZvE",
  sheet = "measure_codes_v3")

etl_to_linkml_plan <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1cHSburUDg6CR4az5FZR82FI992h7cyv-22pLVTFLZvE",
  sheet = "etl_to_linkml_plan")

# workaround so I can work with schema labels in R and then replace with display names 
# before passing to schematic validate
displayname_schemalabel_lookup <- read_csv(
  here::here("data", "displaynames_schemalabels_March_2023.csv"))

# get schema labels and display names for the components

participant_schemalabels <- displayname_schemalabel_lookup %>% 
  filter(component == "Participant") %>% 
  pull(schema_label)

participant_displaynames <- displayname_schemalabel_lookup %>% 
  filter(component == "Participant") %>% 
  pull(display_name)

condition_schemalabels <- displayname_schemalabel_lookup %>% 
  filter(component == "Condition") %>% 
  pull(schema_label)

condition_displaynames <- displayname_schemalabel_lookup %>% 
  filter(component == "Condition") %>% 
  pull(display_name)