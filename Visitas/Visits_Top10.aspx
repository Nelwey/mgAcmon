<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Visits_Top10.aspx.vb" Inherits="Visits_Top10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Top 10 en Visitas</h2>
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
                </div>
            </div>

        </div>
        <div class="col-12">
            <asp:Label ID="lblTotal" runat="server" Text="Total" />
        </div>
        <div class="col-12">
            <asp:GridView ID="grd_Top10" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                <Columns>
                    <asp:BoundField DataField="Gimnasio" HeaderText="Gimnasio" SortExpression="Gimnasio" />
                    <asp:BoundField DataField="Visitas" HeaderText="Cant. Visitas" ReadOnly="True"
                        SortExpression="Visitas">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Column1" DataFormatString="{0:##.##}" HeaderText="Porcentaje"
                        ReadOnly="True" SortExpression="Column1">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Cred_Ganado" HeaderText="Cred. Ganado" ReadOnly="True"
                        SortExpression="Cred_Ganado">
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

</asp:Content>