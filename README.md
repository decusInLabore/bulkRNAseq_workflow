# bulkRNAseq_workflow

This vignette is under construction and is continiously updated. 

* Creeate a project directory
* cd into that project directory
* Create required directories
```
mkdir workdir basedata FASTQ_files

cd workdir

git clone git@github.com:decusInLabore/bulkRNAseq_workflow.git

cd bulkRNAseq_workflow


```

# Option 1: Starting from raw FASTQ-files

## Prepare required files
### Sample specification sheet
The easiest is create a basedesign file with the following columns:
* |sample.id|  suggestion for a format: [dataseries] _ [sample.group] _ [replicate]
* |sample.group|
* |dataseries|
* |comp_1|comp_2|...|comp_N|
* |LRT_Treatment|LRT_...|
* |f_experimental_factor_1|f_experimental_factor_2|...
* |dataseries_colors| may be specified in a dataseries_color column with a unique
 hex code (#FF0000) for each dataseries

* sample.group_colors may be specified in a sample.group_color column with one entry per 
* sample.group

Load design file from file:

This file can be saved in projectFolder/data/base.design.txt

### Meta data sheet

## Create R-object for the project
Open the bulkRNAseq_workflow/PartA_Automatic_Setup.Rmd script in a R-editor such as RStudio.

Edit the entries according to your project. 

To run the script after editing, use the following R-version, if possible:
```
module purge;source /camp/stp/babs/working/software/modulepath_new_software_tree_2018-08-13;module load pandoc/2.2.3.2-foss-2016b;ml R/4.0.3-foss-2020a
```

Once done, save the script. 
