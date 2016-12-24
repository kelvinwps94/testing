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
    public partial class DriverHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


            txtEmail.Text = Request.QueryString["Email"].ToString();


            SqlConnection connect;
            string connStr = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
            connect = new SqlConnection(connStr);
            connect.Open();


            
            
            string strSelect = "Select Name From Driver where Email = '" + txtEmail.Text + "'";

            SqlCommand cmdSelect = new SqlCommand(strSelect, connect);
            SqlDataReader dtr = cmdSelect.ExecuteReader();

            if (dtr.Read())
            {
                string name = dtr["Name"].ToString();
                lblWelcome.Text = "Welcome, " + name;
            }
            dtr.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/DriverPickup.aspx?Email=" + txtEmail.Text);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/DriverReservation.aspx?Email=" + txtEmail.Text);
        }

    }
}