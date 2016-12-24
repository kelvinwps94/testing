using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace EzCabAssignment
{
    public partial class CustomerReserve : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          // lblEmail.Text = Request.QueryString["Email"].ToString();
            string id = string.Empty;
            if (PreviousPage != null)
            {
                TextBox email = PreviousPage.FindControl("txtEmail") as TextBox;
                if (email != null)
                    TextBox2.Text = email.Text;

                //1) can get member id here and put into a label
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();

                string  strSelect = "Select memberID from members where email ='" + TextBox2.Text + "'";

                SqlCommand  cmdSelect = new SqlCommand(strSelect, con);
                SqlDataReader  dtrEmp = cmdSelect.ExecuteReader();

                if (dtrEmp.HasRows)
                {
                    dtrEmp.Read();

                    id = dtrEmp["memberID"].ToString();
                    con.Close();
                }
                Label2.Text = id;
            }
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
             
            }
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {


            if (Calendar1.Visible == false)
            {
                Calendar1.Visible = true;
            }
            else
            {
                Calendar1.Visible = false;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            TextBox1.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy");
            Calendar1.Visible = false;

        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.CompareTo(DateTime.Today) < 0)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void MyListDataBound(object sender, EventArgs e)
        {
            DropDownList2.Items.Insert(0, new ListItem("", ""));
            DropDownList3.Items.Insert(0, new ListItem("", ""));
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label1.Text = ""; 
            //Label2.Text = "";
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select * from route where depart=@depart and destination=@destination";


            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@depart", DropDownList2.SelectedValue.ToString());
            cmdSelect.Parameters.AddWithValue("@destination", DropDownList3.SelectedValue.ToString());

            SqlDataReader dtrEmp = cmdSelect.ExecuteReader();

            if (dtrEmp.HasRows)
            {
                dtrEmp.Read();
                Label1.Text = dtrEmp["distance"].ToString();
                con.Close();

            }
            else
            {
            }
            con.Close();





        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (DropDownList2.SelectedIndex == 0)
            {
                DropDownList3.Items.Clear();
                DropDownList3.Items.Insert(0, new ListItem("", ""));
                Label1.Text = "";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == "" || DropDownList3.SelectedValue == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Please Select Your Pick Up Location.');", true);
            }
            else
            {
                book();

            }

        }

        private void book()
        {
            string date = TextBox1.Text;


            if (date.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Please Select Your Pick Up Date.');", true);
            }
            else
            {

                DateTime test = DateTime.ParseExact(date, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                DateTime dt;
                DateTime startTime = DateTime.Now;
                TimeSpan span;
                int days;
                double hour;

                if (DropDownList6.SelectedIndex == 0)
                {
                    System.Threading.Thread.Sleep(3000);

                    dt = DateTime.Parse(DropDownList4.SelectedValue + ":" + DropDownList5.SelectedValue
                             + ":00 AM");

                    span = test.AddDays(1).Subtract(startTime);
                    days = (int)span.TotalDays;

                    if (days == 0)
                    {
                        span = dt.Subtract(startTime);
                        hour = (double)span.Hours;

                        if (hour < 2)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Sorry. You can only reserve taxi for 2 hours in advanced.');", true);
                        }

                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Reservation Available. Click next to Select Taxi.');", true);
                            Button3.Enabled = true;
                        }
                    }
                    else if (days > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Reservation Available. Click next to Select Taxi.');", true);
                        Button3.Enabled = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Sorry bro, error.');", true);
                    }
                }
                if (DropDownList6.SelectedIndex == 1)
                {

                    System.Threading.Thread.Sleep(3000);

                    dt = DateTime.Parse(DropDownList4.SelectedValue + ":" + DropDownList5.SelectedValue
                              + ":00 PM");
                    span = test.AddDays(1).Subtract(startTime);
                    days = (int)span.TotalDays;

                    if (days == 0)
                    {
                        span = dt.Subtract(startTime);
                        hour = (double)span.Hours;

                        if (hour < 2)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Sorry. You can only reserve taxi for 2 hours in advanced.');", true);
                        }

                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Reservation Available. Click next to Select Taxi.');", true);
                            Button3.Enabled = true;
                        }
                    }
                    else if (days > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Reservation Available. Click next to Select Taxi.');", true);
                        Button3.Enabled = true;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Sorry bro, error.');", true);
                    }

                }
            }
        }
    
    }
}
