Public Sub Main()

  Dim n As Integer = Console.ReadLine()

  Dim m(n - 1, n - 1) As Integer

  For i As Integer = 0 To n - 1
    For j As Integer = 0 To n - 1
      m(i, j) = Console.ReadLine()
    Next
  Next

  Dim count As Integer = 0

  For i As Integer = 0 To n - 1
    For j As Integer = 0 To n - 1
      If m(i, j) = 1 Then count = count + 1
    Next
  Next

  Console.WriteLine(count)

End Sub