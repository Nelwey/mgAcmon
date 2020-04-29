Imports System.IO
Imports System.Data
Imports Microsoft.VisualBasic.CompilerServices
Public Class Visits_Top10
    Inherits System.Web.UI.Page


    Protected Sub btn_Buscar_Click(sender As Object, e As EventArgs)

        Dim Utils As New Gym_Utils
        Dim DT_TotalVisits As DataTable
        Dim DT_Top10Visits As DataTable
        Dim fecI As String = FecInicial.Text
        Dim fecF As String = FecFinal.Text
        Dim TotalVisitas As String

        DT_TotalVisits = Utils.ReadTotalVisitasByPeriodo(fecI, fecF)
        TotalVisitas = DT_TotalVisits.Rows(0).Item(0)

        lblTotal.Text = "Numero total de visitas = " + TotalVisitas

        DT_Top10Visits = Utils.ReadTop10ByPeriodo(FecInicial.Text, FecFinal.Text, TotalVisitas)
        grd_Top10.DataSource = DT_Top10Visits
        grd_Top10.DataBind()

        'SQL_Top10.SelectParameters("FecIni").DefaultValue = FecInicial.Text
        'SQL_Top10.SelectParameters("FecFin").DefaultValue = FecFinal.Text
        'SQL_Top10.SelectParameters("TotalVisitas").DefaultValue = TotalVisitas

        'grd_Top10.DataBind()

    End Sub

    'Public Sub btn_Export_Click(sender As Object, e As EventArgs)

    '    Dim dv As DataView = CType(SQL_Top10.[Select](DataSourceSelectArguments.Empty), DataView)
    '    Dim dt As New DataTable
    '    Dim Utility As New Utils
    '    Dim fileName As String

    '    dt = dv.ToTable()
    '    Utility.ToCSV(dt, Server.MapPath("~/Export/Visit_Top10.csv"))

    '    fileName = "C:\Temp\Visit_Top10.csv"
    '    Response.ContentType = "text/csv"
    '    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
    '    Response.TransmitFile(Server.MapPath("~/Export/Visit_Top10.csv"))
    '    Response.End()

    'End Sub

End Class