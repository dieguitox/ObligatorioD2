using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using ModeloEF;
using System.Data.SqlClient;


public partial class AltaCompania : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LimpioDatos(); 
    }

    protected void LimpioDatos()
    {
        txtNomComp.Text = "";
        txtDireccion.Text = "";
        txtTelefono.Text = "";

        btnBuscar.Enabled = true;
        btnLimpiar.Enabled = true;
        btnCompania.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            string nomComp = txtNomComp.Text.Trim();
            Companias comp = ObContexto.Companias.Where(x => x.NombreComp == nomComp).FirstOrDefault();

            if (comp == null)
            {
                txtDireccion.Text = "";
                txtTelefono.Text = "";

                btnBuscar.Enabled = true;
                btnCompania.Enabled = true;
                btnEliminar.Enabled = false;
                btnModificar.Enabled = false;
            }
            else
            {
                txtNomComp.Text = comp.NombreComp;
                txtDireccion.Text = comp.Direccion;
                txtTelefono.Text = comp.Telefono;

                btnBuscar.Enabled = false;
                btnCompania.Enabled = false;
                btnEliminar.Enabled = true;
                btnModificar.Enabled = true;
                Session["Companias"] = comp;
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];
            Companias comp = (Companias)Session["Companias"];

            comp.Direccion = txtDireccion.Text.Trim();
            comp.Telefono = txtTelefono.Text.Trim();

            Validar.ValidarCompanias(comp);

            ObContexto.SaveChanges();

            lblError.ForeColor = Color.Green;
            lblError.Text = "Modificación con éxito.";


            LimpioDatos();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        Obligatorio2Entities ObContexto = null;

        try
        {
            ObContexto = (Obligatorio2Entities)Session["Contexto"];
            Companias comp = (Companias)Session["Companias"];


            SqlParameter nom = new SqlParameter("@nom", comp.NombreComp);
            SqlParameter ret = new SqlParameter("@ret", System.Data.SqlDbType.Int);
            ret.Direction = System.Data.ParameterDirection.Output;

            ObContexto.Database.ExecuteSqlCommand("exec EliminarCompania @nom, @ret output", nom, ret);

            if ((int)ret.Value == -1)
                throw new Exception("Ya existe una Viaje con esa compañía.");
            else if((int)ret.Value == -2)
                throw new Exception("No existe una Compañía con ese nombre.");
            else
            {
                ObContexto.Entry(comp).State = System.Data.Entity.EntityState.Detached;
                ObContexto.SaveChanges();
            }

            lblError.ForeColor = Color.Green;
            lblError.Text = "Ëliminación correcta.";

            LimpioDatos();

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void BtnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioDatos();
    }

    protected void btnCompania_Click(object sender, EventArgs e)
    {
        Obligatorio2Entities ObContexto = null;
        Companias comp = null;

        try
        {
            ObContexto = (Obligatorio2Entities)Session["Contexto"];

            comp = new Companias()
            {
                NombreComp = txtNomComp.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Telefono = txtTelefono.Text.Trim()
            };
            Validar.ValidarCompanias(comp);

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
            return;
        }
        try
        {
            SqlParameter nom = new SqlParameter("@nom", comp.NombreComp);
            SqlParameter dir = new SqlParameter("@dir", comp.Direccion);
            SqlParameter tel = new SqlParameter("@tel", comp.Telefono);
            SqlParameter ret = new SqlParameter("@ret", System.Data.SqlDbType.Int);

            ret.Direction = System.Data.ParameterDirection.Output;

            ObContexto.Database.ExecuteSqlCommand("exec AltaCompania @nom,@dir,@tel,@ret output", nom, dir, tel, ret);

            if ((int)ret.Value == -1)
                throw new Exception("Nombre repetido, no se puede dar de alta.");
            else
                ObContexto.SaveChanges();

            lblError.ForeColor = Color.Green;
            lblError.Text = "Alta con éxito.";

            LimpioDatos();

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}