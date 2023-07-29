using Math

def convex_hull(points)
  max_y_index = points.sort_by(&.y).last.index
  hull = [points[max_y_index]]
  i = 1
  j = max_y_index + 1
  while i < points.count do
    while j < points.count and points[j-1].x - points[j].x * (points[i].y - points[j].y) / (points[j].x - points[i].x) < 0 do
      j += 1
    end
    if j == points.count then
      j = 0
    end
    hull.push points[j]
    i += 1
  end
  hull
end

def main()
  points = []
  while line = gets do
    points.push line.split.map(&.to_i)
  end
  puts convex_hull(points)
end

main
