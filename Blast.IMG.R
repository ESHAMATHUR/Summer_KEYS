library(tidyverse)
library(ggplot2)

#load dataset
BLASTIMG_file <- "../Raw_Data/BLAST_IMGVR_results.csv"
BLASTIMG_data <-read_csv(BLASTIMG_file)

#filter results by perId and length
BLASTIMG_data_filt <-BLASTIMG_data %>% filter(perid >=75) %>% filter(length>=500)

#best hit
BLASTIMG_data_best <- BLASTIMG_data_filt %>% group_by(query_id) %>% top_n(n=1, wt=bitscore)

#unique contigs
number_hits <- BLASTIMG_data_best %>% select(query_id) %>% unique()
