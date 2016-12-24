using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace EzCabAssignment
{
    public partial class CustomerReserveTaxi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {

                DropDownList depart = PreviousPage.FindControl("DropDownList2") as DropDownList;
                DropDownList destination = PreviousPage.FindControl("DropDownList3") as DropDownList;
                Label distance = PreviousPage.FindControl("Label1") as Label;
                Label duration = PreviousPage.FindControl("Label3") as Label;
                TextBox email = PreviousPage.FindControl("TextBox2") as TextBox;
                txtEmail.Text = email.Text;
                Label member = PreviousPage.FindControl("lblEmail") as Label;

                TextBox date = PreviousPage.FindControl("TextBox1") as TextBox;
                DropDownList time1 = PreviousPage.FindControl("DropDownList4") as DropDownList;
                DropDownList time2 = PreviousPage.FindControl("DropDownList5") as DropDownList;
                DropDownList time3 = PreviousPage.FindControl("DropDownList6") as DropDownList;

                Label2.Text = depart.SelectedValue;
                Label3.Text = destination.SelectedValue;
                Label4.Text = date.Text;
                Label5.Text = time1.SelectedValue + ":" + time2.SelectedValue + " " + time3.SelectedValue;
                Label6.Text = distance.Text + " KM";

                Label9.Text = time1.SelectedValue;
                Label10.Text = time2.SelectedValue;
                Label12.Text = time1.SelectedValue + "." + time2.SelectedValue;

                GridView1.Load += GridView1_Load;
            }

        }

        private void GridView1_Load(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count == 0)
            {
                Label7.Text = "Sorry currently no taxi available.Please go back and select other date/time.";
                btnConfirm.Enabled = false;
            }

        }

        public void OnConfirm(object sender, EventArgs e)
        {
            GridViewRow row;


            double b = double.Parse(Label12.Text, CultureInfo.InvariantCulture);
            string id = "0";
            string route;
            string car;
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Confirm")
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You have confirmed your reservation.')", true);

                row = GridView1.SelectedRow;

                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();

                string strSelect = "Select routeID from route where depart ='" + Label2.Text + "' and destination ='" + Label3.Text + "'";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                SqlDataReader dtrEmp = cmdSelect.ExecuteReader();


                if (dtrEmp.HasRows)
                {
                    dtrEmp.Read();

                    route = dtrEmp["routeID"].ToString();
                    con.Close();

                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        RadioButton rb = (GridView1.Rows[i].FindControl("button")) as RadioButton;
                        if (rb.Checked == false)
                        {
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a taxi.')", true);
                        }
                        if (rb.Checked == true)
                        {
                            con = new SqlConnection(strCon);
                            con.Open();

                            strSelect = "Select memberID from members where email ='" + txtEmail.Text + "'";

                            cmdSelect = new SqlCommand(strSelect, con);
                            dtrEmp = cmdSelect.ExecuteReader();


                            if (dtrEmp.HasRows)
                            {
                                dtrEmp.Read();

                                id = dtrEmp["memberID"].ToString();
                                con.Close();


                                con = new SqlConnection(strCon);
                                con.Open();

                                car = GridView1.Rows[i].Cells[1].Text;

                                string strInsert = "Insert Into reservation (driverID, memberID, routeID, reservationDate) Values (@driverID, @memberID,@routeID, @reservationDate)";

                                SqlCommand cmdInsert;
                                cmdInsert = new SqlCommand(strInsert, con);


                                cmdInsert.Parameters.AddWithValue("@driverID", Int32.Parse(GridView1.Rows[i].Cells[1].Text)); // Int32.Parse(Label13.Text)
                                cmdInsert.Parameters.AddWithValue("@memberID", id);
                                cmdInsert.Parameters.AddWithValue("@routeID", route);
                                cmdInsert.Parameters.AddWithValue("@reservationDate", System.DateTime.Now.ToShortDateString());


                                int intInsertStatus = cmdInsert.ExecuteNonQuery();
                                con.Close();


                                con = new SqlConnection(strCon);
                                con.Open();
                                strInsert = "insert into schedule (driverid, date, pickup) values(@driverid, @date, @pickup)";

                                cmdInsert = new SqlCommand(strInsert, con);

                                cmdInsert.Parameters.AddWithValue("@driverid", Int32.Parse(GridView1.Rows[i].Cells[1].Text));
                                cmdInsert.Parameters.AddWithValue("@date", Label4.Text);
                                cmdInsert.Parameters.AddWithValue("@pickup", Label12.Text);
                                intInsertStatus = cmdInsert.ExecuteNonQuery();

                                con.Close();

                                con = new SqlConnection(strCon);
                                con.Open();

                                strSelect = "Select reservationID from reservation where driverID= " + car + " and memberID=" + id + " and routeID=" + route;

                                cmdSelect = new SqlCommand(strSelect, con);
                                dtrEmp = cmdSelect.ExecuteReader();


                                if (dtrEmp.HasRows)
                                {
                                    dtrEmp.Read();

                                    Label13.Text = dtrEmp["reservationID"].ToString();
                                    con.Close();

                                }
                            }

                        }

                        con.Close();
                    }
                    Server.Transfer("~/CustomerReserveConfirm.aspx?memberid=" + id);
                    //Response.Redirect("~/Confirm.aspx");

                }
                else
                {
                    //   this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
                }
            }


        }


    }
}