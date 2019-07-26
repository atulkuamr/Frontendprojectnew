using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddMarkup : System.Web.UI.Page
{
    public string supplier1 = string.Empty, amt = string.Empty, per = string.Empty, transfermarkup = string.Empty, sightseeingmarkup = string.Empty;
    public string transfercomm = string.Empty, sightseeingcomm = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            string Sql = "select * from Markup";
            SqlDataReader sdr = DB.CommonDatabase.DataReader(Sql);
            try
            {
                while (sdr.Read())
                {
                    supplier1 = sdr["hotelmarkup"].ToString();
                    amt = sdr["hotelcomm"].ToString();
                    sightseeingmarkup = sdr["sightseeingmarkup"].ToString();
                    sightseeingcomm = sdr["sightseeingcomm"].ToString();
                    transfermarkup = sdr["transfermarkup"].ToString();
                    transfercomm = sdr["transfercomm"].ToString();
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                sdr.Close();
            }

            //SIGHTSEEING
            SSmarkup.Value = sightseeingmarkup.Split('~')[1]; SSmarkupPer.Value = sightseeingmarkup.Split('~')[2];
            //TRANSFER
            Tmarkup.Value = transfermarkup.Split('~')[1]; TmarkupPer.Value = transfermarkup.Split('~')[2];
            //HOTEL
            string[] arr = supplier1.Split('#');
            Text1.Value = arr[0].Split('~')[1]; Text2.Value = arr[0].Split('~')[2];
            Text3.Value = arr[1].Split('~')[1]; Text4.Value = arr[1].Split('~')[2];
            Text5.Value = arr[2].Split('~')[1]; Text6.Value = arr[2].Split('~')[2];
            Text7.Value = arr[3].Split('~')[1]; Text8.Value = arr[3].Split('~')[2];
            Text9.Value = arr[4].Split('~')[1]; Text10.Value = arr[4].Split('~')[2];
            Text11.Value = arr[5].Split('~')[1]; Text12.Value = arr[5].Split('~')[2];
            Text13.Value = arr[6].Split('~')[1]; Text14.Value = arr[6].Split('~')[2];
            Text15.Value = arr[7].Split('~')[1]; Text16.Value = arr[7].Split('~')[2];
        }
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        string str = "TBO" + "~" + Text1.Value + "~" + Text2.Value + "#";
        str += "DOTW" + "~" + Text3.Value + "~" + Text4.Value + "#";
        str += "TRAVELBULLZ" + "~" + Text5.Value + "~" + Text6.Value + "#";
        str += "DESIYA" + "~" + Text7.Value + "~" + Text8.Value + "#";
        str += "HOTELBEDS" + "~" + Text9.Value + "~" + Text10.Value + "#";
        str += "ABREU" + "~" + Text11.Value + "~" + Text12.Value + "#";
        str += "EZEEGO1" + "~" + Text13.Value + "~" + Text14.Value + "#";
        str += "JACTRAVEL" + "~" + Text15.Value + "~" + Text16.Value;

        string sql = "update markup set hotelmarkup='" + str + "', hotelcomm='" + str + "'";
        DB.CommonDatabase.RunQuery(sql);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql1 = "update markup set sightseeingmarkup= 'HOTELBEDS~" + SSmarkup.Value + "~" + SSmarkupPer.Value + "'";
        DB.CommonDatabase.RunQuery(sql1);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql1 = "update markup set transfermarkup= 'HOTELBEDS~" + Tmarkup.Value + "~" + TmarkupPer.Value + "'";
        DB.CommonDatabase.RunQuery(sql1);
    }

}