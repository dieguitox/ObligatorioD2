﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

    .auto-style24 {
        width: 609px;
            margin-left: 306px;
        }
    .auto-style22 {
        width: 757px;
    }
    .auto-style15 {
            width: 632px;
        }
    .auto-style23 {
        width: 757px;
        height: 24px;
    }
    .auto-style17 {
        height: 24px;
        width: 632px;
    }
    .auto-style19 {
        width: 757px;
        height: 32px;
    }
    .auto-style18 {
        width: 632px;
        height: 32px;
    }
        .auto-style13 {
            height: 24px;
            width: 252px;
        }
        .auto-style13 {
        width: 179px;
        height: 38px;
    }
        .auto-style25 {
            height: 22px;
        }
        .auto-style26 {
            height: 38px;
            width: 82px;
        }
    </style>
</head>
<body style="width: 1246px; height: 768px">
    <form id="form1" runat="server">
    <div>
    
        <div style="font-family: verdana, Geneva, Tahoma, sans-serif; background-color: #FFFFFF; font-size: xx-large; text-decoration: underline; text-align: center; color: #006666">
            Bienvenido</div>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;<table class="auto-style24" style="font-family: verdana, Geneva, Tahoma, sans-serif">
                <tr>
                    <td class="auto-style22" aria-orientation="vertical" colspan="2">Nombre de Usuario:</td>
                    <td class="auto-style15" aria-orientation="vertical" colspan="2">
                        <asp:TextBox ID="txtUsu" runat="server" Width="141px" Font-Names="Verdana"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23" aria-orientation="vertical" colspan="2">Contraseña:</td>
                    <td class="auto-style17" aria-orientation="vertical" colspan="2">
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="141px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19" aria-orientation="vertical" colspan="2"></td>
                    <td class="auto-style18" aria-orientation="vertical" colspan="2">
                        <asp:Button ID="btnInicioSession" runat="server" Text="Iniciar Sesión" OnClick="btnInicioSession_Click" BackColor="#339966" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" Width="149px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" aria-orientation="vertical" class="auto-style25">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13" colspan="4" dir="auto" aria-orientation="vertical">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:GridView ID="GVListadoPartidas" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="16px" AllowPaging="True" PageSize="8" OnPageIndexChanging="GVListadoPartidas_PageIndexChanging" Width="662px" OnSelectedIndexChanged="GVListadoPartidas_SelectedIndexChanged" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="NumeroDeViaje" HeaderText="Viaje" />
                                <asp:BoundField DataField="FechaHora" HeaderText="Fecha de salida" />
                                <asp:BoundField DataField="AndenSalida" HeaderText="Anden" />
                                <asp:BoundField DataField="Destino" HeaderText="Destino" />
                            	<asp:CommandField SelectText="Ver Terminales" ShowSelectButton="True" />
                            </Columns>
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
                    <td class="auto-style26" dir="ltr" aria-orientation="vertical">&nbsp;&nbsp;
                    </td>
                    <td class="auto-style13" colspan="2" dir="ltr" aria-orientation="vertical">

                    	<asp:GridView ID="GVTerminales" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" Height="54px" AllowPaging="True" PageSize="8" Width="353px" AutoGenerateColumns="False">
							<AlternatingRowStyle BackColor="White" />
							<Columns>
								<asp:BoundField HeaderText="Nro Parada" DataField="NroParada" />
								<asp:BoundField HeaderText="Ciudad" DataField="Ciudad" />
								<asp:BoundField HeaderText="País" DataField="Pais" />
							</Columns>
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
                    <td class="auto-style13" dir="ltr" aria-orientation="vertical">&nbsp;</td>
                </tr>
            </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
    </form>
</body>
</html>
