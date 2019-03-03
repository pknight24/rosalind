read_fasta <- function(path)
{
  dat <- readLines(path)
  nams <- c()
  strs <- c()
  j <- 0
  for (i in 1:length(dat))
  {
    cur <- dat[i]
    if (substr(cur, 1, 1) == ">")
    {
      j <- j + 1
      nams[j] <- substr(cur, 2, nchar(cur))
    }
    else
    {
      strs[j] <- paste(strs[j], cur, sep="")
      if (substr(strs[j], 1, 2) == "NA") strs[j] <- substr(strs[j], 3, nchar(strs[j]))
    }
  }
  data.frame(Name = nams, String = strs)
}