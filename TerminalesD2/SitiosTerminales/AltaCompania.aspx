<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaCompania.aspx.cs" Inherits="AltaCompania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            height: 30px;
            width: 141px;
        }
        .auto-style16 {
            height: 36px;
            width: 123px;
        }
        .auto-style20 {
            height: 36px;
            width: 334px;
        }
        .auto-style22 {
        height: 42px;
        width: 123px;
    }
    .auto-style29 {
        width: 717px;
        height: 402px;
    }
    .auto-style30 {
        width: 709px;
        height: 151px;
    }
        .auto-style31 {
            height: 42px;
            width: 587px;
        }
        .auto-style33 {
            width: 953px;
            height: 25px;
        }
        .auto-style36 {
            height: 30px;
            width: 123px;
        }
        .auto-style37 {
            height: 30px;
            width: 1139px;
        }
        .auto-style38 {
            height: 36px;
            width: 1139px;
        }
        .auto-style39 {
            width: 1139px;
        }
        .auto-style40 {
            height: 42px;
            width: 1139px;
        }
        .auto-style41 {
            width: 953px;
        }
        .auto-style42 {
            height: 30px;
            width: 953px;
        }
        .auto-style43 {
            height: 42px;
            width: 953px;
        }
        .auto-style44 {
            width: 123px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
    <div class="auto-style29" style="font-family: VErdana, Geneva, Tahoma, sans-serif">
        <div class="auto-style31" style="font-family: VERdana, Geneva, Tahoma, sans-serif; font-size: xx-large; text-decoration: underline; background-color: #006666; color: #FFFFFF; text-align: center">
            Alta Compañía</div>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table class="auto-style30">
            <tr>
                <td class="auto-style41">Nombre Compañía:</td>
                <td class="auto-style39">
                    <asp:TextBox ID="txtNomComp" runat="server" Width="300px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:Button ID="btnBuscar" runat="server" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" OnClick="btnBuscar_Click" Text="Buscar" Width="120px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style42">Dirección:</td>
                <td class="auto-style37">
                    <asp:TextBox ID="txtDireccion" runat="server" Width="300px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style36">
                    <asp:Button ID="btnLimpiar" runat="server" OnClick="BtnLimpiar_Click" Text="Limpiar" Width="120px" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" />
                </td>
            </tr>
            <tr>
                <td class="auto-style33">Teléfono:</td>
                <td class="auto-style38">
                    <asp:TextBox ID="txtTelefono" runat="server" Width="300px" Font-Names="Verdana"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style40">
                    <asp:Button ID="btnCompania" runat="server" Text="Crear Compañía" OnClick="btnCompania_Click" Width="120px" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" />
                &nbsp;<asp:Button ID="btnModificar" runat="server" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" ForeColor="White" OnClick="btnModificar_Click" Text="Modificar" Width="120px" />
&nbsp;<asp:Button ID="btnEliminar" runat="server" BackColor="#339966" Font-Bold="True" Font-Italic="True" Font-Names="verdana" ForeColor="White" OnClick="btnEliminar_Click" Text="Eliminar" Width="120px" />
                    </td>
                <td class="auto-style22">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
                <td class="auto-style44">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbVolver" runat="server" PostBackUrl="~/Menu.aspx">Volver</asp:LinkButton>
    </div>
    </body>
</asp:Content>

