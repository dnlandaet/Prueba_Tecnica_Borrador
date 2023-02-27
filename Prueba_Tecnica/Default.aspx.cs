using ClassLibrary1;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prueba_Tecnica
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario;
            if (!IsPostBack)
            {
                usuario =new Usuarios();
                usuario.grid_usuarios(GridView1);
            }
            ConexionBD cn = new ConexionBD();
            cn.AbrirConexion();
            cn.CerrarConexion();
            if (GridView1.Rows.Count >= 10)
            {
                Label10.Visible = true;
                DropDownList1.Visible = true;
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)

        {
            TextBoxNumDoc.Text = GridView1.SelectedRow.Cells[3].Text;
            TextBoxPName.Text = GridView1.SelectedRow.Cells[4].Text;
            TextBoxSName.Text = GridView1.SelectedRow.Cells[5].Text;
            TextBoxPriApe.Text = GridView1.SelectedRow.Cells[6].Text;
            TextBoxSegApe.Text = GridView1.SelectedRow.Cells[7].Text;
            TextBoxTelf.Text = GridView1.SelectedRow.Cells[8].Text;
            TextBoxCorreo.Text = GridView1.SelectedRow.Cells[9].Text;
            TextBoxDir.Text = GridView1.SelectedRow.Cells[10].Text;
            TextBoxEdad.Text = GridView1.SelectedRow.Cells[11].Text;
            ListGen.Text = GridView1.SelectedRow.Cells[12].Text;
            Button3.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e){
            
            Usuarios usuarios = new Usuarios();
            if (usuarios.crear(TextBoxNumDoc.Text, TextBoxPName.Text, TextBoxSName.Text, 
                TextBoxPriApe.Text, TextBoxSegApe.Text, TextBoxTelf.Text, TextBoxCorreo.Text, TextBoxDir.Text, Int32.Parse(TextBoxEdad.Text), 
                ListGen.Text)>0)
            {
                lblMsg.Text = "Ingreso exitoso";
                usuarios.grid_usuarios(GridView1);
                if (GridView1.Rows.Count >= 10)
                {
                    Label10.Visible = true;
                    DropDownList1.Visible = true;
                }

            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            Usuarios usuarios = new Usuarios();
            if (usuarios.eliminar(Convert.ToInt32(e.Keys["id"])) > 0)
            {
                lblMsg.Text = "Eliminación exitosa" + e.Keys["id"];
                usuarios.grid_usuarios(GridView1);

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Usuarios usuarios = new Usuarios();
            if (usuarios.modificar(TextBoxNumDoc.Text, TextBoxPName.Text, TextBoxSName.Text,
                TextBoxPriApe.Text, TextBoxSegApe.Text, TextBoxTelf.Text, TextBoxCorreo.Text, TextBoxDir.Text, Int32.Parse(TextBoxEdad.Text),
                ListGen.Text, Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text)) > 0)
            {
                lblMsg.Text = "Actualización exitosa" + GridView1.SelectedRow.Cells[2].Text;

                usuarios.grid_usuarios(GridView1);

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Usuarios usuarios = new Usuarios();
            string seleccion = DropDownList1.SelectedValue.ToString();
            if ( seleccion == "Nombres Completos")
            {
                    string nombresString = "";
                    List<string> nombres = usuarios.nombresCompletos();
                    foreach(string nombre in nombres)
                    {
                        nombresString += nombre+ "<br>";
                    }
                    LabelRespuesta.Text = nombresString;
               


                    
            }else if(seleccion == "Conteo de Hombres")
            {
                int conteoHombres = usuarios.contarHombres();
                LabelRespuesta.Text = "El conteo de hombres es: " + conteoHombres.ToString();
            }
            else if (seleccion == "Conteo de Mujeres")
            {
                int contMujeres = usuarios.contarMujeres();
                LabelRespuesta.Text = "El conteo de mujeres es: " + contMujeres.ToString();
            }
            else if (seleccion == "Nombre Mayor Persona")
            {
                string nombreMayorPersona = usuarios.nombreMayorPersona();
                LabelRespuesta.Text = "la persona con mayor edad es: " + nombreMayorPersona;
            }
            else if (seleccion == "Promedio edades")
            {
                string promedioEdades = usuarios.promedioEdades();
                LabelRespuesta.Text = "El promedio de edades es: " + promedioEdades;
            }


            Label10.Text = DropDownList1.SelectedValue.ToString();
        }
    }
}