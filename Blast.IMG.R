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

######## load best hits table
best_hits <- "../Raw_Data/BLAST_IMG_besthits.csv"
best_hitsdata <- read_csv(best_hits)

# load table name
table_name <- "../Raw_Data/comparing_vibrant_virsorter.csv"
names<- read_csv(table_name)

#join tables
merge <- full_join(names,best_hitsdata, by=c("contig_id","name_vibrant", "name_virsorter"))

# group and count the contigs with hits or not
count <- merge %>% group_by(is.na(hit_id)) %>% tally() %>% rename("novel_phage"="is.na(hit_id)")

#plot
count %>% ggplot(aes(x=novel_phage, y=n, fill=novel_phage))+
  geom_bar(stat="identity")
ggsave("../Graphs_Data/blast_IMG_results.png")
