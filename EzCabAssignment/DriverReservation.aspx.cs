using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace EzCabAssignment
{
    public partial class DriverReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            string strConn = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
            conn = new SqlConnection(strConn);
            conn.Open();

            string sqlTrunc = "TRUNCATE TABLE ReservationView";
            SqlCommand cmd = new SqlCommand(sqlTrunc, conn);
            cmd.ExecuteNonQuery();


            txtEmail.Text = Request.QueryString["Email"].ToString();
            fillGrid();

            conn.Close();
            
        }

        protected void fillGrid()
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string strSelect1 = "Select * from Driver where Email=@Email";
            SqlCommand cmdSelect = new SqlCommand(strSelect1, con);
            cmdSelect.Parameters.AddWithValue("@Email", txtEmail.Text);
            SqlDataReader dtrEmp = cmdSelect.ExecuteReader();
            while (dtrEmp.Read())
            {


                SqlConnection con2;
                string strCon2 = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
                con2 = new SqlConnection(strCon2);
                con2.Open();

                string strSelect2 = "Select * from Reservation where driverID=@driverID";
                SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con2);
                cmdSelect2.Parameters.AddWithValue("@driverID", dtrEmp["driverID"].ToString());
                SqlDataReader dtrEmp2 = cmdSelect2.ExecuteReader();
                while (dtrEmp2.Read())
                {
   

                    SqlConnection con3;
                    string strCon3 = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
                    con3 = new SqlConnection(strCon3);
                    con3.Open();

                    string strSelect3 = "Select * from Members where memberID=@memberID";
                    SqlCommand cmdSelect3 = new SqlCommand(strSelect3, con3);
                    cmdSelect3.Parameters.AddWithValue("@memberID", dtrEmp2["memberID"].ToString());
                    SqlDataReader dtrEmp3 = cmdSelect3.ExecuteReader();
                    while (dtrEmp3.Read())
                    {




                        SqlConnection con4;
                        string strCon4 = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
                        con4 = new SqlConnection(strCon4);
                        con4.Open();

                        string strSelect4 = "Select * from Route where routeID=@routeID";
                        SqlCommand cmdSelect4 = new SqlCommand(strSelect4, con4);
                        cmdSelect4.Parameters.AddWithValue("@routeID", dtrEmp2["routeID"].ToString());
                        SqlDataReader dtrEmp4 = cmdSelect4.ExecuteReader();
                        while (dtrEmp4.Read())
                        {


                            SqlConnection con5;
                            string strCon5 = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
                            con5 = new SqlConnection(strCon5);
                            con5.Open();

                            string strInsert = "Insert Into ReservationView (driverName, memberName, memberContact, memberEmail, routeDepart, routeDestination, reservationDate) Values (@driverName, @memberName, @memberContact, @memberEmail, @routeDepart, @routeDestination, @reservationDate)";
                            SqlCommand cmdInsert;
                            cmdInsert = new SqlCommand(strInsert, con5);

                            cmdInsert.Parameters.AddWithValue("@driverName", dtrEmp["Name"].ToString());
                            cmdInsert.Parameters.AddWithValue("@memberName", dtrEmp3["Name"].ToString());
                            cmdInsert.Parameters.AddWithValue("@memberContact", dtrEmp3["MobileNo"].ToString());
                            cmdInsert.Parameters.AddWithValue("@memberEmail", dtrEmp3["Email"].ToString());
                            cmdInsert.Parameters.AddWithValue("@routeDepart", dtrEmp4["depart"].ToString());
                            cmdInsert.Parameters.AddWithValue("@routeDestination", dtrEmp4["destination"].ToString());
                            cmdInsert.Parameters.AddWithValue("@reservationDate", dtrEmp2["reservationDate"].ToString());

                            int intInsertStatus = cmdInsert.ExecuteNonQuery();

                            
                            
                        }

                    }

                }
                
            }
            
  


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/DriverHome.aspx?Email=" + txtEmail.Text);
        }


    }
}