args <- commandArgs()
dat <- readLines(args[6])

for (i in seq(1, length(dat), by=3))
{
  from.name <- substr(dat[i], 2, nchar(dat[i]))
  from.s <- paste(dat[i + 1], dat[i + 2], sep="")
  suffix <- substr(from.s, nchar(from.s) - 2, nchar(from.s))
  for (j in seq(from=1, to=length(dat), by=3))
  {
    to.name <- substr(dat[j], 2, nchar(dat[j]))
    to.s <- paste(dat[j + 1], dat[j + 2], sep="")
    prefix <- substr(to.s, 1, 3)
    if (from.s != to.s & suffix == prefix) cat(paste(from.name, " ", to.name, "\n", sep=""))
  }
}