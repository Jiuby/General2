def lucky_tickets(n, b)
    lucky_tickets = 0
    max_value = (1 << n) - 1
    for i in 0..max_value
      first_half = 0
      second_half = 0
      j = 0
      while i > 0
        digit = i % b
        first_half += digit if j < n / 2
        second_half += digit if j >= n / 2
        i >>= 1
        j += 1
      end
      lucky_tickets += 1 if first_half == second_half
    end
    return lucky_tickets
  end
  
  def main()
    n, b = gets.split(' ').map(&:to_i)
    puts lucky_tickets(n, b)
  end
  
  main()
  