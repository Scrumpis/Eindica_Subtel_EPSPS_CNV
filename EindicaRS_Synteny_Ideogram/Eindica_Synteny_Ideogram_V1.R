#Dr. Eric Patterson & Nicholas A. Johnson
#Michigan State University
#2022.12.10
#Last tested R version: 4.3.1
#Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation 
#confers glyphosate resistance in Eleusine indica.
#Fig. 2: An ideogram of glyphosate-susceptible and -resistant Eleusine indica genome alignment.


# Prior data wrangling #
#Karyotype is from the genome.fai file. Its just a list of chromosomes and thier length.  The syntenty file is generated like so:
  
#minimap2 -cx asm20 -t 14 Eleusine_indica_S.v01.fa Eleind_GlyRes_v01.genome_v01.fa > EleInS_v_EleInR.paf

#ragtag.py paf2delta EleInS_v_EleInR.paf > EleInS_v_EleInR.delta

###Show-coords is from the mummer4 package
#show-coords -lTH EleInS_v_EleInR.delta > EleInS_v_EleInR.coords

#The coords files are then turned into the synteny file manually in excel.


# Setup #
#Load libraries
library(RIdeogram)

#Clear environment
rm(list=ls())

#Set working directory
setwd("/path/to/EindicaRS_Synteny_Ideogram/")

#Load data
eIndica_Karyotype <- read.table("data/RvsS.dualKaryotype.txt", sep = "\t", header = T, stringsAsFactors = F)
eIndica_Synteny <- read.table("data/RvsS.dualsynteny.cis.txt", sep = "\t", header = T, stringsAsFactors = F)


# Plot ideogram #
ideogram(karyotype = eIndica_Karyotype, synteny = eIndica_Synteny, label_type = "marker")
convertSVG("chromosome.svg", device = "png")
