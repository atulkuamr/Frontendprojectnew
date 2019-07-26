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
using System.Linq;
using System.IO;
using System.Net.Mime;

public partial class AgentRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoginType.Items.Add("Agents");
            LoginType.Items.Add("Agent Staff");
            //LoginType.Items.Add("Distributer");
            //Currency.Items.Add("INR");
            //Currency.Items.Add("USD");
            //Currency.Items.Add("BDT");
            //Currency.Items.Add("AED");
            //Currency.Items.Add("EUR");
            //Currency.Items.Add("GBP");
            //Currency.Items.Add("SGD");
            //Currency.Items.Add("AUD");
            //Currency.Items.Add("CAD");
            //Currency.Items.Add("THB");

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

        // shashank Gupta
        //try
        //{
        //    if (Session["loginVal"].ToString() != null)
        //    {
        //        hm.Visible = false;
        //        lg.Visible = true;
        //        //Session["loginVal"] = null;
        //    }
        //    else
        //    {
        //        hm.Visible = true;
        //        lg.Visible = false;
        //    }

        //}
        //catch (Exception ex)
        //{
        //}
        //finally
        //{
        //    hm.Visible = false;
        //    lg.Visible = true;
        //}

        try
        {
            if (Session["loginVal"].ToString() != null)
            {
                hm.Visible = true;
                lg.Visible = false;

            }
            else
            {
                hm.Visible = false;
                lg.Visible = true;
            }

        }
        catch (Exception ex)
        {
            hm.Visible = false;
            lg.Visible = true;
        }
        // shashank Gupta
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //wlstart
        string wlLogo = string.Empty;
        string SliderImg = string.Empty;
        string Titlee = Title.Text;
        string SupprtEmail = SupportEmail.Text;
        string MapUrl = Map_Url.Text;
        string FacebookUrl = Facebook_Url.Text;
        string LinkedInUrl = LinkedIn_Url.Text;
        string Support_no = SupportPhone.Text;
        string Mobileno = Mobile_no.Text;
        string AboutUs = About_Us.Text;

        if (wl_ck.Checked == true)
        {
            if (Titlee == "" || Titlee == null)
            {
                alartpop("Please enter title.");
                return;
            }
            else if (SupprtEmail == "" || SupprtEmail == null)
            {
                alartpop("Please enter supprt email.");
                return;
            }
            else if (Support_no == "" || Support_no == null)
            {
                alartpop("Please enter support phone no.");
                return;
            }
            else if (AboutUs == "" || AboutUs == null)
            {
                alartpop("Please enter about us.");
                return;
            }

            HttpFileCollection attachments = Request.Files;
            if (attachments.Count >= 3)
            {
                for (int i = 2; i < attachments.Count; i++)
                {
                    HttpPostedFile attachment = attachments[i];
                    if (attachment.ContentLength > 0 && !String.IsNullOrEmpty(attachment.FileName))
                    {
                        string fname = attachment.FileName;
                        string dt = DateTime.Now.ToString("yyyy-MM-dd");
                        string time = DateTime.Now.ToLongTimeString();
                        fname = dt + "_" + time.Replace(':', '_') + '_' + fname;
                        attachment.SaveAs(Server.MapPath(@"~/img/wl_slider/") + fname);
                        SliderImg += "img/wl_slider/" + fname + "~";
                    }
                }
            }

            if (Logo.HasFile)
            {
                string s = Path.GetFileName(Logo.FileName.ToString());
                string dt = DateTime.Now.ToString("yyyy-MM-dd");
                string time = DateTime.Now.ToLongTimeString();
                wlLogo = dt + "_" + time.Replace(':', '_') + '_' + s;
                string filePath = "~/img/wl_logo/" + wlLogo;
                Logo.PostedFile.SaveAs(Server.MapPath(filePath));
                wlLogo = filePath;
            }
            else
            {
                alartpop("Please select Logo.!");
                return;
            }
        }
        //wlend

        string fileName = string.Empty;
        if (FileUpload1.HasFile)
        {
            fileName = FileUpload1.FileName.ToString();
            string uploadFolderPath = "~/UserImages/";
            string filePath = HttpContext.Current.Server.MapPath(uploadFolderPath);
            string dt = DateTime.Now.ToString("yyyy-MM-dd");
            string time = DateTime.Now.ToLongTimeString();
            fileName = dt + "_" + time.Replace(':', '_') + '_' + fileName;
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

        string loginid = "select * from Adminlogin where username='" + UserId.Text + "'";
        SqlDataReader sdrs = DB.CommonDatabase.DataReader(loginid);
        if (sdrs.Read())
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('User ID already Exists!');", true);
            return;
            //Label1.ForeColor = Color.Red;
            //Label1.Text = "UserID already Exists!";
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
            SQL += "'" + Phone.Text + "',";
            SQL += "'" + UserId.Text + "',";
            SQL += "'" + UserMerchant + "',";
            SQL += "'" + FirstName.Text + "',";
            SQL += "'" + LastName.Text + "',";
            SQL += "'INR',";
            SQL += "'" + City.Text + "',";
            SQL += "'" + State.Text + "',";
            SQL += "'" + PinCode.Text + "',";
            SQL += "'','" + supp + "','" + comm + "','" + Country.SelectedValue + "','info@travstarz.com')";

            try
            {
                DB.CommonDatabase.RunQuery(SQL);
            }
            catch (Exception)
            {
            }

            string dcarduser = GenrateRandomNumber();
            string sql1 = "Insert into Adminlogin(username,Password,Agencyid,AgencyName,ValidationCode,usertype,type,ContactPerson,designation,Phone,Mobile,Email,Address,city,state,LoginFlag,PanNo,ServiceTaxNo,DCarduser,country,JoingDate,image,refagency,WhiteLabel_Status,WhiteLabel_Approval,WL_Domain_Approval) values(";
            sql1 += "'" + UserId.Text + "',";
            sql1 += "'" + Password.Text + "','TRAVREZ" + sid + "',";
            sql1 += "'" + AgencyName.Text + "',";
            sql1 += "'" + Usertype + "',";
            sql1 += "'" + LoginType.Text + "',";
            sql1 += "'" + Usertype + "',";
            sql1 += "'" + FirstName.Text + " " + LastName.Text + "',";
            sql1 += "'" + Designation.Text + "',";
            sql1 += "'" + Phone.Text + "',";
            sql1 += "'" + Phone.Text + "',";
            sql1 += "'" + UserId.Text + "',";
            sql1 += "'" + Address.Text + "',";
            sql1 += "'" + City.Text + "',";
            sql1 += "'" + State.Text + "',";
            sql1 += "'0',";
            sql1 += "'" + Pancardno.Text + "',";
            sql1 += "'" + Gstno.Text + "',";
            //sql1 += "'" + fileName + "',";
            sql1 += "'" + dcarduser + "','" + Country.SelectedValue + "','" + DateTime.Now.ToString("MM/dd/yyyy") + "','" + fileName + "','info@travstarz.com',";
            if (wl_ck.Checked == true)
            {
                sql1 += "'Yes', 'Unapproved','Unapproved')";
            }
            else
            {
                sql1 += "'No','Unapproved','Unapproved')";
            }
            try
            {
                DB.CommonDatabase.RunQuery(sql1);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Agent Id Registered Successfully, Contact Admin for activation!');", true);
                //wl_ck.Checked = false;
                //Label1.ForeColor = System.Drawing.Color.DarkGreen;
                //Label1.Text = "Agent Id Registered Successfully, Contact Admin for activation";
            }
            catch (Exception)
            {
            }

            try
            {
                if (wl_ck.Checked == true)
                {
                    string sql_wl = "Insert into WhiteLabel(username,Title,Facebook_Url,Linkedin_Url,SupportPhone,Mobile,SupportEmail,About_Us,Map_Url,Slider_Images,Logo) values(";
                    sql_wl += "'" + UserId.Text + "',";
                    sql_wl += "'" + Titlee + "',";
                    sql_wl += "'" + FacebookUrl + "',";
                    sql_wl += "'" + LinkedInUrl + "',";
                    sql_wl += "'" + Support_no + "',";
                    sql_wl += "'" + Mobileno + "',";
                    sql_wl += "'" + SupprtEmail + "',";
                    sql_wl += "'" + AboutUs + "',";
                    sql_wl += "'" + MapUrl + "',";
                    sql_wl += "'" + SliderImg + "',";
                    sql_wl += "'" + wlLogo + "')";

                    DB.CommonDatabase.RunQuery(sql_wl);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Agent Id Registered Successfully, Contact Admin for activation!');", true);
                    wl_ck.Checked = false;
                    //Label1.ForeColor = System.Drawing.Color.DarkGreen;
                    //Label1.Text = "Agent Id Registered Successfully, Contact Admin for activation";
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ex + "');", true);
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
                // mm.Body = string.Format("Dear " + FirstName.Text + " " + LastName.Text + " ,<br /><br /> Your ID and password are given below.<br />UserId: " + UserId.Text + "<br />Password: " + Password.Text + "<br/><br/>* Request you to please send us your GST Number on <font style='color: #0000FF; font-size: large'><u>product.support@travstarz.com</u></font><br /><br />For your account activation please contact to Admin.");
                mm.Body = string.Format("Dear " + FirstName.Text + " " + LastName.Text + " ,<br /><br /> Your ID and password are given below.<br /><br />UserId: " + UserId.Text + "<br />Password: " + Password.Text + "<br/><br/>* Request you to please send us your GST Number on <font style='color: #0000FF; font-size: large'><u>product.support@travstarz.com</u></font><br /><br /><a href='http://in.rezb2b.com/'>Click here for login</a> <br /><br />For your account activation please contact to Admin.<br/><br/><div> <img height='90' width='300' src=\"@@IMAGE@@\"/></div>");
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                //smtpClient.EnableSsl = true;

                string attachmentPath = Server.MapPath("~/new-travel-rez.png");
                Attachment inline = new Attachment(attachmentPath);
                string contentID = Path.GetFileName(attachmentPath).Replace(".", "") + "@zofm";

                inline.ContentDisposition.Inline = true;
                inline.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
                inline.ContentId = contentID;
                inline.ContentType.MediaType = "image/png";
                inline.ContentType.Name = Path.GetFileName(attachmentPath);
                mm.Attachments.Add(inline);
                mm.Body = mm.Body.Replace("@@IMAGE@@", "cid:" + contentID);

                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
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

    public void alartpop(string err)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + err + "');document.getElementById('wl').style.display = 'block';", true);
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

    //protected void Country_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string sql = "Select * from hCountryCity where CountryName=" + Country.SelectedValue;
    //    SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
    //    if (sdr.Read())
    //    {
    //        while (sdr.Read())
    //        {
    //            City.Items.Add(sdr["CityName"].ToString());
    //        }
    //    }
    //}
}