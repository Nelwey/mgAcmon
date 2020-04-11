Imports System.Configuration
Imports System.Configuration.ConfigurationSettings
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Public Class Gym_Utils

    Public Function Gym_Insert(
        tmpId_Ciudad As Int16,
        tmpNombre As String,
        tmpDireccion As String,
        tmpReferencias As String,
        tmpTelefono As String,
        tmpCelular As String,
        tmpWeb As String,
        tmpFacebook As String,
        tmpEmail As String,
        tmpLat As String,
        tmpLon As String,
        tmpCreditos As Int16,
        tmpImgLogo As String,
        tmpImg1 As String,
        tmpImg2 As String,
        tmpImg3 As String,
        tmpHorarioLV As String,
        tmpHorarioS As String,
        tmpHorarioDF As String,
        tmpFecActivacion As String,
        tmpActivo As Int16,
        tmpInstagram As String,
        tmpPassw As String) As Int16

        Dim RetCode As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String = "INSERT INTO MG_Gym (" + _
            "Ciudad, " + _
            "Nombre, " + _
            "Direccion, " + _
            "Referencias, " + _
            "Telefono, " + _
            "Celular, " + _
            "Web, " + _
            "Facebook, " + _
            "Email, " + _
            "Lat, " + _
            "Lon, " + _
            "Creditos, " + _
            "ImgLogo, " + _
            "Img1, " + _
            "Img2, " + _
            "Img3, " + _
            "HorarioLV, " + _
            "HorarioS, " + _
            "HorarioDF, " + _
            "FecActivacion, " + _
            "Activo, " + _
            "Instagram, " + _
            "Passw) " + _
        "VALUES (" + _
            tmpId_Ciudad + ", '" + _
            tmpNombre + "', '" + _
            tmpDireccion + "', '" + _
            tmpReferencias + "', '" + _
            tmpTelefono + "', '" + _
            tmpCelular + "', '" + _
            tmpWeb + "', '" + _
            tmpFacebook + "', '" + _
            tmpEmail + "', " + _
            Val(tmpLat) + ", " + _
            Val(tmpLon) + ", " + _
            Val(tmpCreditos) + ", '" + _
            tmpImgLogo + "', '" + _
            tmpImg1 + "', '" + _
            tmpImg2 + "', '" + _
            tmpImg3 + "', '" + _
            tmpHorarioLV + "', '" + _
            tmpHorarioS + "', '" + _
            tmpHorarioDF + "', " + _
            "cast(getdate() as smalldatetime)" + ", " + _
            tmpActivo + ", '" + _
            tmpInstagram + "', '" + _
            tmpPassw + "'))"

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
                Return SqlError.Number
            Next

            ' RetCode = SqlError.Number
        End Try

        Return RetCode

    End Function

    Public Function ReadVisitas(tmpGymID As String, tmpFecha1 As String, tmpFecha2 As String) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "SELECT a.Id, a.Id_Gym, b.Apellido, b.Nombre, " &
                    "convert(nvarchar(30),a.FecVisita,103) AS Fecha, convert(nvarchar(5),a.FecVisita,108) AS Hora, " &
                    "a.CredUsado " &
                    "from mg_visitas a " &
                    "INNER JOIN MG_Persona b ON b.Id = a.Id_Persona " &
                    "WHERE a.Id_Gym = " + tmpGymID
        If tmpFecha2 = "" Then
            queryString += " AND convert(date,a.FecVisita,103) = convert(date,'" + tmpFecha1 + "',103) "
        Else
            queryString += " AND convert(date,a.FecVisita,103) >= convert(date,'" + tmpFecha1 + "',103)  AND " &
            " convert(date,a.FecVisita,103) <= convert(date,'" + tmpFecha2 + "',103)  "
        End If

        queryString += " Order by a.FecVisita desc"

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

    Public Function ReadVisitasResumen(tmpGymID As String) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "SELECT count(*) VisTotal, sum(CredUsado) CredTotal FROM MG_visitas " &
                    "WHERE id_Gym = " & tmpGymID & " GROUP BY id_gym"

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

    Public Function CheckLogin(tmpLogin As String, tmpPassword As String) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "Select Id, Login, Passw, Nombre, Apellido, CredDisponible, Token, Activo " &
                    "From MG_Persona where Login = '" & tmpLogin & "' " &
                    "AND Passw = '" & tmpPassword & "'"

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

    Public Function CheckLoginExiste(tmpLogin As String) As Boolean
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        Dim LoginDB As Int16
        queryString = "SELECT count(*) from MG_Persona WHERE Login = " & tmpLogin

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                ' connection.Open()
                LoginDB = command.ExecuteScalar
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in ValidaLogin")
        End Try

        If LoginDB = 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Function ReadUsuarioLogin(tmpLogin As String) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "Select * From MG_Persona where Login = '" & tmpLogin & "' "

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

    Public Function InsertReview(tmpId_Pers As Int16, tmpId_Gym As Int16, tmpNota As Int16, tmpObser As String) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        Dim queryString2 As String

        queryString = "INSERT INTO [dbo].[MG_Reviews] " &
                    "(ID_Persona, Id_Gym, FecReview, Calificacion, Review) Values " &
                    "(" & tmpId_Pers & ", " & tmpId_Gym & ", DATEADD(hour, -4, GETUTCDATE()), " & tmpNota & ", '" & tmpObser & "')"

        queryString2 = "UPDATE [dbo].[MG_Gym] set ReviewCount = (select count(*) from MG_Reviews where id_gym = " & tmpId_Gym & "), " &
                    "ReviewAverage = (select round(avg(calificacion+0.0),2) from mg_reviews where id_gym = " & tmpId_Gym & ") " &
                    "WHERE id = " & tmpId_Gym

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
            Console.WriteLine("Error in InsertReview")
        End Try

        Return insResult

    End Function

    Public Function ReadReviewResumen(tmpId_Gym As Int16) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String

        queryString = "SELECT COUNT(*) Cantidad, round(avg(calificacion+0.0),2) Nota " &
                    "FROM MG_Reviews WHERE id_gym = " & tmpId_Gym

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
            Console.WriteLine("Error in ReadReviewResumen")
        End Try

        If DTReturn.Rows.Count = 0 Then
            'DTReturn.Columns.Add("Cantidad")
            'DTReturn.Columns.Add("Nota")

            Dim dr As DataRow
            dr = DTReturn.NewRow()

            dr.Item("Cantidad") = 0
            dr.Item("Nota") = 0
            DTReturn.Rows.Add(dr)
        End If

        Return DTReturn

    End Function

    Public Function ReadReviewDetalle(tmpId_Gym As Int16) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String

        queryString = "select Calificacion, Count(Calificacion) as Cantidad " &
                    "FROM MG_Reviews " &
                    "WHERE id_gym = " & tmpId_Gym & " " &
                    "GROUP BY Calificacion ORDER BY Calificacion"

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
            Console.WriteLine("Error in ReadReviewDetalle")
        End Try

        If DTReturn.Rows.Count = 0 Then

            Dim dr As DataRow
            dr = DTReturn.NewRow()

            dr.Item("Calificacion") = 0
            dr.Item("Cantidad") = 0
            DTReturn.Rows.Add(dr)
        End If

        Return DTReturn

    End Function

    Public Function ReadReviewsByGym(tmpGymID As Int16) As DataTable
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "SELECT top 25 b.nombre Persona, a.fecReview Fecha, a.Calificacion Nota, a.Review Comentario " + _
                "FROM mg_reviews a " + _
                "INNER JOIN MG_Persona b on b.id = a.Id_Persona " + _
                "WHERE a.Id_Gym = " + tmpGymID.ToString + " ORDER BY a.fecReview DESC"

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

        Catch ex As SqlException
            Console.WriteLine(ex.ErrorCode, ex.Message)
        End Try

        Return DTReturn

    End Function

    Public Function InsertContacto(Id_Gym As Int16, tmpNombre As String, tmpCelular As String, tmpEmail As String, tmpCargo As String) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String

        queryString = "INSERT INTO MG_Gym_Contacto " &
                    "(id_gym, Nombre, Celular, Email, Cargo) values (" &
                    Id_Gym & ", '" & tmpNombre & "', '" & tmpCelular & "', '" & tmpEmail & "', '" & tmpCargo & "')"

        Dim insResult As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                insResult = command.ExecuteNonQuery()
                connection.Close()
            End Using

        Catch ex As Exception
            Console.WriteLine("Error in InsertContacto")
        End Try

        Return insResult

    End Function

    Public Function CheckIn(Id_Usuario As Int16, Id_Gym As Int16, CredUsado As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
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

    Public Function Delete_Gym_Disc(tmpGymID As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "DELETE FROM MG_Gym_Disc WHERE Id_Gym = " & tmpGymID
        Dim RetValue As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                RetValue = command.ExecuteNonQuery()
                command.Dispose()
                connection.Close()
            End Using
        Catch ex As SqlException
            Console.WriteLine(ex.ErrorCode, ex.Message)
        End Try

        Return RetValue

    End Function

    Public Function Insert_Gym_Disc(tmpGymID As Int16, tmpDiscID As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "Insert into MG_Gym_Disc (Id_Gym, Id_Disciplina) " & _
                " Values (" & tmpGymID & ", " & tmpDiscID & ")"
        Dim RetValue As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                RetValue = command.ExecuteNonQuery()
                command.Dispose()
                connection.Close()
            End Using
        Catch ex As SqlException
            Console.WriteLine(ex.ErrorCode, ex.Message)
        End Try

        Return RetValue

    End Function

    Public Function Delete_Gym_Serv(tmpGymID As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "DELETE FROM MG_Gym_Serv WHERE Id_Gym = " & tmpGymID
        Dim RetValue As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                RetValue = command.ExecuteNonQuery()
                command.Dispose()
                connection.Close()
            End Using
        Catch ex As SqlException
            Console.WriteLine(ex.ErrorCode, ex.Message)
        End Try

        Return RetValue

    End Function

    Public Function Insert_Gym_Serv(tmpGymID As Int16, tmpServID As Int16) As Int16
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "Insert into MG_Gym_Serv (Id_Gym, Id_Servicio) " & _
                " Values (" & tmpGymID & ", " & tmpServID & ")"
        Dim RetValue As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                RetValue = command.ExecuteNonQuery()
                command.Dispose()
                connection.Close()
            End Using
        Catch ex As SqlException
            Console.WriteLine(ex.ErrorCode, ex.Message)
        End Try

        Return RetValue

    End Function

    Public Function Update_Gym_Images(tmpGymID As Int16, tmpField As String, tmpImg As String) As Int16

        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
        Dim queryString As String
        queryString = "UPDATE MG_Gym Set " & tmpField & " = '" & tmpImg & "' WHERE Id = " & tmpGymID

        Dim RetValue As Int16

        Try
            Using connection As New SqlConnection(connString.ToString)
                Dim command As New SqlCommand(queryString, connection)
                connection.Open()
                RetValue = command.ExecuteNonQuery()
                command.Dispose()
                connection.Close()
            End Using
        Catch ex As SqlException
            Console.WriteLine(ex.ErrorCode, ex.Message)
        End Try

        Return RetValue

    End Function


    Public Function CreaToken(tmpIdUsuario As Int16) As String
        Dim tmpToken As String
        tmpToken = tmpIdUsuario & "+" & Now.ToFileTime
        Return tmpToken
    End Function

    Public Function ValidaToken(tmpIdUsuario As Int16, tmpToken As Int16) As Boolean
        Dim connString As String = ConfigurationManager.ConnectionStrings("MultiGymWeb").ToString
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
