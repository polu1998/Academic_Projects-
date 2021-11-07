using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_App
{
    public partial class RestaurantView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int counter;
            if (!IsPostBack)
            {
              
                if (Session["count"] == null)
                    counter = 1;
                else
                    counter = (int)Session["count"];
                Session["count"] = counter + 1;
                Label1.Text = "Restaurant View Count: " + counter.ToString();
            }
            

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOptions.aspx");
        }
    }
}