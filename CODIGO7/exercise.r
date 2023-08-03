# Function to count the number of lucky tickets
luckyTickets <- function(n, b) {
  luckyTickets <- 0
  for (i in 0:(2^n)-1) {
    firstHalf <- 0
    secondHalf <- 0
    j <- 0
    while (i > 0) {
      digit <- i %% b
      firstHalf <- firstHalf + digit if j < n / 2 else secondHalf <- secondHalf + digit
      i <- i %/% 2
      j <- j + 1
    }
    if (firstHalf == secondHalf) {
      luckyTickets <- luckyTickets + 1
    }
  }
  return(luckyTickets)
}

# Read the input data
n <- as.integer(readline())
b <- as.integer(readline())

# Print the output
print(luckyTickets(n, b))
