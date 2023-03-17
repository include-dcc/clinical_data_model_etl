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

datafile_schemalabels <- displayname_schemalabel_lookup %>% 
  filter(component == "DataFile") %>% 
  pull(schema_label)

datafile_displaynames <- displayname_schemalabel_lookup %>% 
  filter(component == "DataFile") %>% 
  pull(display_name)


# # ADD FOLDERS TO SYNAPSE PROJECTS
# 
# synapse_projects <- read_sheet("https://docs.google.com/spreadsheets/d/1wNtmceBQwZu71gmQ1Z48yqNdV0zNu9WfZJ5IAhoRnMw/edit#gid=640167620",
#                                sheet = "synapse_setup") %>%
#   select(study_code, project_synid) %>%
#   filter(study_code %in% c("ABC-DS", "HTP", "DSC", "X01-deSmith", "X01-Hakon",
#                            "DS-Sleep", "BRI-DSR"))
# 
# 
# create_folders <- function(input_project_id){
#   synStore(Folder("2023-03_Study", parent = input_project_id))
#   synStore(Folder("2023-03_Participant", parent = input_project_id))
#   synStore(Folder("2023-03_Condition", parent = input_project_id))
#   synStore(Folder("2023-03_Biospecimen", parent = input_project_id))
#   synStore(Folder("2023-03_DataFile", parent = input_project_id))
# }
# 
# # walk(synapse_projects$project_synid, create_folders)
# 
# get_folder_ids <- function(study){
#   input_project_id <- synapse_projects %>% filter(study_code == study) %>% pull(project_synid)
# 
#   print(study)
#   print(paste0("Study = ", synFindEntityId("2023-03_Study", parent = input_project_id)))
#   print(paste0("Participant = ", synFindEntityId("2023-03_Participant", parent = input_project_id)))
#   print(paste0("Condition = ", synFindEntityId("2023-03_Condition", parent = input_project_id)))
#   print(paste0("Biospecimen = ", synFindEntityId("2023-03_Biospecimen", parent = input_project_id)))
#   print(paste0("DataFile = ", synFindEntityId("2023-03_DataFile", parent = input_project_id)))
# }
# 
# map(synapse_projects$study_code, get_folder_ids)













