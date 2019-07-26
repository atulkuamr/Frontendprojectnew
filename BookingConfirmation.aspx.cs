using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class BookingConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //The Trey Hostel!637!0!0!!TBO!637!404418!!!!KPAu9tQEkP4B/k2IEyD6bw==|DM-LZ|BAR-1A|322(Hash)(Hash)(Hash)!BED IN SHARED ROOM BED-MIXED DORMITORY!!!864!1]TBOroomRS_Travstarz_20160506162541.txt!BED AND BREAKFAST!$
        //Mr,/Test1,/Tester1,/123,/India,!9876543210!trv123!Testing purpose only$
        //23 Jun 2016^24 Jun 2016^1^All^16532@Singapore^SG@Singapore^1^ININ~1^0^^1^Single Room^SB
        string BookingReference = Session["bookingRef"].ToString(); 
        string BookingId = ""; string BkDetails = "";
        string sql = "Select * from HotelBookingDetails where BookingReference='" + BookingReference + "'";
        SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
        try
        {
            if (sdr.Read())
            {
                BookingReference = sdr["BookingReference"].ToString();
                BookingId = sdr["BookingId"].ToString();
                BkDetails = sdr["BkDetails"].ToString();
            }
            else
            {
                BkDetails = Session["BookData"].ToString();
            }
        }
        catch(Exception)
        {
            BkDetails = Session["BookData"].ToString();
        }
        string[] det = BkDetails.Split('$');
        lblBk.Text = BookingReference;
        BookingID.Text = BookingId;
        HotelName.Text = det[0].Split('!')[0];
        TotalPrice.Text = "INR " + det[0].Split('!')[1];
        CheckinDate.Text = det[2].Split('^')[0];
        CheckoutDate.Text = det[2].Split('^')[1];

        string pass = "";
        for (int i = 0; i < det[1].Split('/')[0].Split(',').Length - 1; i++)
        {
            pass += "<br />" + det[1].Split('/')[0].Split(',')[i];
            pass += det[1].Split('/')[1].Split(',')[i];
            pass += det[1].Split('/')[2].Split(',')[i] + "<br />";
        }
        PaxDetails.Text = pass;
    }
}