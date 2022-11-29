library(tidyverse)

# 1. Read in all csv in the folder
records <-  list.files(pattern="*.csv")
read_records <-  lapply(records, read.csv)  

# 2. Combine the files into a large dataframe. 
records_to_check <- do.call(rbind, myfiles)
glimpse(records_to_check)
names(records_to_check)

# 3. Detect the actions disclosing data
records_to_check %>% 
      filter(str_detect(Screen.Action, "Show Patients")) %>% 
      write.csv("results/action_checking_results.csv")