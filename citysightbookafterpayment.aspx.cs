using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class citysightbookafterpayment : System.Web.UI.Page
{ 
    public string st = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        st = Request.QueryString["Sessiond"];
        string availablecash = Session["AvlCash"].ToString();
        string bookingref = GenrateRandomNumber();
        string agencydetails = CF.CommonFunction.agencydetails(Session["loginVal"].ToString());
        string bookingdetails = st + "$" + agencydetails;
        string status="";
        if(bookingref != "")
        {
            status="Confirmed";
        }
        string sql = "Insert into HopOnHopOffBookingDetails(bookingid,bookingdetails,bookingdate,status) values('" + bookingref + "','" + bookingdetails + "','" + System.DateTime.Now.ToString("dd-MM-yyyy") + "','" + status + "')";
        DB.CommonDatabase.RunQuery(sql);

        Response.Redirect("citysightseeingconfirmation.aspx?Finalstr=" + bookingref);
    }
    public static string GenrateRandomNumber()
    {
        string val = "";
        string sql = "SELECT TOP 1 bookingid FROM HopOnHopOffBookingDetails ORDER BY bookingid DESC";
        SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
        try
        {
            if (sdr.Read())
            {
                val = sdr["bookingid"].ToString();
                string id = val.Split('_')[1];
                val = val.Split('_')[0] + "_" + (Convert.ToInt16(id) + 1).ToString();
            }
            else
            {
                val = "TREZOCS" + DateTime.Now.ToString("yy") + "_" + 1;
            }
        }
        catch (Exception)
        {
        }
        return val;
    }
}