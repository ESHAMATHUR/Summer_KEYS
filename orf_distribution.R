library(tidyverse)
library(ggplot2)

#load dataset
orf_file <- "../Raw_Data/prodigal_orf_results.csv"
orf_data <- read_csv(orf_file)

#count contig id
count <- orf_data %>% group_by(contig_id) %>% tally()


#plot
count %>% ggplot(aes(x=n)) +
  geom_histogram(binwidth = 10, color="black", fill="white")+
  xlab("nb of orf per prophage") +
  geom_vline(aes(xintercept=mean(n)), color="red", linetype="dashed", size=1)

ggsave("../Graphs_Data/orf_distribution.png")
