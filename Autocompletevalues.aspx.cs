using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;

public partial class Autocompletevalues : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string finalres = string.Empty; string Cityres = string.Empty; string finlstring = string.Empty;
        try
        {
            string Cityname = string.Empty;
            if (Request.QueryString["q"] != null)
                Cityname = Request.QueryString["q"].ToString();
            else
                Cityname = "";
            String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
            String sConn = "Server=" + ConnectionServer + ";" + ((ConfigurationManager.AppSettings.Get("ConnectionString")));
            SqlConnection MyConnection = new SqlConnection(sConn);
            MyConnection.Open(); string sql = "";
            sql = "Select * from tblcitycountry where  AirPortCode like '" + Cityname + "%'";
            SqlCommand command = new SqlCommand(sql, MyConnection);
            SqlDataReader adoDR = command.ExecuteReader();
            try
            {
                if (adoDR.HasRows)
                {
                    while (adoDR.Read())
                    {
                        try
                        {
                            adoDR.Read();
                            if (Cityres == "")
                            {
                                Cityres = adoDR["Description"].ToString() + "," + adoDR["AirPortCode"].ToString() + "," + adoDR["Country"].ToString();
                                finlstring = Cityres = "\"" + Cityres + "\"";
                            }
                            else
                            {
                                Cityres = adoDR["Description"].ToString() + "," + adoDR["AirPortCode"].ToString() + "," + adoDR["Country"].ToString();
                                finlstring += Cityres = ",\"" + Cityres + "\"";
                            }
                        }
                        catch { }
                    }
                }
            }

            catch
            {
            }
        }
        catch (Exception)
        {
        }
        finalres = "?([" + finlstring + "])" + ";";
        Response.ContentType = "text/json";
        Response.Write(finalres);
    }

    [WebMethod]
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
            sql = "Select * from tblcitycountry where  description like '" + user + "%'";
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
                                Cityres = "(" + adoDR["Description"].ToString() + ")" + "," + adoDR["AirPortCode"].ToString() + "," + adoDR["Country"].ToString();
                                finlstring = Cityres;
                                //sb.Append("\"AirportCode\":" + finlstring + "\"");
                                //sb.Append("}");
                            }
                            else
                            {
                                sb.Append("{");
                                Cityres = "(" + adoDR["Description"].ToString() + ")" + "," + adoDR["AirPortCode"].ToString() + "," + adoDR["Country"].ToString();
                                finlstring += Cityres = ":" + Cityres;
                                //sb.Append("\"AirportCode\":" + finlstring + "\"" + ",");
                                //sb.Append("}");
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
    public static string GetcityName(string user)
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
            sql = "Select * from hCountryCity where CityName like '" + user + "%'";
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
                                Cityres = adoDR["CityName"].ToString() + ", " + adoDR["CountryCode"].ToString() + ", " + adoDR["CountryName"].ToString();
                                finlstring = Cityres;
                            }
                            else
                            {
                                sb.Append("{");
                                Cityres = adoDR["CityName"].ToString() + ", " + adoDR["CountryCode"].ToString() + ", " + adoDR["CountryName"].ToString();
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

}