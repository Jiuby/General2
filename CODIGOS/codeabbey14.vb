Imports System

Public Class Program

  Public Shared Sub Main()

    Dim n As Integer = CInt(Console.ReadLine())
    Dim count As Integer = 0

    For i As Integer = 0 To n - 1
      For j As Integer = 0 To n - 1
        If i = j Then
          count = count + 1
        End If
      Next
    Next

    Console.WriteLine(count)

  End Sub

End Class
