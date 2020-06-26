library(tidyverse)
library(ggplot2)

#load dataset
genome_file <- "genomes_desc.csv"
genome_data <- read_csv(genome_file)

symb <- genome_data %>% filter(symbiotic != "non symbiotic")

# plot

symb %>% ggplot(aes(x=symbiotic))+
  geom_histogram(stat = "count")


ggsave("symbiotic_genomes.png")
