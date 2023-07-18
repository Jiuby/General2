open System

let main() =
  let n = int32 input
  let m = Array.zeroCreate n n
  for i in 0 .. n - 1 do
    for j in 0 .. n - 1 do
      m.[i].[j] <- int32 input

  let count = m |> Array.sumBy (fun r -> r |> Array.sumBy (fun v -> v == 1))
  printfn "%d" count

main ()
