# Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation confers glyphosate resistance in *Eleusine indica*
DOI: [10.21203/rs.3.rs-2587355/v1](https://www.researchsquare.com/article/rs-2587355/v1)  
Repo name: [Eindica_Subtel_EPSPS_CNV](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV)

### Fig. 1: Overview of the glyphosate-susceptible *Eleusine indica* genome.
### Circos Plot  

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
**Synteny Ideogram**

### Fig. 3: Copy number variation in chromosome three across eight glyphosate-resistant and eight glyphosate-susceptible *Eleusine indica* individuals.

### Fig. 5: Relatedness of EPSPS-cassette subtelomere sequence to chromosomal subtelomeric sequences of the glyphosate-resistant and glyphosate-susceptible *Eleusine indica* genomes.
### Tree to visualize relatedness with table as legend

[Eindica_Subtel_Tree](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/tree/main/Eindica_Subtel_Tree) contains `Eindica_Subtel_Tree_V5.R` to create the below tree as well as the only needed source file, `Eindica_R_S_EPSPS_SubTels.afa.raxml.bestTree.clean_labels`. Make sure to change the working directory in the Rscript.

![image](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV/assets/91402988/3edaded2-90a5-4101-9193-1c84932aefa2)

At the bottom of `Eindica_Subtel_Tree_V5.R` you will find the code for a version of the tree without the table legend, just for fun.  

### Supp. Fig. 4: Differential expression of eight glyphosate-resistnt versus eight glyphosate-susceptible *Eleusine indica* individuals.
