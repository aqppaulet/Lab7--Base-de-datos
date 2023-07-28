using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;
using ProjectDatos;


namespace servicio2
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service2" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service2.svc or Service2.svc.cs at the Solution Explorer and start debugging.
    public class Service2 : IService2
    {
        public IList<String> getCiudades()
        {
            //  string filePath = "C:\\Users\\JOSEPAREDES\\Desktop\\2023\\Primer semestre CS\\DBP\\LAB 4\\WebApplication2\\WebApplication2\\App_Data\\ciudades.txt";

            //string[] lineas = File.ReadAllLines(filePath);
            // IList<String> ciudades = File.ReadAllLines(filePath);

            //IList<String> ciudades = new List<String>();
            // Cadena de conexión a la base de datos
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=dbweb1;Integrated Security=True;";

            // Instanciar la clase DBConection del proyecto de datos
            ProjectDatos.DBConection dbConnection = new ProjectDatos.DBConection();

            // Obtener las ciudades utilizando el método GetCiudades() del proyecto de datos
            List<string> ciudades = dbConnection.GetCiudades(connectionString);


            return ciudades;
        }


    }
}
