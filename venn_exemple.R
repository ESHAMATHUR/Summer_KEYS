library(dplyr)
library(tidyverse)
library(stringr)
library(VennDiagram)
library(RColorBrewer)

#+++++++++++++++++++++++++
# Import data
# and cleanup
#+++++++++++++++++++++++++
file <- "../Raw_Data/comparing_vibrant_virsorter.csv"
comp_data <- read_csv(file)

#+++++++++++++++++++++++++
# Venn diagram
# VirSorter/Vibrant
#+++++++++++++++++++++++++

# color choice
myCol <- c("#B3E2CD", "#FDCDAC")

#figure 

venn.diagram(
  x = list(
    comp_data %>% filter(!is.na(name_vibrant)) %>% select(contig_id) %>% unlist() , 
    comp_data %>% filter(!is.na(name_virsorter)) %>% select(contig_id) %>% unlist() 
  ),
  category.names = c("Vibrant", "VirSorter"),
  filename = "ven_all_prophages.png",
  output = TRUE ,
  
  # Output features
  imagetype="png" ,
  height = 700 , 
  width = 700 , 
  resolution = 250,
  compression = "lzw",
  
  # Circles
  lwd = 2,
  lty = 'blank',
  fill = myCol,
  
  # Numbers
  cex = .6,
  fontface = "bold",
  fontfamily = "sans",
  
  # Set names
  cat.cex = 0.6,
  cat.fontface = "bold",
  cat.default.pos = "outer",
  cat.fontfamily = "sans"
)
