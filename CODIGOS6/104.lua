function main()
    eggs = io.read():split(' '):map(tonumber)
    touching = {}
    for i = 1, 20 do
      touching[i] = {}
      for j = 1, 20 do
        touching[i][j] = 0
      end
    end
  
    for i = 1, 20 do
      line = io.read():split(' ')
      egg_index = tonumber(line[1])
      neighbors = {}
      for j = 2, #line do
        neighbors[j-1] = tonumber(line[j])
      end
      neighbors[#neighbors+1] = egg_index
      for j = 1, #neighbors do
        touching[egg_index][neighbors[j]] = 1
      end
    end
  
    ans = {}
    for i = 1, 20 do
      changed = false
      for j = 1, 20 do
        if eggs[j] == 1 and touching[i][j] == 1 then
          eggs[j] = 0
          changed = true
        end
      end
      if not changed then
        ans[i] = i
      end
    end
  
    for i, v in pairs(ans) do
      print(v)
    end
  end
  