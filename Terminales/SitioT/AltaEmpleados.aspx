<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaEmpleados.aspx.cs" Inherits="AltaEmpleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            height: 24px;
            width: 164px;
        }
        .auto-style29 {
            height: 24px;
            width: 1442px;
        }
    .auto-style32 {
        height: 67px;
        width: 622px;
    }
    .auto-style37 {
        width: 623px;
        height: 150px;
            margin-right: 2px;
        }
    .auto-style38 {
        width: 624px;
        height: 413px;
    }
    .auto-style40 {
        width: 621px;
        height: 415px;
    }
        .auto-style42 {
            height: 26px;
        }
        .auto-style45 {
            height: 31px;
            width: 711px;
        }
        .auto-style46 {
            width: 223px;
        }
        .auto-style47 {
            height: 26px;
            width: 223px;
        }
        .auto-style48 {
            height: 31px;
            width: 223px;
        }
        .auto-style49 {
            width: 711px;
        }
        .auto-style50 {
            height: 31px;
            width: 1442px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
    <div class="auto-style38">
        <div class="auto-style40" style="font-family: VErdana, Geneva, Tahoma, sans-serif">
            <div class="auto-style32" style="font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: xx-large; color: #FFFFFF; background-color: #006666; text-align: center; text-decoration: underline">
                Crear Empleado</div>
            
                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="auto-style37">
                        <tr>
                            <td class="auto-style50">Nombre de Usuario:</td>
                            <td class="auto-style45">
                                <asp:TextBox ID="txtUsu" runat="server" Width="310px" Font-Names="Verdana"></asp:TextBox>
                            </td>
                            <td class="auto-style48">
                                <asp:Button ID="btnBuscar" runat="server" BackColor="#339966" BorderColor="#006666" Font-Bold="True" Font-Italic="True" Font-Names="verdana" ForeColor="White" Height="22px" Text="Buscar" Width="100px" OnClick="btnBuscar_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style29">Nombre:</td>
                            <td class="auto-style49">
                                <asp:TextBox ID="txtNombre" runat="server" Width="310px" Font-Names="Verdana" Height="17px"></asp:TextBox>
                            </td>
                            <td class="auto-style46">
                                <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Width="100px" BackColor="#339966" BorderColor="#006666" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" Height="22px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style50">Contraseña:</td>
                            <td class="auto-style45">
                                <asp:TextBox ID="txtPass" runat="server" Width="310px" Font-Names="Verdana" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style48">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style29">&nbsp;</td>
                            <td class="auto-style49">
                                <asp:Button ID="btnCrear" runat="server" Text="Crear" Width="100px" OnClick="btnCrear_Click" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" Height="22px" />
                            &nbsp;
                                <asp:Button ID="btnModificar" runat="server" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="verdana" ForeColor="White" Text="Modificar" Width="100px" Height="22px" OnClick="btnModificar_Click" />
&nbsp;
                                <asp:Button ID="btnEliminar" runat="server" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="verdana" ForeColor="White" Text="Eliminar" Width="100px" Height="22px" OnClick="btnEliminar_Click" />
                            </td>
                            <td class="auto-style46">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style42">
                                <asp:Label ID="lblError" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style47">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbVolver" runat="server" PostBackUrl="~/Menu.aspx" >Volver</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
            
        </div>
    </div>
        </body>
</asp:Content>

