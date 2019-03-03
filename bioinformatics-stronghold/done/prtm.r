mono <- read.table("monoisotopic_mass_table", header=TRUE)

args <- commandArgs()
i <- args[6]

line <- readLines(i)
weight <- 0
for (j in 1:nchar(line))
{
  c <- substr(line, j, j)
  # print(c)
  temp <- mono[mono$Amino.acid == c, 2]
  # print(temp)
  # print(str(temp))
  weight <- weight + temp
}

sprintf("%.3f", weight)