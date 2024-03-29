﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaViajes.aspx.cs" Inherits="AltaViajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style19 {
            height: 314px;
            width: 733px;
        }
        .auto-style20 {
            width: 98%;
            height: 568px;
            margin-left: 6px;
        margin-right: 0px;
    }
        .auto-style21 {
        width: 41%;
    }
        .auto-style22 {
            height: 314px;
            width: 41%;
        }
        .auto-style23 {
            width: 676px;
        }
        .auto-style26 {
            margin-right: 0px;
        }
        .auto-style27 {
            width: 651px;
            height: 680px;
        }
        .auto-style33 {
        width: 41%;
        height: 26px;
    }
        .auto-style34 {
            width: 676px;
            height: 26px;
        }
    .auto-style36 {
        width: 733px;
    }
    .auto-style38 {
        width: 733px;
        height: 26px;
    }
    .auto-style39 {
        height: 47px;
    }
    .auto-style41 {
        height: 39px;
    }
    .auto-style42 {
        height: 39px;
        width: 733px;
    }
    .auto-style43 {
        width: 733px;
        height: 24px;
    }
    .auto-style44 {
        width: 41%;
        height: 24px;
    }
    .auto-style45 {
        width: 676px;
        height: 24px;
    }
    .auto-style46 {
        width: 733px;
        height: 17px;
    }
    .auto-style47 {
        width: 41%;
        height: 17px;
    }
    .auto-style48 {
        width: 676px;
        height: 17px;
    }
        .auto-style49 {
            width: 611px;
            height: 25px;
            margin-left: 6px;
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
    <div class="auto-style27" style="font-family: VErdana, Geneva, Tahoma, sans-serif; font-size: small;">
    
        <div class="auto-style39" style="font-family: VERdana, Geneva, Tahoma, sans-serif; text-decoration: underline; color: #FFFFFF; text-align: center; background-color: #006666; font-size: xx-large">
            Alta Viaje</div>
        <br />
        <table class="auto-style49">
            <tr>
                <td class="auto-style43">Fecha de Partida:</td>
                <td class="auto-style44">
                    <asp:TextBox ID="txtPartida" runat="server" TextMode="DateTimeLocal" Width="200px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style45">
                </td>
            </tr>
            <tr>
                <td class="auto-style46">Fecha de Llegada:</td>
                <td class="auto-style47">
                    <asp:TextBox ID="txtLlegada" runat="server" TextMode="DateTimeLocal" Width="200px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style48"></td>
            </tr>
            <tr>
                <td class="auto-style38">Cant.Pasajeros:</td>
                <td class="auto-style33">
                    <asp:TextBox ID="txtPasajeros" runat="server" Width="197px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style34"></td>
            </tr>
            <tr>
                <td class="auto-style38">Precio:</td>
                <td class="auto-style33">
                    <asp:TextBox ID="txtPrecio" runat="server" Width="197px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style34"></td>
            </tr>
            <tr>
                <td class="auto-style36">Andén:</td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtAnden" runat="server" Width="197px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style23">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style36">Compañía:</td>
                <td class="auto-style21">
                    <asp:DropDownList ID="ddlCompañía" runat="server" Height="18px" Width="205px" Font-Names="Verdana">
                    </asp:DropDownList>
                </td>
                <td class="auto-style23" rowspan="2">
                    <asp:ListBox ID="lbTerminales" runat="server" Height="318px"  Width="200px" Font-Names="Verdana"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style19">Terminales:</td>
                <td class="auto-style22">
                    <asp:GridView ID="GVTerminales" runat="server" AutoGenerateColumns="False" Height="152px" Width="254px" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="None" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" CssClass="auto-style26" OnPageIndexChanging="GVTeminales_PageIndexChanging" OnSelectedIndexChanging="GVTerminales_SelectedIndexChanging" >
                        <Columns>
                            <asp:BoundField HeaderText="Terminales" DataField="Ciudad" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="White" BorderStyle="None" Font-Italic="True" Font-Names="Verdana" Font-Underline="False" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" BorderColor="Black" BorderStyle="None" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style41" colspan="2">
                    <asp:Button ID="btnCrearViaje" runat="server" Text="Crear Viaje" Width="129px" OnClick="btnCrearViaje_Click" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" />
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" Height="22px" Width="129px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnBorrar" runat="server" OnClick="btnBorrar_Click" Text="Borrar Terminal" Width="129px" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" Height="22px" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbVolver" runat="server" PostBackUrl="~/Menu.aspx">Volver</asp:LinkButton>
    
    </div>
</body>
</asp:Content>

