<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Visits_Gyms.aspx.vb" Inherits="Visits_Gyms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Visitas a Gimnasios</h2>
        </div>

        <div class="col-12 col-lg-7 mx-auto my-3">
            <div class="row">
                <div class="col-12 col-sm-4">
                    <label for="FecInicial">Fecha Inicial:</label>
                    <asp:TextBox placeholder="FecInicial" class="form-control form-control-sm" type="Date"
                        runat="server" id="FecInicial" ClientIDMode="Static" />

                </div>
                <div class="col-12 col-sm-4">
                    <label for="FecFinal">Fecha Final:</label>
                    <asp:TextBox placeholder="FecFinal" class="form-control form-control-sm" type="Date" runat="server"
                        id="FecFinal" ClientIDMode="Static" />
                </div>
                <div class="col-12 col-sm-4 align-self-end mt-2">
                    <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                        class="btn btn-dark btn-sm" />

                </div>
            </div>

        </div>


        <div class="col-12 col-lg-7 mx-auto">

            <asp:GridView ID="grd_Gyms" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataSourceID="SQL_GymMaster" DataKeyNames="ID"
                class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Images/Right-arrow.png" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                    <asp:BoundField DataField="Creditos" HeaderText="Creditos" SortExpression="Creditos" />
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

        <div class="col-12">
            <asp:GridView ID="grd_Visitas" runat="server" DataSourceID="SQL_Visitas" AllowPaging="True"
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="25"
                class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="Gimnasio" HeaderText="Gimnasio" SortExpression="Gimnasio" />
                    <asp:BoundField DataField="Fecha" DataFormatString="{0:dd/MM/yyyy hh:mm}" HeaderText="Fecha"
                        ReadOnly="True" SortExpression="Fecha" />
                    <asp:BoundField DataField="Creditos" HeaderText="Creditos" SortExpression="Creditos" />
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








    <asp:SqlDataSource ID="SQL_GymMaster" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT [Id], [Nombre], [Creditos], [Celular] FROM [MG_Gym] WHERE ([Activo] = @Activo) ORDER BY [Nombre]">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="Activo" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_Visitas" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT a.ID, c.apellido, c.Nombre, b.Nombre as Gimnasio,
                a.FecVisita as Fecha, a.CredUsado as  Creditos 
                FROM MG_Visitas a
                inner join mg_persona c on c.id = a.Id_persona
                INNER JOIN dbo.MG_Gym as b ON a.Id_Gym = b.ID 
                WHERE a.FecVisita BETWEEN @FecIni AND @FecFin
                AND a.Id_Gym = @Id_Gym
                Order by a.FecVisita desc">
        <SelectParameters>
            <asp:Parameter Name="FecIni" Type="String" />
            <asp:Parameter Name="FecFin" Type="String" />
            <asp:ControlParameter ControlID="grd_Gyms" Name="Id_Gym" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>