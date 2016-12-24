using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace EzCabAssignment
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = Request.QueryString["Email"].ToString();
            lblWelcome.Text = "Welcome, " + txtEmail.Text;
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AdminPickup.aspx?Email=" + txtEmail.Text);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AdminReport.aspx?Email=" + txtEmail.Text);
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AdminDriverManagement.aspx?Email=" + txtEmail.Text);
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AdminSendPromoCode.aspx?Email=" + txtEmail.Text);
        }
    }
}