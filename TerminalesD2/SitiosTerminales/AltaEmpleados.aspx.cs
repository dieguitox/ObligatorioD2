using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;
using ModeloEF;

public partial class AltaEmpleados : System.Web.UI.Page
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
        txtUsu.Text = "";
        txtNombre.Text = "";
        txtPass.Text = "";

        btnBuscar.Enabled = true;
        btnLimpiar.Enabled = true;
        btnCrear.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpiarDatos();
    }

    protected void btnCrear_Click(object sender, EventArgs e)
    {
        Obligatorio2Entities ObContexto = null;
        Empleados unE = null;

        try
        {
            ObContexto = (Obligatorio2Entities)Session["Contexto"];

            unE = new Empleados()
            {
                Usuario = txtUsu.Text.Trim(),
                NombreCompleto = txtNombre.Text.Trim(),
                Pass = txtPass.Text.Trim()
            };

            Validar.ValidarEmpleados(unE);
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
            return;
        }

        try
        {
            ObContexto.Empleados.Add(unE); 
            ObContexto.SaveChanges();

            lblError.ForeColor = Color.Green;
            lblError.Text = "Usuario ingresado correctamente.";

            LimpiarDatos();

        }
        catch (Exception ex)
        {
            ObContexto.Entry(unE).State = System.Data.Entity.EntityState.Detached;
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            Obligatorio2Entities ObContexto = (Obligatorio2Entities)Session["Contexto"];

            string usu = txtUsu.Text.Trim();
            Empleados unE = ObContexto.Empleados.Where(x => x.Usuario == usu).FirstOrDefault();

            if (unE == null)
            {
                txtPass.Text = "";
                txtNombre.Text = "";

                btnCrear.Enabled = true;
                btnEliminar.Enabled = false;
                btnModificar.Enabled = false;
            }
            else
            {
                txtNombre.Text = unE.NombreCompleto;
                txtPass.Text = unE.Pass;

                btnCrear.Enabled = false;
                btnEliminar.Enabled = true;
                btnModificar.Enabled = true;
                Session["Empleados"] = unE;
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

            Empleados unE = (Empleados)Session["Empleados"];
            Empleados empLogueado = (Empleados)Session["Usuario"];

            if (unE.Usuario != empLogueado.Usuario)
            {
                lblError.ForeColor = Color.Blue;
                lblError.Text = "No se puede cambiar la contraseña de otro usuario.";
                return;
            }

            unE.Pass = txtPass.Text.Trim();
            unE.NombreCompleto = txtNombre.Text.Trim();

            Validar.ValidarEmpleados(unE);

            ObContexto.SaveChanges();

            lblError.ForeColor = Color.Green;
            lblError.Text = "Se modificó correctamente.";

            LimpiarDatos();
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
            Empleados unE = (Empleados)Session["Empleados"];

            bool find = (from unEmp in ObContexto.Viajes
                         where unEmp.Empleados.Usuario == unE.Usuario
                         select unEmp).Any();

            if (find)
            {
                lblError.ForeColor = Color.Blue;
                lblError.Text = "No se puede eliminar, hay viajes asociados.";
                return;
            }

            ObContexto.Empleados.Remove(unE);
            ObContexto.SaveChanges();

            Empleados empLogueado = (Empleados)Session["Usuario"];

            if (unE.Usuario == empLogueado.Usuario )
            {
                Session["Usuario"] = null;
                Response.Redirect("~/default.aspx");
            }

            lblError.Text = "Eliminación con éxito.";

            LimpiarDatos();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}