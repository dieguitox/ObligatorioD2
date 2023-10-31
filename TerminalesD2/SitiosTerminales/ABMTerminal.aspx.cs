using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using ModeloEF;
using System.Data.SqlClient;

public partial class ABMInternacional : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LimpiarDatos();
        }
    }

    private void LimpiarDatos()
    {
        txtCodigo.Text = "";
        txtCiudad.Text = "";
        txtPais.Text = "";

        btnAlta.Enabled = false;
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;
        btnBuscar.Enabled = true;
        
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            string cod = txtCodigo.Text.Trim();
            Terminales unT = ObContexto.Terminales.Where(x => x.Codigo == cod).FirstOrDefault();

            if (unT == null)
            {
                txtCiudad.Text = "";
                txtPais.Text = "";

                btnAlta.Enabled = true;
                btnEliminar.Enabled = false;
                btnModificar.Enabled = false;
            }
            else
            {
                txtCiudad.Text = unT.Ciudad;
                txtPais.Text = unT.Pais;

                btnAlta.Enabled = false;
                btnEliminar.Enabled = true;
                btnModificar.Enabled = true;
                Session["Terminales"] = unT;
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnAlta_Click1(object sender, EventArgs e)
    {
        Obligatorio2Entities ObContexto = null;
        Terminales unT = null;

        try
        {
            ObContexto = (Obligatorio2Entities)Session["Contexto"];

            unT = new Terminales
            {
                Codigo = txtCodigo.Text.Trim(),
                Ciudad = txtCiudad.Text.Trim(),
                Pais = txtPais.Text.Trim()
            };
            Validar.ValidarTerminal(unT);       
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
            return;
        }

        try
        {
            SqlParameter cod = new SqlParameter("@cod", unT.Codigo);
            SqlParameter ciu = new SqlParameter("@ciudad", unT.Ciudad);
            SqlParameter pais = new SqlParameter("@pais", unT.Pais);
            SqlParameter ret = new SqlParameter("@ret", System.Data.SqlDbType.Int);

            ret.Direction = System.Data.ParameterDirection.Output;

            ObContexto.Database.ExecuteSqlCommand("exec AltaTerminal @cod,@ciudad,@pais,@ret output", cod, ciu, pais, ret);

            if ((int)ret.Value == -1)
                throw new Exception("La terminal ya existe.");
            else
                ObContexto.SaveChanges();

            lblError.ForeColor = Color.Blue;
            lblError.Text = "Alta con éxito";

            LimpiarDatos();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click1(object sender, EventArgs e)
    {
        LimpiarDatos();
    }

    protected void btnModificar_Click1(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];
            Terminales unT = (Terminales)Session["Terminales"];

            unT.Ciudad = txtCiudad.Text.Trim();
            unT.Pais = txtPais.Text.Trim();

            Validar.ValidarTerminal(unT);

            ObContexto.SaveChanges();

            lblError.ForeColor = Color.Blue;
            lblError.Text = "Modificación con éxito";

            LimpiarDatos();

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnEliminar_Click1(object sender, EventArgs e)
    {
        Obligatorio2Entities ObContexto = null;
        Terminales unT = null;

        try
        {
            ObContexto = (Obligatorio2Entities)Session["Contexto"];
            unT = (Terminales)Session["Terminales"];

            SqlParameter cod = new SqlParameter("@cod", unT.Codigo);
            SqlParameter ret = new SqlParameter("@ret", System.Data.SqlDbType.Int);
            ret.Direction = System.Data.ParameterDirection.Output;

            ObContexto.Database.ExecuteSqlCommand("exec EliminarTerminal @cod, @ret output", cod, ret);

            if ((int)ret.Value == -1)
                throw new Exception("El codigo de terminal no existe");
            else if ((int)ret.Value == -2)
                throw new Exception("La terminal está en un viaje, no se puede eliminar");
            else
            {
                ObContexto.Entry(unT).State = System.Data.Entity.EntityState.Detached;
                ObContexto.SaveChanges();
            }

            lblError.ForeColor = Color.Blue;
            lblError.Text = "Eliminación con éxito";

            LimpiarDatos();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }

    }
}