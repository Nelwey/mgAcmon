Imports System.Data

Public Class Gyms_Contactos
    Inherits System.Web.UI.Page

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    If Not Page.IsPostBack Then
    '        Dim dtGym As New DataTable
    '        Dim GymID As String
    '        Dim DadCount As Int16

    '        dtGym = CType(SQL_Gyms.Select(DataSourceSelectArguments.Empty), DataView).Table

    '        For Each row As DataRow In dtGym.Rows
    '            GymID = row("IDGym").ToString
    '            Dim Dad As New TreeNode() With {
    '             .Text = row("Gimnasio").ToString(),
    '             .Value = row("IDGym").ToString()
    '            }
    '            TreeView1.Nodes.Add(Dad)
    '            DadCount = TreeView1.Nodes.Count - 1
    '            '                Dim ContID As Int16 = TreeView1.Nodes.Item(row.Item())
    '            If row("IDGym").ToString() = GymID Then
    '                Dim Child As New TreeNode() With {
    '             .Text = row("IDCon").ToString(),
    '             .Value = row("Contacto").ToString()
    '            }
    '                TreeView1.Nodes(DadCount).ChildNodes.Add(Child)
    '            Else

    '            End If
    '            'If parentId = 0 Then
    '            '    TreeView1.Nodes.Add(child)
    '            '    Dim dtChild As DataTable = Me.GetData("SELECT Id, Name FROM VehicleSubTypes WHERE VehicleTypeId = " + child.Value)
    '            '    PopulateTreeView(dtChild, Integer.Parse(child.Value), child)
    '            'Else
    '            '    TreeNode.ChildNodes.Add(child)
    '            'End If
    '        Next
    '    End If

    'End Sub

    Public Sub btn_Export_Click(sender As Object, e As EventArgs)

        Dim dv As DataView = CType(SQL_Gyms.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Gyms_Contactos.csv"))

        fileName = "C:\Temp\Gyms_Contactos.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Gyms_Contactos.csv"))
        Response.End()

    End Sub

End Class