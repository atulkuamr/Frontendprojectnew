using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Data;

public partial class AddNewAgent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoginType.Items.Add("Agents");
            LoginType.Items.Add("Agent Staff");
            if (Session["usertype"].ToString() == "OO" || Session["usertype"].ToString() == "OOU")
            {
                LoginType.Items.Add("Admin Staff");
            }
            LoginType.Items.Add("Distributer");

            Currency.Items.Add("INR");
            Currency.Items.Add("USD");
            Currency.Items.Add("BDT");
            Currency.Items.Add("AED");
            Currency.Items.Add("EUR");
            Currency.Items.Add("GBP");
            Currency.Items.Add("SGD");
            Currency.Items.Add("AUD");
            Currency.Items.Add("CAD");
            Currency.Items.Add("THB");

            string sql = "Select distinct CountryName from hCountryCity";
            SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.Read())
            {
                Country.Items.Add("INDIA");
                while (sdr.Read())
                {
                    Country.Items.Add(sdr["CountryName"].ToString());
                }
            }
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        string fileName = string.Empty;
        if (FileUpload1.HasFile)
        {
            fileName = FileUpload1.FileName.ToString();
            string uploadFolderPath = "~/UserImages/";
            string filePath = HttpContext.Current.Server.MapPath(uploadFolderPath);
            FileUpload1.SaveAs(filePath + "\\" + fileName);
        }
        else
        {
            fileName = "user.jpg";
        }
        string Usertype = string.Empty;
        string UserMerchant = "TravelRezOnline";

        if (LoginType.Text == "Agents")
        {
            Usertype = "A";
        }
        else if (LoginType.Text == "Distributer")
        {
            Usertype = "D";
        }
        else if (LoginType.Text == "Agent Staff")
        {
            Usertype = "AU";
        }
        else if (LoginType.Text == "Staff")
        {
            Usertype = "S";
        }
        string sid = string.Empty;
        string sql2 = "Select top 1 sid from tblAgentdetails ORDER BY sid DESC;";
        SqlDataReader sdr1 = DB.CommonDatabase.DataReader(sql2);
        try
        {
            if (sdr1.Read())
            {
                sid = sdr1["sid"].ToString();
                sid = (Convert.ToInt32(sid) + 1).ToString();
            }
            else
            {

            }
        }
        catch (Exception)
        {
        }

        string supp = ""; string comm = "";
        string sSql = "select * from Markup";
        SqlDataReader sdr = DB.CommonDatabase.DataReader(sSql);
        try
        {
            while (sdr.Read())
            {
                supp = sdr["hotelmarkup"].ToString() + ",";
                comm = sdr["hotelcomm"].ToString() + ",";
            }
        }
        catch (Exception)
        {
        }
        finally
        {
            sdr.Close();
        }

        string refuserid = Session["loginVal"].ToString();
        string loginid = "select * from Adminlogin where username='" + UserId.Text + "'";
        SqlDataReader sdrs = DB.CommonDatabase.DataReader(loginid);
        if (sdrs.Read())
        {
            Label1.ForeColor = Color.Red;
            Label1.Text = "UserID already Exists!";
            UserId.Focus();
        }
        else
        {
            string SQL = "Insert into tblAgentdetails(userid,password,AgentCode,Usertype,ValidationCode,loginType,agencylogo,agencyName,address,PhoneNo,Contact,Emailid,UserMerchant,FirstName,LastName,Currency,City,State,PinCode,Remarks,hotelmarkup,hotelcomm,Country,RefAgency) values(";
            SQL += "'" + UserId.Text + "',";
            SQL += "'" + Password.Text + "','TRAVREZ" + sid + "',";
            SQL += "'" + Usertype + "','" + Usertype + "',";
            SQL += "'" + LoginType.Text + "',";
            SQL += "'" + fileName + "',";
            SQL += "'" + AgencyName.Text + "',";
            SQL += "'" + Address.Text + "',";
            SQL += "'" + Phone.Text + "',";
            SQL += "'" + Mobile.Text + "',";
            SQL += "'" + UserId.Text + "',";
            SQL += "'" + UserMerchant + "',";
            SQL += "'" + FirstName.Text + "',";
            SQL += "'" + LastName.Text + "',";
            SQL += "'" + Currency.Text + "',";
            SQL += "'" + City.Text + "',";
            SQL += "'" + State.Text + "',";
            SQL += "'" + PinCode.Text + "',";
            SQL += "'" + Remarks.Text + "','" + supp + "','" + comm + "','" + Country.SelectedValue + "','" + refuserid + "')";

            try
            {
                DB.CommonDatabase.RunQuery(SQL);
            }
            catch (Exception)
            {
            }

            string dcarduser = GenrateRandomNumber();
            string sql1 = "Insert into Adminlogin(username,Password,Agencyid,AgencyName,ValidationCode,usertype,type,ContactPerson,designation,Phone,Mobile,Email,Address,city,state,LoginFlag,PanNo,ServiceTaxNo,DCarduser,country,JoingDate,image,refagency) values(";
            sql1 += "'" + UserId.Text + "',";
            sql1 += "'" + Password.Text + "','TRAVREZ" + sid + "',";
            sql1 += "'" + AgencyName.Text + "',";
            sql1 += "'" + Usertype + "',";
            sql1 += "'" + LoginType.Text + "',";
            sql1 += "'" + Usertype + "',";
            sql1 += "'" + FirstName.Text + " " + LastName.Text + "',";
            sql1 += "'" + Designation.Text + "',";
            sql1 += "'" + Phone.Text + "',";
            sql1 += "'" + Mobile.Text + "',";
            sql1 += "'" + UserId.Text + "',";
            sql1 += "'" + Address.Text + "',";
            sql1 += "'" + City.Text + "',";
            sql1 += "'" + State.Text + "',";
            sql1 += "'0',";
            sql1 += "'" + TextBox1.Text + "',";
            sql1 += "'" + TextBox2.Text + "',";
            sql1 += "'" + fileName + "',";
            sql1 += "'" + dcarduser + "','" + Country.SelectedValue + "','" + DateTime.Now.ToShortDateString() + "','" + refuserid + "')";

            try
            {
                DB.CommonDatabase.RunQuery(sql1);
                Label1.ForeColor = System.Drawing.Color.DarkGreen;
                Label1.Text = "Agent Id Registered Successfully, Contact Admin for activation";
            }
            catch (Exception)
            {
            }

            //try
            //{
            //    string xml = string.Empty;
            //    xml += "<?xml version='1.0' encoding='utf-8'?>";
            //    xml += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>";
            //    xml += "<soap:Body>";
            //    xml += "<AddNewAgent xmlns='http://tempuri.org/'>";
            //    xml += "<EmailID>" + UserId.Text + "</EmailID>";
            //    xml += "<Password>" + Password.Text + "</Password>";
            //    xml += "</AddNewAgent>";
            //    xml += "</soap:Body>";
            //    xml += "</soap:Envelope>";
            //    string url = "http://bookingapi.theholidaykingdom.com/ApiList.asmx";
            //    cls.CommonClass obj = new cls.CommonClass();
            //    string responsedata = obj.PostXml4Min(url, xml);
            //}
            //catch (Exception) { }

            try
            {
                MailMessage mm = new MailMessage("" + ConfigurationManager.AppSettings["UserName"] + "", UserId.Text);
                mm.Subject = "Your Account is Created";
                // mm.Body = string.Format("Dear " + FirstName.Text + " " + LastName.Text + " ,<br /><br /> Your ID and password are given below.<br />UserId: " + UserId.Text + "<br />Password: " + Password.Text + "<br>* Request you to please send us your GST Number.<br /><br />For your account activation please contact to Admin.");
                mm.Body = string.Format("Dear " + FirstName.Text + " " + LastName.Text + " ,<br /><br /> Your ID and password are given below.<br />UserId: " + UserId.Text + "<br />Password: " + Password.Text + "<br>* Request you to please send us your GST Number. <br /><br />For your account activation please contact to Admin.");
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                //smtpClient.EnableSsl = true;

                ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mm);
            }
            catch (Exception ex)
            {
            }
        }

    }

    public static string GenrateRandomNumber()
    {
        string val = "";
        string sql = "SELECT donecarduser FROM RandomNumber";
        SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
        try
        {
            if (sdr.Read())
            {
                val = sdr["donecarduser"].ToString();
                string id = val.Split('V')[1];
                val = val.Split('V')[0] + "V" + (Convert.ToInt16(id) + 1).ToString();

                string ssql = "Update RandomNumber set donecarduser='" + val + "'";
                DB.CommonDatabase.RunQuery(ssql);
            }
            else
            {
                val = "TREZO" + DateTime.Now.ToString("yy") + "V" + 1;
                string ssql = "Update RandomNumber set donecarduser='" + val + "'";
                DB.CommonDatabase.RunQuery(ssql);
            }
        }
        catch (Exception)
        {
        }
        return val;
    }
}