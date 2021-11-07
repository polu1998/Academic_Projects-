using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_App
{
    public partial class UserOption : System.Web.UI.Page
    {
        HttpCookie cookie;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlRatings.Items.Add("1");
                ddlRatings.Items.Add("2");
                ddlRatings.Items.Add("3");
                ddlRatings.Items.Add("4");
                ddlRatings.Items.Add("5");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Food;Integrated Security=True;Pooling=False";
                using (SqlCommand cmd = new SqlCommand())
                {   //searching using all paarametrs
                    cmd.CommandText = "SELECT * FROM restaurant WHERE Name=@search OR Cuisine = @search OR Location = @search ";
                    cmd.Parameters.AddWithValue("@search", txtSearch.Text);
                    cmd.Connection = con;
                    
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds, "restaurant");
                    ddlRest.DataSource = ds;
                    ddlRest.DataTextField = "Name";
                    this.DataBind();
                    ddlRest.Visible = true;
                    Label1.Visible = true;
                    Label2.Visible = true;
                    Label4.Visible = true;
                    ddlRatings.Visible = true;
                    txtComment.Visible = true;
                    btnAdd.Visible = true;
                }
            }
            gvRestaurant.DataSource = ds;
            gvRestaurant.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Food;Integrated Security=True;Pooling=False";
                using (SqlCommand cmd = new SqlCommand())
                {  //inserting unapproved comments 
                    cmd.CommandText = "INSERT INTO feedback (Name, ratings, comments) VALUES (@name, @rate, @comment)";
                    cmd.Parameters.AddWithValue("@name", ddlRest.SelectedValue);
                    cmd.Parameters.AddWithValue("@rate", ddlRatings.SelectedValue );
                    cmd.Parameters.AddWithValue("@comment", txtComment.Text);
                    cmd.Connection = con;
                   
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ddlRest.Visible = false;
                    
                    ddlRatings.Visible = false;
                    txtComment.Visible = false;
                    
                    Label1.Visible = false;
                    Label2.Visible = false;
                    ddlRatings.Visible = false;
                    txtComment.Visible = false;
                    btnAdd.Visible = false;
                }
            }
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}