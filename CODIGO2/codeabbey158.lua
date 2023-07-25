function main()
    local option = io.read()
  
    if option == "1" then
      -- Generate Hamming code
      print("Enter the data bits:")
      local data = io.read()
      local data_bits = data:split(" ")
      local r = 1
      while #data_bits + r + 1 > 2 ^ r do
        r = r + 1
      end
      local hamming_code = {}
      for i = 0, r + #data_bits - 1 do
        local p = 2 ^ i
        if p == i + 1 then
          hamming_code[i] = 0
        else
          hamming_code[i] = tonumber(data_bits[i - 1])
        end
      end
      for parity = 0, r + #data_bits - 1 do
        local ph = 2 ^ parity
        if ph == parity + 1 then
          local index = ph - 1
          local to_xor = {}
          for i = index, r + #data_bits - 1, 2 * ph do
            to_xor[i - index + 1] = hamming_code[i]
          end
          hamming_code[index] = hamming_code[index] ^ table.unpack(to_xor)
        end
      end
      print("Hamming code generated would be:- " .. table.concat(hamming_code, " "))
    elseif option == "2" then
      -- Detect error in received Hamming code
      print("Enter the received Hamming code:")
      local hamming_code = io.read()
      local data_bits = hamming_code:split(" ")
      local parity_list = {}
      for parity = 0, r + #data_bits - 1 do
        local ph = 2 ^ parity
        if ph == parity + 1 then
          parity_list[parity] = tonumber(data_bits[parity])
        end
      end
      local error = table.unpack(parity_list)
  
      if error == 0 then
        print("There is no error in the received Hamming code")
      else
        print("Error is in bit " .. error)
      end
    else
      print("Option entered does not exist")
    end
  end
  
  main()
  