using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Common;
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
                GVTerminales.Visible = false;
                GeneroContext();
                Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

                Session["Usuario"] = null;
                var listadoViajes = ObContexto.Viajes.Where(x => x.FechaPartida > DateTime.Now).ToList();

                var listadoVM = (from unV in listadoViajes
                                 orderby unV.FechaPartida
                                 select new
                                 {
                                     NumeroDeViaje = unV.CodigoInterno,
                                     FechaHora = unV.FechaPartida,
                                     AndenSalida = unV.Anden,
                                     Destino = unV.ViajeTerminal.OrderByDescending(x => x.NroParada).First().Terminales.Ciudad
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
        GVTerminales.Visible = false;
        GVListadoPartidas.SelectedIndex = -1;
    }

    protected void GVListadoPartidas_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];
            int codViaje = Convert.ToInt32(GVListadoPartidas.SelectedRow.Cells[0].Text);

            var lista = (from unV in ObContexto.ViajeTerminal.Where(v => v.CodigoInterno == codViaje).OrderBy(x => x.NroParada).ToList()
                         select new
                         {
                             NroParada = unV.NroParada,
                             Ciudad = unV.Terminales.Ciudad,
                             Pais = unV.Terminales.Pais
                         }).ToList();

            GVTerminales.Visible = true;
            GVTerminales.DataSource = lista;
            GVTerminales.DataBind();

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}