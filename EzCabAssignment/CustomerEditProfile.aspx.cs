using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using System.Data;
using System.Xml.XmlConfiguration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace EzCabAssignment
{
    public partial class CustomerEditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = Request.QueryString["Email"].ToString();
            if (!IsPostBack)
            {
                string xmlfile = Server.MapPath("~/member.xml");


                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(Server.MapPath("~/member.xml"));

                XmlNodeList NodeList = xmldoc.SelectNodes("MemberInformation/Members");

                foreach (XmlNode item in NodeList)
                {
                    if (item.ChildNodes[1].InnerText == Request.QueryString["Email"])
                    {
                        //Label1.Text = item.ChildNodes[0].InnerText.ToString();

                        lblName.Text = item.ChildNodes[0].InnerText.ToString();
                        lblEmail.Text = item.ChildNodes[1].InnerText.ToString();
                        txtMobileNo.Text = item.ChildNodes[2].InnerText.ToString();
                        lblGender.Text = item.ChildNodes[3].InnerText.ToString();
                        txtDOB.Text = item.ChildNodes[4].InnerText.ToString();
                        break;
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox Name = (TextBox)FindControl("lblName");
            TextBox Email = (TextBox)FindControl("lblEmail");
            TextBox MobileNo = (TextBox)FindControl("txtMobileNo");
            TextBox Gender = (TextBox)FindControl("lblGender");
            TextBox DOB = (TextBox)FindControl("txtDOB");

            string xmlfile = Server.MapPath("~/member.xml");

            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath("~/member.xml"));

            XmlNodeList NodeList = xmldoc.SelectNodes("MemberInformation/Members");

            foreach (XmlNode item in NodeList)
            {
                if (item.ChildNodes[1].InnerText == lblEmail.Text)
                {
                    item.ChildNodes[0].InnerText = Name.Text;
                    item.ChildNodes[1].InnerText = Email.Text;
                    item.ChildNodes[2].InnerText = MobileNo.Text;
                    item.ChildNodes[3].InnerText = Gender.Text;
                    item.ChildNodes[4].InnerText = DOB.Text;
                    break; 
                }
            }
            
            xmldoc.Save(xmlfile);

            string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("member.xml"));

                DataTable dtMem = ds.Tables["Members"];
                con.Open();

                SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Members", con);
                cmd.ExecuteNonQuery();

                using (SqlBulkCopy bc = new SqlBulkCopy(con))
                {
                    bc.DestinationTableName = "Members";
                    bc.ColumnMappings.Add("Name", "Name");
                    bc.ColumnMappings.Add("Email", "Email");
                    bc.ColumnMappings.Add("MobileNo", "MobileNo");
                    bc.ColumnMappings.Add("Gender", "Gender");
                    bc.ColumnMappings.Add("DateOfBirth", "DOB");
                    bc.WriteToServer(dtMem);
                }
            }

            Response.Redirect("~/CustomerHome.aspx?Email=" + lblEmail.Text);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/CustomerHome.aspx?Email=" + lblEmail.Text);
        }



    }
}