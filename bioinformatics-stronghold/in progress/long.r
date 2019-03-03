source("fasta_helper.r")
library(magrittr)

get_overlapping <- function(first, second)
{
  if (is.na(first)) print("ERROR"); return("")
  overlapping <- ""
  for (k in 1:nchar(first))
  {
    cur <- substr(first, k, nchar(first))
    pref <- substr(second, 1, nchar(cur))
    # paste("cur:", cur) %>% print
    # paste("pref:", pref) %>% print
    if (pref == cur & nchar(cur) > nchar(overlapping))
    {
      # paste("new overlapping", cur) %>% print
      overlapping <- cur
    }
  }
  
  # paste("best overlapping:", overlapping) %>% print
  overlapping
}

dat <- read_fasta(commandArgs()[6])
master.list <- as.character(dat$String)

naive.best <- paste(master.list)


while (length(master.list) > 1)
{
  current.list <- master.list
  
  for (i in 1:length(current.list))
  {
    f <- current.list[i]
    paste("starting read:", f) %>% print
    best.merge <- ""
    best.merge.length <- 0
    best.merge.index <- -420
    for (j in 1:length(current.list))
    {
      if (i == j) next
        
      s <- current.list[j]
      overlapping <- get_overlapping(f, s)
      # paste("overlapping:", overlapping) %>% print
      if (nchar(overlapping) > nchar(f) / 2 & nchar(overlapping) > nchar(s) / 2)
      {
        potential.merge <- paste(f, substr(s, nchar(overlapping) + 1, nchar(s)), sep="")
        if (best.merge == "" | nchar(potential.merge) < best.merge.length)
        {
          best.merge <- potential.merge
          best.merge.length <- nchar(potential.merge)
          best.merge.index <- j
          # paste("new best merge:", best.merge) %>% print
        }
        
      }
    }
    
    if (best.merge != "")
    {
      master.list[i] <- best.merge
      master.list <- master.list[master.list != current.list[best.merge.index]]
    }
    # print("master list")
    # print(master.list)
  }
}


cat(master.list[1])