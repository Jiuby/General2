package main

import (
    "fmt"
    "math"
)

func main() {
    var n int
    fmt.Scanf("%d", &n)

    var heights []float64
    for i := 0; i < n; i++ {
        var d1, a, b float64
        fmt.Scanf("%f %f %f", &d1, &a, &b)

        h := tan(b) * d1 / (tan(a) - tan(b))
        heights = append(heights, h)
    }

    for _, h := range heights {
        fmt.Println(int(h))
    }
}
