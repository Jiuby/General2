using System;

public class CloudAltitudeMeasurement
{
    public static void Main(string[] args)
    {
        int n = int.Parse(Console.ReadLine());

        int[] heights = new int[n];
        for (int i = 0; i < n; i++)
        {
            string[] data = Console.ReadLine().Split(" ");

            int d1 = int.Parse(data[0]);
            float a = float.Parse(data[1]);
            float b = float.Parse(data[2]);

            heights[i] = (int)Math.Round(tan(b) * d1 / (tan(a) - tan(b)));
        }

        foreach (int height in heights)
        {
            Console.WriteLine(height);
        }
    }
}
