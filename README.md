# findpos



## INSTALLATION

### INSTALL BLAST

First of all, find the lastest verion of `BLAST` from [here](ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/). Down the appropriate version for your system. And then install in following [here](http://www.ncbi.nlm.nih.gov/books/NBK279671/).

### INSTALL R packages

```
### biostrings
source("https://bioconductor.org/biocLite.R")
biocLite("Biostrings")
### install devtools
install.packages("devtools")
###
devtools::install_github("mhahsler/rBLAST")
devtools::install_github("yangjl/findpos")

```

## USAGE



