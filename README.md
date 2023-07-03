# Subtelomeric 5-enolpyruvylshikimate-3-phosphate synthase copy number variation confers glyphosate resistance in *Eleusine indica*
DOI: [10.21203/rs.3.rs-2587355/v1](https://www.researchsquare.com/article/rs-2587355/v1)  
Repo name: [Eindica_Subtel_EPSPS_CNV](https://github.com/Scrumpis/Eindica_Subtel_EPSPS_CNV)

### Fig. 1: Overview of the glyphosate-susceptible *Eleusine indica* genome. 
**Circos Plot**  

Install Circos directly from Circos website or from Conda.

If you see this error when installing via Conda...
`UnsatisfiableError: 
Note that strict channel priority may have removed packages required for satisfiability.`
Try running the below command.
`conda create --strict-channel-priority --override-channels --channel conda-forge --channel bioconda --channel defaults --name circos -c bioconda circos`

This Circos plot uses Arial font, which does not come preinstalled. Please move `arial.ttf` from the included dir to the `/path/to/opt/anaconda3/envs/circos/fonts` on your system to reproduce the included plot with Arial font, or use a default font by editing the `eindica_circos_006/eindica_circos.conf` file as shown below.

Run the below command from the main /Circos directory.

`circos -conf eindica_circos_006/eindica_circos.conf -outputdir eindica_circos_006/tmp`

The below Circos plot will be produced. Note: a, b, c, and d were added to the final image using Inkspace.

### Fig. 2: An ideogram of glyphosate-susceptible and -resistant *Eleusine indica* genome alignment.
**Synteny Ideogram**

### Fig. 3: Copy number variation in chromosome three across eight glyphosate-resistant and eight glyphosate-susceptible *Eleusine indica* individuals.

### Fig. 5: Relatedness of EPSPS-cassette subtelomere sequence to chromosomal subtelomeric sequences of the glyphosate-resistant and glyphosate-susceptible *Eleusine indica* genomes.

### Supp. Fig. 4: Differential expression of eight glyphosate-resistnt versus eight glyphosate-susceptible *Eleusine indica* individuals.
