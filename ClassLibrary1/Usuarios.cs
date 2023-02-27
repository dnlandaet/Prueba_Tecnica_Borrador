using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Google.Protobuf.WellKnownTypes;

namespace ClassLibrary1
{
    public class Usuarios{
        ConexionBD conectar;
        private DataTable grid_usuarios()
        {
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select * from bd_usuarios");
            MySqlDataAdapter adapter = new MySqlDataAdapter(consulta, conectar.conectar);
            adapter.Fill(tabla);
            return tabla;
        }

        public void grid_usuarios(GridView gv)
        {
            gv.DataSource = grid_usuarios();
            System.Console.WriteLine(gv.DataSource);
            gv.DataBind();

        }

        public int crear(
            string numero_documento, 
            string primer_nombre, 
            string segundo_nombre, 
            string primer_apellido, 
            string segundo_apellido,
            string telefono,
            string correo,
            string direccion,
            int edad,
            string genero)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("INSERT INTO usuarios.bd_usuarios (numero_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo, direccion, edad, genero) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', {8}, '{9}');",
                 numero_documento,
                 primer_nombre,
             segundo_nombre,
             primer_apellido,
             segundo_apellido,
             telefono,
             correo,
             direccion,
             edad,
             genero);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();
            conectar.CerrarConexion();
            return no;
            
        }

        public int modificar(
            string numero_documento,
            string primer_nombre,
            string segundo_nombre,
            string primer_apellido,
            string segundo_apellido,
            string telefono,
            string correo,
            string direccion,
            int edad,
            string genero,
            int id)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
           string consulta = string.Format(
               "UPDATE bd_usuarios SET numero_documento = '{0}', primer_nombre = '{1}', segundo_nombre = '{2}', primer_apellido = '{3}', segundo_apellido = '{4}', telefono = '{5}', correo = '{6}', direccion = '{7}', edad = {8}, genero = '{9}' where id = {10};",
                 numero_documento,
                 primer_nombre,
             segundo_nombre,
             primer_apellido,
             segundo_apellido,
             telefono,
             correo,
             direccion,
             edad,
             genero,
             id);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();
            conectar.CerrarConexion();
            return no;

        }
        public int eliminar(int id)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("DELETE FROM bd_usuarios where id = {0};", id);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();
            conectar.CerrarConexion();
            return no;

        }

        public List<String> nombresCompletos()
        {
            List<String> names = new List<String>();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select concat(primer_nombre, ' ', segundo_nombre, ' ', primer_apellido, ' ', segundo_apellido) as fulName  from bd_usuarios;");
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            MySqlDataReader reader = query.ExecuteReader();
            while (reader.Read())
            {
                names.Add(reader["fulName"].ToString());
            }
            conectar.CerrarConexion();
            return names;

        }
        public int contarMujeres()
        {
            List<String> names = new List<String>();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select id FROM bd_usuarios where genero = 'Femenino'");
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            MySqlDataReader reader = query.ExecuteReader();
            while (reader.Read())
            {
                names.Add(reader["id"].ToString());
            }
            conectar.CerrarConexion();
            return names.Count;

            

        }
        public int contarHombres()
        {
            List<String> names = new List<String>();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select id FROM bd_usuarios where genero = 'Masculino'");
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            MySqlDataReader reader = query.ExecuteReader();
            while (reader.Read())
            {
                names.Add(reader["id"].ToString());
            }
            conectar.CerrarConexion();
            return names.Count;

        }
        public string nombreMayorPersona()
        {
            List<String> names = new List<String>();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select MAX(edad) as edad, concat(primer_nombre, ' ', segundo_nombre, ' ', primer_apellido, ' ', segundo_apellido) as fulName FROM bd_usuarios group by fulName order by edad desc LIMIT 1");
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            MySqlDataReader reader = query.ExecuteReader();
            while (reader.Read())
            {
                names.Add(reader["fulName"].ToString());
            }
            conectar.CerrarConexion();
            return names[0];

        }

        public string promedioEdades()
        {
            List<String> names = new List<String>();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("select avg(edad) as mean FROM bd_usuarios ");
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            MySqlDataReader reader = query.ExecuteReader();
            while (reader.Read())
            {
                names.Add(reader["mean"].ToString());
            }
            conectar.CerrarConexion();
            return names[0];

        }

    }
 
}
