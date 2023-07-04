# Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation confers glyphosate resistance in *Eleusine indica*
DOI: [10.21203/rs.3.rs-2587355/v1](https://www.researchsquare.com/article/rs-2587355/v1)  
Repo name: [Eindica_Subtel_EPSPS_CNV](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV)

### Fig. 1: Overview of the glyphosate-susceptible *Eleusine indica* genome.
#### *Circos Plot*  

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

I have also included a commented out `<links>` section in `eindica_circos.conf` which was not included in Fig. 1 of the publication. If you are curious about what links will look like between interchromosomal syntenic regions which are 14.5Kb or longer, uncomment the `<links>` section.  
  
  
### Fig. 2: An ideogram of glyphosate-susceptible and -resistant *Eleusine indica* genome alignment.
#### *Synteny Ideogram*

### Fig. 3: Copy number variation in chromosome three across eight glyphosate-resistant and eight glyphosate-susceptible *Eleusine indica* individuals.
#### *CNV Ideogram*  

[Eindica_EPSPS_CNV_Ideogram](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_EPSPS_CNV_Ideogram) contains `EindicaRIdeogram_v5.R` to create the below CNV ideograms and the associated source files in 'Eindica_EPSPS_CNV_Ideogram/data'. Note: The publication version of Fig. 3 combines these two figures into one and adds additional visuals using [Microsoft PowerPoint](https://www.microsoft.com/en-us/microsoft-365/powerpoint).

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/281c2566-1127-496f-b234-41e42dfc9e8f)  

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/c7b59be0-0fba-4b8e-9034-0dc9a501095f)
  

### Fig. 5: Relatedness of EPSPS-cassette subtelomere sequence to chromosomal subtelomeric sequences of the glyphosate-resistant and glyphosate-susceptible *Eleusine indica* genomes.
#### *Tree to visualize relatedness with table as legend*

##### Prior data wrangling:
Subtelomeric repeat units from across the GR and GS genomes which are >86% similar in DNA sequence to the EPSPS-Cassette 451bp subtelomere repeat unit were obtained via [BLAST](https://github.com/ncbi/blast_plus_docs). The extracted subtelomeric repeat units were aligned to eachother and the EPSPS-Cassette subtelomere repeat unit with [MUSCLE5](https://github.com/rcedgar/muscle) before creating a tree with [RAXML-NG](https://github.com/amkozlov/raxml-ng). This tree was visualized using `Eindica_Subtel_Tree_V5.R`.  

##### Tree generation:
[Eindica_Subtel_Tree](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_Subtel_Tree) contains `Eindica_Subtel_Tree_V5.R` to create the below tree as well as the only needed source file, `Eindica_R_S_EPSPS_SubTels.afa.raxml.bestTree.clean_labels`. Make sure to change the working directory in the Rscript.  

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/3edaded2-90a5-4101-9193-1c84932aefa2)

At the bottom of `Eindica_Subtel_Tree_V5.R` you will find the code for a version of the tree without the table legend, just for fun.  

### Supp. Fig. 4: Differential expression of eight glyphosate-resistnt versus eight glyphosate-susceptible *Eleusine indica* individuals.
