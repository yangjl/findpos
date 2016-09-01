#' \code{Find SNP Position}
#'
#' Find the physical position of a short sequence in a given genome.
#'
#' @param blastbin The path of binary code for NCBI BLAST program. [String, default=NULL]
#' @param db Path of database to BLAST against. [String]
#' @param fa A fasta file of the sequences of interest. [String]
#'
#' @param identity Percent of identity of the alignment. [interger, default=95]
#' @param coverage Percent of coverage of the alignment. [interger, default=95]
#' @return return a data.frame.
#'
#' @examples
#' inputdf <- data.frame(fq1="fq_1.fq", fq2="f1_2.fq", out="mysample",
#'                  group="g1", sample="s1", PL="illumina", LB="lib1", PU="unit1")
#'
#' run_GATK(inputdf,
#'          ref.fa="~/dbcenter/Ecoli/reference/Ecoli_k12_MG1655.fasta",
#'          gatkpwd="$HOME/bin/GenomeAnalysisTK-3.5/GenomeAnalysisTK.jar",
#'          picardpwd="$HOME/bin/picard-tools-2.1.1/picard.jar",
#'          markDup=TRUE,
#'          realignInDels=FALSE, indels.vcf="indels.vcf",
#'          recalBases=FALSE, dbsnp.vcf="dbsnp.vcf",
#'          email=NULL, runinfo = c(FALSE, "bigmemh", 1))
#'
#' @export
#'
#'

fa <- "example/snp.fasta"
blastbin <- "/Users/yangjl/bin/ncbi-blast-2.4.0+/bin"
findpos <- function(blastbin=NULL, db, fa, identity, coverage) {

  ### set environment in case
  if(!is.null(blastbin)){
    Sys.setenv(PATH = paste(Sys.getenv("PATH"), blastbin, sep=":"))
  }

  ## load some test data
  setMethod("nchar", "ANY", base::nchar)
  seq <- readBStringSet("example/snp.fasta")
  idx <- vmatchPattern(pattern = "[", subject = seq)


  start(idx)

  ## load a BLAST database (replace db with the location + name of the BLAST DB)
  bl <- blast(db="16SMicrobialDB/16SMicrobial")
  bl

  print(bl, info=TRUE)

  ## query a sequence using BLAST
  cl <- predict(bl, seq[1,])

}
