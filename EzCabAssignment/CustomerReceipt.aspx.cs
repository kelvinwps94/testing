using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization; //Use for float purpose
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;

namespace EzCabAssignment
{
    public partial class CustomerReceipt : System.Web.UI.Page
    {
        //Variable Declaration
        int paymentID = 0;
        int driverID = 0;
        int reservationID = 0;
        int customerID = 0;
        string resID = null;
        string TotalRideFare = null;
        string date = null;
        string time = null;
        string carPlateNumber = null;
        string driverName = null;
        string customerName = null;
        string customerEmail = null;
        string driverPhoneNumber = null;
        float totalRideFare = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            //Request existing cookie
            HttpCookie cookie = Request.Cookies["CookiePayment"];
            //Check to see whether a cookie was found.
            if (cookie != null)
            {
                resID = cookie["ReservationID"];
                TotalRideFare = cookie["TotalRideFare"];
            }


            //Prevent user to refresh the page and duplicate the information
            /*Step 1: Create and Open Connection*/
            SqlConnection connect;
            string connStr = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
            connect = new SqlConnection(connStr);
            connect.Open();
            /*Step2 : SQL Command object to retrieve data from Payment table*/
            string strSelect2;
            SqlCommand cmdSelect2;
            strSelect2 = "Select * from Payment";
            cmdSelect2 = new SqlCommand(strSelect2, connect);
            /*Step 3: Execute command to retrieve data*/
            SqlDataReader dtr2;
            dtr2 = cmdSelect2.ExecuteReader();
            /*Step 4: Retrieve the estimated distance and calculate the total ride fare*/
            int reservationID2 = 0;
            if (dtr2.Read())
            {
                reservationID2 = int.Parse(dtr2["reservationID"].ToString());
            }
            //Prevent duplicate so terminate it
            if (int.Parse(resID) == reservationID2)
            {
                connect.Close();
                dtr2.Close();
            }
            //No existing record found so create it
            else
            {
                dtr2.Close();

                //A//--START OF SQL INSERT FOR PAYMENT--
                /*Step 1: Create Sql Insert statement and Sql Insert Object*/
                string strInsert;
                SqlCommand cmdInsert;
                strInsert = "Insert Into Payment (ReservationID, TotalRideFare, PaymentDate, PaymentTime ) Values (@ReservationID, @TotalRideFare, @PaymentDate, @PaymentTime )";
                cmdInsert = new SqlCommand(strInsert, connect);
                reservationID = int.Parse(resID);
                totalRideFare = float.Parse(TotalRideFare, CultureInfo.InvariantCulture.NumberFormat);
                date = DateTime.Now.ToShortDateString();
                time = DateTime.Now.ToShortTimeString();
                cmdInsert.Parameters.AddWithValue("@ReservationID", reservationID);
                cmdInsert.Parameters.AddWithValue("@TotalRideFare", totalRideFare);
                cmdInsert.Parameters.AddWithValue("@PaymentDate", date);
                cmdInsert.Parameters.AddWithValue("@PaymentTime", time);
                /*Step 2: Execute command to insert*/
                int n = cmdInsert.ExecuteNonQuery();
                //A//--END OF SQL INSERT FOR PAYMENT--


                //B//--START OF SQL SEARCHING PAYMENT ID FROM PAYMENT--
                /*Step 1 : SQL Command object to retrieve data from Reservation table*/
                string strSelect;
                SqlCommand cmdSelect;
                strSelect = "Select * from Payment where ReservationID = @ReservationID";
                cmdSelect = new SqlCommand(strSelect, connect);
                cmdSelect.Parameters.AddWithValue("@ReservationID", reservationID);
                /*Step 2: Execute command to retrieve data*/
                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();
                /*Step 3: Retrieve payment ID*/
                if (dtr.Read())
                {
                    paymentID = int.Parse(dtr["PaymentID"].ToString());
                }
                /*Step 4: Close SqlReader connection*/
                dtr.Close();
                //B//--END OF SQL SEARCHING PAYMENT ID FROM PAYMENT--


                //C//--START OF SQL SEARCHING DRIVER ID FROM RESERVATION--
                /*Step 1 : SQL Command object to retrieve data from Reservation table*/
                string strSelect3;
                SqlCommand cmdSelect3;
                strSelect3 = "Select * from Reservation where ReservationID = @ReservationID";
                cmdSelect3 = new SqlCommand(strSelect3, connect);
                cmdSelect3.Parameters.AddWithValue("@ReservationID", resID);
                /*Step 2: Execute command to retrieve data*/
                SqlDataReader dtr3;
                dtr3 = cmdSelect3.ExecuteReader();
                /*Step 3: Retrieve driver ID*/
                if (dtr3.Read())
                {
                    driverID = int.Parse(dtr3["driverID"].ToString());
                }
                /*Step 4: Close SqlReader*/
                dtr3.Close();
                //C//--END OF SQL SEARCHING DRIVER ID FROM RESERVATION--


                //D//--START OF SQL SEARCHING INFORMATION FROM RESERVATION--
                /*Step 1 : SQL Command object to retrieve data from Payment table*/
                string strSelect4;
                SqlCommand cmdSelect4;
                strSelect4 = "Select * from Driver where DriverID = @DriverID";
                cmdSelect4 = new SqlCommand(strSelect4, connect);
                cmdSelect4.Parameters.AddWithValue("@DriverID", driverID);
                /*Step 2: Execute command to retrieve data*/
                SqlDataReader dtr4;
                dtr4 = cmdSelect4.ExecuteReader();
                /*Step 3: Retrieve information*/
                if (dtr4.Read())
                {
                    driverName = dtr4["Name"].ToString();
                    carPlateNumber = dtr4["CarPlateNo"].ToString();
                    driverPhoneNumber = dtr4["ContactNo"].ToString();
                }
                /*Step 4: Close SqlReader*/
                dtr4.Close();
                //D//--END OF SQL SEARCHING INFORMATION FROM RESERVATION--


                //E//--START OF SQL SEARCHING CUSTOMER ID FROM RESERVATION--
                /*Step1 : SQL Command object to retrieve data from Reservation table*/
                string strSelect5;
                SqlCommand cmdSelect5;
                strSelect5 = "Select * from Reservation where ReservationID = @ReservationID";
                cmdSelect5 = new SqlCommand(strSelect5, connect);
                cmdSelect5.Parameters.AddWithValue("@ReservationID", resID);
                /*Step 2: Execute command to retrieve data*/
                SqlDataReader dtr5;
                dtr5 = cmdSelect5.ExecuteReader();
                /*Step 3: Retrieve customer ID*/
                if (dtr5.Read())
                {
                    customerID = int.Parse(dtr5["memberID"].ToString());
                }
                /*Step 4: Close SqlReader*/
                dtr5.Close();
                //E//--END OF SQL SEARCHING CUSTOMER ID FROM RESERVATION--


                //F//--START OF SQL SEARCHING CUSTOMER NAME FROM CUSTOMER--
                /*Step 1 : SQL Command object to retrieve data from Customer table*/
                string strSelect6;
                SqlCommand cmdSelect6;
                strSelect6 = "Select * from Members where memberID = @memberID";
                cmdSelect6 = new SqlCommand(strSelect6, connect);
                cmdSelect6.Parameters.AddWithValue("@memberID", customerID);
                /*Step 2: Execute command to retrieve data*/
                SqlDataReader dtr6;
                dtr6 = cmdSelect6.ExecuteReader();
                /*Step 3: Retrieve customer name*/
                if (dtr6.Read())
                {
                    customerName = dtr6["Name"].ToString();
                    customerEmail = dtr6["Email"].ToString();
                }
                /*Step 4: Close SqlReadern*/
                dtr6.Close();
                //F//--END OF SQL SEARCHING CUSTOMER NAME FROM CUSTOMER--


                //Display all the labels
                lblID.Text = "PMT" + paymentID;
                lblResID.Text = "RSV" + resID;
                lblTotal.Text = "RM" + TotalRideFare;
                lblDate.Text = date;
                lblTime.Text = time;
                lblDriverPhoneNumber.Text = driverPhoneNumber;
                lblCustName.Text = customerName;
                lblDriverName.Text = driverName;
                lblCarPlateNo.Text = carPlateNumber;

                //After finish everything, the cookie became expired.
                cookie.Expires = DateTime.Now.AddDays(-1);

                //Send Mail
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("EzCabServices11@gmail.com");
                mail.To.Add(customerEmail);
                mail.Subject = "Your EzCab Reservation";
                mail.Body += " <html>";

                mail.Body += "<body>";

                mail.Body += "<table>";

                mail.Body += "<tr>";
                mail.Body += "<td>Dear " + customerName + ",</td>";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>You've made a reservation with EzCab.</td>";
                mail.Body += "</tr>";

                mail.Body += "<br/><tr>";
                mail.Body += "<td>----------------------------------------------";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>Driver Name : " + driverName + "</td>";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>Plate Number : " + carPlateNumber + "</td>";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>Driver Contact Number : " + driverPhoneNumber + "</td>";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>----------------------------------------------";
                mail.Body += "</tr>";

                mail.Body += "<br/><tr>";
                mail.Body += "<td>Thank you for use our services.</td>";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>EzCab</td>";
                mail.Body += "</tr>";

                mail.Body += "</table>";
                mail.Body += "</body>";
                mail.Body += "</html>";
                mail.IsBodyHtml = true;
                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("EzCabServices11@gmail.com", "ezcabservices12345678");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
            }

            
        }

    }
}