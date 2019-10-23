#!/bin/bash

# Example script to show how to easily run a Singularity container
# customized for execution on NYU Big Purple HPC
default_container="/gpfs/data/molecpathlab/containers/misc/reporting-3.6.0.simg"
container="${1:-${default_container}}"

# load Singularity
module load singularity/2.5.2

# execute command inside Singularity container
# make sure to mount the correct root drive for $HOME and $PWD
# cd to $PWD inside container then run commands desired
singularity exec \
-B /gpfs \
-B "${PWD}" \
"${container}" \
/bin/bash -c " \
cd ${PWD}
R --vanilla <<E0F
    rmarkdown::render(
        input = 'report.Rmd',
    output_format = 'html_document',
    output_file = 'report.html'
    )
E0F
"
