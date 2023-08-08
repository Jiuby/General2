function TSPInverted(int $n, array $roads) {
  // Create a graph of the roads.
  $graph = array();
  foreach ($roads as $road) {
    $source = $road[0];
    $destination = $road[1];
    $cost = $road[2];

    if (!isset($graph[$source])) {
      $graph[$source] = array();
    }

    $graph[$source][] = array($destination, $cost);
  }

  // Initialize a priority queue to store the cheapest paths from each city.
  $pq = new SplPriorityQueue();
  foreach ($graph as $city => $neighbors) {
    $pq->insert(array($cost = 0, $path = array($city), $city));
  }

  // Continue expanding paths until we find a path to all cities.
  while (!$pq->isEmpty()) {
    $cost = $pq->extract()->cost;
    $path = $pq->extract()->path;
    $currentCity = $pq->extract()->city;

    // If we have reached all cities, return the path.
    if (count($path) == $n) {
      return $path;
    }

    // For each neighbor of the current city, add a new path to the priority queue.
    foreach ($graph[$currentCity] as $neighbor) {
      $neighborCity = $neighbor[0];
      $neighborCost = $neighbor[1];

      if (!in_array($neighborCity, $path)) {
        $newCost = $cost + $neighborCost;
        $newPath = $path;
        $newPath[] = $neighborCity;
        $pq->insert(array($newCost, $newPath, $neighborCity));
      }
    }
  }

  // No path to all cities exists.
  return null;
}
