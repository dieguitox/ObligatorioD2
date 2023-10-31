using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloEF;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                GeneroContext();
                Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

                Session["Usuario"] = null;
                var listadoViajes = ObContexto.Viajes.Where(x => x.FechaPartida > DateTime.Now).ToList();

                var listadoVM = (from unV in listadoViajes
                                 from unaT in unV.ViajeTerminal
                                 orderby unV.FechaPartida
                                 select new
                                 {
                                     NumeroDeViaje = unV.CodigoInterno,
                                     FechaHora = unV.FechaPartida,
                                     AndenSalida = unV.Anden,
                                     Destino = unV.ViajeTerminal.OrderByDescending(x => x.NroParada).FirstOrDefault().Terminales.Ciudad
                                 }).ToList<object>();

                Session["ListaViajes"] = listadoVM;
                GVListadoPartidas.DataSource = listadoVM;
                GVListadoPartidas.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private void GeneroContext()
    {
        try
        {
            Obligatorio2Entities ObContexto = new Obligatorio2Entities();


            Session["Contexto"] = ObContexto;
        }
        catch (Exception ex)
        {

            lblError.Text = ex.Message;
        }
    }

    protected void btnInicioSession_Click(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            Empleados unEmp = ObContexto.Empleados.FirstOrDefault(x => x.Usuario == txtUsu.Text.Trim() && x.Pass == txtPass.Text.Trim());

            if (unEmp != null)
            {
                Session["Usuario"] = unEmp;
                Response.Redirect("~/Menu.aspx");
            }
            else
                lblError.Text = "Credenciales incorrectas";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void GVListadoPartidas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVListadoPartidas.PageIndex = e.NewPageIndex;
        GVListadoPartidas.DataSource = Session["ListaViajes"];
        GVListadoPartidas.DataBind();
        Page.MaintainScrollPositionOnPostBack = true;
    }

    
}