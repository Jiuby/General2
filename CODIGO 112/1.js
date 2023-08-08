function TSPInverted(n, roads) {
    "use strict";
  
    // Create a graph of the roads.
    const graph = {};
    for (const [source, destination, cost] of roads) {
      if (!graph[source]) {
        graph[source] = [];
      }
      graph[source].push([destination, cost]);
    }
  
    // Initialize a priority queue to store the cheapest paths from each city.
    const pq = [];
    for (const city of graph) {
      pq.push([0, [city], city]);
    }
  
    // Continue expanding paths until we find a path to all cities.
    while (pq.length > 0) {
      const [cost, path, currentCity] = pq.shift();
  
      // If we have reached all cities, return the path.
      if (path.length === n) {
        return path;
      }
  
      // For each neighbor of the current city, add a new path to the priority queue.
      for (const [neighbor, neighborCost] of graph[currentCity]) {
        if (!path.includes(neighbor)) {
          const newCost = cost + neighborCost;
          const newPath = path.slice(0);
          newPath.push(neighbor);
          pq.push([newCost, newPath, neighbor]);
        }
      }
    }
  
    // No path to all cities exists.
    return [];
  }
  