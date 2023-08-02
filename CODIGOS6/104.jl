using Printf

function main()
  eggs = readline() |> split |> map(Int)
  touching = zeros(20, 20)

  for i in 1:20
    line = readline() |> split |> map(Int)
    for j in 1:line[1]
      touching[i, line[j + 1]] = 1
    end
  end

  ans = []
  for i in 1:20
    if all(eggs .!= 1 .| touching[i, :])
      ans = push!(ans, i)
    end
  end

  println(ans)
end

if main()
  println("Success!")
else
  println("Error!")
end
