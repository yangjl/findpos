#' \code{Find SNP Position}
#'
#' Find the physical position of a short sequence in a given genome.
#'
#' @param blastbin The path of binary code for NCBI BLAST program. [String, default=NULL]
#' @param db Path of database to BLAST against. [String]
#' @param fa A fasta file of the sequences of interest. [String]
#' @param iden Percent identity of the alignment. [interger, default=95]
#' @param len Minimum length of the alignment. [interger, default=100]
#' @return return a data.frame.
#'
#' @examples
#'
#' @export
findpos <- function(blastbin=NULL, db, fa, iden, len) {

  ### set environment in case
  if(!is.null(blastbin)){
    Sys.setenv(PATH = paste(Sys.getenv("PATH"), blastbin, sep=":"))
  }
  setMethod("nchar", "ANY", base::nchar)

  ## load some test data
  seq <- readBStringSet(fa)
  p <- vmatchPattern(pattern = "[", subject = seq)
  snp <- unlist(start(p))
  df <- as.data.frame(snp)
  ## load a BLAST database (replace db with the location + name of the BLAST DB)
  bl <- blast(db)
  print(bl, info=TRUE)

  ## query a sequence using BLAST
  cl <- getblast(bl, seq)
  cl <- subset(cl, Perc.Ident >= iden & Alignment.Length >= len)
  cl2 <- merge(cl, df, by.x="QueryID", by.y="row.names")
  cl2$pos <- cl2$S.start + cl2$snp + 1

  return(cl2)

}
