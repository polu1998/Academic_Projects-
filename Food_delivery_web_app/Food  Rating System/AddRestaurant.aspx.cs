using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_App
{
    public partial class AddRestaurant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Food;Integrated Security=True;Pooling=False";
                using (SqlCommand cmd = new SqlCommand())
                {
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    cmd.CommandText = "INSERT INTO restaurant (Name, Cuisine, Location) VALUES (@name, @cuisine, @location)";
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@cuisine", txtCuisine.Text);
                    cmd.Parameters.AddWithValue("@location", txtLocation.Text);
                    //adapter.InsertCommand = new SqlCommand
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    /*if (reader.Read())
                    {
                        //Response.Redirect("AdminOptions.aspx");
                        Label1.Text = "Valid";
                    }
                    else
                    {
                        Label1.Text = "Enter valid username and password";
                    }*/
                    //cmd.EndExecuteNonQuery();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOptions.aspx");
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}