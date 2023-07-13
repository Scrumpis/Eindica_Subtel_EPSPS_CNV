# Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation confers glyphosate resistance in *Eleusine indica*
DOI: [10.21203/rs.3.rs-2587355/v1](https://www.researchsquare.com/article/rs-2587355/v1)  
GitHub Repo: [Eindica_Subtel_EPSPS_CNV](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV)  
Repo Author: [Nicholas A. Johnson](https://github.com/Scrumpis)  

------------------


### <ins>Omic Data:</ins>
_The below data is included for the sake of transparency and is not required to create any of the plots, which are self-contained within their own directories._
- CoGe: [Glyphosate-Susceptible](https://genomevolution.org/coge/GenomeInfo.pl?gid=66361) and [Glyphosate-Resistant](https://genomevolution.org/coge/GenomeInfo.pl?gid=66364) _Eleusine indica_ assembled genomes and annotation files

------------------

### <ins>Fig. 1: Overview of the glyphosate-susceptible *Eleusine indica* genome.</ins>
#### *Circos Plot*  

#### Prior data wrangling:
- **a.** Karyotype file (`eindicakaryotype.circos`) is a space delimited genome index that was generated from the assembled [GS genome](https://genomevolution.org/coge/GenomeInfo.pl?gid=66361) using standard command line tools/languages, like `grep` and `AWK`.
- **b.** Gene density file (`geneCoverageHeatMap.circos`) gives normalized gene density in 500Kb genomic windows. Genome windows were made with [bedtools](https://github.com/arq5x/bedtools2) (version 2.30.0). Total base pairs contained within genes were counted in each window from the [E_indica.gff3](https://genomevolution.org/coge/GenomeInfo.pl?gid=66361) annotation file, divided by total base pairs in each window (500Kb), and normalized. Genes were annotated with the [International Weed Genomics Consortium Annotation Pipeline](https://github.com/PattersonWeedLab/IWGC_annotation_pipeline).
- **c.** Transposable element genomic coverage for _Gypsy_ (`gypsycoverage.circos`), _Copia_ (`copiacoverage.circos`), and all transposable elements excluding _Gypsy_ and _Copia_ elements (`othercoverage.circos`) was calculated in terms of total base pairs contained in TEs divided by total base pairs in each 500Kb bedtools-generated genomic window. TEs were annotated with [RepeatModeler](https://github.com/Dfam-consortium/RepeatModeler) (version 2.0.2).
- **d.** Transposable element density file (`TE_total_coverage.circos`) gives normalized TE density in 500Kb genomic windows. TE element density windows were generated in the same fashion as the gene density file (`geneCoverageHeatMap.circos`).
- **Region-A** and **Region-B** labels contained within `labels_epsps.circos.txt` are punctuated with highlights on the karyotype track (a.) contained within `highlights_epsps.txt`.
  
#### Circos plot generation:
Install Circos directly from [Circos website](http://circos.ca/software/download/circos/) or from [Conda](https://anaconda.org/bioconda/circos).

If you see this error when installing via Conda...  
`UnsatisfiableError: 
Note that strict channel priority may have removed packages required for satisfiability.`  
  
Try running the below command.  
`conda create --strict-channel-priority --override-channels --channel conda-forge --channel bioconda --channel defaults --name circos -c bioconda circos`  

This Circos plot uses Arial font, which does not come preinstalled. Please move `ArialBold.ttf` from [EindicaGS_Circos](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/EindicaGS_Circos) to `/circos/fonts` (Conda Path: `/path/to/opt/anaconda3/envs/circos/fonts`) on your system to reproduce the included plot with Arial font.

Alternatively, use a font included with Circos by editing the `eindica_circos_006/eindica_circos.conf` file as shown below.  
```
<fonts>

default = fonts/modern/cmunsx.otf
#default = fonts/ArialBold.ttf

</fonts>
```

Run the below command from the directory [EindicaGS_Circos](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/EindicaGS_Circos).  

`circos -conf eindica_circos_006/eindica_circos.conf -outputdir eindica_circos_006/tmp`

The below Circos plot will be produced. Note: a, b, c, and d labels in the publication version of the figure were added to the final image using [Inkspace](https://inkscape.org/).

![eindicacircos](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/4a6a3865-28f6-4c1b-b7a4-c1999f33a80a)
<sup><sub>The above Circos plot shows (a.) the length (Mb) of chromosomes one through nine as an index with corresponding (b.) gene-rich (blue) and gene-poor (yellow) genomic regions, (c.) *Gypsy* (red), *Copia* (blue), and other (black) transposable element family coverage across the genome (scale: 0-50%), (d.) transposable element rich (red) and transposable element poor (yellow) genomic regions, and the native locations of Region-A (red label) and Region-B (blue label) of the subtelomeric *EPSPS-Cassette*.</sub></sup>

I have also included a commented out `<links>` section in `eindica_circos.conf` which was not included in Fig. 1 of the publication. If you are curious about what links will look like between interchromosomal syntenic regions which are 14.5Kb or longer, uncomment the `<links>` section.

---------------  
  
### <ins>Fig. 2: An ideogram of glyphosate-susceptible and -resistant *Eleusine indica* genome alignment.</ins>
#### *Synteny Ideogram*

#### Prior data wrangling:
GS and GR _Eindica_ genomes were aligned to eachother using [minimap2](https://github.com/lh3/minimap2) (version 2.24) and the resulting `.paf` was converted into a `.coords` file using [RagTag](https://github.com/malonge/RagTag) (version 2.1.0) and [MUMmer4](https://github.com/mummer4/mummer) (version 4.0.0) as shown below.
```bash
minimap2 -cx asm20 -t 14 EleInS.fa EleInR.fa > EleInS_v_EleInR.paf

#ragtag.py is from RagTag
ragtag.py paf2delta EleInS_v_EleInR.paf > EleInS_v_EleInR.delta

#Show-coords is from MUMmer4
show-coords -lTH EleInS_v_EleInR.delta > EleInS_v_EleInR.coords
```
The resulting coords file was given an additional column `fill` to colorize links using command line and saved as `RvsS.dualsynteny.cis.txt`. `RvsS.dualKaryotype.txt` is genome index of both the GS and GR genomes with four additional columns (`fill`,	`species`,	`size`,	and `color`) that were added with command line. These files were visualized using `Eindica_Synteny_Ideogram_V1.R`.  

#### Ideogram generation:
[EindicaRS_Synteny_Ideogram](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_Synteny_Ideogram) contains `Eindica_Synteny_Ideogram_V1.R` and the only two source files, `RvsS.dualsynteny.cis.txt` and `RvsS.dualKaryotype.txt`. Running the R script will produce the below ideogram. Note: Numbers in boxes above and below the ideogram and bold letter “T”s on the karyotype in the publication version of this figure were added in [Microsoft PowerPoint](https://www.microsoft.com/en-us/microsoft-365/powerpoint).  

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/2a256a6b-91c3-47be-95d5-266992da051b)
<sup><sub>Grey links indicate shared synteny between chromosome pairs. Red links indicate large inversions of synteny between the genomes. Black links represent Region-A and Region-B of the _EPSPS-Cassette_ in their native locations.</sub></sup>  

---------------

### <ins>Fig. 3: Copy number variation in chromosome three across eight glyphosate-resistant and eight glyphosate-susceptible *Eleusine indica* individuals.</ins>
#### *CNV Ideogram*  

#### Prior data wrangling:
Illumina resequencing data of eight GR and eight GS Eindica individuals was aligned to their corresponding GR or GS genomes using [HiSat2](https://github.com/DaehwanKimLab/hisat2) (version 2.1.0). [CNVnator](https://github.com/abyzovlab/CNVnator) (version 0.4.1) was used with these alignments to assess copy number variation across the genomes in terms of read depth. The resulting CNV files for chromosome three, the native location of the _EPSPS_ locus, were visualized using `EindicaRIdeogram_v5.R`.  

#### Ideogram generation:
[Eindica_EPSPS_CNV_Ideogram](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_EPSPS_CNV_Ideogram) contains `EindicaRIdeogram_v5.R` to create the below CNV ideograms and the associated source files in `Eindica_EPSPS_CNV_Ideogram/data`. Note: The publication version of Fig. 3 combines these two figures into one and adds additional visuals using [Microsoft PowerPoint](https://www.microsoft.com/en-us/microsoft-365/powerpoint).

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/db155620-b7fc-4e39-b263-94f9e6eccc19)  

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/49294da7-ba12-4668-af57-2ce58db4e307)

<sup><sub>The above plots show copy number variation in chromosome three across eight glyphosate-resistant and eight glyphosate-susceptible _Eleusine indica_ individuals. The ideogram shows deletions below 0.25x of average read depth (blue color spectrum), copy number variation above 0.25 of average read depth and below 4x of average read depth and with a p-value greater than 0.01 (white), and duplications above 4x of average read depth (red color spectrum) across chromosome three in eight glyphosate-resistant (R) versus eight glyphosate-susceptible (S) _E. indica_ individuals at a scale of (the top plot) full chromosome length (63,742,515 base pairs) and (the bottom plot) the first 5,000,000 base pairs of chromosome three. Band thickness is proportional to the length of the genomic region exhibiting copy number variation. Region-A (green triangle), containing _EPSPS_, and Region-B (purple triangle), the genomic region co-duplicated with _EPSPS_, are consistently duplicated around 25x compared to average read depth in R individuals but are not duplicated in any of the S individuals.</sub></sup>   

---------------

### <ins>Fig. 5: Relatedness of _EPSPS-cassette_ subtelomere sequence to chromosomal subtelomeric sequences of the glyphosate-resistant and glyphosate-susceptible *Eleusine indica* genomes.</ins>
#### *Tree to visualize relatedness with table as legend*

#### Prior data wrangling:
Subtelomeric repeat units from across the GR and GS genomes which are >86% similar in DNA sequence to the _EPSPS-Cassette_ 451bp subtelomere repeat unit were obtained via [BLAST+](https://github.com/ncbi/blast_plus_docs) (version 2.14.0). The extracted subtelomeric repeat units were aligned to eachother and the _EPSPS-Cassette_ subtelomere repeat unit with [MUSCLE5](https://github.com/rcedgar/muscle) (version 5.1.0) before creating a tree with [RAXML-NG](https://github.com/amkozlov/raxml-ng) (version 1.1.0).

#### Tree generation:
[Eindica_Subtel_Tree](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_Subtel_Tree) contains `Eindica_Subtel_Tree_V5.R` to create the below tree as well as the only needed source file, `Eindica_R_S_EPSPS_SubTels.afa.raxml.bestTree.clean_labels`. Make sure to change the working directory in the Rscript.  
  
![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/ada56a77-e70d-4b55-bf46-283dc7a1107a)
<sup><sub>The above plot shows the relatedness of subtelomeric sequences found on the glyphosate-resistant (R; gold) and glyphosate-susceptible (S; blue) _E. indica_ genomes to the subtelomeric sequence found on the _EPSPS-cassette_ (Cassette; green). Chromosomes at branch tips further from Cassette are less related to the _EPSPS-cassette_ than chromosomes closer to Cassette. Branch distance is based on similarity. The sequences with the highest relatedness to the _EPSPS-cassette_ subtelomere sequence on each chromosome were used as representative sequences to make this tree.</sub></sup>   
  
  
At the bottom of `Eindica_Subtel_Tree_V5.R` you will find the code for a version of the tree with a table for a legend (shown below), just for fun. This version worked well for a poster.  
  
![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/3edaded2-90a5-4101-9193-1c84932aefa2)
<sup><sub>The above plot shows the relatedness of subtelomeric sequences found on the glyphosate-resistant (R; red) and glyphosate-susceptible (S; blue) _E. indica_ genomes to the subtelomeric sequence found on the _EPSPS-Cassette_ (green). Chromosomes at branch tips further from cassette are less related to cassette than chromosomes closer to cassette. Branch distance is based on BLAST similarity. The sequences with the highest relatedness to the _EPSPS-Cassette_ subtelomere sequence on each chromosome were used as representative sequences to make a tree.</sub></sup>    
   
---------------  
  
### <ins>Supp. Fig. 4: Differential expression of eight glyphosate-resistant versus eight glyphosate-susceptible *Eleusine indica* individuals.</ins>
#### *Volcano plot*  

#### Prior data wrangling:
Illumina paired-end cDNA reads from eight GR and eight GS _E. indica_ individuals were mapped with [HiSat2](https://github.com/DaehwanKimLab/hisat2) (version 2.1.0) to the GS transcriptome, which was pulled from [E_indica.gff3](https://genomevolution.org/coge/GenomeInfo.pl?gid=66361) annotation file using [gffread](https://github.com/gpertea/gffread) (version 0.12.7). HiSat2 alignments were converted into a counts table `EindicaRS.counts.v2.txt` using [SAMtools](https://github.com/samtools/samtools) (version 1.11). Labels in `gene_names_v2.csv` were created for all genes annotated within Region-A and -B of the _EPSPS-Cassette_ with command line.  
  
#### Volcano plot generation:
The script `EindicaRS_edgeR_v4.R` contained in [EindicaRS_edgeR](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/EindicaRS_edgeR) calculates differential expression using the two-sided quasi-likelihood F-test in [edgeR](https://bioconductor.org/packages/release/bioc/html/edgeR.html), writes the calculations into `resistant.v.susceptible.txt` and plots it into the below volcano plot.  

![volcano_plot_600x600](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/9f0d9488-f230-41ed-b30d-db461b788dfa)  
<sup><sub>The above plot from RNA-Seq data shows over-expressed (red) and underexpressed (blue) genes in GR _E. indica_ individuals with labels for all identified genes within the _EPSPS-Cassette_. Gene labels with a non-integer numerical value represent splice variants of the same gene. Genes below a p-value of 0.01 or a fold change value below two were considered not differentially expressed (grey) between the two treatment groups.
