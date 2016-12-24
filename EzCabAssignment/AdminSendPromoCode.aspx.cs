using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Data;

namespace EzCabAssignment
{
    public partial class AdminSendPromoCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = Request.QueryString["Email"].ToString();

            if (!Page.IsPostBack)
            {
                BindEmpGrid();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AdminHome.aspx?Email=" + txtEmail.Text);
        }

        

        protected void BindEmpGrid()
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select * from Members";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmdSelect);
            adp.Fill(dt);
            grEmp.DataSource = dt;
            grEmp.DataBind();
    }       


        


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select * from promotion where PromoCode=@PromoCode";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@PromoCode", RadioButtonList1.SelectedValue.ToString());

            SqlDataReader dtrEmp = cmdSelect.ExecuteReader();

            if (dtrEmp.Read())
            {
                lblPromotionDesc.Text = dtrEmp["Description"].ToString();
                con.Close();
            }

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select * from promotion where PromoCode=@PromoCode";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@PromoCode", txtCode.Text);
            SqlDataReader dtrEmp2 = cmdSelect.ExecuteReader();

            if (dtrEmp2.Read())
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", "alert('Promotion Code already exists.');", true);
                con.Close();
            }
            else
            {
                SqlConnection con2;
                string strCon2 = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                con2 = new SqlConnection(strCon2);
                con2.Open();

                string strInsert;
                SqlCommand cmdInsert;
                strInsert = "Insert Into Promotion (PromoCode, Description) Values (@PromoCode, @Description)";
                cmdInsert = new SqlCommand(strInsert, con2);

                cmdInsert.Parameters.AddWithValue("@PromoCode", txtCode.Text);
                cmdInsert.Parameters.AddWithValue("@Description", txtDesc.Text);

                cmdInsert.ExecuteNonQuery();
                con2.Close();

                //Response.Redirect("~/AdminHome.aspx?Email=" + txtEmail.Text);
                Response.Redirect("~/AdminSendPromoCode.aspx?Email=" + txtEmail.Text);
            }

 
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select * from promotion where PromoCode=@PromoCode";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@PromoCode", RadioButtonList1.SelectedValue.ToString());

            SqlDataReader dtrEmp3 = cmdSelect.ExecuteReader();

            if (dtrEmp3.Read())
            {
                lblPromotionDesc.Text = dtrEmp3["Description"].ToString();
                con.Close();
            }
        }


        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string empId = string.Empty;
            DataTable dt = new DataTable();
            try
            {
                foreach (GridViewRow row in grEmp.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("chkSelect");

                    if (cb.Checked == true)
                    {
                        if (cb != null && cb.Checked)
                        {
                            //get Current EMAIL_ID from the DataKey
                            empId = Convert.ToString(grEmp.DataKeys[row.RowIndex].Value);
                            SqlCommand cmd = new SqlCommand("select Email from Members where memberID=" + empId + "", con);
                            SqlDataAdapter adp = new SqlDataAdapter(cmd);
                            //Fill datatable with EMAIL_ID corresponding to Current EMP_ID
                            adp.Fill(dt);
                            //Get EMAIL_ID into variable
                            string emailId = dt.Rows[0]["Email"].ToString();
                            //write code to send mail
                            SendEmailUsingGmail(emailId);
                            dt.Clear();
                            dt.Dispose();
                        }
                    }
                }
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Emails sent successfully');", true);
            }
            catch (Exception ex)
            {
                Response.Write("Error occured: " + ex.Message.ToString());
            }
            finally
            {
                empId = string.Empty;
            }
        }


        /*
        protected void btnSend_Click(object sender, EventArgs e)
        {
            


            //Send Mail
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            mail.From = new MailAddress("EzCabServices11@gmail.com");
            mail.To.Add(CheckBoxList1.SelectedValue);
            mail.Subject = "Your EzCab Reservation";
            mail.Body += " <html>";

            mail.Body += "<body>";

            mail.Body += "<table>";

            mail.Body += "<tr>";
            mail.Body += "<td>Dear " + listItem.Selected.ToString() + ",</td>";
            mail.Body += "</tr>";

            mail.Body += "<tr>";
            mail.Body += "<td>A driver has accepted your reservation, he should be arrived shortly.</td>";
            mail.Body += "</tr>";

            mail.Body += "<br/><tr>";
            mail.Body += "<td>----------------------------------------------";
            mail.Body += "</tr>";

            mail.Body += "<tr>";
            mail.Body += "<td>Driver Name : " + "</td>";
            mail.Body += "</tr>";

            mail.Body += "<tr>";
            mail.Body += "<td>Plate Number : LOOOOL</td>";
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
            
        }*/

        private void SendEmailUsingGmail(string toEmailAddress)
        {
            try
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Credentials = new NetworkCredential("EzCabServices11@gmail.com", "ezcabservices12345678");
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("EzCabServices11@gmail.com");
                mail.To.Add(toEmailAddress);
                mail.Subject = "Voucher and Coupon Code!";
                mail.Body += " <html>";

                mail.Body += "<body>";

                mail.Body += "<table>";

                mail.Body += "<tr>";
                mail.Body += "<td>Congratulation!</td>";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>You've received a Voucher/Coupon Code!</td>";
                mail.Body += "</tr>";

                mail.Body += "<br/><tr>";
                mail.Body += "<td>----------------------------------------------";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>Coupon Code : " + RadioButtonList1.SelectedValue.ToString() + "</td>";
                mail.Body += "</tr>";

                mail.Body += "<tr>";
                mail.Body += "<td>Reward : " + lblPromotionDesc.Text + "</td>";
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
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                Response.Write("Error occured: " + ex.Message.ToString());
            }
        }

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll =
               (CheckBox)grEmp.HeaderRow.FindControl("chkSelectAll");
            if (chkAll.Checked == true)
            {
                foreach (GridViewRow gvRow in grEmp.Rows)
                {
                    CheckBox chkSel =
                         (CheckBox)gvRow.FindControl("chkSelect");
                    chkSel.Checked = true;
                }
            }
            else
            {
                foreach (GridViewRow gvRow in grEmp.Rows)
                {
                    CheckBox chkSel = (CheckBox)gvRow.FindControl("chkSelect");
                    chkSel.Checked = false;
                }
            }
        }
    
    }



}