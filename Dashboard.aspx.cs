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
using System.Data.SqlClient;
using System.Net.Security;
using System.IO;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;
using System.Data;
using System.Globalization;
using System.Web.Services;
using System.Text;
public partial class Dashboard : System.Web.UI.Page
{
    public SqlDataReader sdr;
    public string loginval = string.Empty;
    public string wlslider = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            loginval = Session["loginVal"].ToString();
            if (Session["white_selflabel"].ToString() != null && Session["white_selflabel"].ToString() == "Approved")
            {
                if (Session["Slider"].ToString() != null)
                {
                    wlslider = Session["Slider"].ToString();
                }
            }
        }
        catch (Exception ex)
        {

        }



        try
        {
            if (!IsPostBack)
            {
                string sq = "select AvailableCredit from admincreditlimit where Uid ='" + loginval + "'";
                System.Data.SqlClient.SqlDataReader sd = DB.CommonDatabase.DataReader(sq);
                if (sd.Read())
                {
                    string bal = sd["AvailableCredit"].ToString();
                    if (bal == "0" || bal == "0.00")
                    {
                        // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "window.onload =function(){alert('Insufficient Balance in your account. Please contact admin')};", true);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            string ServerPath = Server.MapPath("ErrorLogs");
            string DataFile1 = "SearchPage" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
            FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
            StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
            try
            {
                fp1.WriteLine(ex.Message.ToString());
            }
            catch (Exception Ex)
            {
            }
            finally
            {
                fp1.Close();
                fp1 = null;

            }
        }
        //logintime.InnerText = "Last Login : " + Session["LoginTimeO"].ToString();
        if (!IsPostBack)
        {
            try
            {
                string value = Session["loginVal"].ToString();
                City.Items.Add("Select City");
                Hour.Items.Add("Hour");
                Min.Items.Add("Min");

                var sql = "Select Distinct CountryName, CountryCode from Destination_Hotelbeds order by CountryName";
                sdr = DB.CommonDatabase.DataReader(sql);
                Country.Items.Add("Select Country");
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        Country.Items.Add(sdr["CountryName"].ToString() + "-" + sdr["CountryCode"].ToString());
                    }
                }

                string DropDownListPickUp = ConfigurationManager.AppSettings.Get("DropDownListPickUp").ToString();
                string DropDownListDropOff = ConfigurationManager.AppSettings.Get("DropDownListDropOff").ToString();
                string NationalCurrency = ConfigurationManager.AppSettings.Get("NationalCurrency").ToString();
                string nationality = NationalCurrency.Split('~')[0];
                string Currency = NationalCurrency.Split('~')[1];

                PickUp.Items.Add("Select Pick Up");
                for (int i = 0; i < DropDownListPickUp.Split(',').Length; i++)
                {
                    PickUp.Items.Add(DropDownListPickUp.Split(',')[i]);
                }

                DropOff.Items.Add("Select Drop Off");
                for (int i = 0; i < DropDownListDropOff.Split(',').Length; i++)
                {
                    DropOff.Items.Add(DropDownListDropOff.Split(',')[i]);
                }

                for (int i = 0; i < 24; i++)
                {
                    if (i.ToString().Length == 1)
                    {
                        Hour.Items.Add("0" + i.ToString());
                    }
                    else
                    {
                        Hour.Items.Add(i.ToString());
                    }
                }

                for (int i = 0; i < 60; i++)
                {
                    if (i.ToString().Length == 1)
                    {
                        Min.Items.Add("0" + i.ToString());
                    }
                    else
                    {
                        Min.Items.Add(i.ToString());
                    }
                    i += 4;
                }
                //}
                //if (!IsPostBack)
                //{
                Citysight.Items.Add("Select City");
                Countrysight.Items.Add("Select Country");
                var sql1 = "Select Distinct Country from CitySightSeeingCountryCity order by Country";
                sdr = DB.CommonDatabase.DataReader(sql1);
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        Countrysight.Items.Add(sdr["Country"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {


            }
        }

    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string sql = string.Format("select a.CityCode,a.CityName,a.CountryCode,a.CountryName from hCountryCity a where a.CityName like '" + prefixText + "%' or a.CountryCode like '" + prefixText + "%' order by a.CountryName");
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "country");
        int rcount, size;
        rcount = ds.Tables[0].Rows.Count;
        if (rcount >= count)
            size = count;
        else
            size = rcount;
        string[] pnames = new string[size];
        for (int i = 0; i < size; i++)
        {
            DataRow row = ds.Tables[0].Rows[i];
            pnames[i] = row["CityName"].ToString() + ", " + row["CountryCode"].ToString() + ", " + row["CountryName"].ToString();
        }
        return pnames;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetFlight(string prefixText, int count)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string sql = string.Format("Select * from tblcitycountry where AirPortCode like '" + prefixText + "%' or City like '" + prefixText + "%'");
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "country");
        int rcount, size;
        rcount = ds.Tables[0].Rows.Count;
        if (rcount >= count)
            size = count;
        else
            size = rcount;
        string[] pnames = new string[size];
        for (int i = 0; i < size; i++)
        {
            DataRow row = ds.Tables[0].Rows[i];
            pnames[i] = row["City"].ToString() + "," + row["AirPortCode"].ToString() + "," + row["Country"].ToString();
        }
        return pnames;
    }

    protected void Country_SelectedIndexChanged(object sender, EventArgs e)
    {
        //hotelid.Attributes.Clear();
        //transferid.Attributes.Add("class", "tab-pane fade in active");
        //hfTab.Value = "tab-3";
        string country = Country.SelectedValue;
        City.Items.Clear();
        City.Items.Add("Select City");
        var sql = "Select Distinct DestinationName, DestinationCode from Destination_Hotelbeds where CountryName='" + country.Split('-')[0] + "' order by DestinationName";
        sdr = DB.CommonDatabase.DataReader(sql);
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                City.Items.Add(sdr["DestinationName"].ToString() + "/" + sdr["DestinationCode"].ToString());
            }
        }
    }

    protected void PickUp_SelectedIndexChanged(object sender, EventArgs e)
    {
        string country = Country.SelectedValue.Split('-')[1];
        string city = City.SelectedValue.Split('/')[0];
        PickUpPoint.Items.Clear();
        PickUpPoint.Items.Add("Select Pick Up Point");
        string pickupoint = PickUp.SelectedValue;
        if (city == "Delhi and NCR")
        {
            city = "New Delhi and NCR";
        }
        if (pickupoint == "Accommodation")
        {
            var sql = "Select * from HotelData_Hotelbeds where CountryCode='" + country + "' and DestinationName='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    PickUpPoint.Items.Add(sdr["HotelName"].ToString() + "-" + sdr["HotelID"].ToString());
                }
            }
        }
        else if (pickupoint == "Port")
        {
            var sql = "Select * from Terminal where TerminalType='" + pickupoint + "' and destination='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    PickUpPoint.Items.Add(sdr["TerminalName"].ToString() + "-" + sdr["TerminalCode"].ToString());
                }
            }
        }
        else if (pickupoint == "Airport")
        {
            var sql = "Select * from Terminal where TerminalType='" + pickupoint + "' and destination='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    PickUpPoint.Items.Add(sdr["TerminalName"].ToString() + "-" + sdr["TerminalCode"].ToString());
                }
            }
        }
        else if (pickupoint == "Station")
        {
            var sql = "Select * from Terminal where TerminalType='" + pickupoint + "' and destination='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    PickUpPoint.Items.Add(sdr["TerminalName"].ToString() + "-" + sdr["TerminalCode"].ToString());
                }
            }
        }
    }

    protected void DropOff_SelectedIndexChanged(object sender, EventArgs e)
    {
        string country = Country.SelectedValue.Split('-')[1];
        string city = City.SelectedValue.Split('/')[0];
        DropOffPoint.Items.Clear();
        DropOffPoint.Items.Add("Select Drop Off Point");
        string DropOffpoint = DropOff.SelectedValue;
        if (DropOffpoint == "Accommodation")
        {
            if (city == "Delhi and NCR")
            {
                city = "New Delhi and NCR";
            }
            var sql = "Select * from HotelData_Hotelbeds where CountryCode='" + country + "' and DestinationName='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    DropOffPoint.Items.Add(sdr["HotelName"].ToString() + "-" + sdr["HotelID"].ToString());
                }
            }
        }
        else if (DropOffpoint == "Port")
        {
            var sql = "Select * from Terminal where TerminalType='" + DropOffpoint + "' and destination='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    DropOffPoint.Items.Add(sdr["TerminalName"].ToString() + "-" + sdr["TerminalCode"].ToString());
                }
            }
        }
        else if (DropOffpoint == "Airport")
        {
            var sql = "Select * from Terminal where TerminalType='" + DropOffpoint + "' and destination='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    DropOffPoint.Items.Add(sdr["TerminalName"].ToString() + "-" + sdr["TerminalCode"].ToString());
                }
            }
        }
        else if (DropOffpoint == "Station")
        {
            var sql = "Select * from Terminal where TerminalType='" + DropOffpoint + "' and destination='" + city + "'";
            sdr = DB.CommonDatabase.DataReader(sql);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    DropOffPoint.Items.Add(sdr["TerminalName"].ToString() + "-" + sdr["TerminalCode"].ToString());
                }
            }
        }

    }

    protected void Countrysight_SelectedIndexChanged(object sender, EventArgs e)
    {
        //hotelid.Attributes.Clear();
        //transferid.Attributes.Add("class", "tab-pane fade in active");
        //hfTab.Value = "tab-3";
        string country = Countrysight.SelectedValue;
        Citysight.Items.Clear();
        Citysight.Items.Add("Select City");
        var sql = "Select Distinct City from CitySightSeeingCountryCity where Country='" + country + "' order by City";
        sdr = DB.CommonDatabase.DataReader(sql);
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                Citysight.Items.Add(sdr["City"].ToString());
            }
        }
        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "textbx();", true);
    }

    protected void Citysight_SelectedIndexChanged(object sender, EventArgs e)
    {
        string adultage = string.Empty;
        string childage = string.Empty;
        string seniorage = string.Empty;
        string infantage = string.Empty;
        string code = string.Empty;
        string city = Citysight.SelectedValue;
        string sql = "Select SightSeeingCode from CitySightSeeingCountryCity where city='" + city + "'";
        sdr = DB.CommonDatabase.DataReader(sql);
        if (sdr.Read())
        {
            code = sdr["SightSeeingCode"].ToString();
        }
        string sql1 = "Select * from CitySightSeeingAges where SightSeeingCode='" + code + "'";
        sdr = DB.CommonDatabase.DataReader(sql1);
        if (sdr.Read())
        {
            adultage = sdr["AdultAge"].ToString();
            childage = sdr["ChildAge"].ToString();
            seniorage = sdr["SeniorAge"].ToString();
            infantage = sdr["InfantAge"].ToString();
        }

        ad.InnerHtml = "Adult" + adultage;
        ch.InnerHtml = "Child" + childage;
        sen.InnerHtml = "Senior" + seniorage;
        inf.InnerHtml = "Infant" + infantage;
        //upWall.Update();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "textbx();", true);
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
            mm.To.Add(new MailAddress("priyankapuri@travstarz.com"));//itops4  priyankapuri // itsupport@travstarz.com
            mm.Subject = "Package Request";
            mm.Body = string.Format("Hello Team,<br />I'm " + txtName.Value + ", I have a querry regarding Packages.<br/><br/> Email: " + Email.Value + "<br />First Name: " + txtName.Value + "<br />Company Name: " + Company_Name.Value + "<br />Mobile No: " + Mobile.Value + "<br />Package Name:" + Package_Name.Value + "<br />Message: " + Message.Value + "<br/><br/>Please email any updat to this email id.<br/><br/><div> <img height='90' width='300' src=\"@@IMAGE@@\"/></div>");
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

            Email.Value = "";
            txtName.Value = "";
            Company_Name.Value = "";
            Mobile.Value = "";
            Package_Name.Value = "";
            Message.Value = "";
            Label2.ForeColor = Color.Green;
            Label2.Text = "</br>Your Mail send successfully, We will get back to you soon";
            ScriptManager.RegisterStartupScript(Page, GetType(), "disp_confirm", "<script>HideLabel();</script>", false);
        }
        catch (Exception ex)
        {

        }
    }
}