### Jinliang Yang
### updated 08-31-2016

devtools::install_github("mhahsler/rBLAST")

library(Biostrings)
library(rBLAST)

download.file("ftp://ftp.ncbi.nlm.nih.gov/blast/db/16SMicrobial.tar.gz",
              destfile="examples/16SMicrobial.tar.gz", mode='wb')
untar("examples/16SMicrobial.tar.gz", exdir="16SMicrobialDB")

## load some test data
setMethod("nchar", "ANY", base::nchar)
seq <- readBStringSet("example/snp.fasta")
idx <- vmatchPattern(pattern = "[", subject = seq)


start(idx)
Sys.setenv(PATH = paste(Sys.getenv("PATH"), "/Users/jyang/bin/ncbi-blast-2.4.0+/bin", sep=":"))
## load a BLAST database (replace db with the location + name of the BLAST DB)
bl <- blast(db="16SMicrobialDB/16SMicrobial")
bl

print(bl, info=TRUE)

## query a sequence using BLAST
cl <- predict(bl, seq[1,])


#'
#'

fa <- "example/rna.fasta"
blastbin <- "/Users/yangjl/bin/ncbi-blast-2.4.0+/bin"
db="example/16SMicrobialDB/16SMicrobial"
