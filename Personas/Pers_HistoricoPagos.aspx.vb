Imports System.IO
Imports System.Data
Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Microsoft.VisualBasic.CompilerServices

Partial Public Class Pers_HitoricoPagos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'If Not (Page.IsPostBack) Then
        '    calPagoFecha.SelectedDate = Now()
        'End If

    End Sub
    Public Sub btn_Export_Click(sender As Object, e As EventArgs)

        Dim dv As DataView = CType(SQL_Pagos.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As New DataTable
        Dim Utility As New Utils
        Dim fileName As String

        dt = dv.ToTable()
        Utility.ToCSV(dt, Server.MapPath("~/Export/Pers_Pagos.csv"))

        fileName = "C:\Temp\Pers_Pagos.csv"
        Response.ContentType = "text/csv"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.TransmitFile(Server.MapPath("~/Export/Pers_Pagos.csv"))
        Response.End()

    End Sub

    Protected Sub btn_Filtar_Click(sender As Object, e As EventArgs)

        SQL_PersAlfa.SelectCommand = "SELECT a.Id, CONCAT(a.Apellido,', ' + a.Nombre) as Persona, b.Nombre, a.CredDisponible, email, " &
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

    Protected Sub GrdView_PersAlfa_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdView_PersAlfa.SelectedIndexChanged
        SQL_Pagos.SelectParameters("Id_Pers").DefaultValue = GrdView_PersAlfa.SelectedValue
        GrdView_Pagos.DataBind()

        'txtPagoIdPersona.Text = GrdView_PersAlfa.SelectedValue

    End Sub

    'Protected Sub btnGrabaPago_Click(sender As Object, e As System.EventArgs) Handles btnGrabaPago.Click

    '    Dim fechaPago As String
    '    Dim insertResult As Int16
    '    Dim updateResult As Int16
    '    Dim Utils As New Persona_Utils


    '    If txtPagoMonto.Text = "" Or Val(txtPagoMonto.Text) = 0 Then
    '        ' lblMsgPago.Text = "Monto del pago NO puede ser 0 ni blanco."
    '        Response.Write("<script language=""javascript"">alert('Monto del pago NO puede ser 0 ni blanco!');</script>")
    '        Exit Sub
    '    End If

    '    If IsNothing(calPagoFecha.SelectedDate) Then
    '        ' lblMsgPago.Text = "Debe seleccionar una FECHA de pago"
    '        Response.Write("<script language=""javascript"">alert('Debe seleccionar una FECHA de pago!');</script>")
    '        Exit Sub
    '    End If

    '    If ddnFormaPago.SelectedValue = 0 Or IsNothing(ddnFormaPago.SelectedValue) Then
    '        ' lblMsgPago.Text = "Debe seleccionar una FORMA de pago"
    '        Response.Write("<script language=""javascript"">alert('Debe seleccionar una FORMA de pago!');</script>")

    '        Exit Sub
    '    End If

    '    fechaPago = String.Format("{0:yyyy-MM-dd}", calPagoFecha.SelectedDate)
    '    insertResult = Utils.InsertPago(Val(txtPagoIdPersona.Text), fechaPago, Val(txtPagoMonto.Text), Val(ddnFormaPago.SelectedValue))

    '    If insertResult = 1 Then
    '        updateResult = Utils.UpdateCredDisponible(Val(txtPagoIdPersona.Text), Val(txtPagoMonto.Text))
    '    End If

    '    If updateResult = 1 Then
    '        GrdView_Pagos.DataBind()
    '        GrdView_PersAlfa.DataBind()
    '        txtPagoMonto.Text = ""

    '        Response.Write("<script language=""javascript"">alert('Se registro el Pago y se actualizo el dato de Saldo del cliente.');</script>")

    '    End If

    'End Sub

End Class