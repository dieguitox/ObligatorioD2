using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using ModeloEF;


public partial class AltaViajes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            Session["TerminalesLB"] = new List<ViajeTerminal>();
            this.CargarComp();
            this.CargarTerminales();
            Limpiar();
        }
    }

    public void CargarComp()
    {
        Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];
        Session["Companias"] = ObContexto.Companias.ToList();

        ddlCompañía.DataSource = Session["Companias"];
        ddlCompañía.DataTextField = "NombreComp";
        ddlCompañía.DataValueField = "NombreComp";
        ddlCompañía.DataBind();
        ddlCompañía.Items.Insert(0, "Seleccione Compañia");
    }

    public void CargarTerminales()
    {
        Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];
        Session["TerminalesGV"] = ObContexto.Terminales.ToList();

        GVTerminales.DataSource = Session["TerminalesGV"];
        GVTerminales.DataBind();
    }

    private void Limpiar()
    {
        try
        {
            txtAnden.Text = "";
            txtLlegada.Text = "";
            txtPartida.Text = "";
            txtPasajeros.Text = "";
            txtPrecio.Text = "";
            CargarComp();
            CargarTerminales();
            lbTerminales.Items.Clear();
            GVTerminales.DataSource = Session["TerminalesGV"];
            GVTerminales.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnCrearViaje_Click(object sender, EventArgs e)
    {
        Obligatorio2Entities ObContexto = null;
        Viajes unViaje = null;
        try
        {
            ObContexto = (Obligatorio2Entities)Session["Contexto"];
            DateTime partida = Convert.ToDateTime(txtPartida.Text);
            DateTime llegada = Convert.ToDateTime(txtLlegada.Text);
            int anden = Convert.ToInt32(txtAnden.Text);
            var ocupado = (from unV in ObContexto.Viajes.ToList()
                           where unV.Anden == anden &&
                           (unV.FechaPartida.Subtract(partida).TotalMinutes < 30 &&
                           unV.FechaPartida.Subtract(partida).TotalMinutes > -30)
                           select unV).Any();
            
            if (ocupado)
            {
                lblError.Text = "El anden esta ocupado.";
                return;
            }
            
            decimal precio = Convert.ToDecimal(txtPrecio.Text);
            Empleados unEmp = (Empleados)Session["Usuario"];
            int pasajeros = Convert.ToInt32(txtPasajeros.Text);
            Companias comp = ((List<Companias>)Session["Companias"])[ddlCompañía.SelectedIndex - 1];
            List<ViajeTerminal> lista = (List<ViajeTerminal>)Session["TerminalesLB"];



            unViaje = new Viajes
            {
                FechaPartida = partida,
                FechaLlegada = llegada,
                Pasajeros = pasajeros,
                Anden = anden,
                Precio = precio,
                Empleados = unEmp,
                Companias = comp,
                ViajeTerminal = lista
            };

            Validar.ValidarViajes(unViaje);
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
            return;
        }
        try
        {
            ObContexto.Viajes.Add(unViaje);
            ObContexto.SaveChanges();

            lblError.ForeColor = Color.Green;
            lblError.Text = "Alta con éxito";
            Limpiar();
        }
        catch (Exception ex)
        {
            ObContexto.Entry(unViaje).State = System.Data.Entity.EntityState.Detached;
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        if (lbTerminales.SelectedIndex >= 0)
        {
            var terminal = ((List<ViajeTerminal>)Session["TerminalesLB"])[lbTerminales.SelectedIndex];

            for (int i = lbTerminales.SelectedIndex; i < lbTerminales.Items.Count - 1; i++)
                ((List<ViajeTerminal>)Session["TerminalesLB"])[i + 1].NroParada -= 1;

            lbTerminales.Items.RemoveAt(lbTerminales.SelectedIndex);
            lblError.Text = "Se elimino la terminal";
            ((List<Terminales>)Session["TerminalesGV"]).Add(terminal.Terminales);
            ((List<ViajeTerminal>)Session["TerminalesLB"]).Remove(terminal);
            GVTerminales.DataSource = Session["TerminalesGV"];
            GVTerminales.DataBind();
        }
        else
            lblError.Text = "Debe seleccionar una terminal de la lista para eliminar";
    }

    protected void GVTeminales_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVTerminales.PageIndex = e.NewPageIndex;
        GVTerminales.DataSource = Session["TerminalesGV"];
        GVTerminales.DataBind();
        Page.MaintainScrollPositionOnPostBack = true;
    }

    protected void GVTerminales_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            var terminal = ((List<Terminales>)Session["TerminalesGV"])[(e.NewSelectedIndex) + (GVTerminales.PageIndex * GVTerminales.PageSize)];
            lbTerminales.Items.Add(terminal.Ciudad);
            ((List<ViajeTerminal>)Session["TerminalesLB"]).Add(new ViajeTerminal { Terminales = terminal, NroParada = lbTerminales.Items.Count });
            ((List<Terminales>)Session["TerminalesGV"]).Remove(terminal);
            GVTerminales.DataSource = Session["TerminalesGV"];
            GVTerminales.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }
}