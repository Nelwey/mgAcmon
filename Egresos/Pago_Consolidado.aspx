﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Pago_Consolidado.aspx.vb" Inherits="Pago_Consolidado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row mt-3">
    <div class="col-12 text-center">
      <h2>Pago Consolidado</h2>
    </div>
    <div class="col-12 my-3">

      <div class="row">
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
          <label for="FecInicial">Fecha Inicial:</label>
          <asp:TextBox placeholder="FecInicial" class="form-control form-control-sm" type="Date" runat="server"
            id="FecInicial" ClientIDMode="Static" />
        </div>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
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

    <div class="col-12">
      <asp:GridView ID="grd_PagoConsolidado" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_gym" DataSourceID="SQL_pagoConsolidado"
        ForeColor="#333333" PageSize="25" class="table table-responsive-lg table-sm">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
          <asp:BoundField DataField="id_gym" HeaderText="Id" InsertVisible="False" ReadOnly="True"
            SortExpression="id_gym" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
          <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
          <asp:BoundField DataField="Visitas" HeaderText="Visitas" ReadOnly="True" SortExpression="Visitas" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
          <asp:BoundField DataField="Cred_Ganado" HeaderText="Cred_Ganado" ReadOnly="True"
            SortExpression="Cred_Ganado" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
          <asp:BoundField DataField="Bs_a_Pagar" HeaderText="Bs_a_Pagar" SortExpression="Bs_a_Pagar" DataFormatString="{0:n}" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"  />
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


  <asp:SqlDataSource ID="SQL_pagoConsolidado" runat="server"
    ConnectionString="<%$ ConnectionStrings:MultigymConnString %>" SelectCommand="
    SELECT a.id_gym, c.nombre, count(*) as Visitas,  sum(a.credusado) as Cred_Ganado, sum(a.credusado) * 0.85 as Bs_a_Pagar
    FROM dbo.MG_Visitas a 
    INNER JOIN mg_gym c on c.id = a.id_gym 
    WHERE a.FecVisita Between @FecIni AND @FecFin
    GROUP BY a.id_gym, c.nombre">
    <SelectParameters>
      <asp:Parameter Name="FecIni" Type="String" />
      <asp:Parameter Name="FecFin" Type="String" />
    </SelectParameters>
  </asp:SqlDataSource>


</asp:Content>
