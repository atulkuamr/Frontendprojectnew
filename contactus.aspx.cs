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

public partial class contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
                    ind_offices.Visible = true;
                    address.Visible = true;
                    Agent_Address.Visible = false;
                    affiliations.Visible = true;
                    awards.Visible = true;
                    Inter_Offices.Visible = true;
                    LblContact_det.Text = "0124-4705300,(100 Lines)";
                    LblFax.Text = "Fax: 0124-2356656";
                    LblIndia_Office.Text = "New Delhi || Bengaluru || Mumbai || Ahmedabad";
                    LblEmailID.Text = "Booking@travstarz.com";
                    ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
                    map.Attributes["src"] = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d219.05725467507722!2d77.20350990431986!3d28.542242194913673!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390dad4fbd8dbcad%3A0xcf5ab636b8f159a9!2sTravstarz+Holiday+%26+Destinations+Pvt.+Ltd!5e0!3m2!1sen!2sin!4v1473923661104";
                }
                else if (Session["Ref_Agency"].ToString() == "itops1@travstarz.com" && Session["white_selflabel"].ToString() == "Approved")
                {
                    ind_offices.Visible = true;
                    address.Visible = true;
                    Agent_Address.Visible = false;
                    affiliations.Visible = true;
                    awards.Visible = true;
                    Inter_Offices.Visible = true;
                    LblContact_det.Text = "0124-4705300,(100 Lines)";
                    LblFax.Text = "Fax: 0124-2356656";
                    LblIndia_Office.Text = "New Delhi || Bengaluru || Mumbai || Ahmedabad";
                    LblEmailID.Text = "Booking@travstarz.com";
                    ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
                    map.Attributes["src"] = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d219.05725467507722!2d77.20350990431986!3d28.542242194913673!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390dad4fbd8dbcad%3A0xcf5ab636b8f159a9!2sTravstarz+Holiday+%26+Destinations+Pvt.+Ltd!5e0!3m2!1sen!2sin!4v1473923661104";
                }
                else
                {
                    if (Session["Logo"] != null)
                    {
                        ImgLogo.ImageUrl = Session["Logo"].ToString();
                    }

                    if (Session["white_selflabel"].ToString() != null && Session["white_selflabel"].ToString() == "Approved")
                    {
                        if (Session["Map_Url"].ToString() != null)
                        {
                            map.Attributes["src"] = Session["Map_Url"].ToString();
                        }
                        else
                        {
                            map.Attributes["src"] = "";
                        }
                        Inter_Offices.Visible = false;
                        address.Visible = false;
                        Agent_Address.Visible = true;
                        awards.Visible = false;
                        LblAgent_Address.Text = Session["address"].ToString();
                        LblContact_det.Text = Session["Supp_Phone"].ToString();
                        LblFax.Text = "";
                        LblIndia_Office.Text = Session["city"].ToString();
                        LblEmailID.Text = Session["Supp_Email"].ToString();
                        affiliations.Visible = false;
                    }
                    else
                    {
                        if (Session["whitelabel"].ToString() == "Approved")
                        {
                            if (Session["Map_Url"].ToString() != null)
                            {
                                map.Attributes["src"] = Session["Map_Url"].ToString();
                            }
                            else
                            {
                                map.Attributes["src"] = "";
                            }
                            Inter_Offices.Visible = false;
                            address.Visible = false;
                            Agent_Address.Visible = true;
                            LblAgent_Address.Text = Session["address"].ToString();
                            awards.Visible = false;
                            affiliations.Visible = false;
                            LblContact_det.Text = Session["Supp_Phone"].ToString();
                            LblFax.Text = "";
                            LblIndia_Office.Text = Session["city"].ToString();
                            LblEmailID.Text = Session["Supp_Email"].ToString();
                        }
                        else
                        {
                            map.Attributes["src"] = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d219.05725467507722!2d77.20350990431986!3d28.542242194913673!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390dad4fbd8dbcad%3A0xcf5ab636b8f159a9!2sTravstarz+Holiday+%26+Destinations+Pvt.+Ltd!5e0!3m2!1sen!2sin!4v1473923661104";
                            LblEmailID.Text = Session["Supp_Email"].ToString();
                            address.Visible = true;
                            Agent_Address.Visible = false;
                            affiliations.Visible = true;
                            awards.Visible = true;
                            LblIndia_Office.Text = "New Delhi || Bengaluru || Mumbai || Ahmedabad";
                            LblContact_det.Text = "0124-4705300,(100 Lines)";
                            LblFax.Text = "Fax: 0124-2356656";
                            Inter_Offices.Visible = true;
                        }
                    }
                }

            }
            else
            {
                hm.Visible = false;
                lg.Visible = true;
                ind_offices.Visible = true;
                address.Visible = true;
                Agent_Address.Visible = false;
                affiliations.Visible = true;
                awards.Visible = true;
                Inter_Offices.Visible = true;
                LblContact_det.Text = "0124-4705300,(100 Lines)";
                LblFax.Text = "Fax: 0124-2356656";
                LblIndia_Office.Text = "New Delhi || Bengaluru || Mumbai || Ahmedabad";
                LblEmailID.Text = "Booking@travstarz.com";
                ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
                map.Attributes["src"] = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d219.05725467507722!2d77.20350990431986!3d28.542242194913673!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390dad4fbd8dbcad%3A0xcf5ab636b8f159a9!2sTravstarz+Holiday+%26+Destinations+Pvt.+Ltd!5e0!3m2!1sen!2sin!4v1473923661104";
            }

        }
        catch (Exception ex)
        {
            hm.Visible = false;
            lg.Visible = true;
            ind_offices.Visible = true;
            affiliations.Visible = true;
            address.Visible = true;
            Agent_Address.Visible = false;
            awards.Visible = true;
            Inter_Offices.Visible = true;
            LblContact_det.Text = "0124-4705300,(100 Lines)";
            LblFax.Text = "Fax: 0124-2356656";
            LblIndia_Office.Text = "New Delhi || Bengaluru || Mumbai || Ahmedabad";
            LblEmailID.Text = "Booking@travstarz.com";
            ImgLogo.ImageUrl = "~/img/new-travel-rez.png";
            map.Attributes["src"] = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d219.05725467507722!2d77.20350990431986!3d28.542242194913673!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390dad4fbd8dbcad%3A0xcf5ab636b8f159a9!2sTravstarz+Holiday+%26+Destinations+Pvt.+Ltd!5e0!3m2!1sen!2sin!4v1473923661104";
        }
        // shashank Gupta
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mm = new MailMessage(ConfigurationManager.AppSettings["UserName"], "priyankapuri@travstarz.com"); //priyankapuri   itsupport@travstarz.com
            mm.Subject = "Querry From RezB2B.com Contact us Page.";
            mm.Body = "Hello Team,<br /><br />I'm " + tb_Name.Value + ",<br />Email: " + tb_email.Value + "<br />Phone No: " + tb_phno.Value + "<br />Message: " + tb_Message.Value + "<br/><br/>Please email any update, news & offers to this email id.<br/><br/><div> <img height='90' width='300' src=\"@@IMAGE@@\"/></div>";
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

            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
            NetworkCred.Password = ConfigurationManager.AppSettings["Password"];

            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
            smtp.Send(mm);
            Label1.ForeColor = Color.White;
            Label1.Text = "Email Sent SucessFully!";
            tb_Name.Value = "";
            tb_email.Value = "";
            tb_phno.Value = "";
            tb_Message.Value = "";

            ScriptManager.RegisterStartupScript(Page, GetType(), "disp_confirm", "<script>Showbtn();</script>", false);

        }
        catch (Exception ex)
        {

        }

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

            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
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



