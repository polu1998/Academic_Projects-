using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_App
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        
        protected void Page__PreInit(object sender, EventArgs e)
        {
            //Page.Theme=Session["theme"].ToString();
            string theme = (string)Session["theme"];
            if (theme != null && theme.Length != 0)
            {
                Page.Theme = theme;
                ddlTheme.Text = theme;
            }
            else
                Page.Theme = "Dark";

            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlTheme.Items.Add("Dark");
            ddlTheme.Items.Add("Light");
        }

        protected void adminBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

        protected void userBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*Session["theme"] = ddlTheme.SelectedItem.Text;
            Response.Redirect("Login.aspx");*/
            Session["theme"]=ddlTheme.SelectedItem.Value;
            Server.Transfer(Request.FilePath);






        }
    }
}