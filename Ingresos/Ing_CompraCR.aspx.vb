Imports System.IO
Imports System.Data
Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Microsoft.VisualBasic.CompilerServices

Public Class Ing_CompraCR
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_Buscar_Click(sender As Object, e As EventArgs)
        'SQL_ComprasCR.SelectParameters.Add("@FecIni", System.Data.DbType.String, FecInicial.Text)
        'SQL_ComprasCR.SelectParameters.Add("@FecFin", System.Data.DbType.String, FecFinal.Text)
        SQL_ComprasCR.SelectParameters("FecIni").DefaultValue = FecInicial.Text
        SQL_ComprasCR.SelectParameters("FecFin").DefaultValue = FecFinal.Text

        'SQL_ComprasCR.DataBind()
        'grd_ComprasCR.DataSource = SQL_ComprasCR
        grd_ComprasCR.DataBind()

    End Sub

    Public Sub btn_Export_Click(sender As Object, e As EventArgs)

        Dim dv As DataView = CType(SQL_ComprasCR.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Pers_CompraCR.csv"))

        fileName = "C:\Temp\Pers_CompraCR.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Pers_CompraCR.csv"))
        Response.End()

    End Sub
End Class