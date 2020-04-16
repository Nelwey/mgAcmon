<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" 
    CodeFile="Gyms_Alfabetico.aspx.vb" Inherits="Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Lista de Gimnasios</h2>
        </div>
        <div class="col-12 mb-2">
            <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                class="btn btn-sm btn-dark" />
        </div>
        <div class="col-12">

            <asp:GridView ID="GridView1" runat="server" DataSourceID="SQL_GymAlfa" AutoGenerateColumns="False"
                AllowPaging="True" AllowSorting="True" PageSize="25" class="table table-responsive-lg table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Nro">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                    <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Creditos" HeaderText="Creditos" SortExpression="Creditos" />
                    <asp:BoundField DataField="Activo" HeaderText="Activo" ReadOnly="True" SortExpression="Activo" />
                    <asp:BoundField DataField="FecActivacion" HeaderText="Fecha Act." SortExpression="FecActivacion"
                        DataFormatString="{0:MM/dd/yyyy}" />
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





    <asp:SqlDataSource ID="SQL_GymAlfa" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Nombre], [Direccion], [Telefono], [Celular], [Email], [Creditos], CASE WHEN Activo = 1 THEN 'Si'
WHEN Activo = 0 THEN 'No' ENd as Activo, [FecActivacion] FROM [MG_Gym]"></asp:SqlDataSource>

</asp:Content>