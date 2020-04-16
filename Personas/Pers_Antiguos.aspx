<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Pers_Antiguos.aspx.vb" Inherits="Pers_Antiguos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Clientes Antiguos</h2>
        </div>
        <div class="col-12 mb-3">
            <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click" class="btn btn-sm btn-dark" />
        </div>
        <div class="col-12">
            <asp:GridView ID="grd_Antguos" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SQL_Antiguos"
                ForeColor="#333333" PageSize="25" class="table table-responsive-lg table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                        SortExpression="Id" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                    <asp:BoundField DataField="FecIngreso" HeaderText="Fecha Ingreso" SortExpression="FecIngreso"
                        DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:BoundField DataField="Column1" HeaderText="Dias Ant." ReadOnly="True"
                        SortExpression="Column1" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

        </div>
    </div>



    <asp:SqlDataSource ID="SQL_Antiguos" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT TOP 50 [Id], [Nombre], [Apellido], [Email], [Celular], [FecIngreso], [Activo], 
                    datediff(DAY,FecIngreso,GETDATE())
                    FROM [MG_Persona] 
                    ORDER BY [FecIngreso]">
    </asp:SqlDataSource>

</asp:Content>