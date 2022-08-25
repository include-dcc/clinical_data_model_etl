
library(tidyverse)

# combine participant tables

htp_participant <- read_csv(here::here("output", "htp_participant.csv"))
#nexus_participant <- read_csv(here::here("output", "nexus_participant.csv"))
khor_participant <- read_csv(here::here("output", "khor_participant.csv"))
dsc_participant <- read_csv(here::here("output", "dsc_participant.csv"))
abcds_participant <- read_csv(here::here("output", "abcds_participant.csv"))

all_cohorts_participant <- rbind(htp_participant, khor_participant, dsc_participant, abcds_participant)

write_csv(all_cohorts_participant, here::here("output", "all_cohorts_participant.csv"))


# combine condition tables

htp_condition <- read_csv(here::here("output", "htp_condition.csv"))
#nexus_condition <- read_csv(here::here("output", "nexus_condition.csv"))
abcds_condition <- read_csv(here::here("output", "abcds_condition.csv"))

all_cohorts_condition <- rbind(htp_condition, abcds_condition)

write_csv(all_cohorts_condition, here::here("output", "all_cohorts_condition.csv"))


# get a random sample of IDs to spot check
all_cohorts_participant %>% 
  group_by(`Study Code`) %>% 
  slice_sample(n = 3) %>% 
  pull(`Participant ID`)

all_cohorts_condition %>% 
  group_by(`Study Code`) %>% 
  slice_sample(n = 3) %>% 
  pull(`Participant ID`)