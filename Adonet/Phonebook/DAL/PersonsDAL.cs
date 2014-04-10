using Phonebook.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Phonebook.DAL
{
    public class PersonsDAL
    {
        //method that returns list of persons
        public static List<Person> GetPersons()
        {
            // create empty list which we'll populate width persons
            List<Person> persons = new List<Person>();

            // use ConfigurationManager class to read connection string from Web.config file
            string CS = ConfigurationManager.ConnectionStrings["PhonebookConnectionString"].ConnectionString;

            // create new SQLConnection Object
            using (SqlConnection con = new SqlConnection(CS))   
            {
                //Create new SqlCommand object.
                SqlCommand cmd = new SqlCommand("Select * from Persons", con);
                con.Open();

                // Create new SqlDataReader object by invoking ExecuteReader method.
                SqlDataReader rdr = cmd.ExecuteReader();
                
                // as long as there are more records to read Read == true
                while (rdr.Read())
                {
                    Person p = new Person();
                    p.PersonID = Convert.ToInt32(rdr["PersonID"]);
                    p.FirstName = rdr["FirstName"].ToString();
                    p.LastName = rdr["LastName"].ToString();

                    // populate list
                    persons.Add(p);
                }
            }
            return persons;
        }

        // I'll give you person Id you return me persons data
        public static Person GetPerson(int pID)
        {
            string CS = ConfigurationManager.ConnectionStrings["PhonebookConnectionString"].ConnectionString;
            
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select * from Persons where PersonID=@PersonID", con);
                cmd.Parameters.Add(new SqlParameter("@PersonID", pID));
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();

                Person p = new Person();
                p.PersonID = Convert.ToInt32(rdr["PersonID"]);
                p.FirstName = rdr["FirstName"].ToString();
                p.LastName = rdr["LastName"].ToString();

                return p;
            }
        }

        //Update person method
        public static void UpdatePerson (Person p)
        {
            string CS = ConfigurationManager.ConnectionStrings["PhonebookConnectionString"].ConnectionString;
            
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Update Persons set FirstName=@FirstName, LastName=@LastName where PersonID=@PersonID", con);
                cmd.Parameters.Add(new SqlParameter("@PersonID", p.PersonID));
                cmd.Parameters.Add(new SqlParameter("@FirstName", p.FirstName));
                cmd.Parameters.Add(new SqlParameter("@LastName", p.LastName));

                con.Open();
                cmd.ExecuteNonQuery();
            }

        }

        // Insert person method
        public static void InsertPerson(Person p)
        {
            string CS = ConfigurationManager.ConnectionStrings["PhonebookConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Insert into Persons (FirstName, LastName) values (@FirstName, @LastName)",con);
                cmd.Parameters.Add(new SqlParameter("@FirstName", p.FirstName));
                cmd.Parameters.Add(new SqlParameter("@LastName", p.LastName));
                
                con.Open();
                var n = cmd.ExecuteNonQuery();
            }
        }

        public static void DeletePerson(int pID)
        {
            string CS = ConfigurationManager.ConnectionStrings["PhonebookConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Delete from Persons where PersonID=@PersonID", con);
                cmd.Parameters.Add(new SqlParameter("@PersonID", pID));
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}