using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Web.Services;
using clsdb = DB.CommonDatabase;

public partial class CountryCity : System.Web.UI.Page
{
    public List<string> obj1 = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    string selectedCountry = Request["q"];
        //    if (selectedCountry.Length >= 3)
        //    {
        //        string arr = string.Empty;                
        //        Response.Clear();
        //        string sql = "select * from hCountryCity where CityCode+CityName+CountryCode+CountryName like '%" + selectedCountry.Trim().Replace("'", "''") + "%' order by CityName";
        //        String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
        //        String sConn = "Server=" + ConnectionServer + ";" + ConfigurationManager.AppSettings.Get("ConnectionString");
        //        SqlConnection MyConnection = new SqlConnection(sConn);
        //        MyConnection.Open();
        //        DataTable dt = new DataTable();
        //        SqlCommand command = new SqlCommand(sql, MyConnection);
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        adapter.Fill(dt);
        //        MyConnection.Close();
        //        StringBuilder sb = new StringBuilder();
        //        string str = string.Empty;                
        //        foreach (DataRow row in dt.Rows)
        //        {
        //            str = row["CityName"].ToString() + "," + row["CityCode"].ToString() + "," + row["CountryName"].ToString() + "," + row["CountryCode"].ToString();
        //        }
        //        Response.Write(obj1.ToArray());
        //    }
        //    else
        //    {
        //        Response.Clear();
        //        Response.End();
        //    }
        //}
        //else
        //{
        //    Response.Clear();
        //    Response.End();
        //}
    }

    public static string GetcityName1(string user)
    {
        string finalres = string.Empty; string finlstring = string.Empty;
        try
        {
            string Cityres = string.Empty; string Airportcode = string.Empty;
            String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
            String sConn = "Server=" + ConnectionServer + ";" + ((ConfigurationManager.AppSettings.Get("ConnectionString")));
            SqlConnection MyConnection = new SqlConnection(sConn);
            MyConnection.Open();
            string sql = "";
            sql = "select a.CityCode,a.CityName,a.CountryCode,a.CountryName from hCountryCity a where a.CityName like '" + user + "%' or a.countryname like '" + user + "%' or a.CountryCode like '" + user + "%' order by a.CountryName";
            SqlCommand command = new SqlCommand(sql, MyConnection);
            SqlDataReader adoDR = command.ExecuteReader();
            try
            {
                StringBuilder sb = new StringBuilder();
                if (adoDR.HasRows)
                {
                    sb.Append("{" + "\"CITY\":");
                    sb.Append("[");
                    while (adoDR.Read())
                    {
                        try
                        {
                            if (Cityres == "")
                            {
                                sb.Append("{");
                                Cityres = adoDR["CityName"].ToString() + "," + adoDR["CountryCode"].ToString() + "," + adoDR["CountryName"].ToString();
                                finlstring = Cityres;
                            }
                            else
                            {
                                sb.Append("{");
                                Cityres = adoDR["CityName"].ToString() + "," + adoDR["CountryCode"].ToString() + "," + adoDR["CountryName"].ToString();
                                finlstring += Cityres = ":" + Cityres;
                            }
                        }
                        catch { }
                    }
                    sb.Append("]");
                    sb.Append("}");
                    finalres = finlstring;
                }
            }
            catch
            {
            }
        }
        catch (Exception)
        {
            throw;
        }
        return finalres;
    }

    [WebMethod]
    public static string[] GetcityName(string prefix)
    {
        List<string> country = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select a.CityCode,a.CityName,a.CountryCode,a.CountryName from hCountryCity a where a.CityName like '" + prefix + "%' or a.countryname like '" + prefix + "%' or a.CountryCode like '" + prefix + "%' order by a.CountryName";
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        country.Add(string.Format("{3}, {0}, {1}", sdr["CountryCode"], sdr["CountryName"], sdr["CityCode"], sdr["CityName"]));
                    }
                }
                conn.Close();
            }
        }
        return country.ToArray();
    }
}