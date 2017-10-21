# Pandoc Conversion from DOCX files to HTML files. 


This bash script shows how to speed up pandoc in converting docx documents to html format using gnu parallel.

### Requirements

The minimum prerequisites to run this sample are:
* Gnu parallel. To run the pandoc on multiple cores
* pandoc.       To convert the docx to html.Installation instructions at https://pandoc.org/installing.html

The simplest way to install the requirements are as follows: 
````Terminal
sudo apt-get install parallel
````
For 64-bit Debian and Ubuntu, download  debian package on the [download page](https://github.com/jgm/pandoc/releases/tag/1.19.2.1)
````
sudo dpkg -i $DEB
````
where $DEB is the path to the downloaded deb, will install the pandoc and pandoc-citeproc executables and man pages

### Create the following folders

* input_folder.     The directory having the doc files 
* output_folder.   The directory for storing the output files.

### Arguments
````
/path/to/input_folder/ /path/to/output_folder num_cores 
````
### Example (running on 2 cores)
````
./docx_to_html.sh /mnt/input_folder/ /mnt/output_folder/ 2
````
### To view core utilization
````
sudo apt-get install htop
````

![Alt text](/core_utilization.png?raw=true "core utilization")
