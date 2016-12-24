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
    public partial class CustomerPayment : System.Web.UI.Page
    {
        //Variable Declaration
        float Total = 0;
        float EstimatedDistanceKm = 0;
        int routeID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null)
            {
                Label reserve = PreviousPage.FindControl("Label3") as Label;
                Label1.Text = reserve.Text;

                //--START OF RETRIEVE ROUTE ID
                /*Step 1: Create and Open Connection*/
                SqlConnection connect;
                string connStr = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
                connect = new SqlConnection(connStr);
                connect.Open();
                /*Step2 : SQL Command object to retrieve data from Reservation table*/
                string strSelect;
                SqlCommand cmdSelect;
                strSelect = "Select * From Reservation where ReservationID = @ReservationID";
                cmdSelect = new SqlCommand(strSelect, connect);
                cmdSelect.Parameters.AddWithValue("@ReservationID", Label1.Text);
                /*Step 3: Execute command to retrieve data*/
                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();
                /*Step 4: Retrieve route ID*/
                if (dtr.Read())
                {
                    routeID = int.Parse(dtr["routeID"].ToString());
                }
                dtr.Close();
                //--END OF RETRIEVE ROUTE ID


                //--START OF RETRIEVE ESTIMATED DISTANCE AND CALCULATE TOTAL RIDE FARE
                /*Step 1 : SQL Command object to retrieve data from Route table*/
                string strSelect2;
                SqlCommand cmdSelect2;
                strSelect2 = "Select * From Route where RouteID = @RouteID";
                cmdSelect2 = new SqlCommand(strSelect2, connect);
                cmdSelect2.Parameters.AddWithValue("@RouteID", routeID);
                /*Step 2: Execute command to retrieve data*/
                SqlDataReader dtr2;
                dtr2 = cmdSelect2.ExecuteReader();
                /*Step 3: Retrieve the estimated distance and calculate the total ride fare*/
                if (dtr2.Read())
                {
                    EstimatedDistanceKm = float.Parse(dtr2["distance"].ToString(), System.Globalization.CultureInfo.InvariantCulture);
                }
                //Calculation for Total Ride Fare is RM1 per kilometer
                Total = 1 * EstimatedDistanceKm;
                /*Step 4: Close SqlReader and Database connection*/
                connect.Close();
                dtr2.Close();
                //--END OF RETRIEVE ESTIMATED DISTANCE AND CALCULATE TOTAL RIDE FARE


                //Display Total Ride Fare
                lblFare.Text = "RM" + Total.ToString("0.00");

                //Create the cookie object for payment(Purpose: to pass value to next page).
                HttpCookie cookie = new HttpCookie("CookiePayment");
                // Add reservation ID
                cookie["ReservationID"] = Label1.Text;
                // Add total ride fare
                cookie["TotalRideFare"] = Total.ToString("0.00");
                // Add it to the current web response.
                Response.Cookies.Add(cookie);
                // This cookie lives for 1 days.
                cookie.Expires = DateTime.Now.AddDays(1);
            }
        }

    }
}