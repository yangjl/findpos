

devtools::install_github("mhahsler/rBLAST")

library(Biostrings)
library(rBLAST)

download.file("ftp://ftp.ncbi.nlm.nih.gov/blast/db/16SMicrobial.tar.gz", 
              destfile="examples/16SMicrobial.tar.gz", mode='wb')
untar("examples/16SMicrobial.tar.gz", exdir="16SMicrobialDB")

## load some test data 
seq <- readRNAStringSet(system.file("examples/RNA_example.fasta", package="rBLAST"))

Sys.setenv(PATH = paste(Sys.getenv("PATH"), "/Users/jyang/bin/ncbi-blast-2.4.0+/bin", sep=":"))
## load a BLAST database (replace db with the location + name of the BLAST DB)
bl <- blast(db="16SMicrobialDB/16SMicrobial")
bl

print(bl, info=TRUE)

## query a sequence using BLAST
cl <- predict(bl, seq[1,])
