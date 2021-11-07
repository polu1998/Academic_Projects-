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
    public partial class AdminOptions : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection();
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Food;Integrated Security=True;Pooling=False";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "SELECT * FROM restaurant";
                        cmd.Connection = con;
                        //con.Open();
                        //SqlDataReader reader = cmd.ExecuteReader();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        adapter.Fill(ds, "restaurant");
                        ddlRestList.DataSource = ds;
                        ddlRestList.DataTextField = "Name";
                        ddlRestList.DataBind();
                    }
                }
            }
        }

        protected void btnAddNewRestaurant_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddRestaurant.aspx");
        }

        protected void btnViewRestaurant_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantView.aspx?restaurant=" + ddlRestList.SelectedValue);
        }

        protected void btnVC_Click(object sender, EventArgs e)
        {
            DataSet dsCom = new DataSet();
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Food;Integrated Security=True;Pooling=False";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM feedback";
                    cmd.Connection = con;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dsCom, "feedback");
                }
            }
            gvComments.DataSource = dsCom;
            gvComments.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source = (localdb)\mssqllocaldb; Initial Catalog = Food; Integrated Security = True; Pooling = False";
                foreach (GridViewRow gvrow in gvComments.Rows)
                {

                    CheckBox chck = gvrow.FindControl("check") as CheckBox;
                    if (chck.Checked)
                    {
                        string name = gvrow.Cells[0].Text;
                        string rating = gvrow.Cells[1].Text;
                        string comment = gvrow.Cells[2].Text;
                        //deleting comments whhich arent approved by admin
                        SqlCommand cmd1 = new SqlCommand("delete from feedback WHERE Name=@name AND ratings=@rating AND comments=@comment", con);
                        //inserting comments approved to review table
                        SqlCommand cmd2 = new SqlCommand("INSERT INTO reviewtable(Name,ratings,comments) VALUES(@name,@rating,@comment)",   con);
                        cmd1.Parameters.AddWithValue("@name", name);
                        cmd1.Parameters.AddWithValue("@rating", rating);
                        cmd1.Parameters.AddWithValue("@comment", comment);
                        cmd2.Parameters.AddWithValue("@name", name);
                        cmd2.Parameters.AddWithValue("@rating", rating);
                        cmd2.Parameters.AddWithValue("@comment", comment);
                        con.Open();
                        cmd1.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source = (localdb)\mssqllocaldb; Initial Catalog = Food; Integrated Security = True; Pooling = False";
                foreach (GridViewRow gvrow in gvComments.Rows)
                {

                    CheckBox chck = gvrow.FindControl("check") as CheckBox;
                    if (chck.Checked)
                    {
                        string name = gvrow.Cells[0].Text;
                        string rating = gvrow.Cells[1].Text;
                        string comment = gvrow.Cells[2].Text;
                        SqlCommand cmd = new SqlCommand("delete from feedback WHERE Name=@name AND ratings=@rating AND comments=@comment", con);
                        cmd.Parameters.AddWithValue("@name",name);
                        cmd.Parameters.AddWithValue("@rating",rating);
                        cmd.Parameters.AddWithValue("@comment",comment);
                        con.Open();
                        int id = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}