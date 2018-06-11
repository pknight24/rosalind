#! /usr/local/bin/julia

function check_motif(b, h)
  status = length(b) > length(h)
  for c in 1:length(h)
    status = status && (h[c] == b[c])
  end
  return status
end

open(ARGS[1]) do f
  text = map(strip, readlines(f))
  base = text[1]
  head = text[2]
  positions = []
  for i in 1:length(base)
    if base[i] == head[1]
      if check_motif(base[i:end], head)
        append!(positions, [i])
      end
    end
  end
  for p in positions
    print("$p ")
  end
  end
