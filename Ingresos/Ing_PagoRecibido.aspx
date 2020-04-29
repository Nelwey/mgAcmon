<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Ing_PagoRecibido.aspx.vb" Inherits="Ing_PagoRecibido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mt-3">

        <div class="col-12 text-center">
            <h2>Registro de Ingreso</h2>
        </div>
        <div class="col-12 py-3">

            <div class="row">
                <div class="col-12 col-sm-5 col-md-7 col-lg-8 col-xl-9 mb-3">
                    <asp:TextBox ID="txtFiltroApellido" runat="server" class="form-control form-control-sm">
                    </asp:TextBox>
                </div>
                <div class="col">
                    <asp:Button ID="btn_Filtar" runat="server" Text="Filtrar por Apellido" OnClick="btn_Filtar_Click"
                        class="btn btn-sm btn-dark" />
                    <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                        class="btn btn-sm btn-dark" />
                </div>
            </div>

        </div>
        <div class="col-12">
            <asp:GridView ID="GrdView_PersAlfa" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataSourceID="SQL_PersAlfa" AllowPaging="True" AllowSorting="True" PageSize="15" DataKeyNames="Id"
                class="table table-responsive-md table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ButtonType="Image" HeaderText="Detalle" SelectImageUrl="~/Images/Right-arrow.png"
                        ShowHeader="True" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>

                    <asp:BoundField DataField="Id" HeaderText="ID Pers" SortExpression="Id">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>


                    <asp:BoundField DataField="CredDisponible" HeaderText="Creditos" SortExpression="CredDisponible">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Activo" HeaderText="Activo" ReadOnly="True" SortExpression="Activo" />

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

        <div id="frmNuevoPago" class="col-12 col-md-4 col-lg-3" runat="server">

            <div class="bg-azul text-white p-2 rounded">

                <div class="form-group text-center">
                    <h3>Nuevo Pago</h3>
                </div>
                <div class="form-group">
                    <label>ID Persona</label>
                    <asp:TextBox ID="txtPagoIdPersona" runat="server" class="form-control form-control-sm">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Monto Pagado</label>
                    <asp:TextBox ID="txtPagoMonto" runat="server" class="form-control form-control-sm"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Forma de Pago</label>

                    <asp:DropDownList ID="ddnFormaPago" runat="server" DataSourceID="sqlFormaPago"
                        DataTextField="Nombre" DataValueField="Id" class="form-control form-control-sm">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Calendar ID="calPagoFecha" runat="server" BackColor="White" BorderColor="#3366CC"
                        BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                        ForeColor="#003399" class="w-100">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                            Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </div>
                <div class="form-group">

                    <asp:Button ID="btnGrabaPago" runat="server" Text="Guardar" class="btn btn-sm btn-dark" />
                    <asp:Button data-dismiss="modal" ID="btnCancelPago" runat="server" Text="Cancelar"
                        class="btn btn-sm btn-danger" />

                </div>

            </div>





        </div>

        <div id="GrdUltimos10Pagos" class="col-12 col-md-8 col-lg-9 pt-2" runat="server">

            <div class="form-group text-center">
                <h3>Últimos 10 pagos</h3>
            </div>

            <asp:GridView ID="GrdView_Pagos" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataSourceID="SQL_Pagos"
                class="table table-sm table-responsive-sm table-bordered table-striped">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>

                    <asp:BoundField DataField="Id_persona" HeaderText="Id_persona" SortExpression="Id_persona" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha"
                        DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
                    <asp:BoundField DataField="Forma_Pago" HeaderText="Forma_Pago" SortExpression="Forma_Pago" />
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

    <asp:SqlDataSource ID="SQL_PersAlfa" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="Select distinct a.id, a.nombre, a.creddisponible, a.activo from mg_persona a
        inner join mg_pagos b on b.Id_persona = a.Id">
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="SQL_Pagos" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="
        SELECT TOP 10 a.[Id_persona]
        ,Format(a.FecPago,'dd-MM-yyyy') as Fecha
        ,a.[Monto]
        ,c.Nombre as Forma_Pago
        FROM MG_Pagos a
        INNER JOIN MG_Persona b ON b.Id = a.Id_persona 
        INNER JOIN MG_FormaPago c ON c.Id = a.Id_FormaPago 
        WHERE id_persona =  @Id_Pers
            ">
        <SelectParameters>
            <asp:Parameter Name="Id_Pers" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlFormaPago" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Nombre] FROM [MG_FormaPago] ORDER BY [Nombre]"></asp:SqlDataSource>


</asp:Content>