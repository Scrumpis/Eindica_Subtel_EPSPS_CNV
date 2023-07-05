#Nicholas A. Johnson
#Dr. Eric Patterson's Lab
#Michigan State University
#2022.12.14
#Last used R-Version: 4.3.1
#Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation 
#confers glyphosate resistance in Eleusine indica.
#Supp. Fig. 4: Differential expression of eight glyphosate-resistant versus
#eight glyphosate-susceptible Eleusine indica individuals.


#Prior data wrangling:
#Eleusine indica glyphosate-resistant and -susceptible Illumina Paired-End cDNA 
#reads mapped with HiSat2 against E.indica GS transcripts pulled from 
#E_indica.gff3 annotation file using gffread. Labels created for all genes
#contained within the EPSPS-Cassette.


# Setup #
#Clear environment
rm(list=ls())

#Set working directory
setwd("/path/to/EindicaRS_edgeR/")

#Load libraries
library(edgeR)
library(tidyverse)
library(ggrepel)

#Get package versions from current session
sessionInfo()


# EdgeR #
#Define groups: 1 = resistant; 2 = susceptible
group <- factor(c(2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1))

#Define variables
x <- read.table("data/EindicaRS.counts.v2.txt", header = TRUE, row.names = "gene_ids")
y <- DGEList(counts=x, group = group)

#Check that samples look right
y$samples

#Filter out lowly-expressed genes to reduce their influence on false discovery 
#rate, then check that samples still look right.
filtered_y <- filterByExpr(y)
summary(filtered_y)
table(filtered_y)
y <- y[filtered_y, , keep.lib.sizes=FALSE]
y$samples

#Normalize libraries to account for highly-expressed genes overwhelming 
#data from lower-expressed genes, the RNA composition effect. TMM normalization 
#used where "the majority (more than half) of the genes are believed to be not 
#differentially expressed between any pair of the samples". Then check what 
#the normalization factors are; these factors should multiply to unity.
y <- calcNormFactors(y)
y$samples

#Define model design matrix. If all comparisons are with reference to the 
#first group, include an intercept column.  
design <- model.matrix(~group, data = y$samples)
design

#Estimate dispersion with "robustification" against potential outlier genes, 
#report the dispersion, and plot dispersion.
y <- estimateDisp(y, design, robust = TRUE)
y$common.dispersion

#Perform quasi-likelihood F-tests and plot QL dispersion, 
#again with "robustification"
fit <- glmQLFit(y, design, robust=TRUE)
plotQLDisp(fit)

#Plot samples with multi-dimensional scaling to see if they group according 
#to treatment, sample, type, or something expected.
plotMDS(y)

#Calculate DE using glmQLFTest, "the QL F-test is preferred as it reflects 
#the uncertainty in estimating the dispersion for each gene. It provides a 
#more robust and reliable error rate control when the number of replicates is 
#small." A my.contrasts object is not needed because there is an intercept column.
qlf.resistant.v.susceptible <- glmQLFTest(fit)
write.table(qlf.resistant.v.susceptible$table, "data/resistant.v.susceptible.txt")
plotQLDisp(qlf.resistant.v.susceptible)


# Create table of differentially expressed genes with below thresholds #
#Add a column of NAs
qlf.resistant.v.susceptible$table$diffexpressed <- "NO"

#If log2Foldchange > 0.6 and pvalue < 0.05, set as "UP" 
qlf.resistant.v.susceptible$table$
  diffexpressed[qlf.resistant.v.susceptible$table$logFC > 1 & 
                  qlf.resistant.v.susceptible$table$PValue < 0.01] <- "UP"
#If log2Foldchange < -0.6 and pvalue < 0.05, set as "DOWN"
qlf.resistant.v.susceptible$table$
  diffexpressed[qlf.resistant.v.susceptible$table$logFC < -1 & 
                  qlf.resistant.v.susceptible$table$PValue < 0.01] <- "DOWN"


# Add EPSPS-Cassette gene labels #
#Create a new column "delabel" to de, that will contain the name of genes 
#differentially expressed (NA in case they are not)
qlf.resistant.v.susceptible$table$delabel <- 
  read.csv("data/gene_names_v2.csv", header = FALSE)


# Volcano Plot #
#Legend title for ggplot
legend_title <- "Differential\nExpression"

#Volcano plot main code
ggplot(data=qlf.resistant.v.susceptible$table, aes(x= qlf.resistant.v.susceptible$table$logFC, 
                    y=-log10(qlf.resistant.v.susceptible$table$PValue),
                    col=diffexpressed, label= delabel$V2)) +
  labs(x="Log2 Fold Change", y="-Log10 p-Value") +
  geom_point(size = 2.5) +
  theme_minimal() +
  theme(text = element_text(size = 18, face = "bold")) +
  scale_color_manual(legend_title,values=c("blue", "grey", "red"),
                     labels =  c("Under", "No", "Over")) +
  guides(color = guide_legend(reverse=TRUE)) +
  geom_vline(xintercept=c(-1, 1), col="black") +
  geom_hline(yintercept=-log10(0.01), col="black") +
  #add labels to genes
  geom_label_repel(aes(label=qlf.resistant.v.susceptible$table$delabel$V2), 
                   box.padding = 0.5, segment.size = 1, max.overlaps = Inf, 
                   color = "black", size = 8, fontface = "bold", 
                   fill = alpha(c("olivedrab1"),0.85))

#To view the plot best, export to SVG or PNG. It will look funky in the R-Studio
#plot preview but worked well on a poster when exported to SVG with increased
#dimensions. The included png example is 600 wide x 600 high 
