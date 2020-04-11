Imports System.IO
Imports System.Data


Partial Public Class Utils

    Public Sub ToCSV(ByVal dtDataTable As DataTable, ByVal strFilePath As String)
        Dim sw As StreamWriter = New StreamWriter(strFilePath, False)

        For i As Integer = 0 To dtDataTable.Columns.Count - 1
            sw.Write(dtDataTable.Columns(i))

            If i < dtDataTable.Columns.Count - 1 Then
                sw.Write(",")
            End If
        Next

        sw.Write(sw.NewLine)

        For Each dr As DataRow In dtDataTable.Rows

            For i As Integer = 0 To dtDataTable.Columns.Count - 1

                If Not Convert.IsDBNull(dr(i)) Then
                    Dim value As String = dr(i).ToString()

                    If value.Contains(","c) Then
                        value = String.Format("""{0}""", value)
                        sw.Write(value)
                    Else
                        sw.Write(dr(i).ToString())
                    End If
                End If

                If i < dtDataTable.Columns.Count - 1 Then
                    sw.Write(",")
                End If
            Next

            sw.Write(sw.NewLine)
        Next

        sw.Close()
    End Sub

End Class
