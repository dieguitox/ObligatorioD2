using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloEF;

public partial class EstadisticadeViaje : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

        var listado = (from unV in ObContexto.Viajes.ToList()
                       group unV by new { mes = unV.FechaPartida.Month, anio = unV.FechaPartida.Year }
                       into grupito
                       select new
                       {
                           Mes = grupito.Key.mes,
                           Año = grupito.Key.anio,
                           Cantidad = grupito.Count()
                       }).ToList();

        GdvViajesxMes.DataSource = listado;
        GdvViajesxMes.DataBind();

        var listado2 = (from unV in ObContexto.Viajes.ToList()
                       group unV by new { comp = unV.Companias.NombreComp , anio = unV.FechaPartida.Year }
                       into grupito
                       select new
                       {
                           Compañía = grupito.Key.comp,
                           Año = grupito.Key.anio,
                           Cantidad = grupito.Count()
                       }).ToList();

        GdvCompania.DataSource = listado2;
        GdvCompania.DataBind();

    }

    protected void GdvViajesxMes_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}