Imports System.IO
Imports System.Data
Imports Microsoft.VisualBasic.CompilerServices

Partial Public Class Formulario_web1
    Inherits System.Web.UI.Page

    Public Sub btn_Export_Click(sender As Object, e As EventArgs)

        Dim dv As DataView = CType(SQL_GymAlfa.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Gyms_Alfa.csv"))

        fileName = "C:\Temp\Gyms_Alfa.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Gyms_Alfa.csv"))
        Response.End()

        'Try
        '    My.Computer.Network.DownloadFile(Server.MapPath("~/Export/Gyms_Alfa.csv"), "C:\Temp\Gyms_Alfa.csv")
        'Catch ex As Exception
        '    ' btn_Export.Text = "Error en download file: " & ex.Message
        'End Try

        'Utility.ToCSV(dt, "C:\Temp\Gyms_Alfa.csv")
        'ToCSV(dt, "../Export/gyms.csv")

        ' WriteToOutput(csv, "export.csv", "text/csv")
    End Sub


    Public Shared Sub ToCSV(ByVal dtDataTable As DataTable, ByVal strFilePath As String)
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

    Private Sub Formulario_web1_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class