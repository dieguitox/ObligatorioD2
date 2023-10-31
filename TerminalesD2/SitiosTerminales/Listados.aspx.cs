using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloEF;


public partial class Listados : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {

            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];
            Session["ViajesMes"] = ObContexto.Viajes.ToList();
            Session["Filtros"] = Session["ViajesMes"];
            CargarDdls();
        }
    }

    protected void GVViajes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVViajes.PageIndex = e.NewPageIndex;
        MostrarEnGrilla((List<Viajes>)Session["Filtros"]);
        Page.MaintainScrollPositionOnPostBack = true;
    }

    private void CargarDdls()
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            var Destino = (from unV in ObContexto.Viajes
                           from unD in unV.ViajeTerminal
                           group unD by unD.Terminales.Ciudad into grupo
                           select new
                           {
                               Ciudad = grupo.Key.ToString()
                           }).ToList();


            Session["Compania"] = ObContexto.Companias.ToList();
            ddlCompania.DataSource = Session["Compania"];
            ddlCompania.DataTextField = "NombreComp";
            ddlCompania.DataBind();
            ddlCompania.Items.Insert(0, "Seleccionar");

            ddlDestino.DataSource = Destino;
            ddlDestino.DataTextField = "Ciudad";
            ddlDestino.DataBind();
            ddlDestino.Items.Insert(0, "Seleccionar");

            MostrarEnGrilla((List<Viajes>)Session["ViajesMes"]);
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            ddlCompania.SelectedIndex = -1;
            ddlDestino.SelectedIndex = -1;
            FechaCalendar.Text = DateTime.Today.ToShortDateString();
            Session["Filtros"] = ObContexto.Viajes;
            MostrarEnGrilla((List<Viajes>)Session["Filtros"]);
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnFiltro_Click(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            Session["Filtros"] = ObContexto.Viajes.ToList();
            if (ddlCompania.SelectedIndex != 0)
            {
                Session["Filtros"] = (from unV in (List<Viajes>)Session["Filtros"]
                                      where unV.Companias.NombreComp == ddlCompania.SelectedValue
                                      select unV).ToList();
            }

            if (ddlDestino.SelectedIndex != 0)
            {
                Session["Filtros"] = (from unV in (List<Viajes>)Session["Filtros"]
                                      where unV.ViajeTerminal.OrderByDescending(x => x.NroParada).FirstOrDefault().Terminales.Ciudad == ddlDestino.SelectedValue
                                      select unV).ToList();
            }

            if (!(string.IsNullOrWhiteSpace(FechaCalendar.Text)))
            {
                Session["Filtros"] = (from unV in (List<Viajes>)Session["Filtros"]
                                      where unV.FechaPartida.Date == Convert.ToDateTime(FechaCalendar.Text)
                                      select unV).ToList();
            }

            var prueba = (List<Viajes>)Session["Filtros"];
            MostrarEnGrilla((List<Viajes>)Session["Filtros"]);
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private void MostrarEnGrilla(List<Viajes> listadoViajes)
    {

        
        var listadoViajesGrilla = (from unV in listadoViajes
                                   select new
                                   {
                                       Viaje = unV.CodigoInterno,
                                       FechaHora = unV.FechaPartida,
                                       Compañía = unV.Companias.NombreComp,
                                       Destino = unV.ViajeTerminal.OrderByDescending(x => x.NroParada).FirstOrDefault().Terminales.Ciudad
                                   }).ToList();
        GVViajes.DataSource = listadoViajesGrilla;
        GVViajes.DataBind();
    }
}