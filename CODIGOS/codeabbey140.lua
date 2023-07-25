function countOnes(n)
    count = 0
    for i = 1, n do
      for j = 1, n do
        if i == j then
          count = count + 1
        end
      end
    end
    return count
  end
  
  n = tonumber(io.read())
  print(countOnes(n))
  