using System;
using System.Collections.Generic;
using System.Linq;

public class TSPInverted
{
    public static List<string> Solve(int n, List<Tuple<string, string, int>> roads)
    {
        // Create a graph of the roads.
        var graph = new Dictionary<string, List<Tuple<string, int>>>();
        foreach (var road in roads)
        {
            string source = road.Item1;
            string destination = road.Item2;
            int cost = road.Item3;

            if (!graph.ContainsKey(source))
            {
                graph.Add(source, new List<Tuple<string, int>>());
            }

            graph[source].Add(new Tuple<string, int>(destination, cost));
        }

        // Initialize a priority queue to store the cheapest paths from each city.
        var pq = new PriorityQueue<Tuple<int, List<string>, string>>(
            (x, y) => x.Item1.CompareTo(y.Item1));
        foreach (var city in graph)
        {
            pq.Enqueue(new Tuple<int, List<string>, string>(0, new List<string> { city.Key }, city.Key));
        }

        // Continue expanding paths until we find a path to all cities.
        while (!pq.IsEmpty)
        {
            var cost = pq.Peek().Item1;
            var path = pq.Peek().Item2;
            var currentCity = pq.Dequeue().Item3;

            // If we have reached all cities, return the path.
            if (path.Count == n)
            {
                return path;
            }

            // For each neighbor of the current city, add a new path to the priority queue.
            foreach (var neighbor in graph[currentCity])
            {
                string neighborCity = neighbor.Item1;
                int neighborCost = neighbor.Item2;

                if (!path.Contains(neighborCity))
                {
                    var newCost = cost + neighborCost;
                    var newPath = path.ToList();
                    newPath.Add(neighborCity);
                    pq.Enqueue(new Tuple<int, List<string>, string>(newCost, newPath, neighborCity));
                }
            }
        }

        // No path to all cities exists.
        return null;
    }
}
