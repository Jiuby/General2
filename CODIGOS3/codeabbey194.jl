function convex_hull(points)
    max_y_index = argmax(points .=> points[1][2])
    hull = [max_y_index]
    for i in 1:length(points)
      while length(hull) > 2 && cross(hull[end-1] - hull[end-2], points[i] - hull[end-1]) < 0
        hull = hull[1:end-1]
      end
      hull = push!(hull, i)
    end
    return hull
  end
  
  input = readlines(stdin)
  points = map(x -> parse.(Int, x), split(input[1], " "))
  hull = convex_hull(points)
  println(hull)
  