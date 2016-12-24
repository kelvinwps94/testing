using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;

namespace EzCabAssignment
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string xmlfile = Server.MapPath("~/accounts.xml");

            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath("~/accounts.xml"));

            XmlNodeList NodeList = xmldoc.SelectNodes("AccountInformation/Accounts");

            foreach (XmlNode item in NodeList)
            {
                if (item.ChildNodes[0].InnerText == txtEmail.Text)
                {
                    if (item.ChildNodes[1].InnerText == txtPw.Text)
                    {
                        if (item.ChildNodes[2].InnerText == "Admin")
                        {
                            Response.Redirect("~/AdminHome.aspx?Email=" + txtEmail.Text);
                        }

                    }
                }
            }
        }
    }
}