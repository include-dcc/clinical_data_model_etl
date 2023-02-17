library(tidyverse)

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP, ~`Virtual Biorepository Contact`,
  "HTP", "Crnic Institute Human Trisome Project", "INCLUDE", "phs002330", "TBD"
) %>% 
  write_csv(here::here("output", "htp_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP, ~`Virtual Biorepository Contact`,
  "BRI-DSR", "Benaroya Research Institute Down Syndrome Registry", 
  "INCLUDE", NA, NA) %>% 
  write_csv(here::here("output", "bridsr_study.csv"))


tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP, ~`Virtual Biorepository Contact`,
  "ABC-DS", "Alzheimer's Biomarker Consortium - Down Syndrome", "INCLUDE", NA, NA
) %>% 
  write_csv(here::here("output", "abcds_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP, ~`Virtual Biorepository Contact`,
  "DSC", "DS-Connect-The Down Syndrome Registry", "INCLUDE", NA, NA
) %>% 
  write_csv(here::here("output", "dsc_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP, ~`Virtual Biorepository Contact`,
  "DS-Sleep", "Dimensional, Sleep, and Genomic Analyses of 
  Down Syndrome to Elucidate Phenotypic Variability", "INCLUDE", NA, NA
) %>% 
  write_csv(here::here("output", "dssleep_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP, ~`Virtual Biorepository Contact`,
  "X01-deSmith", "The epidemiology of transient leukemia in newborns 
  with Down syndrome", "INCLUDE", NA, NA
) %>% 
  write_csv(here::here("output", "desmith_study.csv"))

tribble(
  ~`Study Code`, ~`Study Name`, ~Program, ~dbGaP, ~`Virtual Biorepository Contact`,
  "X01-Hakon", "Genetic Underpinnings of the Multifactorial 
  Phenotype of Trisomy 21 Patients Unveiled by Multi-Omics Approaches", 
  "INCLUDE", NA, NA
) %>% 
  write_csv(here::here("output", "hakon_study.csv"))
