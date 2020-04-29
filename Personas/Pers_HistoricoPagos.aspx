<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Pers_HistoricoPagos.aspx.vb" Inherits="Pers_HitoricoPagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row mt-3">

        <div class="col-12 text-center">
            <h2>Historico de Pagos</h2>
        </div>
        <div class="col-12 py-3 py-0">

            <div class="row">
                <div class="col-12 col-md-4 col-lg-6  mb-3 mb-md-0">
                    <asp:TextBox ID="txtFiltroApellido" runat="server" class="form-control form-control-sm">
                    </asp:TextBox>

                </div>
                <div class="col">
                    <asp:Button ID="btn_Filtar" runat="server" Text="Filtrar por Apellido. Use % como Comodin"
                        OnClick="btn_Filtar_Click" class="btn btn-sm btn-dark" />
                    <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                        class="btn btn-sm btn-dark" />
                </div>
            </div>

        </div>
        <div class="col-12">
            <asp:GridView ID="GrdView_PersAlfa" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataSourceID="SQL_PersAlfa" AllowPaging="True" AllowSorting="True" PageSize="15" DataKeyNames="Id"
                class="table table-responsive-md table-sm"
                OnSelectedIndexChanged="GrdView_PersAlfa_SelectedIndexChanged">
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

                    <asp:BoundField DataField="Persona" HeaderText="Nombre" SortExpression="Persona">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>

                    <asp:BoundField DataField="email" HeaderText="eMail" SortExpression="email">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Nombre" HeaderText="Plan" SortExpression="Nombre">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
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

        <div class="col-12 text-center">
            <h3>Historico de pagos</h3>
        </div>
        <div id="GrdUltimos10Pagos" class="col-12" runat="server">
            <asp:GridView ID="GrdView_Pagos" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataSourceID="SQL_Pagos" PageSize="15"
                class="table table-sm table-responsive-sm">
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
        SelectCommand="SELECT a.Id, CONCAT(a.Apellido,', ' + a.Nombre) as Persona, b.Nombre, a.CredDisponible, a.email,  
                    CASE WHEN a.Activo = 1 THEN 'Si'
                    WHEN a.Activo = 0 THEN 'No' ENd as Activo
                    FROM mg_persona a
                    INNER JOIN MG_Planes b ON b.id = a.Id_Plan
                    ORDER BY  a.Apellido, a.Nombre">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_Pagos" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="
        SELECT a.[Id_persona]
        ,Format(a.FecPago,'dd-MM-yyyy') as Fecha
        ,a.[Monto]
        ,c.Nombre as Forma_Pago
        FROM MG_Pagos a
        INNER JOIN MG_Persona b ON b.Id = a.Id_persona 
        INNER JOIN MG_FormaPago c ON c.Id = a.Id_FormaPago 
        WHERE id_persona =  @Id_Pers
        ORDER BY a.FecPago DESC">
        <SelectParameters>
            <asp:Parameter Name="Id_Pers" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlFormaPago" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Nombre] FROM [MG_FormaPago] ORDER BY [Nombre]"></asp:SqlDataSource>


</asp:Content>