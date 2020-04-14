<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Gyms_Master.aspx.vb" Inherits="Gyms_Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Maestro de Gimnasios</h2>
        </div>
        <div class="col-12 py-3 py-0">
            <div class="row ">
                <div class="col-12 col-sm-6 col-md-8 col-lg-4 mb-3 mb-md-0 ">
                    <asp:TextBox ID="txtBuscar" runat="server" class="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-8">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" class="btn btn-sm btn-dark" />
                    <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Centro" class="btn btn-sm btn-dark" />
                </div>
            </div>
        </div>
        <div class="col-12">
            <asp:GridView ID="grdBuscar" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                DataSourceID="SqlDataSource2" class="table table-responsive-lg table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                    <asp:BoundField ApplyFormatInEditMode="True" DataField="FecActivacion"
                        DataFormatString="{0:dd/MM/yyyy}" HeaderText="FecActivacion" SortExpression="FecActivacion" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <div class="col-12 mb-5 border-bottom">

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" class="w-100">

                <%--view--%>
                <ItemTemplate>
                    <div class="row p-3 justify-content-between" id="contenedorGymsView">
                        <!-- script para no tener que repetir todo ese chorizo, solo funca para itemTemplate -->
                        <script>
                            let gymS = [{
                                    nameInfo: 'ID',
                                    gymId: 'IDLabel',
                                    gymSource: '<%#Eval("ID")%>'
                                },
                                {
                                    nameInfo: 'ID Ciudad',
                                    gymId: 'Id_CiudadLabel',
                                    gymSource: '<%#Eval("Id_Ciudad")%>'
                                },
                                {
                                    nameInfo: 'Nombre',
                                    gymId: 'NombreLabel',
                                    gymSource: '<%#Eval("Nombre")%>'
                                },
                                {
                                    nameInfo: 'FecActivacion',
                                    gymId: 'FecActivacionLabel',
                                    gymSource: '<%#Eval("FecActivacion")%>'
                                },
                                {
                                    nameInfo: 'Celular',
                                    gymId: 'CelularLabel',
                                    gymSource: '<%#Eval("Celular")%>'
                                },
                                {
                                    nameInfo: 'ImgLogo',
                                    gymId: 'ImgLogoLabel',
                                    gymSource: '<%#Eval("ImgLogo")%>'
                                },
                                {
                                    nameInfo: 'Telefono',
                                    gymId: 'TelefonoLabel',
                                    gymSource: '<%#Eval("Telefono")%>'
                                },
                                {
                                    nameInfo: 'Img1',
                                    gymId: 'Img1Label',
                                    gymSource: '<%#Eval("Img1")%>'
                                },
                                {
                                    nameInfo: 'Direccion',
                                    gymId: 'DireccionLabel',
                                    gymSource: '<%#Eval("Direccion")%>'
                                },
                                {
                                    nameInfo: 'Img2',
                                    gymId: 'Img2Label',
                                    gymSource: '<%#Eval("Img2")%>'
                                },
                                {
                                    nameInfo: 'Passw',
                                    gymId: 'PasswLabel',
                                    gymSource: '<%#Eval("Passw")%>'
                                },
                                {
                                    nameInfo: 'Img3',
                                    gymId: 'Img3Label',
                                    gymSource: '<%#Eval("Img3")%>'
                                },
                                {
                                    nameInfo: 'Email',
                                    gymId: 'EmailLabel',
                                    gymSource: '<%#Eval("Email")%>'
                                },
                                {
                                    nameInfo: 'Lat',
                                    gymId: 'LatLabel',
                                    gymSource: '<%#Eval("Lat")%>'
                                },
                                {
                                    nameInfo: 'Web',
                                    gymId: 'WebLabel',
                                    gymSource: '<%#Eval("Web")%>'
                                },
                                {
                                    nameInfo: 'Lon',
                                    gymId: 'LonLabel',
                                    gymSource: '<%#Eval("Lon")%>'
                                },
                                {
                                    nameInfo: 'Facebook',
                                    gymId: 'FacebookLabel',
                                    gymSource: '<%#Eval("Facebook")%>'
                                },
                                {
                                    nameInfo: 'ReviewCount',
                                    gymId: 'ReviewCountLabel',
                                    gymSource: '<%#Eval("ReviewCount")%>'
                                },
                                {
                                    nameInfo: 'Instagram',
                                    gymId: 'InstagramLabel',
                                    gymSource: '<%#Eval("Instagram")%>'
                                },
                                {
                                    nameInfo: 'ReviewAverage',
                                    gymId: 'ReviewAverageLabel',
                                    gymSource: '<%#Eval("ReviewAverage")%>'
                                },
                                {
                                    nameInfo: 'Horarios LV',
                                    gymId: 'HorarioLV',
                                    gymSource: '<%#Eval("HorarioLV")%>'
                                },
                                {
                                    nameInfo: 'Creditos',
                                    gymId: 'CreditosLabel',
                                    gymSource: '<%#Eval("Creditos")%>'
                                },
                                {
                                    nameInfo: 'HorarioS',
                                    gymId: 'HorarioSLabel',
                                    gymSource: '<%#Eval("HorarioS")%>'
                                },
                                {
                                    nameInfo: 'HorarioDF',
                                    gymId: 'HorarioDFLabel',
                                    gymSource: '<%#Eval("HorarioDF")%>'
                                },
                                {
                                    nameInfo: 'Referencias',
                                    gymId: 'ReferenciasLabel',
                                    gymSource: '<%#Eval("Referencias")%>'
                                }
                            ];

                            gymS.forEach(element => {


                                $('#contenedorGymsView').append(`
            
                                <div class="col-12  col-md-5 col mb-2">
                                    <div class="row">
                                        <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                            <small>${element.nameInfo}: </small>
                                        </div>
                                        <div class="col border bg-white">
                                            <small id="${element.gymId}"> ${element.gymSource}</small>
                                        </div>
                                    </div>
                                </div>
                            `);


                            });
                        </script>

                        <div class="col-12  col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Activo:</small>
                                </div>
                                <div class="col border bg-amarillo">
                                    <asp:CheckBox ID="ActivoCheckBox" runat="server" Checked='<%# Bind("Activo") %>'
                                        Enabled="false" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12">

                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="Editar" class="btn btn-dark btn-sm" />
                            &nbsp;
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                                CommandName="Delete" Text="Eliminar" class="d-none btn btn-primary btn-sm" />
                            &nbsp;
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                Text="Nuevo" class="btn btn-dark btn-sm" />

                        </div>

                    </div>
                </ItemTemplate>

                <%-- View_actualizar--%>
                <EditItemTemplate>

                    <div class="row p-3 justify-content-between">

                        <div class="col-12 col-md-5  mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>ID:</small>
                                </div>
                                <div class="col">
                                    <input ID="IDLabel" type="text" runat="server" value='<%#Bind("ID") %>'
                                        class="form-control form-control-sm" disabled />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Id_Ciudad:</small>
                                </div>
                                <div class="col">
                                    <input ID="Id_CiudadTextBox" type="text" runat="server"
                                        value='<%#Bind("Id_Ciudad") %>' class="form-control form-control-sm" disabled />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Nombre:</small>
                                </div>
                                <div class="col">
                                    <input ID="NombreTextBox" type="text" runat="server" value='<%#Bind("Nombre") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Fecha Activacion:</small>
                                </div>
                                <div class="col">
                                    <input ID="FecActivacionTextBox" type="text" runat="server"
                                        value='<%#Bind("FecActivacion") %>' class="form-control form-control-sm"
                                        disabled />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Celular:</small>
                                </div>
                                <div class="col">
                                    <input ID="CelularTextBox" type="text" runat="server" value='<%#Bind("Celular") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Logo:</small>
                                </div>
                                <div class="col">
                                    <input ID="ImgLogoTextBox" type="text" runat="server" value='<%#Bind("ImgLogo") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Telefono:</small>
                                </div>
                                <div class="col">
                                    <input ID="TelefonoTextBox" type="text" runat="server"
                                        value='<%#Bind("Telefono") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Imagen 1:</small>
                                </div>
                                <div class="col">
                                    <input ID="Img1TextBox" type="text" runat="server" value='<%#Bind("Img1") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Direccion:</small>
                                </div>
                                <div class="col">
                                    <input ID="DireccionTextBox" type="text" runat="server"
                                        value='<%#Bind("Direccion") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Imagen 2:</small>
                                </div>
                                <div class="col">
                                    <input ID="Img2TextBox" type="text" runat="server" value='<%#Bind("Img2") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Passw:</small>
                                </div>
                                <div class="col">
                                    <input ID="PasswTextBox" type="text" runat="server" value='<%#Bind("Passw") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Imagen 3:</small>
                                </div>
                                <div class="col">
                                    <input ID="Img3TextBox" type="text" runat="server" value='<%#Bind("Img3") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Email:</small>
                                </div>
                                <div class="col">
                                    <input ID="EmailTextBox" type="text" runat="server" value='<%#Bind("Email") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Lat:</small>
                                </div>
                                <div class="col">
                                    <input ID="LatTextBox" type="text" runat="server" value='<%#Bind("Lat") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Web:</small>
                                </div>
                                <div class="col">
                                    <input ID="WebTextBox" type="text" runat="server" value='<%#Bind("Web") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Lon:</small>
                                </div>
                                <div class="col">
                                    <input ID="LonTextBox" type="text" runat="server" value='<%#Bind("Lon") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Facebook:</small>
                                </div>
                                <div class="col">
                                    <input ID="FacebookTextBox" type="text" runat="server"
                                        value='<%#Bind("Facebook") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Review Count:</small>
                                </div>
                                <div class="col">
                                    <input ID="ReviewCountTextBox" type="text" runat="server"
                                        value='<%#Bind("ReviewCount") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Instagram:</small>
                                </div>
                                <div class="col">
                                    <input ID="InstagramTextBox" type="text" runat="server"
                                        value='<%#Bind("Instagram") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Review Promedio:</small>
                                </div>
                                <div class="col">
                                    <input ID="ReviewAverageTextBox" type="text" runat="server"
                                        value='<%#Bind("ReviewAverage") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Horario Lu-Vi:</small>
                                </div>
                                <div class="col">
                                    <input ID="HorarioLV" type="text" runat="server" value='<%#Bind("HorarioLV") %>'
                                        class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Creditos:</small>
                                </div>
                                <div class="col">
                                    <input ID="CreditosTextBox" type="text" runat="server"
                                        value='<%#Bind("Creditos") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Horario Sab:</small>
                                </div>
                                <div class="col">
                                    <input ID="HorarioSTextBox" type="text" runat="server"
                                        value='<%#Bind("HorarioS") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Horario Dom/Feriado:</small>
                                </div>
                                <div class="col">
                                    <input ID="HorarioDFTextBox" type="text" runat="server"
                                        value='<%#Bind("HorarioDF") %>' class="form-control form-control-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Activo:</small>
                                </div>
                                <div class="col">
                                    <asp:CheckBox ID="ActivoCheckBox" runat="server" checked='<%# Bind("Activo") %>' />
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Referencias:</small>
                                </div>
                                <div class="col">
                                    <textarea ID="Referencias" runat="server" value='<%# Bind("Referencias") %>'
                                        class="form-control form-control-sm"></textarea>
                                </div>
                            </div>
                        </div>



                        <div class="col-12">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                CommandName="Update" Text="Actualizar" Cssclass="btn btn-dark btn-sm" />
                            &nbsp;
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancelar" Cssclass="btn btn-danger btn-sm " />
                        </div>
                    </div>

                </EditItemTemplate>

                <%-- View_insertar--%>
                <InsertItemTemplate>
                    <div class="row p-3 justify-content-between">

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Nombre:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'
                                            class="form-control form-control-sm " />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Id_Ciudad:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="Id_CiudadTextBox" runat="server"
                                            Text='<%# Bind("Id_Ciudad") %>' class="form-control form-control-sm " />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Celular:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="CelularTextBox" runat="server" Text='<%# Bind("Celular") %>'
                                            class="form-control form-control-sm " />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Fecha Activacion:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="FecActivacionTextBox" runat="server"
                                            Text='<%# Bind("FecActivacion") %>' class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Telefono:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="TelefonoTextBox" runat="server" Text='<%# Bind("Telefono") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Logo:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="ImgLogoTextBox" runat="server" Text='<%# Bind("ImgLogo") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Direccion:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="DireccionTextBox" runat="server"
                                            Text='<%# Bind("Direccion") %>' class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Imagen 1:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="Img1TextBox" runat="server" Text='<%# Bind("Img1") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Passw:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="PasswTextBox" runat="server" Text='<%# Bind("Passw") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Imagen 2:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="Img2TextBox" runat="server" Text='<%# Bind("Img2") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Email:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Imagen 3:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="Img3TextBox" runat="server" Text='<%# Bind("Img3") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Web:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="WebTextBox" runat="server" Text='<%# Bind("Web") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Lat:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="LatTextBox" runat="server" Text='<%# Bind("Lat") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Facebook:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="FacebookTextBox" runat="server" Text='<%# Bind("Facebook") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Lon:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="LonTextBox" runat="server" Text='<%# Bind("Lon") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Instagram:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="InstagramTextBox" runat="server"
                                            Text='<%# Bind("Instagram") %>' class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Creditos:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="CreditosTextBox" runat="server" Text='<%# Bind("Creditos") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>


                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Horarios Lu-Vi:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="HorarioLV" runat="server" Text='<%# Bind("HorarioLV") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>ReviewCount:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="ReviewCountTextBox" runat="server"
                                            Text='<%# Bind("ReviewCount") %>' class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Horario Sab:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="HorarioSTextBox" runat="server" Text='<%# Bind("HorarioS") %>'
                                            class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>ReviewAverage:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="ReviewAverageTextBox" runat="server"
                                            Text='<%# Bind("ReviewAverage") %>' class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Horario Dom/Feriado:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox ID="HorarioDFTextBox" runat="server"
                                            Text='<%# Bind("HorarioDF") %>' class="form-control form-control-sm" />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Activo:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:CheckBox ID="ActivoCheckBox" runat="server"
                                            Checked='<%# Bind("Activo") %>' />
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-5 mb-2">
                            <div class="row">
                                <div class="col-3 col-sm-4 col-xl-4 bg-azul text-white">
                                    <small>Referencias:</small>
                                </div>
                                <div class="col">
                                    <small class="text-light">
                                        <asp:TextBox TextMode="MultiLine" Rows="5" class="form-control form-control-sm"
                                            id="Referencias" runat="server" text='<%# Bind("Referencias") %>'>
                                        </asp:TextBox>
                                    </small>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                CommandName="Insert" Text="Insertar" Cssclass="btn btn-dark btn-sm" />
                            &nbsp;
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancelar" Cssclass="btn btn-danger btn-sm mr-2" />
                        </div>

                    </div>
                </InsertItemTemplate>

            </asp:FormView>

        </div>
        <div class="col-12 mb-5 border-bottom">

            <div class="row p-2" id="ImagenesDiv" runat="server">
                <!-- Carga Imagenes  -->
                <div class="col-12 col-sm-6 col-lg-3  pb-3 ">
                    <h3 class="bg-azul text-white p-2 rounded">Logo</h3>

                    <div class="custom-file mb-3">
                        <asp:FileUpload ID="logo" runat="server" />

                    </div>

                    <div>
                        <img id="contLogo" src="http://placehold.it/180" class="imgSize" alt="" runat="server" />
                    </div>

                </div>
                <div class="col-12 col-sm-6 col-lg-3  ">
                    <h3 class="bg-azul text-white p-2 rounded">Imagen 1</h3>

                    <div class="custom-file mb-3">
                        <asp:FileUpload ID="imagen1" runat="server" />
                    </div>

                    <div>
                        <img id="contImagen1" src="http://placehold.it/180" class="imgSize" alt="" />
                    </div>

                </div>
                <div class="col-12 col-sm-6 col-lg-3  ">
                    <h3 class="bg-azul text-white p-2 rounded">Imagen 2</h3>

                    <div class="custom-file mb-3">
                        <asp:FileUpload ID="imagen2" runat="server" />
                    </div>
                    <div>
                        <img id="contImagen2" src="http://placehold.it/180" class="imgSize" alt="" />
                    </div>

                </div>
                <div class="col-12 col-sm-6 col-lg-3  ">
                    <h3 class="bg-azul text-white p-2 rounded">Imagen 3</h3>
                    <div class="custom-file mb-3">
                        <asp:FileUpload ID="imagen3" runat="server" />
                    </div>
                    <div>
                        <img id="contImagen3" src="http://placehold.it/180" class="imgSize" />
                    </div>
                </div>
                <div class="col-12 mt-2">
                    <asp:Button ID="btnCargaImagenes" runat="server" Text="Carga Imagenes"
                        class="btn btn-dark btn-sm" />
                    <asp:Label ID="lblCargaImagenes" runat="server" Text=""></asp:Label>
                </div>

            </div>

        </div>
        <div class="col-12 mb-5 border-bottom">
            <div class="row p-2" id="Disc_Serv_Div" runat="server">
                <div class="col py-3">
                    <h2 class="bg-azul text-white rounded p-2">Disciplinas</h2>
                    <asp:ListBox ID="lstGymDisc" runat="server" Width="80%" DataSourceID="SQL_GymDisc"
                        DataTextField="Disciplina" DataValueField="Id" Height="200px"
                        class="form-control form-control-sm">
                    </asp:ListBox>

                    <div style="height:auto;">
                        <asp:CheckBoxList ID="chkboxDisciplinas" runat="server" RepeatColumns="3" Width="80%"
                            DataSourceID="SQL_Disciplinas" DataTextField="Nombre" DataValueField="Id">
                        </asp:CheckBoxList>
                    </div>
                    <asp:Button ID="btnGrabaDisc" runat="server" Text="Grabar Disciplinas"
                        class="btn btn-dark btn-sm" />
                </div>
                <div class="col py-3">
                    <h2 class="bg-azul text-white rounded p-2">Servicios</h2>
                    <asp:ListBox ID="lstGymServ" runat="server" Width="80%" DataSourceID="SQL_GymServ"
                        DataTextField="Servicio" DataValueField="Id" Height="200px"
                        class="form-control form-control-sm">
                    </asp:ListBox>
                    <div style="height:auto;">
                        <asp:CheckBoxList ID="chkboxServicios" runat="server" RepeatColumns="3" Width="80%"
                            DataSourceID="SQL_Servicios" DataTextField="Nombre" DataValueField="Id">
                        </asp:CheckBoxList>
                    </div>
                    <asp:Button ID="btnGrabaServ" runat="server" Text="Grabar Servicios" class="btn btn-dark btn-sm" />
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="row" id="Contactos_Div" runat="Server">
                <h2 class="bg-azul text-white rounded p-2">Contactos</h2>
                <div class="col-12">

                    <div class="row">
                        <div class="col-12 col-sm-auto">
                            <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
                            <asp:TextBox ID="txtContactName" runat="server" class="form-control form-control-sm">
                            </asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-auto">
                            <asp:Label ID="Label2" runat="server" Text="Celular"></asp:Label>
                            <asp:TextBox ID="txtContactCel" runat="server" class="form-control form-control-sm">
                            </asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-auto">
                            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                            <asp:TextBox ID="txtContactMail" runat="server" class="form-control form-control-sm">
                            </asp:TextBox>
                        </div>
                        <div class="col col-12 col-sm-auto">
                            <asp:Label ID="Label4" runat="server" Text="Cargo"></asp:Label>
                            <asp:TextBox ID="txtContactCargo" runat="server" class="form-control form-control-sm">
                            </asp:TextBox>
                        </div>
                    </div>
                    <asp:Button ID="NewContact" runat="server" Text="Insertar Contacto"
                        class="btn btn-dark btn-sm my-3" />
                </div>

                <div class="col-12">
                    <asp:GridView ID="grdContactos" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataSourceID="SQL_Contactos" DataKeyNames="Id"
                        class="table table-responsive-lg table-sm">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                                SortExpression="Id" />
                            <asp:BoundField DataField="Id_Gym" HeaderText="Id_Gym" SortExpression="Id_Gym" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                </div>


            </div>
        </div>
        <div class="col-12">
            <!--  Bancos  -->
            <div id="Banco_div" runat="server">
                <asp:FormView ID="Frm_Banco" runat="server" DataKeyNames="ID" DataSourceID="SQL_Gym_Banco"
                    class="w-100">
                    <ItemTemplate>

                        <div class="row p-3 justify-content-between">

                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2 bg-azul text-white">
                                        <small>ID:</small>
                                    </div>
                                    <div class="col col-lg-4 bg-amarillo border">
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2  bg-azul text-white">
                                        <small>Id_Banco:</small>
                                    </div>
                                    <div class="col col-lg-4 bg-amarillo border">
                                        <asp:Label ID="Id_BancoLabel" runat="server" Text='<%# Eval("Id_Banco") %>' />
                                    </div>
                                </div>
                            </div>


                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2  bg-azul text-white">
                                        <small>BcoCuenta:</small>
                                    </div>
                                    <div class="col col-lg-4 bg-amarillo border">
                                        <asp:Label ID="BcoCuentaLabel" runat="server" Text='<%# Eval("BcoCuenta") %>' />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2  bg-azul text-white">
                                        <small>BcoCuentaHabiente:</small>
                                    </div>
                                    <div class="col col-lg-4 bg-amarillo border">
                                        <asp:Label ID="BcoCuentaHabienteLabel" runat="server"
                                            Text='<%# Eval("BcoCuentaHabiente") %>' />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2  bg-azul text-white">
                                        <small> BcoCI:</small>
                                    </div>
                                    <div class="col col-lg-4 bg-amarillo border">
                                        <asp:Label ID="BcoCILabel" runat="server" Text='<%# Eval("BcoCI") %>' />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-4 col-xl-2 mb-2 p-0">

                                <asp:DropDownList ID="ddnBanco" runat="server" DataTextField="Nombre"
                                    DataValueField="Id" DataSourceID="SQL_Bancos"
                                    SelectedValue='<%# Bind("Id_Banco") %>' class="form-control form-control-sm">
                                </asp:DropDownList>


                            </div>
                            <div class="col-12 p-0">

                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                                    CommandName="Edit" Text="Editar" class="btn btn-sm btn-dark" />
                                &nbsp;

                            </div>

                        </div>


                    </ItemTemplate>

                    <EditItemTemplate>
                        <div class="row p-3 justify-content-between">


                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2 bg-azul text-white">
                                        <small>ID:</small>
                                    </div>
                                    <div class="col col-lg-4">
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2 bg-azul text-white">
                                        <small>Id_Banco:</small>
                                    </div>
                                    <div class="col col-lg-4">
                                        <asp:TextBox ID="Id_BancoTextBox" runat="server" Text='<%# Bind("Id_Banco") %>'
                                            class="form-control form-control-sm" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2 bg-azul text-white">
                                        <small>BcoCuenta:</small>
                                    </div>
                                    <div class="col col-lg-4">
                                        <asp:TextBox ID="BcoCuentaTextBox" runat="server"
                                            Text='<%# Bind("BcoCuenta") %>' class="form-control form-control-sm" />
                                    </div>
                                </div>
                            </div>


                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2 bg-azul text-white">
                                        <small>BcoCuentaHabiente:</small>
                                    </div>
                                    <div class="col col-lg-4">
                                        <asp:TextBox ID="BcoCuentaHabienteTextBox" runat="server"
                                            Text='<%# Bind("BcoCuentaHabiente") %>'
                                            class="form-control form-control-sm" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="row">
                                    <div class="col-6 col-sm-5 col-md-3 col-lg-2 bg-azul text-white">
                                        <small>BcoCI:</small>
                                    </div>
                                    <div class="col col-lg-4">
                                        <asp:TextBox ID="BcoCITextBox" runat="server" Text='<%# Bind("BcoCI") %>'
                                            class="form-control form-control-sm" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-4 col-xl-2 mb-2 p-0">

                                <asp:DropDownList ID="ddnBanco" runat="server" DataTextField="Nombre"
                                    DataValueField="Id" DataSourceID="SQL_Bancos"
                                    SelectedValue='<%# Bind("Id_Banco") %>'>
                                </asp:DropDownList>


                            </div>
                            <div class="col-12 p-0">



                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="Actualizar" class="btn btn-sm btn-dark" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancelar" class="btn btn-sm btn-danger" />

                            </div>




                        </div>











                    </EditItemTemplate>

                    <InsertItemTemplate>
                        Id_Banco:
                        <asp:TextBox ID="Id_BancoTextBox" runat="server" Text='<%# Bind("Id_Banco") %>' />
                        <br />
                        <asp:DropDownList ID="ddnBanco" runat="server" DataTextField="Nombre" DataValueField="Id"
                            DataSourceID="SQL_Bancos" SelectedValue='<%# Bind("Id_Banco") %>'>
                        </asp:DropDownList>
                        <br />
                        BcoCuenta:
                        <asp:TextBox ID="BcoCuentaTextBox" runat="server" Text='<%# Bind("BcoCuenta") %>' />
                        <br />
                        BcoCuentaHabiente:
                        <asp:TextBox ID="BcoCuentaHabienteTextBox" runat="server"
                            Text='<%# Bind("BcoCuentaHabiente") %>' />
                        <br />
                        BcoCI:
                        <asp:TextBox ID="BcoCITextBox" runat="server" Text='<%# Bind("BcoCI") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insertar" />
                        &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>


    <script>
        function readURL(input, contenedor) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $(contenedor).attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#logo").change(function () {
            readURL(this, '#contLogo');
        });
        $("#imagen1").change(function () {
            readURL(this, '#contImagen1');
        });
        $("#imagen2").change(function () {
            readURL(this, '#contImagen2');
        });
        $("#imagen3").change(function () {
            readURL(this, '#contImagen3');
        });
    </script>





    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        DeleteCommand="DELETE FROM [MG_Gym] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [MG_Gym] ([Id_Ciudad], [Nombre], [Direccion], [Referencias], [Telefono], [Celular], [Web], [Facebook], [Email], [Creditos], [ImgLogo], [Img1], [Img2], [Img3], [HorarioLV], [HorarioS], [HorarioDF], [Instagram], [Passw], [Lat], [Lon], [FecActivacion], [Activo], [ReviewCount], [ReviewAverage]) 
            VALUES (@Id_Ciudad, @Nombre, @Direccion, @Referencias, @Telefono, @Celular, @Web, @Facebook, @Email, @Creditos, @ImgLogo, @Img1, @Img2, @Img3, @HorarioLV, @HorarioS, @HorarioDF, @Instagram, @Passw, @Lat, @Lon, @FecActivacion, @Activo, @ReviewCount, @ReviewAverage)"
        SelectCommand="SELECT [ID], [Id_Ciudad], [Nombre], [Direccion], [Referencias], [Telefono], [Celular], [Web], [Facebook], [Email], [Creditos], [ImgLogo], [Img1], [Img2], [Img3], [HorarioLV], [HorarioS], [HorarioDF], [Instagram], [Passw], [Lat], [Lon], [FecActivacion], [Activo], [ReviewCount], [ReviewAverage] FROM [MG_Gym] WHERE ([ID] = @ID)"
        UpdateCommand="UPDATE [MG_Gym] SET [Id_Ciudad] = @Id_Ciudad, [Nombre] = @Nombre, [Direccion] = @Direccion, [Referencias] = @Referencias, [Telefono] = @Telefono, [Celular] = @Celular, [Web] = @Web, [Facebook] = @Facebook, [Email] = @Email, [Creditos] = @Creditos, [ImgLogo] = @ImgLogo, [Img1] = @Img1, [Img2] = @Img2, [Img3] = @Img3, [HorarioLV] = @HorarioLV, [HorarioS] = @HorarioS, [HorarioDF] = @HorarioDF, [Instagram] = @Instagram, [Passw] = @Passw, [Lat] = @Lat, [Lon] = @Lon, [FecActivacion] = @FecActivacion, [Activo] = @Activo, [ReviewCount] = @ReviewCount, [ReviewAverage] = @ReviewAverage WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id_Ciudad" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Referencias" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Web" Type="String" />
            <asp:Parameter Name="Facebook" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Creditos" Type="Int16" />
            <asp:Parameter Name="ImgLogo" Type="String" />
            <asp:Parameter Name="Img1" Type="String" />
            <asp:Parameter Name="Img2" Type="String" />
            <asp:Parameter Name="Img3" Type="String" />
            <asp:Parameter Name="HorarioLV" Type="String" />
            <asp:Parameter Name="HorarioS" Type="String" />
            <asp:Parameter Name="HorarioDF" Type="String" />
            <asp:Parameter Name="Instagram" Type="String" />
            <asp:Parameter Name="Passw" Type="String" />
            <asp:Parameter Name="Lat" Type="Decimal" />
            <asp:Parameter Name="Lon" Type="Decimal" />
            <asp:Parameter Name="FecActivacion" DbType="Date" />
            <asp:Parameter Name="Activo" Type="Boolean" />
            <asp:Parameter Name="ReviewCount" Type="Int32" />
            <asp:Parameter Name="ReviewAverage" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdBuscar" Name="ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id_Ciudad" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="Referencias" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Web" Type="String" />
            <asp:Parameter Name="Facebook" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Creditos" Type="Int16" />
            <asp:Parameter Name="ImgLogo" Type="String" />
            <asp:Parameter Name="Img1" Type="String" />
            <asp:Parameter Name="Img2" Type="String" />
            <asp:Parameter Name="Img3" Type="String" />
            <asp:Parameter Name="HorarioLV" Type="String" />
            <asp:Parameter Name="HorarioS" Type="String" />
            <asp:Parameter Name="HorarioDF" Type="String" />
            <asp:Parameter Name="Instagram" Type="String" />
            <asp:Parameter Name="Passw" Type="String" />
            <asp:Parameter Name="Lat" Type="Decimal" />
            <asp:Parameter Name="Lon" Type="Decimal" />
            <asp:Parameter Name="FecActivacion" DbType="Date" />
            <asp:Parameter Name="Activo" Type="Boolean" />
            <asp:Parameter Name="ReviewCount" Type="Int32" />
            <asp:Parameter Name="ReviewAverage" Type="Decimal" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [ID], [Nombre], [Direccion], [FecActivacion] FROM [MG_Gym] WHERE ([Nombre] LIKE '%' + @Nombre + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBuscar" Name="Nombre" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_Disciplinas" runat="server"
        ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Nombre] FROM [MG_Disciplinas] ORDER BY [Nombre]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_GymDisc" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT dbo.MG_Gym_Disc.Id, dbo.MG_Gym_Disc.Id_Gym, dbo.MG_Gym_Disc.Id_Disciplina, dbo.MG_Disciplinas.Nombre, CONCAT(dbo.MG_Gym_Disc.Id_Disciplina,' - ', dbo.MG_Disciplinas.Nombre) as Disciplina FROM dbo.MG_Gym_Disc INNER JOIN dbo.MG_Disciplinas ON dbo.MG_Gym_Disc.Id_Disciplina = dbo.MG_Disciplinas.Id WHERE (dbo.MG_Gym_Disc.Id_Gym = @Id_Gym)">
        <SelectParameters>
            <asp:ControlParameter ControlID="grdBuscar" Name="Id_Gym" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_Servicios" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Nombre] FROM [MG_Servicios] ORDER BY [Nombre]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQL_GymServ" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="select a.id, a.id_gym, a.id_servicio, b.nombre, CONCAT(a.id_servicio, ' - ', b.nombre) AS Servicio from MG_Gym_Serv a inner join MG_Servicios b on b.id = a.Id_Servicio WHERE ([Id_Gym] = @Id_Gym) ORDER BY [Id_Servicio]">
        <SelectParameters>
            <asp:ControlParameter ControlID="grdBuscar" Name="Id_Gym" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQL_Contactos" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Id_Gym], [Nombre], [Celular], [Email], [Cargo] FROM [MG_Gym_Contacto] WHERE ([Id_Gym] = @Id_Gym)"
        DeleteCommand="DELETE FROM [MG_Gym_Contacto] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [MG_Gym_Contacto] ([Id_Gym], [Nombre], [Celular], [Email], [Cargo]) VALUES (@Id_Gym, @Nombre, @Celular, @Email, @Cargo)"
        UpdateCommand="UPDATE [MG_Gym_Contacto] SET [Id_Gym] = @Id_Gym, [Nombre] = @Nombre, [Celular] = @Celular, [Email] = @Email, [Cargo] = @Cargo WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id_Gym" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Cargo" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdBuscar" Name="Id_Gym" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id_Gym" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Cargo" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_Bancos" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Nombre] FROM [MG_Bancos] ORDER BY [Nombre]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_Gym_Banco" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        DeleteCommand="DELETE FROM [MG_Gym] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [MG_Gym] ([Id_Banco], [BcoCuenta], [BcoCuentaHabiente], [BcoCI]) VALUES (@Id_Banco, @BcoCuenta, @BcoCuentaHabiente, @BcoCI)"
        SelectCommand="SELECT [ID], [Id_Banco], [BcoCuenta], [BcoCuentaHabiente], [BcoCI] FROM [MG_Gym] WHERE ([ID] = @ID)"
        UpdateCommand="UPDATE [MG_Gym] SET [Id_Banco] = @Id_Banco, [BcoCuenta] = @BcoCuenta, [BcoCuentaHabiente] = @BcoCuentaHabiente, [BcoCI] = @BcoCI WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id_Banco" Type="Int32" />
            <asp:Parameter Name="BcoCuenta" Type="String" />
            <asp:Parameter Name="BcoCuentaHabiente" Type="String" />
            <asp:Parameter Name="BcoCI" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdBuscar" Name="ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id_Banco" Type="Int32" />
            <asp:Parameter Name="BcoCuenta" Type="String" />
            <asp:Parameter Name="BcoCuentaHabiente" Type="String" />
            <asp:Parameter Name="BcoCI" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>




</asp:Content>