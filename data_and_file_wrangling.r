mkdir workdir scripts data

git clone git@github.com:decusInLabore/bulkRNAseq_workflow.git

## Customize for project ##

# Edit Main Analysis Part 0 prepare alignment and ...Crick srcipt

# create base design table
# open /camp/stp/babs/working/eastp/analysis/124_GCSF-macrophages_response_to_yeast-H3_ts245.tessa.swanton/experiments/RN22122/ts245/babs/biologic/inputs/analyse_x_GRCm38/experiment_table.csv

# problem: input files could not be loaded
# attempt 1: get rid of spaces in the filenames
#   * copy all input files to data/input_dge

# cp 
# files <- list.files("/camp/stp/babs/working/eastp/analysis/124_GCSF-macrophages_response_to_yeast-H3_ts245.tessa.swanton/experiments/RN22122/ts245/babs/biologic/inputs/analyse_x_GRCm38/results_tables/")
# file.exists(files[1])
# cp -r /camp/stp/babs/working/eastp/analysis/124_GCSF-macrophages_response_to_yeast-H3_ts245.tessa.swanton/experiments/RN22122/ts245/babs/biologic/inputs/analyse_x_GRCm38/results_tables/ /camp/stp/babs/working/boeings/Projects/papayannopoulosv/tessa.swanton/529_rna_seq_visualization_RN22122/data/input_dge/

## convert all empty spaces to underscores ##
find . -type f -name "* *.txt" -exec bash -c 'mv "$0" "${0// /_}"' {} \;

# remove pipes
find . -depth ! -name '.*' -name '*.txt' -exec bash -c '
  for file do
    dir=${file%/*}
    base=${file##*/}
    mv -i -- "$file" "$dir/${base//|/_}"
  done' sh {} +
    
# remove hypen
find . -depth ! -name '.*' -name '*.txt' -exec bash -c '
  for file do
    dir=${file%/*}
    base=${file##*/}
    mv -i -- "$file" "$dir/${base//-/_}"
  done' sh {} +    
    
# remove multipe underscores (run twice to also remove tripple underscores)
find . -depth ! -name '.*' -name '*.txt' -exec bash -c '
  for file do
    dir=${file%/*}
    base=${file##*/}
    mv -i -- "$file" "$dir/${base//__/_}"
  done' sh {} +   