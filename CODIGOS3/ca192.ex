def convex_hull(points) do
  max_y_index = Enum.max_by(points, fn {x, y} -> y end)
  hull = [points[max_y_index]]
  for i <- 1..length(points) do
    for j <- i + 1..length(points) do
      if cross(points[i] - points[j], points[j] - points[max_y_index]) <= 0 do
        break
      end
    end
    hull = [points[i] | hull]
  end
  hull
end
