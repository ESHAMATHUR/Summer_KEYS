library(ggplot2)
library(tidyverse)

#load IMG file
IMG_file <- "../Raw_Data/IMG_GOLD_env.csv"
IMG_data <- read_csv(IMG_file)

IMG_data <- IMG_data %>% rename("subtype"="GOLD Ecosystem Subtype") 

count_data <- IMG_data %>% group_by(subtype) %>% tally()

count_data %>% ggplot(aes(x=reorder(subtype, -n), y=n, fill=subtype)) +
  geom_bar(stat="identity")+
  xlab("IMG GOLD environment")+
  ylab("nb of hits")


ggsave("../Graphs_Data/BLAST_IMG_env.png")  
  