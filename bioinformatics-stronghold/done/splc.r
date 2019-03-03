library(magrittr)

source("fasta_helper.r")

splice.out <- function(strand, intron)
{
  for (k in 1:nchar(strand))
  {
    before <- substr(strand, 1, k - 1)
    cur <- substr(strand, k, nchar(intron) + k - 1)
    after <- substr(strand, nchar(intron) + k, nchar(strand))

    if (intron == cur) 
    {
      new.strand <- paste(before, after, sep="")
      return(new.strand)
    }
    if(cur == "") return(strand)
  }
  strand
  
}


dat <- read_fasta(commandArgs()[6]) 
dat$String <- dat$String %>% as.character
main.strand <- dat[1, 2]
introns <- dat[2:length(dat$String), 2]
for (i in introns)
{
  main.strand <- splice.out(main.strand, i)
}

rna.strand <- gsub("T", "U", main.strand)


rna.codon.table <- read.table("reference/rna_codon")

codons <- rna.strand %>% substring(seq(1, nchar(rna.strand) - 3, 3), seq(3, nchar(rna.strand) - 1, 3))

peptide <- ""

for (i in codons)
{
  pep <- rna.codon.table[rna.codon.table$V1 == i, 2]
  if (pep == "Stop") break
  else peptide <- paste(peptide, pep, sep="")
}
cat(peptide)