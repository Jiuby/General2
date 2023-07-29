import java.util.Scanner;

public class ConvexHull {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    List<int[]> points = new ArrayList<>();
    for (int i = 0; i < n; i++) {
      int[] point = new int[2];
      point[0] = scanner.nextInt();
      point[1] = scanner.nextInt();
      points.add(point);
    }
    List<Integer> hull = convexHull(points);
    System.out.println(hull);
  }

  private static List<Integer> convexHull(List<int[]> points) {
    int maxYIndex = points.stream().max(Comparator.comparingInt(x -> x[1])).get()[0];
    List<Integer> hull = new ArrayList<>();
    hull.add(maxYIndex);
    for (int i = 1; i <= points.size(); i++) {
      while (hull.size() > 2 &&
             cross(hull.get(hull.size() - 2), hull.get(hull.size() - 1), points.get(i)) < 0) {
        hull.remove(hull.size() - 1);
      }
      hull.add(i);
    }
