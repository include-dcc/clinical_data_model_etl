
### Functions to get unique values from an unharmonized dataset to compare to dictionary

library(tidyverse)

# Get unique values for a single column type
get_unique_values_by_coltype <- function(dataset, coltype) {
  dataset %>% 
    select(where(paste0("is.", coltype))) %>% 
    pivot_longer(cols = everything(),
                 names_to = "original_header",
                 values_to = "unique_values") %>% 
    group_by(original_header) %>% 
    summarize(values = paste(unique(unique_values), collapse = "; "))
}

# Get unique values for every column type and bind into a single dataframe
get_all_unique_values <- function(dataset) {
  
  dataset %>% 
    summarise_all(class) %>% 
    slice(1) %>% 
    unlist() %>% 
    unique() %>%   
    map(\(x) get_unique_values_by_coltype(x, dataset = dataset)) %>% 
    bind_rows() %>% 
    arrange(tolower(original_header))
}