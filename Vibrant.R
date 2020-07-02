library(tidyverse)
library(ggplot2)

#load dataset
vibrant_file <- "../Raw_Data/Vibrant_merge.csv"
vibrant_data <- read_csv(vibrant_file)

#count nb prophages by genomes
count <- vibrant_data %>% group_by(type, sample) %>% tally()

#boxplot
count %>% ggplot(aes(x=type, y=n, color=type))+
  geom_boxplot() +
  ylab("nb of prophage per genome") +
  ggtitle("Prophages in symbiotic/non-symbiotic Nostoc")

ggsave("plot_prophage_vibrant.png")

#######################################################
#load VirSorter
VirSorter_file <- "../Raw_Data/VirSorter_merge.csv"
VirSorter_data <- read_csv(VirSorter_file)
VirSorter_data <- VirSorter_data %>% select(type, sample, Fragment) %>% mutate(tool="VirSorter")


#prepare Vibrant Data
vibrant_data <- vibrant_data %>%rename("Fragment"="sequence_name") %>% mutate(tool="Vibrant")

#merge in 1 table
all_data <- bind_rows(VirSorter_data, vibrant_data) %>% group_by(type, sample, tool) %>% tally()

#boxplot
plot <- all_data %>% ggplot(aes(x=type, y=n, color=type))+
  geom_boxplot() +
  ylab("nb of prophage per genome") +
  ggtitle("Prophages in symbiotic/non-symbiotic Nostoc")

plot + facet_grid(.~ tool)

ggsave("../Graphs_Data/number_prophages_genomes.png")
