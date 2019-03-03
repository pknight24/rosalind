library(magrittr)
nums <- readLines(commandArgs()[6]) %>% strsplit(" ") %>% unlist %>% as.numeric 

expected <- (nums[1] + nums[2] + nums[3] + .75*nums[4] + .5*nums[5]) * 2
sprintf("%.3f", expected)

