using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloEF;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Session["Usuario"] is Empleados))
            Response.Redirect("~/Default.aspx");
        else
        {
            lbUsuario.Text = "Bienvenido/a " + ((Empleados)Session["Usuario"]).NombreCompleto;
        }
    }

    protected void BtnDeslogueo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
    