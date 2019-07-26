using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Cancellationform_New : System.Web.UI.Page
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
    public ListItem Pax0 = new ListItem(); public ListItem Pax1 = new ListItem();
    public List<string> PaxOut = new List<string>(); public List<string> PaxInb = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (IsPostBack == false)
        //{
        String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
        if (Request.QueryString["RefID"] != "")
        {
            refid = Request.QueryString["RefID"].ToString();
        }
        //refid = "28012017122109TRS";

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
        MyConnection.Open(); string sql0 = "";
        sql0 = "select * from PassengreDetails where reservationid='" + refid + "'";
        System.Data.SqlClient.SqlCommand command0 = new System.Data.SqlClient.SqlCommand(sql0, MyConnection);
        System.Data.SqlClient.SqlDataReader adoDR0 = command0.ExecuteReader();
        try
        {
            if (adoDR0.HasRows)
            {
                while (adoDR0.Read())
                {
                    try
                    {
                        if (adoDR0["status_out"].ToString() == "Requested")
                        {
                            PaxOut.Add(adoDR0["title"].ToString() + "." + adoDR0["firstName"].ToString() + "/" + adoDR0["LastName"].ToString() + "(" + adoDR0["PassengerTYPE"].ToString() + ")" + "(" + adoDR0["status_out"].ToString() + ")" + "`" + adoDR0["sid"].ToString());
                        }
                        if (searchparam.Split(';')[0].ToUpper() == "TWO")
                        {
                            if (adoDR0["status_Inb"].ToString() == "Requested")
                            {
                                PaxInb.Add(adoDR0["title"].ToString() + "." + adoDR0["firstName"].ToString() + "/" + adoDR0["LastName"].ToString() + "(" + adoDR0["PassengerTYPE"].ToString() + ")" + "(" + adoDR0["status_Inb"].ToString() + ")" + "`" + adoDR0["sid"].ToString());
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
        //--------------rEAD PASSENGER DETAILS END----------------------
        Finalstring = FlightDetails + "~" + FareDetails + "~" + searchparam + "~" + PNR_Details + "~" + PaxDetails;
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            string UpdQuery_Inb = string.Empty; string Insert_CancRes = string.Empty; int totalpax = 0;
            totalpax = PaxOut.Count;
            for (int i = 0; i < PaxOut.Count; i++)
            {
                string UpdQuery = "update PassengreDetails set status_out='Cancelled' where sid='" + PaxOut[i].Split('`')[1] + "'";
                CommonDb.RunQuery(UpdQuery);
            }
            if (PaxInb.Count >= 1)
            {
                totalpax = totalpax + PaxInb.Count;
                for (int j = 0; j < PaxInb.Count; j++)
                {
                    UpdQuery_Inb = "update PassengreDetails set status_Inb='Cancelled' where sid='" + PaxInb[j].Split('`')[1] + "' ";
                    CommonDb.RunQuery(UpdQuery_Inb);
                }
            }
            DateTime Canclled_Date = DateTime.Now;
            Insert_CancRes = "insert into  CancelReservation(Reservationid,agentid,AgentCode,CancelDatetime,Airline_Pnr,Gds_Pnr,Cancellation_Charge,Refunded_Charge,Paxcout,ExecutiveName)";
            Insert_CancRes += " values('" + refid + "','" + Session["userid"] + "','" + Session["usertype"] + "','" + Canclled_Date + "','" + PNR_Details.Split(',')[0] + "','" + PNR_Details.Split(',')[1] + "','" + Cnc_cnx.Text + "','" + cnc_Refund.Text + "','" + totalpax + "','" + Executive.Text + "')";
            CommonDb.RunQuery(Insert_CancRes);
            //update balance 
            decimal refund = 0;
            if (cnc_Refund.Text != "")
                refund = Convert.ToDecimal(cnc_Refund);
            CF.CommonFunction.FlightUpdateBalances(refid, "Cancel_Booking", "Online", refund, 0, 0, 0, Session["userid"].ToString(), Session["userid"].ToString(), "0", "", PNR_Details.Split('`')[1], "", Session["usertype"].ToString(), Session["usertype"].ToString(), "C", "1", "Cancellation", "", 0);
        }
        catch
        {
        }
    }
}