#Nicholas A. Johnson
#Dr. Eric Patterson's Lab at Michigan State University
#2022.09.09
#Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation 
#confers glyphosate resistance in Eleusine indica.
#Fig. 5: Relatedness of EPSPS-cassette subtelomere sequence to chromosomal 
#subtelomeric sequences of the glyphosate-resistant and glyphosate-susceptible 
#Eleusine indica genomes. 

#Prior data wrangling:
#Subtelomeric repeat units from across the GR and GS genomes which are >86% 
#similar in DNA sequence to the EPSPS-Cassette 451bp subtelomere repeat unit
#were obtained via BLAST. The extracted SubTel repeat units were aligned to 
#eachother and the EPSPS-Cassette subtelomere unit with MUSCLE before 
#creating a tree with RAXML-NG. This tree was visualized using this R script.


# Setup #
#Load libraries
library(ggplot2)
library(tidyverse)
library(ggpubr)
library(ggtree)
library(cowplot)

#Clear environment
rm(list=ls())

#Set working directory
setwd("/path/to/Eindica_Subtel_Tree/")

#Load tree file
df<-read.tree('Eindica_R_S_EPSPS_SubTels.afa.raxml.bestTree.clean_labels')


# Table Legend #
legend <- structure(list(
Chr = c("EPSPS","3.2R","4R","4S","6S","7.1R","1R","8R","8S","2S","2R"),
N = c(1,2,2,3,3,2,2,2,3,3,2)),
row.names = c(NA, -11L), class = "data.frame")

summary.table <-
  structure(list(
    "Subtelomeric\nRepeat" = c("Cassette","Chr 3.2R","Chr 4R","Chr 4S","Chr 6S","Chr 7.1R","Chr 1R","Chr 8R","Chr 8S","Chr 2S","Chr 2R"),
    Similarity = c("-","99.56%", "98.88%", "98.88%", "96.88%", "96.44%", "95.78%", "87.11%", "87.11%", "86.99%", "86.3%")
  ), row.names = c(NA, -11L), class = "data.frame")

p2 <- ggtexttable(summary.table, rows = NULL, theme = ttheme(base_size = 6.5))
p2 <- ggtexttable(summary.table, rows = NULL, theme = ttheme(base_size = 6.5)) %>%
  thead_add_border() %>%
  tab_add_vline() %>%
  table_cell_bg(row = 2:12, column = 1:2, fill = NULL) %>%
  table_cell_font(row = 2, column = 1:tab_ncol(p2), size = 7, color = "darkgreen") %>% 
  table_cell_font(row = 3, column = 1:tab_ncol(p2), size = 7, color = "red") %>% 
  table_cell_font(row = 4, column = 1:tab_ncol(p2), size = 7, color = "red") %>% 
  table_cell_font(row = 5, column = 1:tab_ncol(p2), size = 7, color = "blue") %>% 
  table_cell_font(row = 6, column = 1:tab_ncol(p2), size = 7, color = "blue") %>% 
  table_cell_font(row = 7, column = 1:tab_ncol(p2), size = 7, color = "red") %>% 
  table_cell_font(row = 8, column = 1:tab_ncol(p2), size = 7, color = "red") %>% 
  table_cell_font(row = 9, column = 1:tab_ncol(p2), size = 7, color = "red") %>% 
  table_cell_font(row = 10, column = 1:tab_ncol(p2), size = 7, color = "blue") %>% 
  table_cell_font(row = 11, column = 1:tab_ncol(p2), size = 7, color = "blue") %>% 
  table_cell_font(row = 12, column = 1:tab_ncol(p2), size = 7, color = "red")


# Radial Tree #
tree <- ggtree(tr=df, layout='circular', size=0.75) + 
  geom_tiplab(align=TRUE, linesize=0.75, geom = "label", size=4.5, aes(colour = c("GlyRes", "EPSPS",
                                                                      "GlySus", "GlyRes", 
                                                                      "GlyRes", "GlySus", 
                                                                      "GlyRes", "GlyRes", 
                                                                      "GlySus", "GlySus", 
                                                                      "GlyRes", "black", 
                                                                      "black", "black", 
                                                                      "black", "black", 
                                                                      "black", "black", 
                                                                      "black", "black"))) +
                                                                      
  scale_color_manual(NULL, values=c(EPSPS = "darkgreen", GlyRes = "red", GlySus = "blue"), labels = rep("", length(unique(legend$N)))) +
  theme(
    legend.key = element_rect(fill = NA, colour = NA),
    legend.spacing.y = unit(2, "pt"),
    legend.background = element_blank()
  ) +
  guides(color = guide_legend(byrow = TRUE))


# Print Figures #
#Print Tree:
p <- tree + theme(legend.position = "none")
ggdraw(p, xlim = c(-0.06, 1.5)) + 
#Print Table Legend:  
  draw_plot(p2, x = 0.78)





### BONUS TREE ###
#Tree with legend replacing table:
#Original tree before deciding to include table as legend.

# Radial Tree #
ggtree(tr=df, layout='circular', size=1) + 
  geom_tiplab(align=TRUE, linesize=1, geom = "label", size=5, aes(colour = c("GlyRes", "Cassette",
                                                                                "GlySus", "GlyRes", 
                                                                                "GlyRes", "GlySus", 
                                                                                "GlyRes", "GlyRes", 
                                                                                "GlySus", "GlySus", 
                                                                                "GlyRes", "black", 
                                                                                "black", "black", 
                                                                                "black", "black", 
                                                                                "black", "black", 
                                                                                "black", "black"))) +

# Original Legend #
scale_color_manual(values=c(Cassette = "darkgreen", GlyRes = "red", GlySus = "blue")) +
theme(legend.position = c(0.9,0.6),
      text = element_text(size = 15, face = "bold"),
      legend.title = element_blank(),
      legend.key = element_rect(fill = c("red", "blue", "darkgreen")))
