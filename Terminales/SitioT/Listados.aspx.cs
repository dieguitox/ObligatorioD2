using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloEF;


public partial class Listados : System.Web.UI.Page
{

    static Obligatorio2Entities ObContexto = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ObContexto = (Obligatorio2Entities)Session["Contexto"];
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

            var destinos = (from unV in ObContexto.Viajes
                            from unD in unV.ViajeTerminal
                            group unD by new { ciudad = unD.Terminales.Ciudad, codigo = unD.Terminales.Codigo }
                           into grupo
                            select new
                            {
                                Ciudad = grupo.Key.ciudad.ToString(),
                                Codigo = grupo.Key.codigo.ToString()
                            }).ToList();


            Session["Compania"] = ObContexto.Companias.ToList();
            ddlCompania.DataSource = Session["Compania"];
            ddlCompania.DataTextField = "NombreComp";
            ddlCompania.DataBind();
            ddlCompania.Items.Insert(0, "Seleccionar");

            ddlDestino.DataSource = destinos;
            ddlDestino.DataTextField = "Ciudad";
            ddlDestino.DataValueField = "Codigo";
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
            ddlCompania.SelectedIndex = -1;
            ddlDestino.SelectedIndex = -1;
            FechaCalendar.Text = DateTime.Today.ToShortDateString();
            Session["Filtros"] = ObContexto.Viajes.ToList();
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
                                      where unV.ViajeTerminal.Last().CodigoTerminal == ddlDestino.SelectedValue
                                      select unV).ToList();
            }

            if (!(string.IsNullOrWhiteSpace(FechaCalendar.Text)))
            {
                Session["Filtros"] = (from unV in (List<Viajes>)Session["Filtros"]
                                      where unV.FechaPartida.Date == Convert.ToDateTime(FechaCalendar.Text)
                                      select unV).ToList();
            }

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
                                       Destino = (from unD in unV.ViajeTerminal
                                                  orderby unD.NroParada descending
                                                  select unD).First().Terminales.Ciudad
                                   }).ToList();
        GVViajes.DataSource = listadoViajesGrilla;
        GVViajes.DataBind();
    }
}