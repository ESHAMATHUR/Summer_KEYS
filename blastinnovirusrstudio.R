library(tidyverse)
library(ggplot2)

#load dataset
blast_file <- "results_blastinnovir_merged.csv"
blast_data <- read_csv(blast_file)

#clean dataset
matches <- blast_data %>% filter(length_match >= 500)

#save in file
write_csv(matches, "relevant_results.csv")
