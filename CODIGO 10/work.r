n <- as.integer(readline())

heights <- vector(mode="integer", length=n)
for(i in 1:n) {
  d1 <- as.numeric(readline())
  a <- as.numeric(readline())
  b <- as.numeric(readline())

  heights[i] <- ceiling(tan(b) * d1 / (tan(a) - tan(b)))
}

print(heights)
