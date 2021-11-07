using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_App
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.Theme = "Dark";

        }

        //protected voi

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Food;Integrated Security=True;Pooling=False";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM [user] WHERE uname = @uname AND pwd = @pwd";
                    cmd.Parameters.AddWithValue("@uname", tbUserName.Text);
                    cmd.Parameters.AddWithValue("@pwd", tbPwd.Text);
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Response.Redirect("UserOption.aspx");
                    }
                    else
                    {
                        Label1.Text = "Enter valid username and password";
                    }
                }
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}