library(tidyverse)

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP,
  "HTP", "Crnic Institute Human Trisome Project", "INCLUDE", "phs002330"
) %>% 
  write_csv(here::here("output", "htp_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP,
  "BRI-DSR", "Benaroya Research Institute Down Syndrome Registry", 
  "INCLUDE", NA) %>% 
  write_csv(here::here("output", "bridsr_study.csv"))


tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP,
  "ABC-DS", "Alzheimer's Biomarker Consortium - Down Syndrome", "INCLUDE", NA
) %>% 
  write_csv(here::here("output", "abcds_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP,
  "DSC", "DS-Connect-The Down Syndrome Registry", "INCLUDE", NA
) %>% 
  write_csv(here::here("output", "dsc_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP,
  "DS-Sleep", "Dimensional, Sleep, and Genomic Analyses of 
  Down Syndrome to Elucidate Phenotypic Variability", "INCLUDE", NA
) %>% 
  write_csv(here::here("output", "dssleep_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP,
  "X01-deSmith", "The epidemiology of transient leukemia in newborns 
  with Down syndrome", "INCLUDE", NA
) %>% 
  write_csv(here::here("output", "desmith_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP,
  "X01-Hakon", "Genetic Underpinnings of the Multifactorial 
  Phenotype of Trisomy 21 Patients Unveiled by Multi-Omics Approaches", 
  "INCLUDE", NA
) %>% 
  write_csv(here::here("output", "hakon_study.csv"))
