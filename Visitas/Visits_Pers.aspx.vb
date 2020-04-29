Imports System.IO
Imports System.Data
Imports Microsoft.VisualBasic.CompilerServices

Public Class Visits_Pers_aspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_Buscar_Click(sender As Object, e As EventArgs)
        SQL_Personas.SelectParameters("FecIni").DefaultValue = FecInicial.Text
        SQL_Personas.SelectParameters("FecFin").DefaultValue = FecFinal.Text


    End Sub

    Public Sub btn_Export_Click(sender As Object, e As EventArgs)

        Dim dv As DataView = CType(SQL_VisitaDetalle.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Pers_Visitas.csv"))

        fileName = "C:\Temp\Pers_Visitas.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Pers_Visitas.csv"))
        Response.End()

    End Sub

    Private Sub grd_Gyms_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grd_Personas.SelectedIndexChanged
        SQL_VisitaDetalle.SelectParameters("FecIni").DefaultValue = FecInicial.Text
        SQL_VisitaDetalle.SelectParameters("FecFin").DefaultValue = FecFinal.Text
        SQL_VisitaDetalle.SelectParameters("Id_Pers").DefaultValue = grd_Personas.SelectedValue

        grd_VisitaPersona.DataBind()

    End Sub
End Class