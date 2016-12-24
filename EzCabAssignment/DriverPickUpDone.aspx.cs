using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EzCabAssignment
{
    public partial class DriverPickUpDone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = Request.QueryString["Email"].ToString();
        }

        protected void brnClose_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/DriverHome.aspx?Email=" + txtEmail.Text);
        }

        protected void btnAgain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DriverPickUp.aspx?Email=" + txtEmail.Text);
        }
    }
}