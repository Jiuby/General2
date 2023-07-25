countOnes <- function(n) {
  count <- 0
  for (i in 1:n) {
    for (j in 1:n) {
      if (i == j) {
        count <- count + 1
      }
    }
  }
  return(count)
}

n = as.integer(readline("Enter the size of the matrix: "))
print(countOnes(n))
