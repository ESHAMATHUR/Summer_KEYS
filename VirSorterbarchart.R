library(tidyverse)
library(ggplot2)

#load dataset
VirSorterbc_file <- "../Raw_Data/VirSorter_merge.csv"
VirSorterbc_data <- read_csv(VirSorterbc_file)

VirSorterbc_data %>% ggplot(aes(x=Category))+
  geom_bar(stat = "count") +
  facet_grid(.~type)


ggsave("../Graphs_Data/VirSorterbc.png")


