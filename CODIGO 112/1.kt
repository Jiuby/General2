fun TSPInverted(n: Int, roads: List<Triple<String, String, Int>>): List<String> {
    // Create a graph of the roads.
    val graph = mutableMapOf<String, MutableList<Triple<String, Int>>>()
    for (road in roads) {
      val source = road.first
      val destination = road.second
      val cost = road.third
  
      if (!graph.containsKey(source)) {
        graph[source] = mutableListOf()
      }
  
      graph[source]!!.add(Triple(destination, cost))
    }
  
    // Initialize a priority queue to store the cheapest paths from each city.
    val pq = PriorityQueue<Triple<Int, List<String>, String>>(compareBy{ it.first })
    for (city in graph.keys) {
      pq.add(Triple(0, listOf(city), city))
    }
  
    // Continue expanding paths until we find a path to all cities.
    while (!pq.isEmpty()) {
      val (cost, path, currentCity) = pq.poll()
  
      // If we have reached all cities, return the path.
      if (path.size == n) {
        return path
      }
  
      // For each neighbor of the current city, add a new path to the priority queue.
      for (neighbor in graph[currentCity]!!) {
        val neighborCity = neighbor.first
        val neighborCost = neighbor.second
  
        if (!path.contains(neighborCity)) {
          val newCost = cost + neighborCost
          val newPath = path.toMutableList()
          newPath.add(neighborCity)
          pq.add(Triple(newCost, newPath, neighborCity))
        }
      }
    }
  
    // No path to all cities exists.
    return emptyList()
  }
  