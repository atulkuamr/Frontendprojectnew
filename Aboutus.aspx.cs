using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Security;
using System.IO;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;

public partial class Aboutus : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        About_Whitelabel.Visible = false;
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

                if (Session["Ref_Agency"].ToString() == "info@travstarz.com" && Session["white_selflabel"].ToString() == "Unapproved")
                {
                    About_travstarz.Visible = true;
                    About_Whitelabel.Visible = false;
                    about.Visible = true;
                    team.Visible = true;
                    affiliations.Visible = true;
                    ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
                }
                else if (Session["Ref_Agency"].ToString() == "itops1@travstarz.com" && Session["white_selflabel"].ToString() == "Approved")
                {
                    About_travstarz.Visible = true;
                    About_Whitelabel.Visible = false;
                    about.Visible = true;
                    team.Visible = true;
                    affiliations.Visible = true;
                    ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
                }
                else
                {

                    if (Session["Logo"] != null)
                    {
                        ImgLogo.ImageUrl = Session["Logo"].ToString();
                    }

                    if (Session["white_selflabel"].ToString() != null && Session["white_selflabel"].ToString() == "Approved")
                    {
                        Lblabout_whitelabel.Text = Session["Ab_us"].ToString();
                        About_Whitelabel.Visible = true;
                        About_travstarz.Visible = false;
                        about.Visible = false;
                        team.Visible = false;
                        affiliations.Visible = false;
                    }
                    else
                    {
                        if (Session["whitelabel"].ToString() == "Approved")
                        {
                            Lblabout_whitelabel.Text = Session["Ab_us"].ToString();
                            About_Whitelabel.Visible = true;
                            About_travstarz.Visible = false;
                            about.Visible = false;
                            team.Visible = false;
                            affiliations.Visible = false;
                        }
                        else
                        {
                            Lblabout_whitelabel.Text = Session["Ab_us"].ToString();
                            About_Whitelabel.Visible = true;
                            About_travstarz.Visible = false;
                            about.Visible = true;
                            team.Visible = true;
                            affiliations.Visible = true;
                        }
                    }
                }
            }
            else
            {
                hm.Visible = false;
                lg.Visible = true;
                About_travstarz.Visible = true;
                About_Whitelabel.Visible = false;
                about.Visible = true;
                team.Visible = true;
                affiliations.Visible = true;
                ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
            }

        }
        catch (Exception ex)
        {
            hm.Visible = false;
            lg.Visible = true;
            About_travstarz.Visible = true;
            About_Whitelabel.Visible = false;
            about.Visible = true;
            team.Visible = true;
            affiliations.Visible = true;
            ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
        }
        // shashank Gupta              
    }

    protected void Subscribe(object sender, EventArgs e)
    {
        try
        {
            string username = string.Empty;
            string password = string.Empty;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
            mm.To.Add(new MailAddress("anuragpuri@travstarz.com")); //anuragpuri//  itops4/itsupport@travstarz.com
            mm.Subject = "Subscription Request";
            mm.Body = string.Format("Hello Team,<br /> I want to subscribe <br/><br/> Email: " + Text1.Value + "<br />First Name: " + Text2.Value + "<br />Last Name: " + Text3.Value + "<br />Company Name: " + Text4.Value + "<br />Mobile No. " + Text5.Value + "<br/><br/>Please email any update, news & offers to this email id.<br/><br/><div> <img height='90' width='300' src=\"@@IMAGE@@\"/></div>");
            mm.IsBodyHtml = true;

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

            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["Host"];
            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
            //smtpClient.EnableSsl = true;

            ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
            NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
            smtp.Send(mm);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We will get back to you soon')", true);

            Text1.Value = "";
            Text2.Value = "";
            Text3.Value = "";
            Text4.Value = "";
            Text5.Value = "";
            Label2.ForeColor = Color.Green;
            Label2.Text = "</br>Your Mail send successfully, We will get back to you soon";
            ScriptManager.RegisterStartupScript(Page, GetType(), "disp_confirm", "<script>HideLabel();</script>", false);
        }
        catch (Exception ex)
        {

        }
    }
}