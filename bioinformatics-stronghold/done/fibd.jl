#! /usr/local/bin/julia


function mortal_fib(n::Int64, m::Int64)
  g = [1, 1]
  for i in 3:n
    if i <= m
      push!(g,g[i-1] + g[i-2])
    elseif i == m + 1
      push!(g, g[i-1] + g[i-2] - 1)
    else
      push!(g, g[i-1] + g[i-2] - g[i-m-1])
    end
  end
  return g[end]
end
open(ARGS[1]) do f
  result = mortal_fib(89, 17)
  print("$result\n")
  end
