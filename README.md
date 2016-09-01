# findpos



## INSTALLATION

### INSTALL BLAST

First of all, find the lastest verion of `BLAST` from following ftp.
```
ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/
``` 
Download the appropriate version for your system. And then install it following [here](http://www.ncbi.nlm.nih.gov/books/NBK279671/).

### INSTALL R packages

```
### biostrings
source("https://bioconductor.org/biocLite.R")
biocLite("Biostrings")

### install devtools
install.packages("devtools")

### install packages in development 
devtools::install_github("yangjl/findpos")

```

## USAGE



