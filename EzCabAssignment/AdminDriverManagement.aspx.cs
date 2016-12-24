using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Xml.XmlConfiguration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EzCabAssignment
{
    public partial class AdminDriverManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtEmail.Text = Request.QueryString["Email"].ToString();

            if (!IsPostBack)
            {
                GetAllRecordsFromXML();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AdminHome.aspx?Email=" + txtEmail.Text);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string xmlfile = Server.MapPath("~/Driver.xml");
            string xmlfile2 = Server.MapPath("~/accounts.xml");

            if (File.Exists(xmlfile) == true && File.Exists(xmlfile2) == true)
            {
                XmlDocument xmldoc1 = new XmlDocument();
                xmldoc1.Load(Server.MapPath("~/accounts.xml"));

                XmlNodeList xNodeList = xmldoc1.SelectNodes("AccountInformation/Accounts");

                int check = 0;

                foreach (XmlNode item in xNodeList)
                {
                    if (item.ChildNodes[0].InnerText == txtEmaill.Text)
                    {
                        lblDrvExisted.Text = "IC No./Email already existed!";
                        check = 1;
                        break;
                    }
                    
                }

                XmlDocument xmldoc2 = new XmlDocument();
                xmldoc2.Load(Server.MapPath("~/Driver.xml"));

                XmlNodeList NodeList = xmldoc2.SelectNodes("DriverInformation/Drivers");

                int check2 = 0;

                foreach (XmlNode item2 in NodeList)
                {
                    if(item2.ChildNodes[0].InnerText == txtICNo.Text)
                    {
                        lblDrvExisted.Text = "IC No./Email already existed!";
                        check2 = 1;
                        break;
                    }
                }

                if (check == 0 && check2 == 0)
                {
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.Load(Server.MapPath("~/Driver.xml"));

                    XmlDocument xmlDoc1 = new XmlDocument();
                    xmlDoc1.Load(Server.MapPath("~/accounts.xml"));

                    XmlElement parentElement = xmlDoc.CreateElement("Drivers");

                    XmlElement parentElement1 = xmlDoc1.CreateElement("Accounts");

                    XmlElement icNo = xmlDoc.CreateElement("ICNo");
                    icNo.InnerText = txtICNo.Text;

                    XmlElement name = xmlDoc.CreateElement("Name");
                    name.InnerText = txtName.Text;

                    XmlElement email = xmlDoc.CreateElement("Email");
                    email.InnerText = txtEmaill.Text;

                    XmlElement email1 = xmlDoc1.CreateElement("Email");
                    email1.InnerText = txtEmaill.Text;

                    XmlElement pw = xmlDoc1.CreateElement("Password");
                    pw.InnerText = txtPassword.Text;

                    XmlElement gender = xmlDoc.CreateElement("Gender");
                    gender.InnerText = rblGender.SelectedValue.ToString();

                    XmlElement tCompany = xmlDoc.CreateElement("TaxiCompany");
                    tCompany.InnerText = txtTCompany.Text;

                    XmlElement expDL = xmlDoc.CreateElement("ExpiredDrivingLicense");
                    expDL.InnerText = txtDrivingL.Text;

                    XmlElement contactNo = xmlDoc.CreateElement("ContactNo");
                    contactNo.InnerText = txtContactNo.Text;

                    XmlElement carPN = xmlDoc.CreateElement("CarPlateNo");
                    carPN.InnerText = txtCarPlateNo.Text;

                    XmlElement role = xmlDoc1.CreateElement("Role");
                    role.InnerText = txtRole.Text;

                    parentElement.AppendChild(icNo);
                    parentElement.AppendChild(name);
                    parentElement.AppendChild(email);
                    parentElement.AppendChild(gender);
                    parentElement.AppendChild(tCompany);
                    parentElement.AppendChild(expDL);
                    parentElement.AppendChild(contactNo);
                    parentElement.AppendChild(carPN);

                    parentElement1.AppendChild(email1);
                    parentElement1.AppendChild(pw);
                    parentElement1.AppendChild(role);

                    xmlDoc.DocumentElement.AppendChild(parentElement);
                    xmlDoc1.DocumentElement.AppendChild(parentElement1);
                    xmlDoc.Save(Server.MapPath("~/Driver.xml"));
                    xmlDoc1.Save(Server.MapPath("~/accounts.xml"));

                    string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        DataSet ds = new DataSet();
                        DataSet ds2 = new DataSet();
                        ds.ReadXml(Server.MapPath("~/Driver.xml"));
                        ds2.ReadXml(Server.MapPath("~/accounts.xml"));

                        DataTable dtDrv = ds.Tables["Drivers"];
                        DataTable dtAcc = ds2.Tables["Accounts"];
                        con.Open();

                        SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Driver", con);
                        cmd.ExecuteNonQuery();

                        SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE Accounts", con);
                        cmd1.ExecuteNonQuery();

                        using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                        {
                            bc2.DestinationTableName = "Driver";
                            bc2.ColumnMappings.Add("ICNo", "ICNo");
                            bc2.ColumnMappings.Add("Name", "Name");
                            bc2.ColumnMappings.Add("Email", "Email");
                            bc2.ColumnMappings.Add("Gender", "Gender");
                            bc2.ColumnMappings.Add("TaxiCompany", "TaxiCompany");
                            bc2.ColumnMappings.Add("ExpiredDrivingLicense", "ExpiredDrivingLicense");
                            bc2.ColumnMappings.Add("ContactNo", "ContactNo");
                            bc2.ColumnMappings.Add("CarPlateNo", "CarPlateNo");
                            bc2.WriteToServer(dtDrv);
                        }

                        using (SqlBulkCopy bc = new SqlBulkCopy(con))
                        {
                            bc.DestinationTableName = "Accounts";
                            bc.ColumnMappings.Add("Email", "Email");
                            bc.ColumnMappings.Add("Password", "Password");
                            bc.ColumnMappings.Add("Role", "Roles");
                            bc.WriteToServer(dtAcc);
                        }
                    }
                }
                GetAllRecordsFromXML();
            }
            else
            {
                if (File.Exists(xmlfile2) == true)
                {
                    XmlDocument xmldoc = new XmlDocument();
                    xmldoc.Load(Server.MapPath("~/accounts.xml"));

                    XmlNodeList xNodeList = xmldoc.SelectNodes("AccountInformation/Accounts");
                    int check1 = 0;

                    foreach (XmlNode item in xNodeList)
                    {
                        if (item.ChildNodes[0].InnerText == txtEmaill.Text)
                        {
                            lblDrvExisted.Text = "IC No./Email already existed!";
                            check1 = 1;
                            break;
                        }
                    }

                    if (check1 == 0)
                    {
                        XmlElement parentElement = xmldoc.CreateElement("Accounts");

                        XmlElement email = xmldoc.CreateElement("Email");
                        email.InnerText = txtEmaill.Text;

                        XmlElement passwords = xmldoc.CreateElement("Password");
                        passwords.InnerText = txtPassword.Text;

                        XmlElement role = xmldoc.CreateElement("Role");
                        role.InnerText = txtRole.Text;

                        parentElement.AppendChild(email);
                        parentElement.AppendChild(passwords);
                        parentElement.AppendChild(role);

                        xmldoc.DocumentElement.AppendChild(parentElement);
                        xmldoc.Save(Server.MapPath("~/accounts.xml"));

                        string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            DataSet ds2 = new DataSet();
                            ds2.ReadXml(Server.MapPath("~/accounts.xml"));

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
                        //finalCheck1 = 1;
                    }
                    else
                    {
                        XmlTextWriter xmlNew2 = new XmlTextWriter(xmlfile2, System.Text.Encoding.UTF8);

                        xmlNew2.WriteStartDocument();

                        xmlNew2.WriteStartElement("AccountInformation");

                        xmlNew2.WriteStartElement("Accounts");

                        xmlNew2.WriteElementString("Email", txtEmaill.Text);
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
                            ds.ReadXml(Server.MapPath("~/accounts.xml"));

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
                        //finalCheck1 = 1;
                    }

                }

                if (File.Exists(xmlfile) == true)
                {
                    XmlDocument xmldoc = new XmlDocument();
                    xmldoc.Load(Server.MapPath("~/accounts.xml"));

                    XmlNodeList xNodeList = xmldoc.SelectNodes("AccountInformation/Accounts");
                    int check1 = 0;

                    foreach (XmlNode item in xNodeList)
                    {
                        if (item.ChildNodes[0].InnerText == txtEmaill.Text)
                        {
                            lblDrvExisted.Text = "IC No./Email already existed!";
                            check1 = 1;
                            break;
                        }
                        
                    }

                    if (check1 == 0)
                    {
                        XmlElement parentElement = xmldoc.CreateElement("Drivers");

                        XmlElement icNo = xmldoc.CreateElement("ICNo");
                        icNo.InnerText = txtICNo.Text;

                        XmlElement name = xmldoc.CreateElement("Name");
                        name.InnerText = txtName.Text;

                        XmlElement email = xmldoc.CreateElement("Email");
                        email.InnerText = txtEmaill.Text;

                        XmlElement gender = xmldoc.CreateElement("Gender");
                        gender.InnerText = rblGender.SelectedValue.ToString();

                        XmlElement tCompany = xmldoc.CreateElement("TaxiCompany");
                        tCompany.InnerText = txtTCompany.Text;

                        XmlElement expDL = xmldoc.CreateElement("ExpiredDrivingLicense");
                        expDL.InnerText = txtDrivingL.Text;

                        XmlElement contactNo = xmldoc.CreateElement("ContactNo");
                        contactNo.InnerText = txtContactNo.Text;

                        XmlElement carPN = xmldoc.CreateElement("CarPlateNo");
                        carPN.InnerText = txtCarPlateNo.Text;

                        parentElement.AppendChild(icNo);
                        parentElement.AppendChild(name);
                        parentElement.AppendChild(email);
                        parentElement.AppendChild(gender);
                        parentElement.AppendChild(tCompany);
                        parentElement.AppendChild(expDL);
                        parentElement.AppendChild(contactNo);
                        parentElement.AppendChild(carPN);

                        xmldoc.DocumentElement.AppendChild(parentElement);
                        xmldoc.Save(Server.MapPath("~/Driver.xml"));

                        string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            DataSet ds2 = new DataSet();
                            ds2.ReadXml(Server.MapPath("~/Driver.xml"));

                            DataTable dtDrv = ds2.Tables["Drivers"];
                            con.Open();

                            SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Driver", con);
                            cmd.ExecuteNonQuery();

                            using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                            {
                                bc2.DestinationTableName = "Driver";
                                bc2.ColumnMappings.Add("ICNo", "ICNo");
                                bc2.ColumnMappings.Add("Name", "Name");
                                bc2.ColumnMappings.Add("Email", "Email");
                                bc2.ColumnMappings.Add("Gender", "Gender");
                                bc2.ColumnMappings.Add("TaxiCompany", "TaxiCompany");
                                bc2.ColumnMappings.Add("ExpiredDrivingLicense", "ExpiredDrivingLicense");
                                bc2.ColumnMappings.Add("ContactNo", "ContactNo");
                                bc2.ColumnMappings.Add("CarPlateNo", "CarPlateNo");
                                bc2.WriteToServer(dtDrv);
                            }
                        }
                        //finalCheck1 = 1;
                    }
                }
                else
                {
                    XmlTextWriter xmlNew = new XmlTextWriter(xmlfile, System.Text.Encoding.UTF8);

                    xmlNew.WriteStartDocument();

                    xmlNew.WriteStartElement("DriverInformation");

                    xmlNew.WriteStartElement("Drivers");

                    xmlNew.WriteElementString("ICNo", txtICNo.Text);
                    xmlNew.WriteElementString("Name", txtName.Text);
                    xmlNew.WriteElementString("Email", txtEmaill.Text);
                    xmlNew.WriteElementString("Gender", rblGender.SelectedItem.Text);
                    xmlNew.WriteElementString("TaxiCompany", txtTCompany.Text);
                    xmlNew.WriteElementString("ExpiredDrivingLicense", txtDrivingL.Text);
                    xmlNew.WriteElementString("ContactNo", txtContactNo.Text);
                    xmlNew.WriteElementString("CarPlateNo", txtCarPlateNo.Text);

                    xmlNew.WriteEndElement();

                    xmlNew.WriteEndElement();

                    xmlNew.WriteEndDocument();

                    xmlNew.Close();

                    string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        DataSet ds = new DataSet();
                        ds.ReadXml(Server.MapPath("~/Driver.xml"));

                        DataTable dtDrv = ds.Tables["Drivers"];
                        con.Open();

                        SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Driver", con);
                        cmd.ExecuteNonQuery();

                        using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                        {
                            bc2.DestinationTableName = "Driver";
                            bc2.ColumnMappings.Add("ICNo", "ICNo");
                            bc2.ColumnMappings.Add("Name", "Name");
                            bc2.ColumnMappings.Add("Email", "Email");
                            bc2.ColumnMappings.Add("Gender", "Gender");
                            bc2.ColumnMappings.Add("TaxiCompany", "TaxiCompany");
                            bc2.ColumnMappings.Add("ExpiredDrivingLicense", "ExpiredDrivingLicense");
                            bc2.ColumnMappings.Add("ContactNo", "ContactNo");
                            bc2.ColumnMappings.Add("CarPlateNo", "CarPlateNo");
                            bc2.WriteToServer(dtDrv);
                        }
                    }
                }
                GetAllRecordsFromXML();
            }
            GetAllRecordsFromXML();
        }

        private void GetAllRecordsFromXML()
        {
            string xmlfile = Server.MapPath("~/Driver.xml");
            if (File.Exists(xmlfile) == true)
            {
                System.Data.DataSet dataSet = new System.Data.DataSet();

                dataSet.ReadXml(Server.MapPath("~/Driver.xml"));

                if (dataSet.Tables.Count != 0)
                {
                    GridView1.DataSource = dataSet;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.DataBind();
                }
            }
        }

        /*private void GetAllDriverRecordsFromXML()
        {
            string xmlfile = Server.MapPath("~/accounts.xml");

            if (File.Exists(xmlfile) == true)
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(Server.MapPath("~/accounts.xml"));

                XmlNodeList NodeList = xmldoc.SelectNodes("AccountInformation/Accounts");
            }
        }*/

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetAllRecordsFromXML();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetAllRecordsFromXML();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label ICNumber = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1"));
            TextBox Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1"));
            Label Email = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label8"));
            Label Gender = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label3"));
            TextBox TaxiCompany = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2"));
            TextBox ExpiredDrivingLicense = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3"));
            TextBox ContactNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4"));
            TextBox CarPlateNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5"));

            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath("~/Driver.xml"));

            XmlNodeList NodeList = xmldoc.SelectNodes("DriverInformation/Drivers");

            foreach (XmlNode item in NodeList)
            {
                if (item.ChildNodes[0].InnerText == ICNumber.Text)
                {
                    item.ChildNodes[1].InnerText = Name.Text;
                    item.ChildNodes[2].InnerText = Email.Text;
                    item.ChildNodes[3].InnerText = Gender.Text;
                    item.ChildNodes[4].InnerText = TaxiCompany.Text;
                    item.ChildNodes[5].InnerText = ExpiredDrivingLicense.Text;
                    item.ChildNodes[6].InnerText = ContactNo.Text;
                    item.ChildNodes[7].InnerText = CarPlateNo.Text;
                }
            }

            xmldoc.Save(Server.MapPath("~/Driver.xml"));
            GridView1.EditIndex = -1;

            string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/Driver.xml"));

                DataTable dtDrv = ds.Tables["Drivers"];
                con.Open();

                SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Driver", con);
                cmd.ExecuteNonQuery();

                using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                {
                    bc2.DestinationTableName = "Driver";
                    bc2.ColumnMappings.Add("ICNo", "ICNo");
                    bc2.ColumnMappings.Add("Name", "Name");
                    bc2.ColumnMappings.Add("Email", "Email");
                    bc2.ColumnMappings.Add("Gender", "Gender");
                    bc2.ColumnMappings.Add("TaxiCompany", "TaxiCompany");
                    bc2.ColumnMappings.Add("ExpiredDrivingLicense", "ExpiredDrivingLicense");
                    bc2.ColumnMappings.Add("ContactNo", "ContactNo");
                    bc2.ColumnMappings.Add("CarPlateNo", "CarPlateNo");
                    bc2.WriteToServer(dtDrv);
                }

            }
            GetAllRecordsFromXML();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label ICNumber = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1"));

            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath("~/Driver.xml"));

            XmlNodeList NodeList = xmldoc.SelectNodes("DriverInformation/Drivers");

            foreach (XmlNode item in NodeList)
            {
                if (item.ChildNodes[0].InnerText == ICNumber.Text)
                {
                    item.ParentNode.RemoveChild(item);
                }
            }

            xmldoc.Save(Server.MapPath("~/Driver.xml"));

            string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/Driver.xml"));

                DataTable dtDrv = ds.Tables["Drivers"];
                con.Open();

                SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Driver", con);
                cmd.ExecuteNonQuery();

                using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                {
                    bc2.DestinationTableName = "Driver";
                    bc2.ColumnMappings.Add("ICNo", "ICNo");
                    bc2.ColumnMappings.Add("Name", "Name");
                    bc2.ColumnMappings.Add("Email", "Email");
                    bc2.ColumnMappings.Add("Gender", "Gender");
                    bc2.ColumnMappings.Add("TaxiCompany", "TaxiCompany");
                    bc2.ColumnMappings.Add("ExpiredDrivingLicense", "ExpiredDrivingLicense");
                    bc2.ColumnMappings.Add("ContactNo", "ContactNo");
                    bc2.ColumnMappings.Add("CarPlateNo", "CarPlateNo");
                    bc2.WriteToServer(dtDrv);
                }

            }
            GetAllRecordsFromXML();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetAllRecordsFromXML();
        }

        


        /*protected void btnAddAcc_Click(object sender, EventArgs e)
        {
            string xmlfile = Server.MapPath("~/accounts.xml");

            if (File.Exists(xmlfile) == true)
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(Server.MapPath("~/accounts.xml"));

                XmlNodeList xNodeList = xmldoc.SelectNodes("AccountInformation/Accounts");
                string[] keyValue = new string[xNodeList.Count];
                int count = 0;
                int check1 = 0;

                foreach (XmlNode xNode in xNodeList)
                {
                    foreach (XmlNode xNodeInner in xNode.ChildNodes)
                    {
                        if (xNodeInner.Name == "Email")
                        {
                            keyValue[count] = xNodeInner.InnerText;
                            count++;
                        }
                    }
                }

                foreach (string strIfDuplicate in keyValue)
                {
                    XmlNodeList xNodeCheck = xmldoc.SelectNodes("AccountInformation/Accounts[Email ='" + strIfDuplicate + "']");
                    if (xNodeCheck.Count > 1)
                    {
                        for (int i = 0; i < xNodeCheck.Count; i++)
                        {
                            lblExisted.Text = "Email already existed!";
                        }
                    }
                    else
                    {
                        check1 = 1;
                    }
                }

                if (check1 == 1)
                {
                    XmlElement parentElement = xmldoc.CreateElement("Accounts");

                    XmlElement email = xmldoc.CreateElement("Email");
                    email.InnerText = txtEmail.Text;

                    XmlElement passwords = xmldoc.CreateElement("Password");
                    passwords.InnerText = txtPw.Text;

                    XmlElement role = xmldoc.CreateElement("Role");
                    role.InnerText = txtRole.Text;

                    parentElement.AppendChild(email);
                    parentElement.AppendChild(passwords);
                    parentElement.AppendChild(role);

                    xmldoc.DocumentElement.AppendChild(parentElement);
                    xmldoc.Save(Server.MapPath("~/accounts.xml"));

                    string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        DataSet ds2 = new DataSet();
                        ds2.ReadXml(Server.MapPath("~/accounts.xml"));

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
                XmlTextWriter xmlNew2 = new XmlTextWriter(xmlfile, System.Text.Encoding.UTF8);

                xmlNew2.WriteStartDocument();

                xmlNew2.WriteStartElement("AccountInformation");

                xmlNew2.WriteStartElement("Accounts");

                xmlNew2.WriteElementString("Email", txtEmail.Text);
                xmlNew2.WriteElementString("Password", txtPw.Text);
                xmlNew2.WriteElementString("Role", txtRole.Text);

                xmlNew2.WriteEndElement();

                xmlNew2.WriteEndElement();

                xmlNew2.WriteEndDocument();

                xmlNew2.Close();

                string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    DataSet ds = new DataSet();
                    ds.ReadXml(Server.MapPath("~/accounts.xml"));

                    DataTable dtAcc = ds.Tables["Accounts"];
                    con.Open();

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
        }*/
    }

}