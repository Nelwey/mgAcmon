<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Gyms_CtaBanco.aspx.vb" Inherits="Gyms_CtaBanco" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Bancos de Gimnasios</h2>
        </div>
        <div class="col-12 mb-2">
            <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                class="btn btn-sm btn-dark" />
        </div>
        <div class="col-12">
            <asp:GridView ID="Grd_Bancos" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SQL_Bancos"
                ForeColor="#333333" PageSize="25" class="table table-responsive-lg table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                    <asp:BoundField DataField="Nombre1" HeaderText="Banco" SortExpression="Nombre1" />
                    <asp:BoundField DataField="BcoCuenta" HeaderText="Cuenta" SortExpression="BcoCuenta" />
                    <asp:BoundField DataField="BcoCuentaHabiente" HeaderText="Persona"
                        SortExpression="BcoCuentaHabiente" />
                    <asp:BoundField DataField="BcoCI" HeaderText="CI Persona" SortExpression="BcoCI" />
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





    <asp:SqlDataSource ID="SQL_Bancos" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="select a.Id, a.Nombre, a.Celular, a.Id_Banco, b.Nombre, a.BcoCuenta, a.BcoCuentaHabiente, a.BcoCI
FROM MG_Gym a
INNER JOIN MG_Bancos b ON b.id = a.id_Banco
WHERE a.Activo = 1
ORDER BY a.Nombre">
    </asp:SqlDataSource>
</asp:Content>