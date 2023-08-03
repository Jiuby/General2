function lucky_tickets(n, b)
    lucky_tickets = 0
    for i in 0:(1 << n)-1
      first_half = 0
      second_half = 0
      j = 0
      while i > 0
        digit = i % b
        first_half += digit if j < n / 2 else second_half += digit
        i >>= 1
        j += 1
      end
      if first_half == second_half
        lucky_tickets += 1
      end
    end
    return lucky_tickets
  end
  
  # Read the input data
  n = parse(Int, readline())
  b = parse(Int, readline())
  
  # Print the output
  println(lucky_tickets(n, b))
  