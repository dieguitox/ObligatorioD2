<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EstadisticadeViaje.aspx.cs" Inherits="EstadisticadeViaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 56%;
            height: 540px;
            margin-left: 138px;
        }
        .auto-style22 {
            width: 165px;
        }
        .auto-style23 {
            width: 165px;
            height: 25px;
        }
        .auto-style24 {
            width: 165px;
            height: 326px;
        }
        .auto-style25 {
            margin-left: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <body>
    <div class="auto-style38">
        <div class="auto-style40" style="font-family: VErdana, Geneva, Tahoma, sans-serif">
            <div class="auto-style32" style="font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: xx-large; color: #FFFFFF; background-color: #006666; text-align: center; text-decoration: underline">
                Estadisticas de Viajes</div>
    <p>
        <br />
        <table class="auto-style21">
            <tr>
                <td aria-orientation="horizontal" class="auto-style23" dir="auto">
                    <asp:GridView ID="GdvViajesxMes" runat="server" OnSelectedIndexChanged="GdvViajesxMes_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Width="328px">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:GridView ID="GdvCompania" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="326px">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>
            </table>
    </p>
            <p class="auto-style25">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Menu.aspx">Volver</asp:LinkButton>
    </p>

</asp:Content>

