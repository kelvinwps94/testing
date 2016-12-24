using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.XmlConfiguration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace EzCabAssignment
{
    public partial class CustomerRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            string xmlfile = Server.MapPath("member.xml");
            string xmlfile2 = Server.MapPath("accounts.xml");

            if (File.Exists(xmlfile) == true && File.Exists(xmlfile2) == true)
            {
                XmlDocument xmldoc1 = new XmlDocument();
                xmldoc1.Load(Server.MapPath("accounts.xml"));

                XmlNodeList xNodeList = xmldoc1.SelectNodes("AccountInformation/Accounts");

                int check = 0;

                foreach (XmlNode item in xNodeList)
                {
                    if (item.ChildNodes[0].InnerText == txtEmail.Text)
                    {
                        lblExisted.Text = "Email already existed!";
                        //when found, you flag 1 and then no need find liao
                        check = 1;
                        break;
                    }
                    //else
                    //{
                    //    check = 1;
                    //}
                }

                if (check == 0)
                {
                    XmlDocument xmldoc2 = new XmlDocument();
                    xmldoc2.Load(Server.MapPath("member.xml"));


                    XmlElement parentElement1 = xmldoc2.CreateElement("Members");

                    XmlElement name = xmldoc2.CreateElement("Name");
                    name.InnerText = txtName.Text;

                    XmlElement email1 = xmldoc2.CreateElement("Email");
                    email1.InnerText = txtEmail.Text;

                    XmlElement mobileNo = xmldoc2.CreateElement("MobileNo");
                    mobileNo.InnerText = txtMobile.Text;

                    XmlElement gender = xmldoc2.CreateElement("Gender");
                    gender.InnerText = rblGender.SelectedValue.ToString();

                    XmlElement dob = xmldoc2.CreateElement("DateOfBirth");
                    dob.InnerText = txtDobDay.Text + "-" + txtDobMonth.Text + "-" + txtDobYear.Text;

                    parentElement1.AppendChild(name);
                    parentElement1.AppendChild(email1);
                    parentElement1.AppendChild(mobileNo);
                    parentElement1.AppendChild(gender);
                    parentElement1.AppendChild(dob);

                    xmldoc2.DocumentElement.AppendChild(parentElement1);
                    xmldoc2.Save(Server.MapPath("member.xml"));

                    XmlElement parentElement = xmldoc1.CreateElement("Accounts");

                    XmlElement email = xmldoc1.CreateElement("Email");
                    email.InnerText = txtEmail.Text;

                    XmlElement passwords = xmldoc1.CreateElement("Password");
                    passwords.InnerText = txtPassword.Text;

                    XmlElement role = xmldoc1.CreateElement("Role");
                    role.InnerText = txtRole.Text;

                    parentElement.AppendChild(email);
                    parentElement.AppendChild(passwords);
                    parentElement.AppendChild(role);

                    xmldoc1.DocumentElement.AppendChild(parentElement);
                    xmldoc1.Save(Server.MapPath("accounts.xml"));

                    string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        DataSet ds = new DataSet();
                        DataSet ds2 = new DataSet();
                        ds.ReadXml(Server.MapPath("member.xml"));
                        ds2.ReadXml(Server.MapPath("accounts.xml"));

                        DataTable dtMem = ds.Tables["Members"];
                        DataTable dtAcc = ds2.Tables["Accounts"];
                        con.Open();

                        SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Members", con);
                        cmd.ExecuteNonQuery();

                        SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE Accounts", con);
                        cmd1.ExecuteNonQuery();

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

                        using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                        {
                            bc2.DestinationTableName = "Accounts";
                            bc2.ColumnMappings.Add("Email", "Email");
                            bc2.ColumnMappings.Add("Password", "Password");
                            bc2.ColumnMappings.Add("Role", "Roles");
                            bc2.WriteToServer(dtAcc);
                        }
                    }
                    Response.Redirect("~/CustomerLogin.aspx");
                }
            }
            else
            {
                if (File.Exists(xmlfile2) == true)
                {
                    XmlDocument xmldoc = new XmlDocument();
                    xmldoc.Load(Server.MapPath("accounts.xml"));

                    XmlNodeList xNodeList = xmldoc.SelectNodes("AccountInformation/Accounts");
                    int check1 = 0;

                    foreach (XmlNode item in xNodeList)
                    {
                        if (item.ChildNodes[0].InnerText == txtEmail.Text)
                        {
                            lblExisted.Text = "Email already existed!";
                            check1 = 1;
                            break;
                        }
                        
                    }

                    if (check1 == 0)
                    {
                        XmlElement parentElement = xmldoc.CreateElement("Accounts");

                        XmlElement email = xmldoc.CreateElement("Email");
                        email.InnerText = txtEmail.Text;

                        XmlElement passwords = xmldoc.CreateElement("Password");
                        passwords.InnerText = txtPassword.Text;

                        XmlElement role = xmldoc.CreateElement("Role");
                        role.InnerText = txtRole.Text;

                        parentElement.AppendChild(email);
                        parentElement.AppendChild(passwords);
                        parentElement.AppendChild(role);

                        xmldoc.DocumentElement.AppendChild(parentElement);
                        xmldoc.Save(Server.MapPath("accounts.xml"));

                        string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            DataSet ds2 = new DataSet();
                            ds2.ReadXml(Server.MapPath("accounts.xml"));

                            DataTable dtAcc = ds2.Tables["Accounts"];
                            con.Open();

                            SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Accounts", con);
                            cmd.ExecuteNonQuery();

                            using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                            {
                                bc2.DestinationTableName = "Accounts";
                                bc2.ColumnMappings.Add("Email", "Email");
                                bc2.ColumnMappings.Add("Password", "Password");
                                bc2.ColumnMappings.Add("Role", "Roles");
                                bc2.WriteToServer(dtAcc);
                            }
                        }

                    }

                }
                else
                {
                    XmlTextWriter xmlNew2 = new XmlTextWriter(xmlfile2, System.Text.Encoding.UTF8);

                    xmlNew2.WriteStartDocument();

                    xmlNew2.WriteStartElement("AccountInformation");

                    xmlNew2.WriteStartElement("Accounts");

                    xmlNew2.WriteElementString("Email", txtEmail.Text);
                    xmlNew2.WriteElementString("Password", txtPassword.Text);
                    xmlNew2.WriteElementString("Role", txtRole.Text);

                    xmlNew2.WriteEndElement();

                    xmlNew2.WriteEndElement();

                    xmlNew2.WriteEndDocument();

                    xmlNew2.Close();

                    string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        DataSet ds = new DataSet();
                        ds.ReadXml(Server.MapPath("accounts.xml"));

                        DataTable dtAcc = ds.Tables["Accounts"];
                        con.Open();

                        SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Accounts", con);
                        cmd.ExecuteNonQuery();

                        using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                        {
                            bc2.DestinationTableName = "Accounts";
                            bc2.ColumnMappings.Add("Email", "Email");
                            bc2.ColumnMappings.Add("Password", "Password");
                            bc2.ColumnMappings.Add("Role", "Roles");
                            bc2.WriteToServer(dtAcc);
                        }
                    }

                }

                if (File.Exists(xmlfile) == true)
                {
                    XmlDocument xmldoc = new XmlDocument();
                    xmldoc.Load(Server.MapPath("member.xml"));

                    XmlDocument xmldoc1 = new XmlDocument();
                    xmldoc1.Load(Server.MapPath("accounts.xml"));

                    XmlNodeList xNodeList = xmldoc1.SelectNodes("AccountInformation/Accounts");
                    int check2 = 0;

                    foreach (XmlNode item in xNodeList)
                    {
                        if (item.ChildNodes[0].InnerText == txtEmail.Text)
                        {
                            lblExisted.Text = "Email already existed!";
                            check2 = 1;
                            break;
                        }
                    }

                    if (check2 == 0)
                    {
                        XmlElement parentElement = xmldoc.CreateElement("Members");

                        XmlElement name = xmldoc.CreateElement("Name");
                        name.InnerText = txtName.Text;

                        XmlElement email = xmldoc.CreateElement("Email");
                        email.InnerText = txtEmail.Text;

                        XmlElement mobileNo = xmldoc.CreateElement("MobileNo");
                        mobileNo.InnerText = txtMobile.Text;

                        XmlElement gender = xmldoc.CreateElement("Gender");
                        gender.InnerText = rblGender.SelectedValue.ToString();

                        XmlElement dob = xmldoc.CreateElement("DateOfBirth");
                        dob.InnerText = txtDobDay.Text + "-" + txtDobMonth.Text + "-" + txtDobYear.Text;

                        parentElement.AppendChild(name);
                        parentElement.AppendChild(email);
                        parentElement.AppendChild(mobileNo);
                        parentElement.AppendChild(gender);
                        parentElement.AppendChild(dob);

                        xmldoc.DocumentElement.AppendChild(parentElement);
                        xmldoc.Save(Server.MapPath("member.xml"));

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

                    }



                }
                else
                {
                    XmlTextWriter xmlNew = new XmlTextWriter(xmlfile, System.Text.Encoding.UTF8);

                    xmlNew.WriteStartDocument();

                    xmlNew.WriteStartElement("MemberInformation");

                    xmlNew.WriteStartElement("Members");

                    xmlNew.WriteElementString("Name", txtName.Text);
                    xmlNew.WriteElementString("Email", txtEmail.Text);
                    xmlNew.WriteElementString("MobileNo", txtMobile.Text);
                    xmlNew.WriteElementString("Gender", rblGender.SelectedValue.ToString());
                    xmlNew.WriteElementString("DateOfBirth", txtDobDay.Text + "-" + txtDobMonth.Text + "-" + txtDobYear.Text);

                    xmlNew.WriteEndElement();

                    xmlNew.WriteEndElement();

                    xmlNew.WriteEndDocument();

                    xmlNew.Close();

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

                }
                Response.Redirect("~/CustomerLogin.aspx");
            }
        }
    }
}