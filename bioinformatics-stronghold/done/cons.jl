#! /usr/local/bin/julia

open(ARGS[1]) do f
  text = split(readstring(f), ">")[2:end]
  profile = ["A:", "C:", "G:", "T:"]

  strings = []
  for t in text
    this_string = split(t)[2:end]
    full_dna = ""
    for i in this_string
      full_dna *= i
    end
    push!(strings, full_dna)
  end
  len = length(strings[1]) # all dna strings have the same length
  for i in 1:len
    a = 0
    c = 0
    g = 0
    t = 0
    for s in strings
      if s[i] == 'A'
        a += 1
      elseif s[i] == 'C'
        c +=1
      elseif s[i] == 'G'
        g += 1
      elseif s[i] == 'T'
        t += 1
      end
    end
    profile = [profile [a, c, g, t]]
  end

  consensus = ""
  for i in 2:length(profile[1, :])
    col = profile[:,i]
    rowmax = col[1]
    rowind = 1
    for j in 1:length(col)
      if col[j] > rowmax
        rowmax = col[j]
        rowind = j
      end
    end
    if rowind == 1
      consensus *= "A"
    elseif rowind == 2
      consensus *= "C"
    elseif rowind == 3
      consensus *= "G"
    elseif rowind == 4
      consensus *= "T"
    end
  end

  println(consensus)

  for i in 1:4
    for j in profile[i, :]
      print("$j ")
    end
    println()
  end

  end
