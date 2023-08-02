eggs <- as.numeric(readLines(file("input.txt")))
touching <- matrix(0, 20, 20)

for (i in 1:20) {
  line <- readLines(file("input.txt"))
  egg_index <- as.numeric(line[1])
  neighbors <- as.numeric(line[2:(length(line)-1)])
  touching[egg_index, neighbors] <- 1
  touching[neighbors, egg_index] <- 1
}

ans <- c()
for (i in 1:20) {
  if (all(eggs != 1 | touching[i, ])) {
    ans <- c(ans, i)
  }
}

print(ans)
