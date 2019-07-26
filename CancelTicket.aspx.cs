using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class CancelTicket : System.Web.UI.Page
{
    public string Finalstring = string.Empty;
    public string NoofPax = "0";
    public string address = string.Empty;
    public string BookStatus = string.Empty;
    public string refid = string.Empty;
    public string PNR_Details = string.Empty;
    public string FlightDetails = string.Empty;
    public string FareDetails = string.Empty; public string PaxDetails = string.Empty;
    public string searchparam = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");

            if (Request.QueryString["Ref"] != "")
            {
                refid = Request.QueryString["Ref"].ToString();
            }
            //refid = "06032017114329TRS";

            String sConn = "Server=" + ConnectionServer + ";" + ((ConfigurationManager.AppSettings.Get("ConnectionString")));
            System.Data.SqlClient.SqlConnection MyConnection = new System.Data.SqlClient.SqlConnection(sConn);
            MyConnection.Open(); string sql = "";
            sql = "select * from reservationtable where reservationid='" + refid + "'";
            if (Session["usertype"] != "" && Session["usertype"] != null)
            {
                if (Session["usertype"].ToString() != "OO" && Session["usertype"].ToString() != "OOU")
                {
                    sql += " " + "and  agentid='" + Session["userid"] + "'";
                }
            }
            System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(sql, MyConnection);
            System.Data.SqlClient.SqlDataReader adoDR = command.ExecuteReader();
            try
            {
                if (adoDR.HasRows)
                {
                    while (adoDR.Read())
                    {
                        try
                        {
                            PNR_Details = adoDR["Airlinepnr"].ToString() + "," + adoDR["GdsPNR"].ToString() + "," + adoDR["TicketNo"].ToString();
                            NoofPax = adoDR["TotalPassenger"].ToString();
                            FlightDetails = adoDR["Flightstring"].ToString();
                            FareDetails = adoDR["Farestring"].ToString();
                            BookStatus = adoDR["BookStatus"].ToString();
                            searchparam = adoDR["searchparam"].ToString() + "!" + adoDR["ReservationDate"].ToString() + "," + adoDR["ReservationTIME"].ToString();
                        }
                        catch
                        {
                        }
                    }
                }
            }
            catch
            {
            }
            finally
            {
                MyConnection.Close();
                command.Dispose();
            }

            //-----------------READ PASSENGER DETAILS ---------------------------
            if (!IsPostBack)
            {
                MyConnection.Open(); string sql0 = "";
                sql0 = "select * from PassengreDetails where reservationid='" + refid + "'";
                System.Data.SqlClient.SqlCommand command0 = new System.Data.SqlClient.SqlCommand(sql0, MyConnection);
                System.Data.SqlClient.SqlDataReader adoDR0 = command0.ExecuteReader();
                paxOut.Items.Clear(); paxIn.Items.Clear();
                ListItem Pax0 = new ListItem(); ListItem Pax1 = new ListItem();
                try
                {
                    if (adoDR0.HasRows)
                    {
                        while (adoDR0.Read())
                        {
                            try
                            {
                                if (adoDR0["status_out"].ToString() != "")
                                {
                                    Pax0 = new ListItem(adoDR0["title"].ToString() + " . " + adoDR0["firstName"].ToString() + " / " + adoDR0["LastName"].ToString() + " ( " + adoDR0["PassengerTYPE"].ToString() + " ) " + " ( " + adoDR0["status_out"].ToString() + " ) ", adoDR0["sid"].ToString());
                                    paxOut.Items.Add(Pax0);
                                }
                                else
                                {
                                    Pax0 = new ListItem(adoDR0["title"].ToString() + " . " + adoDR0["firstName"].ToString() + " / " + adoDR0["LastName"].ToString() + " ( " + adoDR0["PassengerTYPE"].ToString() + " ) " + " ( " + "Booked" + " ) ", adoDR0["sid"].ToString());
                                    paxOut.Items.Add(Pax0);
                                }
                                if (searchparam.Split(';')[0].ToUpper() == "TWO")
                                {
                                    if (adoDR0["status_Inb"].ToString() != "")
                                    {
                                        Pax1 = new ListItem(adoDR0["title"].ToString() + " . " + adoDR0["firstName"].ToString() + " / " + adoDR0["LastName"].ToString() + " ( " + adoDR0["PassengerTYPE"].ToString() + " ) " + " ( " + adoDR0["status_Inb"].ToString() + " ) ", adoDR0["sid"].ToString());
                                        paxIn.Items.Add(Pax1);
                                    }
                                    else
                                    {
                                        Pax1 = new ListItem(adoDR0["title"].ToString() + " . " + adoDR0["firstName"].ToString() + " / " + adoDR0["LastName"].ToString() + " ( " + adoDR0["PassengerTYPE"].ToString() + " ) " + " ( " + "Booked" + " ) ", adoDR0["sid"].ToString());
                                        paxIn.Items.Add(Pax1);
                                    }
                                }
                            }
                            catch
                            {
                            }
                        }
                    }
                }
                catch
                {
                }
                finally
                {
                    MyConnection.Close();
                    command0.Dispose();
                }
            }
            //--------------rEAD PASSENGER DETAILS END----------------------
            Finalstring = FlightDetails + "~" + FareDetails + "~" + searchparam + "~" + PNR_Details + "~" + PaxDetails;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string ServerIP = Request.ServerVariables["REMOTE_ADDR"];
            string journydate = JournyOut.InnerText;
            DateTime CancelReq = DateTime.Now;
            string journydate_Inb = JournyInb.InnerText;
            string LastName = string.Empty;
            if (Request.QueryString["Ref"] != "")
            {
                refid = Request.QueryString["Ref"].ToString();
            }
            for (int i = 0; i < paxOut.Items.Count; i++)
            {
                if (paxOut.Items[i].Selected)
                {
                    string UpdateQuery = "update PassengreDetails set lastname='" + paxOut.Items[i].Text.Split('/')[1].Split('(')[0] + "',status_out='Requested',Cancel_Requested='" + CancelReq + "' where reservationid='" + refid + "' and sid='" + paxOut.Items[i].Value + "'";
                    CommonDb.RunQuery(UpdateQuery);
                }
            }
            if (paxIn.Items.Count > 0)
            {
                for (int j = 0; j < paxIn.Items.Count; j++)
                {
                    if (paxIn.Items[j].Selected)
                    {
                        string UpdateQuery = "update PassengreDetails set lastname='" + paxIn.Items[j].Text.Split('/')[1].Split('(')[0] + "',status_Inb='Requested',Cancel_Requested='" + CancelReq + "' where reservationid='" + refid + "' and sid='" + paxIn.Items[j].Value + "'";
                        CommonDb.RunQuery(UpdateQuery);
                    }
                }
            }
            string Cancle_mode = string.Empty;
            if (radio1.Checked)
                Cancle_mode = "Normal Cancellation";
            else if (radio2.Checked)
                Cancle_mode = "Full Refund";
            DateTime Update_Date = DateTime.Now;

            //Update reservation table with remarks and update date time and server Ip
            string Update_Resn = "update reservationtable set update_id='" + Session["userid"] + "',Cancel_Mode='" + Cancle_mode + "',UpdateDate='" + Update_Date + "',Remarks='" + Remarks.Text + "',Server_Ip='" + ServerIP + "' where reservationid='" + refid + "'";
            CommonDb.RunQuery(Update_Resn);
            //Update completed 
            string aab = FlightDetails;
            Response.Redirect("CancelledReservationList.aspx");
            string popupScript = "<script language='javascript'>" + "window.close();" + "if (window.opener && !window.opener.closed)" + "{" + "window.opener.location.reload();" + "}" + "</script>";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "DatePickerScript", popupScript, true);
        }
        catch
        {
        }
    }
}