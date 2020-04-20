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


    <asp:XmlDataSource ID="XmlDataSource1" runat="server" datafile="~/Gyms/Gym_Contactos.xml"></asp:XmlDataSource>

    <asp:SqlDataSource ID="SQL_Gyms" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="select b.id as IDGym, a.id_Gym as IDCon, b.nombre as Gimnasio, a.nombre as Contacto,a.celular as celular ,a.email,a.cargo
                from mg_gym_contacto a
                inner join mg_gym b on b.id = a.id_gym
                order by b.nombre">
    </asp:SqlDataSource>

</asp:Content>