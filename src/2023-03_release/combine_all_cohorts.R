library(tidyverse)


## STUDY

gs4_deauth()

# read in sheet with metadata for all studies
all_cohorts_study <- read_sheet(
  "https://docs.google.com/spreadsheets/d/1cHSburUDg6CR4az5FZR82FI992h7cyv-22pLVTFLZvE/edit#gid=726242842",
  sheet = "study_metadata_2023-03")

write_csv(all_cohorts_study, here::here("output", "all_cohorts_study.csv"))

# 
# # get each study and write to csv
# get_individual_study <- function(study_code){
#   
#   individual <- study_all %>% filter(`Study Code` == study_code)
#   
#   write_csv(individual, here::here("output", paste0(study_code, "_study.csv")))
# }
# 
# walk(study_all$`Study Code`, get_individual_study)
# 
# # if need to reassemble individual study files
# filenames_study <- list.files(path = here::here("output"),
#                                     pattern = "study.csv",
#                                     full.names = TRUE)
# 
# all_cohorts_study <- read_csv(filenames_study) %>% 
#   select(-Uuid, -entityId)
# 
# write_csv(all_cohorts_study, here::here("output", "all_cohorts_study.csv"))


#**Delete existing `all_cohorts_participant.csv` and `all_cohorts_condition.csv` first**

## PARTICIPANT

filenames_participant <- list.files(path = here::here("output"),
                                    pattern = "participant.csv",
                                    full.names = TRUE)

all_cohorts_participant <- read_csv(filenames_participant)

write_csv(all_cohorts_participant, here::here("output", "all_cohorts_participant.csv"))

# check number of participants per study
all_cohorts_participant %>% count(`Study Code`)

# see random sample from each study
all_cohorts_participant %>% 
  group_by(`Study Code`) %>% 
  sample_n(5) %>% 
  view()


## CONDITION

filenames_condition <- list.files(path = here::here("output"),
                                  pattern = "condition.csv",
                                  full.names = TRUE)

all_cohorts_condition <- read_csv(filenames_condition)

write_csv(all_cohorts_condition, here::here("output", "all_cohorts_condition.csv"))

# check unique participants per study
all_cohorts_condition %>% 
  group_by(`Study Code`) %>% 
  summarize(n = n_distinct(`Participant External ID`))

# check participants who don't have conditions

# DS-Sleep - only Condition is DS for now - only 36 participants are DS

# ABCDS: 10192 23001 23002
# 10192 is control with no Conditions
# 23001 & 23002 are DS with no baseline health history (only c2)
setdiff(abcds_participant$`Participant External ID`, 
        unique(all_cohorts_condition %>% 
                 filter(`Study Code` == "ABC-DS") %>% 
                 pull(`Participant External ID`) %>% 
                 unique()))

# DSC: 11296 12481 12633 12657 12721 13056
# these participants have mostly blank IHQ and no DS Specific Diagnosis
# Leave out of Condition for now, check with DSC team
setdiff(dsc_participant$`Participant External ID`, 
        unique(all_cohorts_condition %>% 
                 filter(`Study Code` == "DSC") %>% 
                 pull(`Participant External ID`) %>% 
                 unique()))

# check for duplicate rows
all_cohorts_condition %>% janitor::get_dupes() %>% view()

# see random sample from each study
all_cohorts_condition %>%
  group_by(`Study Code`) %>% 
  filter(`Participant External ID` == sample(`Participant External ID`, 1)) %>% 
  view()
