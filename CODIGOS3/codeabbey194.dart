import 'dart:math';

void main() {
  List<List<int>> points = [
    [113, 44],
    [87, 101],
    [64, 38],
    [52, 161],
    [108, 28],
    [27, 40],
    [145, 103],
    [161, 89],
    [96, 26],
    [83, 163],
    [69, 11],
    [15, 74],
    [50, 132],
    [48, 107],
    [134, 135],
    [37, 27],
    [3, 88],
  ];

  List<int> hull = _convexHull(points);

  print(hull);
}

List<int> _convexHull(List<List<int>> points) {
  int maxYIndex = points.indexWhere((point) => point[1] == points.map((point) => point[1]).reduce(max));
  List<int> hull = [maxYIndex];
  for (int i = 1; i <= points.length; i++) {
    while (hull.length > 2 &&
           cross(hull[hull.length - 2] - hull[hull.length - 1], points[i] - hull[hull.length - 1]) < 0) {
      hull.removeLast();
    }
    hull.add(i);
  }
  return hull;
}

int cross(List<int> a, List<int> b) {
  return a[0] * b[1] - a[1] * b[0];
}
