# Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation confers glyphosate resistance in *Eleusine indica*
DOI: [10.21203/rs.3.rs-2587355/v1](https://www.researchsquare.com/article/rs-2587355/v1)  
Repo name: [Eindica_Subtel_EPSPS_CNV](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV)


### <ins>Fig. 1: Overview of the glyphosate-susceptible *Eleusine indica* genome.</ins>
#### *Circos Plot*  

#### Prior data wrangling:
- a. Karyotype file (`eindicakaryotype.circos`) is a space delimited genome index that was generated from the assembled GS genome using standard command line tools/languages, like `grep` and `AWK`.
- b. Gene density file (`geneCoverageHeatMap.circos`) gives normalized gene density in 500Kb genomic windows. Genome windows were made with [bedtools](https://github.com/arq5x/bedtools2). Total base pairs contained within genes were counted in each window from the .gff annotation file, divided by total base pairs in each window (500Kb), and normalized. Genes were annotated with the [International Weed Genomics Consortium Annotation Pipeline](https://github.com/PattersonWeedLab/IWGC_annotation_pipeline).
- c. Transposable element genomic coverage for _Gypsy_ (`gypsycoverage.circos`), _Copia_ (`copiacoverage.circos`), and all transposable elements excluding _Gypsy_ and _Copia_ elements (`othercoverage.circos`) was calculated in terms of total base pairs contained in TEs divided by total base pairs in each 500Kb bedtools-generated genomic window. TEs were annotated with [RepeatModeler](https://github.com/Dfam-consortium/RepeatModeler).
- d. Transposable element density file (`TE_total_coverage.circos`) gives normalized TE density in 500Kb genomic windows. TE element density windows were generated in the same fashion as `geneCoverageHeatMap.circos`.
  
#### Circos generation:
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


### <ins>Fig. 3: Copy number variation in chromosome three across eight glyphosate-resistant and eight glyphosate-susceptible *Eleusine indica* individuals.</ins>
#### *CNV Ideogram*  

#### Prior data wrangling:
Illumina resequencing data of 8 GR and 8 GS Eindica individuals was aligned to their corresponding GR or GS genomes using [HiSat2](https://github.com/DaehwanKimLab/hisat2) (version 2.1.0). [CNVnator](https://github.com/abyzovlab/CNVnator) (version 0.4.1) was used with these alignments to assess copy number variation across the genomes in terms of read depth. The resulting CNV files for chromosome three, the native location of EPSPS, were visualized using `EindicaRIdeogram_v5.R`.  

#### Ideogram generation:
[Eindica_EPSPS_CNV_Ideogram](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_EPSPS_CNV_Ideogram) contains `EindicaRIdeogram_v5.R` to create the below CNV ideograms and the associated source files in `Eindica_EPSPS_CNV_Ideogram/data`. Note: The publication version of Fig. 3 combines these two figures into one and adds additional visuals using [Microsoft PowerPoint](https://www.microsoft.com/en-us/microsoft-365/powerpoint).

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/281c2566-1127-496f-b234-41e42dfc9e8f)  

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/c7b59be0-0fba-4b8e-9034-0dc9a501095f)
  

### <ins>Fig. 5: Relatedness of EPSPS-cassette subtelomere sequence to chromosomal subtelomeric sequences of the glyphosate-resistant and glyphosate-susceptible *Eleusine indica* genomes.</ins>
#### *Tree to visualize relatedness with table as legend*

##### Prior data wrangling:
Subtelomeric repeat units from across the GR and GS genomes which are >86% similar in DNA sequence to the EPSPS-Cassette 451bp subtelomere repeat unit were obtained via [BLAST](https://github.com/ncbi/blast_plus_docs). The extracted subtelomeric repeat units were aligned to eachother and the EPSPS-Cassette subtelomere repeat unit with [MUSCLE5](https://github.com/rcedgar/muscle) before creating a tree with [RAXML-NG](https://github.com/amkozlov/raxml-ng). This tree was visualized using `Eindica_Subtel_Tree_V5.R`.  

##### Tree generation:
[Eindica_Subtel_Tree](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_Subtel_Tree) contains `Eindica_Subtel_Tree_V5.R` to create the below tree as well as the only needed source file, `Eindica_R_S_EPSPS_SubTels.afa.raxml.bestTree.clean_labels`. Make sure to change the working directory in the Rscript.  

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/3edaded2-90a5-4101-9193-1c84932aefa2)
<sup><sub>The above plot shows the relatedness of subtelomeric sequences found on the glyphosate-resistant (R; red) and glyphosate-susceptible (S; blue) _E. indica_ genomes to the subtelomeric sequence found on the _EPSPS-cassette_ (green). Chromosomes at branch tips further from cassette are less related to cassette than chromosomes closer to cassette. Branch distance is based on BLAST similarity. The sequences with the highest relatedness to the _EPSPS-cassette_ subtelomere sequence on each chromosome were used as representative sequences to make a tree.</sub></sup>    
  
At the bottom of `Eindica_Subtel_Tree_V5.R` you will find the code for a version of the tree without the table legend, just for fun.  
  
  
### <ins>Supp. Fig. 4: Differential expression of eight glyphosate-resistant versus eight glyphosate-susceptible *Eleusine indica* individuals.</ins>
#### *Volcano plot*  

##### Prior data wrangling:
RNA-Seq data from all 16 _E. indica_ individuals 
  
##### Volcano plot generation:

