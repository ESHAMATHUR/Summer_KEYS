library(tidyverse)
library(ggplot2)

#load dataset
vir_file <- "VirSorter_merge.csv"
vir_data <- read_csv(vir_file)

#count nb prophages by genomes
count <- vir_data %>% group_by(type, sample) %>% tally()

#boxplot
count %>% ggplot(aes(x=type, y=n, color=type))+
  geom_boxplot() +
  ylab("nb of prophage per genome") +
  ggtitle("Prophages in symbiotic/non-symbiotic Nostoc")

ggsave("plot_prophage.png")
