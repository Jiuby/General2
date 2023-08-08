func TSPInverted(n: Int, roads: [(String, String, Int)]) -> [String] {
  // Create a graph of the roads.
  var graph = [String: [String: Int]]()
  for road in roads {
    if !graph.keys.contains(road.0) {
      graph[road.0] = [road.1: road.2]
    } else {
      graph[road.0]![road.1] = road.2
    }
  }

  // Initialize a priority queue to store the cheapest paths from each city.
  var pq = PriorityQueue<(Int, [String], String)>(sortedBy: { $0.0 < $1.0 })
  for city in graph.keys {
    pq.append((0, [city], city))
  }

  // Continue expanding paths until we find a path to all cities.
  while !pq.isEmpty {
    let (cost, path, currentCity) = pq.removeFirst()

    // If we have reached all cities, return the path.
    if path.count == n {
      return path
    }

    // For each neighbor of the current city, add a new path to the priority queue.
    for neighbor in graph[currentCity]! {
      if !path.contains(neighbor.key) {
        let newCost = cost + neighbor.value
        let newPath = path + [neighbor.key]
        pq.append((newCost, newPath, neighbor.key))
      }
    }
  }

  // No path to all cities exists.
  return []
}
