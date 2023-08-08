function TSPInverted(n: number, roads: readonly [string, string, number][]): readonly string[] {
    // Create a graph of the roads.
    const graph: Record<string, Record<string, number>> = roads.reduce<Record<string, Record<string, number>>>((acc, [source, destination, cost]) => {
      acc[source] = (acc[source] || {}) as Record<string, number>;
      acc[source][destination] = cost;
      return acc;
    }, {});
  
    // Initialize a priority queue to store the cheapest paths from each city.
    const pq: PriorityQueue<{
      cost: number;
      path: readonly string[];
      currentCity: string;
    }> = new PriorityQueue<{
      cost: number;
      path: readonly string[];
      currentCity: string;
    }}>((a, b) => a.cost - b.cost);
    for (const city of Object.keys(graph)) {
      pq.enqueue({
        cost: 0,
        path: [city],
        currentCity: city,
      });
    }
  
    // Continue expanding paths until we find a path to all cities.
    while (!pq.isEmpty) {
      const { cost, path, currentCity } = pq.dequeue();
  
      // If we have reached all cities, return the path.
      if (path.length === n) {
        return path;
      }
  
      // For each neighbor of the current city, add a new path to the priority queue.
      for (const neighbor of graph[currentCity]) {
        if (!path.includes(neighbor.key)) {
          const newCost = cost + neighbor.value;
          const newPath = [...path, neighbor.key];
          pq.enqueue({
            cost: newCost,
            path: newPath,
            currentCity: neighbor.key,
          });
        }
      }
    }
  
    // No path to all cities exists.
    return [];
  