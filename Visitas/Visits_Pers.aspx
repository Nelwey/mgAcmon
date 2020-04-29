<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Visits_Pers.aspx.vb" Inherits="Visits_Pers_aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Visitas de Personas</h2>
        </div>
        <div class="col-12 col-lg-8 col-xl-7 mx-auto my-3">

            <div class="row">
                <div class="col-12 col-md-4">
                    <label for="FecInicial">Fecha Inicial:</label>
                    <asp:TextBox placeholder="FecInicial" class="form-control form-control-sm" type="Date"
                        runat="server" id="FecInicial" ClientIDMode="Static" />
                </div>

                <div class="col-12 col-md-4">
                    <label for="FecFinal">Fecha Final:</label>
                    <asp:TextBox placeholder="FecFinal" class="form-control form-control-sm" type="Date" runat="server"
                        id="FecFinal" ClientIDMode="Static" />
                </div>
                
                <div class="col-12 col-md-4 align-self-end mt-2">
                    <asp:Button ID="btn_Buscar" runat="server" Text="Buscar" OnClick="btn_Buscar_Click"
                        class="btn btn-dark btn-sm" />

                    <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                        class="btn btn-dark btn-sm" />
                </div>
            </div>

        </div>

        <div class="col-12 col-lg-8 col-xl-7 mx-auto mb-3">
            <asp:GridView ID="grd_Personas" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="Id_Persona" DataSourceID="SQL_Personas" CellPadding="4"
                ForeColor="#333333" class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ButtonType="Image" HeaderText="Detalle" SelectImageUrl="~/Images/Right-arrow.png"
                        ShowHeader="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Id_Persona" HeaderText="Id_Persona" InsertVisible="False" ReadOnly="True" SortExpression="Id_Persona"/>
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="Visitas" HeaderText="Visitas" ReadOnly="True" SortExpression="Visitas"/>
                    <asp:BoundField DataField="Cred_Usado" HeaderText="Cred_Usado" ReadOnly="True" SortExpression="Cred_Usado"/>

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
            <asp:GridView ID="grd_VisitaPersona" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SQL_VisitaDetalle" ForeColor="#333333"
                PageSize="25" class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id_Persona" HeaderText="Id_Persona" SortExpression="Id_Persona">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Gimnasio" HeaderText="Gimnasio" SortExpression="Gimnasio" />
                    <asp:BoundField DataField="FecVisita" DataFormatString="{0:dd/MM/yyyy HH:mm}"
                        HeaderText="Fecha Visita" SortExpression="FecVisita" />
                    <asp:BoundField DataField="CredUsado" HeaderText="CredUsado" SortExpression="CredUsado">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
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

    <asp:SqlDataSource ID="SQL_Personas" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT c.ID as Id_Persona, c.Apellido, c.nombre, count(*) as Visitas, sum(a.credusado) as Cred_Usado
                    FROM MG_Visitas a
                    INNER JOIN mg_Persona c on c.Id = a.Id_Persona
                    WHERE a.FecVisita Between @FecIni AND @FecFin
                    GROUP BY  c.ID, c.Apellido, c.nombre
                    ORDER BY c.Apellido, c.nombre">
        <SelectParameters>
            <asp:ControlParameter ControlID="FecInicial" Name="FecIni" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="FecFinal" Name="FecFin" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SQL_VisitaDetalle" runat="server"
        ConnectionString="<%$ ConnectionStrings:MultigymConnString %>" SelectCommand="SELECT a.Id_Persona, b.Nombre as Gimnasio, a.FecVisita, a.CredUsado 
                FROM MG_Visitas a
                INNER JOIN dbo.MG_Gym as b ON a.Id_Gym = b.ID 
                WHERE a.FecVisita Between @FecIni AND @FecFin
                AND a.id_Persona = @Id_Pers
                Order by a.FecVisita desc">
        <SelectParameters>
            <asp:Parameter Name="FecIni" Type="String" />
            <asp:Parameter Name="FecFin" Type="String" />
            <asp:Parameter Name="Id_Pers" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>