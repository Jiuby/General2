def TSP_inverted(n, roads)
  # Create a graph of the roads.
  graph = {}
  roads.each do |road|
    source, destination, cost = road
    if !graph.key?(source)
      graph[source] = []
    end
    graph[source].append([destination, cost])
  end

  # Initialize a priority queue to store the cheapest paths from each city.
  pq = []
  graph.each do |source, neighbors|
    pq.append([0, [source], source])
  end

  # Continue expanding paths until we find a path to all cities.
  while !pq.empty?
    cost, path, current_city = pq.shift

    # If we have reached all cities, return the path.
    if path.length == n
      return path
    end

    # For each neighbor of the current city, add a new path to the priority queue.
    graph[current_city].each do |neighbor, neighbor_cost|
      if !path.include?(neighbor)
        new_cost = cost + neighbor_cost
        new_path = path.dup
        new_path.append(neighbor)
        pq.append([new_cost, new_path, neighbor])
      end
    end
  end

  # No path to all cities exists.
  return []
end
