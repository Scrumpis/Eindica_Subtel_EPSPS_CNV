#Nicholas A. Johnson
#Dr. Eric Patterson's Lab at Michigan State University
#2022.12.28
#Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation 
#confers glyphosate resistance in Eleusine indica.
#Fig. 3: Copy number variation in chromosome three across eight glyphosate-resistant 
#and eight glyphosate-susceptible Eleusine indica individuals.

#Prior data wrangling:
#Illumina resequencing data of 8 GR and 8 GS Eindica individuals was aligned
#to their corresponding GR or GS genomes using HiSat2 (version 2.1.0). CNVnator 
#(version 0.4.1) was used with these alignments to assess copy number variation
#across the genomes in terms of read depth. The resulting CNV files were 
#visualized using the below Rscript.


# Set Up #
#Libraries
library(RIdeogram)
require(RIdeogram)

#Clear environment
rm(list=ls())

#Set working directory
setwd("/path/to/Eindica_EPSPS_CNV_Ideogram/")


# Zoomed-in chromosome 3 ideogram #

chr3_zoomed_karyotype <- read.csv("./data/eindica_chr3_zoomed_karyotype.csv", header = TRUE)

chr3_zoomed_cnv <- read.csv("./data/Eindica_R_S_chr3_zoomed_CNVnator_uncomplemented_R.csv", header = TRUE)

EPSPS_labels <- read.csv("./data/Eindica_EPSPS_markers_Rideogram.csv", header = TRUE)

ideogram(karyotype = chr3_zoomed_karyotype, overlaid = chr3_zoomed_cnv, label = EPSPS_labels, 
         label_type = "marker", width = 196, Lx = 20, Ly = 190, output = "chromosome3zoomed.svg") #switch to Lx = 180 or 190 for scale bars on right side, Lx = 20 on left

convertSVG("chromosome3zoomed.svg", file = "chromosome3zoomed", device = "png", dpi = 1200)


# Full-size chromosome 3 ideogram #

chr3_karyotype <- read.csv("./data/eindica_chr3_karyotype.csv", header = TRUE)

chr3_cnv <- read.csv("./data/Eindica_R_S_chr3_CNVnator_uncomplemented_R.csv", header = TRUE)

EPSPS_labels <- read.csv("./data/Eindica_EPSPS_markers_Rideogram.csv", header = TRUE)

ideogram(karyotype = chr3_karyotype, overlaid = chr3_cnv, label = EPSPS_labels, 
         label_type = "marker", width = 196, Lx = 20, Ly = 190, output = "chromosome3.svg") #Top: Lx = 97, Ly = 5

convertSVG("chromosome3.svg", file = "chromosome3", device = "png", dpi = 1200)
