
library(tidyverse)

# combine participant tables

#htp_participant <- read_csv(here::here("output", "htp_participant.csv"))
#nexus_participant <- read_csv(here::here("output", "nexus_participant.csv"))
khor_participant <- read_csv(here::here("output", "khor_participant.csv"))
dsc_participant <- read_csv(here::here("output", "dsc_participant.csv"))
abcds_participant <- read_csv(here::here("output", "abcds_participant.csv"))

all_cohorts_participant <- rbind(khor_participant, abcds_participant, dsc_participant)

write_csv(all_cohorts_participant, here::here("output", "all_cohorts_participant.csv"))


# combine condition tables

#htp_condition <- read_csv(here::here("output", "htp_condition.csv"))
#nexus_condition <- read_csv(here::here("output", "nexus_condition.csv"))
abcds_condition <- read_csv(here::here("output", "abcds_condition.csv"))
khor_condition <- read_csv(here::here("output", "khor_condition.csv"))
dsc_condition <- read_csv(here::here("output", "dsc_condition.csv"))

all_cohorts_condition <- rbind(abcds_condition, khor_condition, dsc_condition)

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


# how many unique participants?
n_distinct(all_cohorts_participant$`Participant ID`)


# only new cohorts
new_participant <- rbind(khor_participant, abcds_participant)
new_condition <- rbind(khor_condition, abcds_condition)

n_distinct(new_participant$`Participant ID`) # 584 new participants
#4515 new conditions added
