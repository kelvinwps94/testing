using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EzCabAssignment
{
    public partial class CustomerReserveConfirm : System.Web.UI.Page
    {
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                string idStr = Request.QueryString["memberid"];
                int.TryParse(idStr, out id);
            }
            //if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            if (PreviousPage != null)
            {
                Label reserve = PreviousPage.FindControl("Label13") as Label;
                Label depart = PreviousPage.FindControl("Label2") as Label;
                Label destination = PreviousPage.FindControl("Label3") as Label;

                Label1.Text = depart.Text;
                Label2.Text = destination.Text;
                Label3.Text = reserve.Text;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            int route;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select routeID from route where depart='" + Label1.Text + "' and destination='" + Label2.Text + "'";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            SqlDataReader dtrEmp = cmdSelect.ExecuteReader();


            if (dtrEmp.HasRows)
            {
                dtrEmp.Read();
                route = Int32.Parse(dtrEmp["routeID"].ToString());
                dtrEmp.Close();
                con.Close();


                con = new SqlConnection(strCon);
                con.Open();

                strSelect = "Select * from favourite where routeID=" + route.ToString() + " and memberID=" + id.ToString();

                cmdSelect = new SqlCommand(strSelect, con);
                SqlDataReader dtrEmp1 = cmdSelect.ExecuteReader();


                if (dtrEmp1.HasRows)
                {
                    dtrEmp1.Read();
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('oredy have lah')", true);
                    con.Close();
                }
                else
                {
                    dtrEmp1.Close();
                    string strInsert = "Insert Into favourite (routeID, memberID) Values (@routeID, @memberID)";

                    SqlCommand cmdInsert;
                    cmdInsert = new SqlCommand(strInsert, con);


                    cmdInsert.Parameters.AddWithValue("@routeID", route);
                    cmdInsert.Parameters.AddWithValue("@memberID", id);


                    int intInsertStatus = cmdInsert.ExecuteNonQuery();

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('boleh lah')", true);
                   con.Close();
                }
            } con.Close();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Server.Transfer("~/CustomerPayment.aspx");
        }


    }
}