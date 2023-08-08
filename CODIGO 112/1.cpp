#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
  int n, roads;
  cin >> n >> roads;

  vector<vector<pair<int, int>>> graph(n);
  for (int i = 0; i < roads; i++) {
    int u, v, w;
    cin >> u >> v >> w;
    graph[u].push_back({v, w});
  }

  vector<int> path;
  int cost = 0;

  // Initialize the priority queue.
  priority_queue<pair<int, vector<int>>, vector<pair<int, vector<int>>>, greater<pair<int, vector<int>>>> pq;
  pq.push({0, {0}});

  // Continue expanding paths until we find a path to all cities.
  while (!pq.empty()) {
    int current_cost = pq.top().first;
    vector<int> current_path = pq.top().second;
    pq.pop();

    // If we have reached all cities, return the path.
    if (current_path.size() == n) {
      cout << " ";
      for (int city : current_path) {
        cout << city << " ";
      }
      cout << endl;
      break;
    }

    // For each neighbor of the current city, add a new path to the priority queue.
    for (auto neighbor : graph[current_path.back()]) {
      int new_cost = current_cost + neighbor.second;
      vector<int> new_path = current_path;
      new_path.push_back(neighbor.first);
      pq.push({new_cost, new_path});
    }
  }

  return 0;
}
