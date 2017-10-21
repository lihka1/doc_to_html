#!/bin/bash

# code inspired from...https://gist.github.com/gtfierro/8324883

# requires ImageMagick
# requires tesseract (https://code.google.com/p/tesseract-ocr/)
# requires GNU parallel (https://www.gnu.org/software/parallel/)
# all of these are typically available through sudo apt-get install.
# number of cores over which the process will be parallelized


# arg1---pdf's folder of the input folder'
# arg2---intermediate storage for tiff files'
# arg3---destination of output folder'
# arg4---no of cores to used '

# go to the pdf folder
cd $1

# converts each of the PDFs into TIFF images so that tesseract can interact with them
ls . | parallel --gnu --no-notice -j $4 convert -depth 8 -density 300 -strip -background white -alpha off {} $2/{}.tif 


# go to tiff folder
cd $2

# runs OCR on the found TIFF files and converts them to text. Assumes English, but you can supply
# extra arguments to tesseract
find . -name '*.tif' | parallel --no-notice -j $4 tesseract -l eng {} $3{} hocr
