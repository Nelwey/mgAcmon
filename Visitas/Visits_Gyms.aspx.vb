﻿Imports System.IO
Imports System.Data
Imports Microsoft.VisualBasic.CompilerServices

Public Class Visits_Gyms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub btn_Export_Click(sender As Object, e As EventArgs)

        Dim dv As DataView = CType(SQL_Visitas.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Gyms_Visitas.csv"))

        fileName = "C:\Temp\Gyms_Visitas.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Gyms_Visitas.csv"))
        Response.End()

    End Sub

    Private Sub grd_Gyms_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grd_Gyms.SelectedIndexChanged
        SQL_Visitas.SelectParameters("FecIni").DefaultValue = FecInicial.Text
        SQL_Visitas.SelectParameters("FecFin").DefaultValue = FecFinal.Text
        SQL_Visitas.SelectParameters("Id_Gym").DefaultValue = grd_Gyms.SelectedValue

        grd_Visitas.DataBind()

    End Sub
End Class