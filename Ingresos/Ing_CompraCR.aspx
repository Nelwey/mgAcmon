<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Ing_CompraCR.aspx.vb" Inherits="Ing_CompraCR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3">
        <div class="col-12 text-center">
            <h2>Creditos Comprados</h2>
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
            <asp:GridView ID="grd_ComprasCR" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SQL_ComprasCR"
                ForeColor="#333333" PageSize="25" class="table table-responsive-sm table-sm">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                        SortExpression="Id" />
                    <asp:BoundField DataField="Id_persona" HeaderText="Id_persona" SortExpression="Id_persona" />
                    <asp:BoundField DataField="Persona" HeaderText="Persona" ReadOnly="True" SortExpression="Persona" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
                    <asp:BoundField DataField="Forma_Pago" HeaderText="Forma_Pago" SortExpression="Forma_Pago" />
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

    <asp:SqlDataSource ID="SQL_ComprasCR" runat="server" ConnectionString="<%$ ConnectionStrings:MultigymConnString %>"
        SelectCommand="SELECT a.Id, a.Id_persona, CONCAT(b.Nombre, ' ', b.Apellido) AS Persona, Format(a.FecPago, 'dd-MM-yyyy') AS Fecha, a.Monto, c.Nombre AS Forma_Pago 
                        FROM dbo.MG_Pagos AS a 
                        INNER JOIN dbo.MG_Persona AS b ON b.Id = a.Id_persona 
                        INNER JOIN dbo.MG_FormaPago AS c ON c.Id = a.Id_FormaPago 
                        WHERE a.FecPago BETWEEN @FecIni AND @FecFin
                        ORDER BY a.FecPago">
        <SelectParameters>
            <asp:Parameter Name="FecIni" Type="String" />
            <asp:Parameter Name="FecFin" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>