Imports System.IO
Imports System.Data
Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Microsoft.VisualBasic.CompilerServices

Public Class Pago_Consolidado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btn_Buscar_Click(sender As Object, e As EventArgs) Handles btn_Buscar.Click

        SQL_pagoConsolidado.SelectParameters("FecIni").DefaultValue = FecInicial.Text
        SQL_pagoConsolidado.SelectParameters("FecFin").DefaultValue = FecFinal.Text
        grd_PagoConsolidado.DataBind()

    End Sub
    Protected Sub btn_Export_Click(sender As Object, e As EventArgs) Handles btn_Export.Click
        Dim dv As DataView = CType(SQL_pagoConsolidado.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Pago_Consolidado.csv"))

        fileName = "C:\Temp\Pago_Consolidado.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Pago_Consolidado.csv"))
        Response.End()

    End Sub
End Class