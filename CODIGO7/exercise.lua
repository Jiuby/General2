function lucky_tickets(n, b)
    local lucky_tickets = 0
    for i = 0, (1 << n) - 1 do
      local first_half = 0
      local second_half = 0
      local j = 0
      while i > 0 do
        local digit = i % b
        first_half = first_half + digit if j < n / 2 else second_half = second_half + digit
        i = i >> 1
        j = j + 1
      end
      if first_half == second_half then
        lucky_tickets = lucky_tickets + 1
      end
    end
    return lucky_tickets
  end
  
  function main()
    local n = tonumber(io.read())
    local b = tonumber(io.read())
    print(lucky_tickets(n, b))
  end
  
  main()
  