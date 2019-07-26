using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class citysightcustdet : System.Web.UI.Page
{
    public SqlDataReader sdr;
    public string finaldata2 = string.Empty;
    public string adt = string.Empty;
    public string chd = string.Empty;
    public string infant = string.Empty;
    public string seniors = string.Empty;
    public string day = string.Empty;
    public string orgday = string.Empty;
    public string ah = string.Empty;
    public string code = string.Empty;
    public string adultage = string.Empty;
    public string childage = string.Empty;
    public string seniorage = string.Empty;
    public string infantage = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        finaldata2 = Request.QueryString["custdet"];
        Session["ah"] = finaldata2;
        //South Africa~Cape Town~1~1~1~1!1935.2~                                    1 Day Hop On Hop Off~3382.5~                                    2 Day Hop On Hop Off~
        adt = finaldata2.Split('~')[2];
        chd = finaldata2.Split('~')[3];
        infant = finaldata2.Split('~')[4];
        seniors = finaldata2.Split('~')[5].Split('!')[0];
        day = finaldata2.Split('!')[1];
        string sql = "Select SightSeeingCode from CitySightSeeingCountryCity where city='" + finaldata2.Split('~')[1]+"'";
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
       // orgday=day.Split('~')
        //South Africa~Cape Town~2~1~1~1
    }
    //protected void btn_Click(object sender, EventArgs e)
    //{
    //    var abcb = finaldata2;
    //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "confirmbook()", true);
    //}
}