<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMTerminal.aspx.cs" Inherits="ABMInternacional" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style31 {
            height: 15px;
        }
        .auto-style37 {
            height: 32px;
        }
        .auto-style38 {
            width: 1352px;
            height: 32px;
        }
        .auto-style44 {
            width: 1352px;
            height: 25px;
        }
        .auto-style46 {
            height: 25px;
        }
        .auto-style47 {
            width: 182px;
            height: 25px;
        }
        .auto-style49 {
            width: 1352px;
            height: 23px;
        }
        .auto-style50 {
            height: 23px;
        }
        .auto-style51 {
            width: 182px;
            height: 23px;
        }
        .auto-style52 {
            width: 640px;
            height: 40px;
            margin-left: 0px;
        }
    .auto-style53 {
        height: 41px;
    }
        .auto-style54 {
            width: 581px;
            height: 172px;
        }
        .auto-style55 {
            height: 32px;
            width: 182px;
        }
        .auto-style56 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body style="width: 931px; height: 362px">
    <div class="auto-style52" style="font-family: Verdana, Geneva, Tahoma, sans-serif" dir="auto">
    
        <div class="auto-style53" style="font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: x-large; text-decoration: underline; color: #FFFFFF; background-color: #006666; text-align: center;">
            ABM TERMINALES
        </div>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table class="auto-style54">
            <tr>
                <td class="auto-style38">Código:</td>
                <td class="auto-style37">
                    <asp:TextBox ID="txtCodigo" runat="server" Width="270px"></asp:TextBox>
                </td>
                <td class="auto-style55">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="128px" OnClick="btnBuscar_Click" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style49">Ciudad:</td>
                <td class="auto-style50">
                    <asp:TextBox ID="txtCiudad" runat="server" Width="270px"></asp:TextBox>
                </td>
                <td class="auto-style51">
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" Width="128px" OnClick="btnLimpiar_Click1" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style44">País:</td>
                <td class="auto-style46">
                    <asp:TextBox ID="txtPais" runat="server" Width="270px"></asp:TextBox>
                </td>
                <td class="auto-style47"></td>
            </tr>
            <tr>
                <td class="auto-style31" colspan="3"></td>
            </tr>
            <tr>
                <td class="auto-style37" colspan="3" text-aling="center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAlta" runat="server" Text="Agregar" Width="128px" OnClick="btnAlta_Click1" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" CssClass="auto-style56" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="128px" OnClick="btnModificar_Click1" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White"/>
                &nbsp;&nbsp;
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="128px" OnClick="btnEliminar_Click1" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
        </table>
    
        <br />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lbVolver" runat="server" PostBackUrl="~/Menu.aspx">Volver</asp:LinkButton>
    
    </div>
    
</body>
</asp:Content>

