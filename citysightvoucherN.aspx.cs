using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class citysightvoucherN : System.Web.UI.Page
{
    public SqlDataReader sdr;
    public string sql = string.Empty;
    public string city = string.Empty;
    public string country = string.Empty;
    public string date = string.Empty;
    public string number = string.Empty;
    public string confirmation = string.Empty;
    public string cname = string.Empty;
    public string tpax = string.Empty;
    public string tinf = string.Empty;
    public string tsen = string.Empty;
    public string tadt = string.Empty;
    public string tchd = string.Empty;
    public string agencydetails = string.Empty;
    public string day = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        string bookingref = Request.QueryString["RID"];
        //other.Visible = false;
        string Sql = "Select * from HopOnHopOffBookingDetails where bookingid='" + bookingref + "'";
        sdr = DB.CommonDatabase.DataReader(Sql);
        if (sdr.Read())
        {
            agencydetails = sdr.GetString(2).Split('$')[1];
            country = sdr.GetString(2).Split('~')[0].Split('/')[4];
            city = sdr.GetString(2).Split('~')[1];
            date = sdr.GetString(3);
            number = sdr.GetString(1).Split('_')[1];
            confirmation = sdr.GetString(1);
            int senlenghth = Convert.ToInt16(sdr.GetString(2).Split('~')[5].Split('!')[0]);//Mr,Mr,Master,Master,//rr,hgf,gfc,hgj,//fg,ytr,hk,gfc,
            string[] arr = sdr.GetString(2).Split('/');
            //string name = "";
            //for (int i = 0; i < arr.Length - 2; i++)
            //{
            //    cname += arr[i].Split(',')[senlenghth] + " ";
            //}
            for (int i = 0; i <arr[0].Split(',').Length-1; i++)
            {
                cname += arr[0].Split(',')[i] + " " + arr[1].Split(',')[i] + " " + arr[2].Split(',')[i]+" ,";
                //if (arr[0].Split(',')[i] == "Mr")
                //    cname += "(A) ,";
                //else
                //    cname += "(C) ,";
            }
            cname = cname.TrimEnd(',');
            tpax = (Convert.ToInt32(sdr.GetString(2).Split('~')[2]) + Convert.ToInt32(sdr.GetString(2).Split('~')[3]) + Convert.ToInt32(sdr.GetString(2).Split('~')[4]) + Convert.ToInt32(sdr.GetString(2).Split('~')[5].Split('!')[0])).ToString();
            tadt = sdr.GetString(2).Split('~')[2];
            tchd = sdr.GetString(2).Split('~')[3];
            tinf = sdr.GetString(2).Split('~')[4];
            tsen = sdr.GetString(2).Split('~')[5].Split('!')[0];
            day =  sdr.GetString(2).Split('!')[1].Split('$')[0].TrimEnd('~').Split('~')[1];
        }
    }
}