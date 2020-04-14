Imports System.Data
Imports System.IO

Public Class Gyms_Master
    Inherits System.Web.UI.Page

    Protected Sub btnGrabaDisc_Click(sender As Object, e As System.EventArgs) Handles btnGrabaDisc.Click

        Dim GymUtil As New Gym_Utils
        Dim tmpGymID As Int16 = grdBuscar.SelectedValue
        Dim tmpResults As Int16

        tmpResults = GymUtil.Delete_Gym_Disc(Val(tmpGymID))
        For i As Int16 = 0 To chkboxDisciplinas.Items.Count - 1
            If chkboxDisciplinas.Items(i).Selected = True Then
                tmpResults = GymUtil.Insert_Gym_Disc(tmpGymID, chkboxDisciplinas.Items(i).Value)
            End If
        Next

    End Sub


    Protected Sub btnGrabaServ_Click(sender As Object, e As System.EventArgs) Handles btnGrabaServ.Click
        Dim GymUtil As New Gym_Utils
        Dim tmpGymID As Int16 = grdBuscar.SelectedValue
        Dim tmpResults As Int16

        tmpResults = GymUtil.Delete_Gym_Serv(Val(tmpGymID))
        For i As Int16 = 0 To chkboxServicios.Items.Count - 1
            If chkboxServicios.Items(i).Selected = True Then
                tmpResults = GymUtil.Insert_Gym_Serv(tmpGymID, chkboxServicios.Items(i).Value)
            End If
        Next

    End Sub

    Protected Sub grdBuscar_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles grdBuscar.SelectedIndexChanged
        lstGymDisc.DataBind()
        lstGymServ.DataBind()

        chkboxDisciplinas.ClearSelection()
        chkboxServicios.ClearSelection()

        grdBuscar.Visible = False
        ImagenesDiv.Visible = True
        Disc_Serv_Div.Visible = True
        Contactos_Div.Visible = True
        Banco_div.Visible = True
        FormView1.ChangeMode(FormViewMode.ReadOnly)
        FormView1.Visible = True

        'Dim dv As New DataView()
        'Dim dt As New DataTable()

        'Imagenes
        'dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
        'dt = dv.ToTable()

        'contLogo.Src = "https://multigym.fit/images/gyms/" & dt.Rows(0).Item("ImgLogo")

    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As System.EventArgs) Handles btnBuscar.Click
        grdBuscar.Visible = True
        FormView1.Visible = False
    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As System.EventArgs) Handles btnNuevo.Click
        FormView1.ChangeMode(FormViewMode.Insert)
        ImagenesDiv.Visible = True
        Disc_Serv_Div.Visible = True
        Contactos_Div.Visible = True
        Banco_div.Visible = True
        FormView1.Visible = True
        lstGymDisc.Items.Clear()
        lstGymServ.Items.Clear()

    End Sub

    Protected Sub btnCargaImagenes_Click(sender As Object, e As System.EventArgs) Handles btnCargaImagenes.Click
        Dim tmpCountImg As Int16 = 0
        Dim GymUtils As New Gym_Utils
        Dim ResUpdate As Int16
        Dim folderPath As String = Server.MapPath("~\Images\Gyms\")

        Try
            If logo.HasFile Then
                If File.Exists(folderPath & Path.GetFileName(logo.FileName)) Then
                    File.Delete(folderPath & Path.GetFileName(logo.FileName))
                End If
                logo.SaveAs(folderPath & Path.GetFileName(logo.FileName))
                tmpCountImg += 1
                ResUpdate = GymUtils.Update_Gym_Images(grdBuscar.SelectedValue, "ImgLogo", logo.FileName)
            End If
            If imagen1.HasFile Then
                If File.Exists(folderPath & Path.GetFileName(imagen1.FileName)) Then
                    File.Delete(folderPath & Path.GetFileName(imagen1.FileName))
                End If
                imagen1.SaveAs(folderPath & Path.GetFileName(imagen1.FileName))
                tmpCountImg += 1
                ResUpdate = GymUtils.Update_Gym_Images(grdBuscar.SelectedValue, "Img1", imagen1.FileName)
            End If
            If imagen2.HasFile Then
                If File.Exists(folderPath & Path.GetFileName(imagen2.FileName)) Then
                    File.Delete(folderPath & Path.GetFileName(imagen2.FileName))
                End If
                imagen2.SaveAs(folderPath & Path.GetFileName(imagen2.FileName))
                tmpCountImg += 1
                ResUpdate = GymUtils.Update_Gym_Images(grdBuscar.SelectedValue, "Img2", imagen2.FileName)
            End If
            If imagen3.HasFile Then
                If File.Exists(folderPath & Path.GetFileName(imagen3.FileName)) Then
                    File.Delete(folderPath & Path.GetFileName(imagen3.FileName))
                End If
                imagen3.SaveAs(folderPath & Path.GetFileName(imagen3.FileName))
                tmpCountImg += 1
                ResUpdate = GymUtils.Update_Gym_Images(grdBuscar.SelectedValue, "Img3", imagen3.FileName)
            End If

        Catch ex As Exception
            lblCargaImagenes.Text = "Error al cargar: " & ex.Message
            Exit Sub
        End Try

        lblCargaImagenes.Text = "Se cargaron " & tmpCountImg & " Imagenes con Exito"
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        ImagenesDiv.Visible = False
        Disc_Serv_Div.Visible = False
        Contactos_Div.Visible = False
        Banco_div.Visible = False
    End Sub

    Protected Sub FormView1_ModeChanged(sender As Object, e As System.EventArgs) Handles FormView1.ModeChanged
        If FormView1.CurrentMode = FormViewMode.Edit Then
            ImagenesDiv.Visible = False
            Disc_Serv_Div.Visible = False
            Contactos_Div.Visible = False
            Banco_div.Visible = False
        End If
        If FormView1.CurrentMode = FormViewMode.ReadOnly Then
            ImagenesDiv.Visible = True
            Disc_Serv_Div.Visible = True
            Contactos_Div.Visible = True
            Banco_div.Visible = True
        End If
    End Sub

    Protected Sub NewContact_Click(sender As Object, e As System.EventArgs) Handles NewContact.Click
        Dim GymUtils As New Gym_Utils
        Dim insResult As Int16

        insResult = GymUtils.InsertContacto(grdBuscar.SelectedValue, txtContactName.Text, txtContactCel.Text, txtContactMail.Text, txtContactCargo.Text)

        txtContactCargo.Text = ""
        txtContactCel.Text = ""
        txtContactMail.Text = ""
        txtContactName.Text = ""

        grdContactos.DataBind()

    End Sub

    Protected Sub Frm_Banco_ModeChanged(sender As Object, e As System.EventArgs) Handles Frm_Banco.ModeChanged
        If Frm_Banco.CurrentMode = FormViewMode.Edit Then
            ImagenesDiv.Visible = True
            Disc_Serv_Div.Visible = True
            Contactos_Div.Visible = True
            Banco_div.Visible = True
        End If
        If Frm_Banco.CurrentMode = FormViewMode.ReadOnly Then
            ImagenesDiv.Visible = True
            Disc_Serv_Div.Visible = True
            Contactos_Div.Visible = True
            Banco_div.Visible = True
        End If

    End Sub

End Class