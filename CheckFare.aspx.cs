using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckFare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)

    {
        if (Session["logi"] == null || Session["logi"] == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Your session is expired.Please login first.');window.location='loginpage1.aspx';", true);
            return;
        }
        string DataString = string.Empty; string Fare = string.Empty; string Strings = string.Empty;
        if (Request.QueryString["Str"] != null)
            Strings = cls.CommonClass.Base64Decode(Request.QueryString["Str"].ToString());
        if (Request.QueryString["Fare"] != null)
            Fare = cls.CommonClass.Base64Decode(Request.QueryString["Fare"].ToString());
        Session["FareString"] = Fare;
        Session["FlightData"] = Strings;
        string Searchstring = Session["SearchString"].ToString();
        string key = Session["key"].ToString();
        //CommonClass ObjComm = new CommonClass();
        //DataString = CommonClass.Base64Decode(Strings);
        TBOv10 ObjTbo = new TBOv10(); string CheckResult = string.Empty;
        //Anjali
        if (Strings != "")
        {
            if (Strings.Contains("UAPIAvail"))
            {
                CheckResult = ObjTbo.Uapi_checkFare(Strings + "," + Searchstring, Fare, key);
                if (CheckResult.ToUpper().Contains("TRUE"))
                {
                    Response.Redirect("BookingDetailsPage.aspx?Bookdata=" + cls.CommonClass.Base64Encode(Strings + "," + Searchstring) + "");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Flight fare has changed.Please select another flight for booking.');window.location='SearchPage.aspx';", true);
                    return;
                }
            }
            else
            {
                CheckResult = (Searchstring.Split(';')[0].ToUpper() == "TWO" && (Searchstring.Split(';')[15].ToUpper() == "D" && Searchstring.Split(';')[16].ToUpper() == "D")) ? ObjTbo.TBOCheckFare(Strings + "," + Searchstring + "," + Fare) : ObjTbo.TBOCheckFare(Strings + "," + Searchstring);
                if (CheckResult.ToString().ToUpper() == "TRUE" || CheckResult.ToString().ToUpper() == "TRUE`TRUE")
                {
                    Response.Redirect("BookingDetailsPage.aspx?Bookdata=" + cls.CommonClass.Base64Encode(Strings + "," + Searchstring) + "");
                }
                else if (CheckResult.ToString().ToUpper().Contains("FALSE-REPRICE"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Flight fare has changed.Please select another flight for booking.');window.location='SearchPage.aspx';", true);
                    return;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Insufficient balance.Please contact support team.');window.location='SearchPage.aspx';", true);
                    return;
                }
            }
        }

        // old
        //if (Strings != "")
        //{
        //    if (Strings.Contains("UAPIAvail"))
        //    {
        //        CheckResult = ObjTbo.Uapi_checkFare(Strings + "," + Searchstring, Fare, key);
        //        if (CheckResult.Contains("True"))
        //        {
        //            Session["changefare"] = "";
        //            Response.Redirect("BookingDetailsPage.aspx?Bookdata=" + cls.CommonClass.Base64Encode(Strings + "," + Searchstring) + "");
        //        }
        //        else
        //        {
        //            Session["changefare"] = "";// "The rates for the selected Flight(s) have changed. The New Rate is Rs. " + CheckResult.Split(':')[1] + ". Please confirm below if you accept this.";
        //            Response.Redirect("BookingDetailsPage.aspx?Bookdata=" + cls.CommonClass.Base64Encode(Strings + "," + Searchstring) + "");
        //        }
        //    }       

        //    //else
        //    //{
        //    //    CheckResult = ObjTbo.TBOCheckFare(Strings + "," + Searchstring);
        //    //    CheckResult = "True"; 
        //    //    Response.Redirect("BookingDetailsPage.aspx?Bookdata=" + cls.CommonClass.Base64Encode(Strings + "," + Searchstring) + ""); 
        //    //  
        //    //}
        //}
    }
}

