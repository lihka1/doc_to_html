#!/bin/bash

# requires GNU parallel (https://www.gnu.org/software/parallel/)
# all of these are typically available through sudo apt-get install.
# number of cores over which the process will be parallelized


# arg1---folder of the input docs
# arg2---destination of output folder
# arg3---no of cores to used

# go to the pdf folder
cd $1

# converts each of the PDFs into TIFF images so that tesseract can interact with them
find . -name '*.docx' | parallel --gnu --no-notice -j $3 pandoc -f docx -t html {} -s -o $2/{}.html 

