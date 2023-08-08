def TSPInverted(n: Int, roads: List[(String, String, Int)]): List[String] = {
  // Create a graph of the roads.
  val graph = roads.groupBy(_._1).mapValues(_.map(_._2))

  // Initialize a priority queue to store the cheapest paths from each city.
  val pq = new mutable.PriorityQueue[(Int, List[String], String)]()(Ordering.by(_._1))
  for (city <- graph.keys) {
    pq.add((0, List(city), city))
  }

  // Continue expanding paths until we find a path to all cities.
  while (!pq.isEmpty) {
    val (cost, path, currentCity) = pq.dequeue

    // If we have reached all cities, return the path.
    if (path.length == n) {
      return path
    }

    // For each neighbor of the current city, add a new path to the priority queue.
    for (neighbor <- graph(currentCity)) {
      if (!path.contains(neighbor)) {
        val newCost = cost + neighbor
        val newPath = path :+ neighbor
        pq.add((newCost, newPath, neighbor))
      }
    }
  }

  // No path to all cities exists.
  Nil
}
