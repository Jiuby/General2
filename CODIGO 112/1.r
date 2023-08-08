TSPInverted <- function(n, roads) {
  # Create a graph of the roads.
  graph <- list()
  for (road in roads) {
    source <- road[1]
    destination <- road[2]
    cost <- road[3]

    if (!source %in% names(graph)) {
      graph[[source]] <- list()
    }

    graph[[source]][[destination]] <- cost
  }

  # Initialize a priority queue to store the cheapest paths from each city.
  pq <- priorityQueue()
  for (city in names(graph)) {
    pq$insert(c(0, list(city), city))
  }

  # Continue expanding paths until we find a path to all cities.
  while (!pq$isEmpty()) {
    cost <- pq$extract()[1]
    path <- pq$extract()[2]
    current_city <- pq$extract()[3]

    # If we have reached all cities, return the path.
    if (length(path) == n) {
      return(path)
    }

    # For each neighbor of the current city, add a new path to the priority queue.
    for (neighbor in names(graph[[current_city]])) {
      neighbor_cost <- graph[[current_city]][[neighbor]]

      if (!neighbor %in% path) {
        new_cost <- cost + neighbor_cost
        new_path <- path
        new_path <- c(new_path, neighbor)
        pq$insert(c(new_cost, new_path, neighbor))
      }
    }
  }

  # No path to all cities exists.
  return(NULL)
}
