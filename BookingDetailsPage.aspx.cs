using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class BookingDetailsPage : System.Web.UI.Page
{
    public string Searchparam = string.Empty;
    public string BookingString = "";
    public int adtcount = 0;
    public int chdcount = 0;
    public int infcount = 0;

    //shashank
    public string domestic_check1 = string.Empty;
    public string domestic_check2 = string.Empty;

    public SqlDataReader sdr;//
    public string pc = string.Empty;
    public int pric = 0;
    public string noofdays = string.Empty;
    public string dat = string.Empty;
    //shashank

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {


            string TxnID = string.Empty;
            Searchparam = Session["SearchString"].ToString();
            adtcount = Convert.ToInt32(Searchparam.Split(',', ';')[5]);
            chdcount = Convert.ToInt32(Searchparam.Split(',', ';')[6]);
            infcount = Convert.ToInt32(Searchparam.Split(',', ';')[7]);

            if (Request.QueryString["Bookdata"] != null)
                Session["BookData"] = BookingString = cls.CommonClass.Base64Decode(Request.QueryString["Bookdata"].ToString());
            // Session["cityarray"]


            //shashank
            string departr = Searchparam.Split(',', ';')[3];
            dat = (Searchparam.Split(',', ';')[3]);

            string arival = Searchparam.Split(',', ';')[4];
            DateTime cin1 = Convert.ToDateTime(departr);

            string flytype = Searchparam.Split(',', ';')[0];
            if (flytype == "One")
            {
                noofdays = "1";
            }
            else if (flytype == "Two")
            {
                DateTime cout1 = Convert.ToDateTime(arival);
                TimeSpan span = cout1 - cin1;
                noofdays = span.Days.ToString();
            }

            domestic_check1 = (Searchparam.Split(',', ';')[15].Trim('!')).ToString();
            domestic_check2 = (Searchparam.Split(',', ';')[16].Trim('!')).ToString();

            string Totaladlt = Convert.ToString(infcount + adtcount + chdcount);
            string sql3 = "SELECT TOP 1 * FROM Trawelltag_PremiumChart where Plan_Code = '9a73a001-2923-4349-b369-0b5839f127a8' and (Age_Limit = 70 or Age_Limit > 70)  and (Day_Limit = 60 or Day_Limit > 60)  order by Day_Limit,Age_Limit;";
            //string sql3 = "SELECT TOP 1 * FROM Trawelltag_PremiumChart where Plan_Code = '9a73a001-2923-4349-b369-0b5839f127a8' and (Age_Limit = 70 or Age_Limit > 70)  and (Day_Limit = '" + noofdays + "' or Day_Limit > '" + noofdays + "')  order by Day_Limit,Age_Limit;";
            SqlDataReader sdr = DB.CommonDatabase.DataReader(sql3);
            if (sdr.Read())
            {
                pc = sdr["Premium"].ToString();
                pric = Convert.ToInt32(pc) * Convert.ToInt32(Totaladlt);
                //hidn.Value = pric.ToString();
                hidn.Value = pc;
                HiddenField1.Value = BookingString.Split(',')[0];
                if (domestic_check1 == "D" && domestic_check2 == "D")
                {
                    totlpc.Text = (Convert.ToInt32(BookingString.Split(',')[0]) + pric).ToString();
                }
                else
                {
                    totlpc.Text = BookingString.Split(',')[0];
                }
                //pric = Convert.ToInt32(price);
            }
            //shashank


        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");

        }
    }
}