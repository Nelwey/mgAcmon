<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Gyms_Reviews.aspx.vb" Inherits="Gyms_Reviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Reviews por Gimnasios</h2>
        </div>
        <div class="col-12 mb-2">
            <asp:Button ID="btn_Export" runat="server" Text="Exportar Datos" OnClick="btn_Export_Click" class="btn btn-dark btn-sm"/>
        </div>
        <div class="col-12 col-lg-7 mx-auto">

            <asp:GridView ID="grd_ReviewMaster" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SQL_Reviews" PageSize="15" class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Gimnasio" SortExpression="Nombre">
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Nro_Reviews" HeaderText="Cant.Reviews" SortExpression="Nro_Reviews">
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Estrellas" HeaderText="Estrellas" SortExpression="Estrellas">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:CommandField SelectText="" ShowSelectButton="True" HeaderText="Detalle" ButtonType="Image"
                        SelectImageUrl="~/Images/Right-arrow.png" />
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
            <asp:GridView ID="grd_ReviewDetalle" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SQL_RevDetalle"
                ForeColor="#333333" PageSize="25" class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Persona" HeaderText="Persona" ReadOnly="True" SortExpression="Persona">
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FecReview" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha"
                        SortExpression="FecReview" />
                    <asp:BoundField DataField="Calificacion" HeaderText="Calificacion" SortExpression="Calificacion">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Review" HeaderText="Comentario" SortExpression="Review">
                        <ItemStyle Font-Italic="True" Font-Size="Smaller" />
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



    <asp:SqlDataSource ID="SQL_Reviews" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT Id, Nombre, ReviewCount as Nro_Reviews, ReviewAverage as Estrellas
                FROM MG_Gym 
                WHERE ReviewCount > 0
                ORDER BY ReviewAverage">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQL_RevDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT a.Id, CONCAT(b.Nombre,' ',b.Apellido) as Persona, a.FecReview, a.Calificacion, a.Review 
            FROM mg_reviews a
            INNER JOIN MG_Persona b ON b.Id = a.Id_Persona 
            WHERE ([Id_Gym] = @Id_Gym)">
        <SelectParameters>
            <asp:ControlParameter ControlID="grd_ReviewMaster" Name="Id_Gym" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>
</asp:Content>