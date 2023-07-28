using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace ProjectDatos
{
    public class DBConection
    {
        public static void Main(String[] args)
        {
            string connectionString = "Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = dbweb1; Integrated Security = True;";

            DBConection db = new DBConection();
            List<string> ciudades = db.GetCiudades(connectionString);

            if (ciudades.Count == 0)
            {
                Console.WriteLine("No hay datos");
                return;
            }

            foreach (string Ciudad in ciudades)
            {
                Console.WriteLine(Ciudad);
            }

            Console.ReadKey();
        }

        public List<string> GetCiudades(string connectionString)
        {
            string consultaSql = "SELECT Ciudad FROM [dbo].[DataCiudad]";

            List<string> ciudades = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(consultaSql, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string Ciudad = reader["Ciudad"].ToString();
                        ciudades.Add(Ciudad);
                    }
                }
            }

            return ciudades;
        }
    }
}
