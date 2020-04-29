Imports System.Configuration
Imports System.Configuration.ConfigurationSettings
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Public Class Persona_Utils

    Public Function Persona_Insert(strEmail As String, strPassw As String, strNombre As String, strApellido As String,
                                   strCelular As String, strFecNac As String, strFecIng As String,
                                   strPlan As Int16, strCreditos As Int16, strEmpresa As Int16,
                                   strActivo As Int16, strSexo As String) As Int16

        Dim RetCode As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String = "INSERT INTO MG_Persona (" + _
          "Email          " + _
          ",Passw          " + _
          ",Nombre         " + _
          ",Apellido       " + _
          ",Celular        " + _
          ",FecNacimiento  " + _
          ",FecIngreso     " + _
          ",Id_Plan        " + _
          ",CredDisponible " + _
          ",Id_empresa     " + _
          ",Activo         " + _
          ",Sexo)        " + _
        "VALUES(" + _
           "'" + strEmail + "'" + _
           ",'" + strPassw + "'" + _
           ",'" + strNombre + "'" + _
           ",'" + strApellido + "'" + _
           ",'" + strCelular + "'" + _
           ",cast('" + strFecNac + "' as datetime)" + _
           ",cast('" + strFecIng + "' as datetime)" + _
           "," + strPlan.ToString + _
           "," + strCreditos.ToString + _
           "," + strEmpresa.ToString + _
           "," + strActivo.ToString + _
           ",'" + strSexo.ToString + "')"

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                Try
                    RetCode = command.ExecuteNonQuery()
                Finally
                    connection.Close()
                End Try
            End Using

        Catch ex As SqlException
            For Each SqlError In ex.Errors
                RetCode = ex.Errors(0).Number
                Dim msg As String = String.Format("{0}: {1}", SqlError.Number, SqlError.Message)
            Next

            ' RetCode = SqlError.Number
        End Try

        Return RetCode

    End Function

    Public Function CheckLogin(tmpLogin As String, tmpPassword As String, tmpTipoUser As String) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String

        ' tmpTipoUser = 'P'= Persona, "G"= Gym, 'E' = Empresa, 'F' = Familia
        Select Case tmpTipoUser
            Case "P"
                queryString = "SELECT * FROM MG_Persona WHERE "
            Case "G"
                queryString = "SELECT * FROM MG_Gym WHERE "
            Case "E"
                queryString = "SELECT * FROM MG_Empresa WHERE "
            Case "F"
                queryString = "SELECT * FROM MG_Familia WHERE "
            Case Else
                Return Nothing
        End Select

        queryString += "Email = '" & tmpLogin & "' AND  Passw = '" & tmpPassword & "'"

        Dim DTReturn As New DataTable

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                Dim reader As SqlDataReader = command.ExecuteReader()
                Try
                    DTReturn.Load(reader)
                Finally
                    reader.Close()
                End Try
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in CheckLogin")
        End Try

        Return DTReturn

    End Function

    Public Function ReadUsuarioLogin(tmpLogin As String) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        queryString = "Select * From MG_Persona where Email = '" & tmpLogin & "' "

        Dim DTReturn As New DataTable

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                Dim reader As SqlDataReader = command.ExecuteReader()
                Try
                    DTReturn.Load(reader)
                Finally
                    reader.Close()
                    connection.Close()
                End Try
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in CheckLogin")
        End Try

        Return DTReturn

    End Function

    Public Function ReadPersonaID_Created() As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        Dim insResult As Int16

        queryString = "SELECT SCOPE_IDENTITY()"

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                Try
                    insResult = command.ExecuteNonQuery()
                Finally
                    connection.Close()
                End Try
            End Using

        Catch ex As SqlException
            For Each SqlError In ex.Errors
                insResult = ex.Errors(0).Number
                Dim msg As String = String.Format("{0}: {1}", SqlError.Number, SqlError.Message)
            Next

            ' RetCode = SqlError.Number
        End Try

        Return insResult

    End Function

    Public Function ReadPersona_ID(tmpID As Int16) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        Dim DTReturn As New DataTable

        queryString = "SELECT a.id,a.nombre,a.apellido,a.Id_Plan, b.Nombre as NombrePlan, b.Precio as Precio, b.Creditos as Creditos, " &
                    "ImagenQR, DescQR " &
                    "FROM mg_persona a, mg_planes b " &
                    "WHERE (a.id_plan = b.id And a.id = " & Val(tmpID) & ")"

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                Dim reader As SqlDataReader = command.ExecuteReader()
                Try
                    DTReturn.Load(reader)
                Finally
                    reader.Close()
                End Try
            End Using

        Catch ex As SqlException
            For Each SqlError In ex.Errors
                Dim msg As String = String.Format("{0}: {1}", SqlError.Number, SqlError.Message)
            Next

            ' RetCode = SqlError.Number
        End Try

        Return DTReturn

    End Function

    Public Function SearchPersona(tmpBuscar As String, tmpCampo As String) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        Dim DTReturn As New DataTable

        queryString = "SELECT Id, Nombre, Apellido, Email, Id_Plan, CredDisponible as Cred_Disp, FecIngreso as Fecha_Ing " &
                    "FROM MG_Persona "

        Select Case tmpCampo
            Case "ID"
                queryString += "WHERE Id = " & Val(tmpBuscar)
            Case "Nombre"
                queryString += "WHERE Nombre like '%" & tmpBuscar & "%'" ' AND DATEDIFF(day,fecingreso,GETDATE()) < 30"
            Case "Apellido"
                queryString += "WHERE Apellido like '%" & tmpBuscar & "%'" ' AND DATEDIFF(day,fecingreso,GETDATE()) < 30"
            Case "Email"
                queryString += "WHERE Email like '%" & tmpBuscar & "%' " 'AND DATEDIFF(day,fecingreso,GETDATE()) < 30"
        End Select

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                Dim reader As SqlDataReader = command.ExecuteReader()
                Try
                    DTReturn.Load(reader)
                Finally
                    reader.Close()
                End Try
            End Using

        Catch ex As SqlException
            For Each SqlError In ex.Errors
                Dim msg As String = String.Format("{0}: {1}", SqlError.Number, SqlError.Message)
            Next
        End Try

        Return DTReturn

    End Function

    Public Function ChangeUserPassword(tmpID As Int16, tmpNewPass As String) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        Dim insResult As Int16

        queryString = "Update MG_Persona set Passw = '" & tmpNewPass & "' Where ID = " & tmpID

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                Try
                    insResult = command.ExecuteNonQuery()
                Finally
                    connection.Close()
                End Try
            End Using

        Catch ex As SqlException
            For Each SqlError In ex.Errors
                insResult = ex.Errors(0).Number
                Dim msg As String = String.Format("{0}: {1}", SqlError.Number, SqlError.Message)
            Next

            ' RetCode = SqlError.Number
        End Try

        Return insResult

    End Function

    Public Function InsertPago(tmpIdUsuario As Int16, tmpFechaPago As String, tmpMonto As Int16, tmpIdFormaPago As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        queryString = "INSERT INTO MG_Pagos (id_Persona, FecPago, Monto, Id_FormaPago) " &
                    "VALUES (" & tmpIdUsuario & ", CAST('" & tmpFechaPago & "' as date ), " & tmpMonto & ", " & tmpIdFormaPago & ")"

        Dim insResult As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                insResult = command.ExecuteNonQuery()
                connection.Close()
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in CheckLogin")
        End Try

        Return insResult

    End Function

    Public Function UpdateCredDisponible(tmpIdUsuario As Int16, tmpMonto As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        queryString = "UPDATE MG_Persona SET CredDisponible = CredDisponible + " & tmpMonto & ", Activo = 1 "
        queryString += "WHERE Id = " & tmpIdUsuario

        Dim insResult As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                insResult = command.ExecuteNonQuery()
                connection.Close()
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in CheckLogin")
        End Try

        Return insResult

    End Function


    Public Function CheckIn(Id_Usuario As Int16, Id_Gym As Int16, CredUsado As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        Dim queryString2 As String

        queryString = "INSERT INTO [Multigym].[dbo].[MG_Visitas] " &
                    "(id_persona, id_gym, fecVisita, credusado) values " &
                    "(" & Id_Usuario & ", " & Id_Gym & ", DATEADD(hour, -4, GETUTCDATE()), " & CredUsado & ")"

        queryString2 = "UPDATE MG_Persona SET creddisponible = creddisponible - " & CredUsado & " WHERE Id = " & Id_Usuario

        Dim insResult As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                Dim command2 As New SqlCommand(queryString2, connection)
                connection.Open()
                insResult = command.ExecuteNonQuery()
                If insResult = 1 Then
                    insResult = command2.ExecuteNonQuery()
                End If
                connection.Close()
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in CheckLogin")
        End Try

        Return insResult

    End Function


    Public Function CreaToken(tmpIdUsuario As Int16) As String
        Dim tmpToken As String
        tmpToken = tmpIdUsuario & "+" & Now.ToFileTime
        Return tmpToken
    End Function

    Public Function ValidaToken(tmpIdUsuario As Int16, tmpToken As Int16) As Boolean
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultigymConnString").ToString
        Dim queryString As String
        Dim TokenDB As Int16
        queryString = "SELECT Token from MG_Persona WHERE Id = " & tmpIdUsuario

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                ' connection.Open()
                TokenDB = command.ExecuteScalar
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in ReadGymAll_ID")
        End Try

        If TokenDB = tmpToken Then
            Return True
        Else
            Return False
        End If

    End Function

End Class
