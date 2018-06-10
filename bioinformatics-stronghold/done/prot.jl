#! /usr/local/bin/julia

open(ARGS[1]) do f
  rna_codon = Dict{String, String}()
  rnafile = readlines(open("rna_codon", "r"))
  for l in rnafile
    pair = split(l)
    rna_codon[pair[1]] = pair[2]
  end

  text = strip(readstring(f))
  codons = [""]
  index = 1
  bases = split(text, "")
  cur = ""
  for b in bases
    cur = cur * b

    if length(cur) == 3
      codons[index] = cur
      append!(codons, [""])
      index += 1
      cur = ""
    end
  end

  protein = ""

  for c in codons
    if c != ""
      if rna_codon[c] != "Stop"
        protein *= rna_codon[c]
      end
    end
  end

  println(protein)

  
  
  
  
  

  end
