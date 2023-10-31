<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Listados.aspx.cs" Inherits="Listados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style16 {
            width: 543px;
        }
        .auto-style17 {
            width: 525px;
        }
        .auto-style18 {
            width: 543px;
            height: 7px;
        }
        .auto-style19 {
            height: 7px;
        }
        .auto-style20 {
            height: 7px;
            width: 525px;
        }
        .auto-style21 {
            width: 646px;
        }
        .auto-style22 {
            width: 648px;
            margin-left: 0px;
            height: 67px;
        }
        .auto-style23 {
            width: 543px;
            height: 23px;
        }
        .auto-style24 {
            width: 525px;
            height: 23px;
        }
        .auto-style25 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
        <div class="auto-style22" style="font-family: verdana, Geneva, Tahoma, sans-serif">
    
            <div style="font-family: Verdana, Geneva, Tahoma, sans-serif; color: #FFFFFF; font-size: xx-large; text-align: center; background-color: #006666; text-decoration: underline">
                Listado de Viaje</div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
        <br />
        <table class="auto-style21">
            <tr>
                <td class="auto-style23">
                    Compañía</td>
                <td class="auto-style24">
                    Destino</td>
                <td class="auto-style25">
                    Fecha</td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:DropDownList ID="ddlCompania" runat="server" Width="156px"  AutoPostBack="True" Font-Names="Verdana">
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">
                    <asp:DropDownList ID="ddlDestino" runat="server" Width="156px"  AutoPostBack="True" Font-Names="Verdana">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="FechaCalendar" runat="server" TextMode="Date" Width="152px" AutoPostBack="True" Font-Names="Verdana" ></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Button ID="btnFiltro" runat="server" OnClick="btnFiltro_Click" Text="Filtrar" Width="160px" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" />
                </td>
                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
                <td class="auto-style19">
                    <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar Filtros" Width="160px" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style13" colspan="3">
                    <asp:GridView ID="GVViajes" runat="server" Height="181px" Width="641px" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GVViajes_PageIndexChanging" >
						<AlternatingRowStyle BackColor="White" />
						<EditRowStyle BackColor="#7C6F57" />
						<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
						<HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
						<RowStyle BackColor="#E3EAEB" />
						<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
						<sortedascendingcellstyle backcolor="#F8FAFA" />
						<sortedascendingheaderstyle backcolor="#246B61" />
						<sorteddescendingcellstyle backcolor="#D4DFE1" />
						<sorteddescendingheaderstyle backcolor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="3">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
        <br />
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbVolver" runat="server" PostBackUrl="~/Menu.aspx">Volver</asp:LinkButton>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
</body>

</asp:Content>

