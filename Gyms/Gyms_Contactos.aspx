<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Gyms_Contactos.aspx.vb" Inherits="Gyms_Contactos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Contactos de Gimnasio</h2>
        </div>
        <div class="col-12 mb-3">
            <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click"
                class="btn btn-dark btn-sm" />
        </div>
        <div class="col-12">

            <asp:GridView ID="grd_Contactos" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataSourceID="SQL_Gyms" CellPadding="4" ForeColor="#333333" GridLines="None"
                PageSize="25">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Gimnasio" HeaderText="Gimnasio" SortExpression="Gimnasio" />
                    <asp:BoundField DataField="Contacto" HeaderText="Contacto" SortExpression="Contacto" />
                    <asp:BoundField DataField="celular" HeaderText="Celular" SortExpression="celular" />
                    <asp:BoundField DataField="email" HeaderText="eMail" SortExpression="email" />
                    <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
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

            <asp:TreeView ID="TreeView1" runat="server" DataSourceID="XmlDataSource1" ExpandDepth="1" CssClass="w-100">
                <DataBindings>
                    <asp:TreeNodeBinding DataMember="Gym" TextField="NameGym" ValueField="NameGym" />
                    <asp:TreeNodeBinding DataMember="Contact" TextField="NameContact" ValueField="NameContact" />
                </DataBindings>

                <LeafNodeStyle CssClass="text-dark bg-light" />

                <NodeStyle CssClass="text-decoration-none p-1" />
                <ParentNodeStyle CssClass="bg-amarillo txt-azul w-100 rounded" />
                <RootNodeStyle CssClass="bg-azul text-light w-100" />

            </asp:TreeView>

        </div>
    </div>



    


    <asp:XmlDataSource ID="XmlDataSource1" runat="server"  datafile="~/Gyms/Gym_Contactos.xml"></asp:XmlDataSource>

    <asp:SqlDataSource ID="SQL_Gyms" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="select b.id as IDGym, a.id_Gym as IDCon, b.nombre as Gimnasio, a.nombre as Contacto,a.celular as celular ,a.email,a.cargo
                from mg_gym_contacto a
                inner join mg_gym b on b.id = a.id_gym
                order by b.nombre">
    </asp:SqlDataSource>

</asp:Content>