###############################################################################


## Creating NF-core bulk RNA-Seq cript                                       ##


module purge
module load Nextflow/21.10.3
module load Singularity/3.6.4

export NXF_WORK=`echo $PWD/work/ | sed 's:^/camp/stp/babs/working/:/camp/stp/babs/scratch/:'`
if [ ! -d '$NXF_WORK' ]; then
    ln -s $NXF_WORK .
fi
export NXF_SINGULARITY_CACHEDIR=/camp/apps/misc/stp/babs/nf-core/singularity/rnaseq/3.6/

sbatch --time=12:00:00 --wrap ' \
nextflow run nf-core/rnaseq \
-r 3.6 \
--input /camp/stp/babs/working/boeings/Projects/goulda/adrien.franchet/472A_brains_from_drosophila_larvae_RN21220/workdir/bulkRNAseq_workflow/design/RN21220test.NFcore.samplesheet.file.csv \
--outdir /camp/stp/babs/working/boeings/Projects/goulda/adrien.franchet/472A_brains_from_drosophila_larvae_RN21220/workdir/ \
-profile crick \
--aligner star_rsem \
--rsem_index /camp/svc/reference/Genomics/babs/drosophila_melanogaster/ensembl/BDGP6/release-89/genome_idx/rsem/star/100bp \
--email stefan.boeing@crick.ac.uk \
--fasta /camp/svc/reference/Genomics/babs/drosophila_melanogaster/ensembl/BDGP6/release-89/genome/Drosophila_melanogaster.BDGP6.dna_sm.toplevel.fa \
--gtf /camp/svc/reference/Genomics/babs/drosophila_melanogaster/ensembl/BDGP6/release-89/gtf/Drosophila_melanogaster.BDGP6.89.rnaseqc.gtf \
' --job-name=NFCR_RN21220test -c 12 --mem-per-cpu=7000 -o NFC.slurm
