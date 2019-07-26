using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Security;
using System.IO;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;

public partial class CreditRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AgencyName"].ToString() == "")
        {
            Response.Redirect("sessionexpired.aspx");
        }
        try
        {
            txtagentID.Value = Session["Email"].ToString();
            txtAgentCode.Value = Session["AgencyName"].ToString() + "(" + Session["AgentCode"].ToString() + ")";
            txtpending.Value = Session["AvlCash"].ToString();
        }
        catch (Exception)
        { }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            string sSQL12 = "Insert Into OfflineCreditLog (Uid,AgentCode,Description,CreditNeeded,PhoneMobile,LastDepositDate,LastDepositAmount,CreditAvailable,LastUpdateDate,RefAgency,ValidationCode,Remarks,DepositUpdateflag) values(" +
                       "'" + txtagentID.Value + "'" + "," + "'" + Session["Agentcode"].ToString() + "'" + "," + "'" + Session["AgencyName"].ToString() + "'" + "," + "'" + txtcramount.Value + "'" + "," + "'" + txtmobile.Value + "'" + "," + "'" + txtdepdate.Value + "'" + "," + "'" + txtlstdepdate.Value + "'" + "," + "'" + txtpending.Value + "'" + "," + "'" + DateTime.Now + "'" + "," + "'" + Session["RefAgency"].ToString() + "'" + "," + "'" + Session["usertype"].ToString() + "'" + "," + "'" + txtRemarks.Value + "'" + "," + "0" + ")";
            Boolean res = CommonDb.RunQuery(sSQL12);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }

        string FromMail = ConfigurationManager.AppSettings.Get("DepositEmail");
        String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
        String sConn = "Server=" + ConnectionServer + ";" + ((ConfigurationManager.AppSettings.Get("ConnectionString")));
        SqlConnection MyConnection = new SqlConnection(sConn);
        MyConnection.Open(); string sql = ""; string distemailid = string.Empty;
        sql = "Select * from tblcitycountry where  description = '" + Session["RefAgency"].ToString() + "'";
        SqlCommand command = new SqlCommand(sql, MyConnection);
        SqlDataReader adoDR = command.ExecuteReader();
        if (adoDR.HasRows)
        {
            adoDR.Read();
            distemailid = adoDR["Emailid"].ToString();
        }

        string CcMail = Session["Email"].ToString();
        string sBody = "";
        sBody = "<table width='500px' align='center' style='BORDER-RIGHT: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid'>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td align='center' colspan='2'><font size='4' color='#000000' style='font-family:arial'><u>Credit Request</u></font>";
        sBody = sBody + "</td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td></td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td align='right' width='250px'><font size='2' color='#000000' style='font-family:arial; font-weight:bold'>Agent ID :&nbsp;</font></td>";
        sBody = sBody + "<td align='left' width='250px'><font size='2' color='red' style='font-family:arial'>&nbsp;" + txtagentID.Value + "</font></td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td align='right' width='250px'><font size='2' color='#000000' style='font-family:arial; font-weight:bold'>Credit Amount Needed :&nbsp;</font></td>";
        sBody = sBody + "<td align='left' width='250px'><font size='2' color='black' style='font-family:arial'>&nbsp;&#8377;&nbsp;" + txtcramount.Value + "</font></td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td align='right' width='250px'><font size='2' color='#000000' style='font-family:arial; font-weight:bold'>Mobile Number :&nbsp;</font></td>";
        sBody = sBody + "<td align='left' width='250px'><font size='2' color='black' style='font-family:arial'>&nbsp;" + txtmobile.Value + "</font></td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td align='right' width='250px'><font size='2' color='#000000' style='font-family:arial; font-weight:bold'>Last Deposit Date :&nbsp;</font></td>";
        sBody = sBody + "<td align='left' width='250px'><font size='2' color='black' style='font-family:arial'>&nbsp;" + txtdepdate.Value + "</font></td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td align='right' width='250px'><font size='2' color='#000000' style='font-family:arial; font-weight:bold'>Last Deposit Amount :&nbsp;</font></td>";
        sBody = sBody + "<td align='left' width='250px'><font size='2' color='black' style='font-family:arial'>&nbsp;&#8377;&nbsp;" + txtlstdepdate.Value + "</font></td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "<tr>";
        sBody = sBody + "<td align='right' width='250px'><font size='2' color='#000000' style='font-family:arial; font-weight:bold'>Credit Already Pending :&nbsp;</font></td>";
        sBody = sBody + "<td align='left' width='250px'><font size='2' color='black' style='font-family:arial'>&nbsp;&#8377;&nbsp;" + txtpending.Value + "</font></td>";
        sBody = sBody + "</tr>";
        sBody = sBody + "</table>";

        string accmail = "varunrajput@travstarz.com";

        MailMessage mm = new MailMessage(ConfigurationManager.AppSettings["UserName"], "" + accmail + "");
        mm.CC.Add(CcMail);
        mm.Body = string.Format(sBody);
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = ConfigurationManager.AppSettings["Host"];
        smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);

        ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
        NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
        smtp.Send(mm);

        Response.Redirect("CreditRequest.aspx");
    }
}