

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Xml.Linq;
using WebApplication4.ServiceReference1;
using WebApplication4.ServiceReference2;


namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AddCityItems();
            }
        }

        private string[] hola()
        {
            using (WebApplication4.ServiceReference2.Service2Client client = new WebApplication4.ServiceReference2.Service2Client())
            {
                string[] ciudades = client.getCiudades();
                return ciudades;
            }
        }

        protected void AddCityItems()
        {
            try
            {
                // string[] ciudadesService1 = hola();

                // string[] listaCiudad = ciudadesService1;
                string[] listaCiudad = hola();

                Array.Sort(listaCiudad);

                foreach (string ciudad in listaCiudad)
                {
                    DropDownListCiudad.Items.Add(ciudad);
                }
            }
            catch (Exception ex)
            {
                // Manejar el error de la llamada al servicio
                // Puedes mostrar un mensaje de error en la página o registrar el error en los registros de seguimiento
                // por ejemplo:
                // LabelError.Text = "Error al obtener la lista de ciudades: " + ex.Message;
            }
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            string nombre = TextBoxNombre.Text;
            string apellidos = TextBoxApellidos.Text;
            string email = TextBoxEmail.Text;
            string direccion = TextBoxDireccion.Text;
            bool sexM = RadioButtonM.Checked;
            bool sexF = RadioButtonF.Checked;
            string ciudad = DropDownListCiudad.SelectedValue;
            string reque = TextBoxRequerimiento.Text;

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Nombre: " + nombre);
            sb.AppendLine("Apellidos: " + apellidos);
            sb.AppendLine("Email: " + email);
            sb.AppendLine("Dirección: " + direccion);
            sb.AppendLine("Sexo Masculino: " + sexM);
            sb.AppendLine("Sexo Femenino: " + sexF);
            sb.AppendLine("Ciudad seleccionada: " + ciudad);
            sb.AppendLine("Requerimiento: " + reque);

            string contenido = sb.ToString();

            // Llamar al método del servicio para guardar la información
            using (WebApplication4.ServiceReference1.Service1Client client2 = new WebApplication4.ServiceReference1.Service1Client())
            {
                client2.GI(contenido);
            }

            TextBox1.Text = contenido;
            TextBoxNombre.Text = string.Empty;
            TextBoxApellidos.Text = string.Empty;
            TextBoxEmail.Text = string.Empty;
            TextBoxDireccion.Text = string.Empty;
            TextBoxRequerimiento.Text = string.Empty;
            DropDownListCiudad.SelectedIndex = 0;
            RadioButtonM.Checked = false;
            RadioButtonF.Checked = false;
        }
    }
}

