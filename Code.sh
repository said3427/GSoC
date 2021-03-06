# Said Muñoz Montero - said3427@gmail.com
# Installation
## Install requirements using conda
conda install -y -c bioconda stringtie==2.1.1
conda install -y -c bioconda bioconductor-ballgown

## tablemaker is provided as binary (Previously downloaded)
## ./tablemaker-2.1.1.Linux_x86_64/tablemaker

# Files
## Download bam files
wget http://www.genoscope.cns.fr/externe/ONT_mouse_RNA/data/transcriptome/RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam
wget http://www.genoscope.cns.fr/externe/ONT_mouse_RNA/data/transcriptome/RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam

## Result directory
mkdir results

# Transcript assembly
## -R parameter is necessary for long reads
stringtie -R RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam  > results/liver.gtf
stringtie -R RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam  > results/brain.gtf


## 1000 lines of GTF
head -n 1000 results/liver.gtf > results/liver1000lines.gtf
head -n 1000 results/brain.gtf > results/brain1000lines.gtf

# Tablemaker
./tablemaker-2.1.1.Linux_x86_64/tablemaker -q -W -G results/liver.gtf RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam -o brain
./tablemaker-2.1.1.Linux_x86_64/tablemaker -q -W -G results/liver.gtf RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam -o liver

# R script
## This script load the tablemaker results and extract the first 1000 lines of FPKM
R CMD BATCH load.r

