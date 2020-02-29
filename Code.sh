# Installation
## Install requirements using conda
conda install -c bioconda stringtie==2.1.1
conda install -c bioconda bioconductor-ballgown

## tablemaker is provided as binary (Previously downloaded)
## ./tablemaker-2.1.1.Linux_x86_64/tablemaker

# Files
## Download bam files
wget http://www.genoscope.cns.fr/externe/ONT_mouse_RNA/data/transcriptome/RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam
wget http://www.genoscope.cns.fr/externe/ONT_mouse_RNA/data/transcriptome/RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam

# Transcript assembly
## -R parameter is necessary for long reads
stringtie -R RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam  > liver.gtf
stringtie -R RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam  > brain.gtf

## 1000 lines of GTF
head -n 1000 liver.gtf > liver1000lines.gtf
head -n 1000 brain.gtf > brain1000lines.gtf

# Tablemaker
./tablemaker-2.1.1.Linux_x86_64/tablemaker -q -W -G liver.gtf RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam -o brain
./tablemaker-2.1.1.Linux_x86_64/tablemaker -q -W -G liver.gtf RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam -o liver


R CMD BATCH load.r

