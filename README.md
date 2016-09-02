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

The usage information can be found by typing `?findpos`, which is the major function for this task.
To run it, first of all, set up a `blast` database, i.e. `example/16SMicrobialDB/16SMicrobial`. And then specify the code for `BLAST` program, i.e. `~/bin/ncbi-blast-2.4.0+/bin`. Note, the sequences of interest should be `fasta` format, i.e. `example/rna.fasta`. Finally, specify your mapping parameters, such as percent identity (`iden`) and mapped seq length (`len`). And then you just click and run.

```
library("Biostrings")
library("findpos")
### Find the help document for the function
?findpos

### run
res <- findpos(blastbin = "~/bin/ncbi-blast-2.4.0+/bin", db="example/16SMicrobialDB/16SMicrobial", fa="example/rna.fasta", iden=95, len=100)
```
