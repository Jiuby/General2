function cloud_altitude(d1, a, b)
    h = math.tan(b) * d1 / (math.tan(a) - math.tan(b))
    return math.floor(h)
  end
  
  n = tonumber(io.read())
  
  heights = {}
  for i = 1, n do
    d1, a, b = io.read():split()
    heights[i] = cloud_altitude(tonumber(d1), tonumber(a), tonumber(b))
  end
  
  for i, h in ipairs(heights) do
    print(h)
  end
  