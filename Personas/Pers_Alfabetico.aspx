<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Pers_Alfabetico.aspx.vb" Inherits="Pers_Alfabetico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3">

        <div class="col-12">
            <h2>Lista de Personas</h2>
        </div>
        <div class="col-12 py-3 py-0">

            <div class="row">
                <div class="col-12 col-md-6 col-lg-8 mb-3 mb-md-0">
                    <asp:TextBox ID="txtFiltroApellido" runat="server" class="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                    <asp:Button ID="btn_Filtar" runat="server" Text="Filtrar por Apellido" OnClick="btn_Filtar_Click"
                    class="btn btn-sm btn-dark" />
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                    <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                    class="btn btn-sm btn-dark"/>
                </div>
            </div>
            
        </div>
        <div class="col-12">
            <asp:GridView ID="GrdView_PersAlfa" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataSourceID="SQL_PersAlfa" AllowPaging="True" AllowSorting="True"
                PageSize="25" class="table table-responsive-lg table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                    <asp:BoundField DataField="FecIngreso" HeaderText="Fecha In" SortExpression="FecIngreso"
                        DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="Nombre1" HeaderText="Plan" SortExpression="Nombre1" />
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

    </div>




    <asp:SqlDataSource ID="SQL_PersAlfa" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="select a.Apellido, a.Nombre,a.Email, a.Celular, a.FecIngreso, b.Nombre, a.CredDisponible, 
                    CASE WHEN a.Activo = 1 THEN 'Si'
                    WHEN a.Activo = 0 THEN 'No' ENd as Activo
                    from mg_persona a
                    INNER JOIN MG_Planes b ON b.id = a.Id_Plan
                    ORDER BY  a.Apellido, a.Nombre">
    </asp:SqlDataSource>

</asp:Content>