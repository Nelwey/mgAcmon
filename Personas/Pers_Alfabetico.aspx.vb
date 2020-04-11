Imports System.IO
Imports System.Data
Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Microsoft.VisualBasic.CompilerServices

Partial Public Class Pers_Alfabetico
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub btn_Export_Click(sender As Object, e As EventArgs)

        Dim dv As DataView = CType(SQL_PersAlfa.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Pers_Alfa.csv"))

        fileName = "C:\Temp\Pers_Alfa.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Pers_Alfa.csv"))
        Response.End()

    End Sub

    Protected Sub btn_Filtar_Click(sender As Object, e As EventArgs)

        SQL_PersAlfa.SelectCommand = "select a.Apellido, a.Nombre,a.Email, a.Celular, a.FecIngreso, b.Nombre, a.CredDisponible, " &
                   "CASE WHEN a.Activo = 1 THEN 'Si' " &
                   "WHEN a.Activo = 0 THEN 'No' ENd as Activo " &
                   "from mg_persona a " &
                   "INNER JOIN MG_Planes b ON b.id = a.Id_Plan " &
                   "WHERE a.apellido Like '" & txtFiltroApellido.Text & "'" &
                   "ORDER BY  a.Apellido, a.Nombre"

        SQL_PersAlfa.Select(DataSourceSelectArguments.Empty)
        SQL_PersAlfa.DataBind()
        GrdView_PersAlfa.DataBind()

    End Sub
End Class