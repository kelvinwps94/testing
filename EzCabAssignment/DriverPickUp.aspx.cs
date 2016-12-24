using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Timers;


namespace EzCabAssignment
{
    public partial class DriverPickUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = Request.QueryString["Email"].ToString();

            lblDate.Text = DateTime.Now.ToLongDateString();


            SqlConnection conPickUp;
            string connStr = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
            conPickUp = new SqlConnection(connStr);
            conPickUp.Open();
            string strSelect2 = "Select * from Driver WHERE Email = '" + txtEmail.Text + "'";
            SqlCommand cmdSelect2 = new SqlCommand(strSelect2, conPickUp);
            SqlDataReader dtr2;
            dtr2 = cmdSelect2.ExecuteReader();

            if (dtr2.Read())
            {
                string name = dtr2["Name"].ToString();
                txtName.Text = name;

                string carPlate = dtr2["CarPlateNo"].ToString();
                txtTaxi.Text = carPlate;
            }
            dtr2.Close();
        }

        protected void btnPrice_Click(object sender, EventArgs e)
        {
            txtPrice.Text = "";

            SqlConnection conPickUp;
            string connStr = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
            conPickUp = new SqlConnection(connStr);
            conPickUp.Open();

            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "Select distance From dbo.Route WHERE depart ='" + ddlDeparture.Text + "' and destination = '" + ddlArrival.Text + "'";
            cmdSelect = new SqlCommand(strSelect, conPickUp);

            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    txtPrice.Text = String.Format("{0:#.00}", dtr["distance"]);
                    lblError.Text = "";

                }
            }
            else
            {
                lblError.Text = "Sorry there is not such route please try another route";
            }


            




            conPickUp.Close();
            dtr.Close();
        }


        protected void btnDone_Click(object sender, EventArgs e)
        {
            linqDataContext dc = new linqDataContext();
            PickUp tc = new PickUp();

            tc.TaxiNo = txtTaxi.Text;
            tc.Depart = ddlDeparture.SelectedValue;
            tc.Arrival = ddlArrival.SelectedValue;
            tc.Price = Convert.ToDouble(txtPrice.Text);
            tc.DriverName = txtName.Text;

            tc.startTime = lblStart.Text;
            tc.endTime = lblEnd.Text;
            tc.Date = Convert.ToDateTime(lblDate.Text);


            dc.PickUps.InsertOnSubmit(tc);
            dc.SubmitChanges();

            Response.Redirect("DriverPickUpDone.aspx?Email=" + txtEmail.Text);

            
        }

        protected void btnEnd_Click(object sender, EventArgs e)
        {

            lblEnd.Text = DateTime.Now.ToLongTimeString();
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {

            lblStart.Text = DateTime.Now.ToLongTimeString();

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/DriverHome.aspx?Email=" + txtEmail.Text);
        }
    }
}