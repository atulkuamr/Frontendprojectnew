using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookingdetails : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //string BookingDetails = Request.QueryString["SearchVal"].ToString();
        string SightseeingDetail = Session["SearchVal"].ToString();
        //string SightseeingDisplay = Request.QueryString["SearchVal"].ToString();

        //string totpassanger = (BookingDetails.Split('~')[0].Split(',').Length - 1).ToString();
        //string totalbookingdetail = BookingDetails + "$" + SightseeingDetail + "$" + SightseeingDisplay;
        //Session["BookData"] = totalbookingdetail;


        //{
        //    string CustomerDetails = Request.QueryString["BookingDetails"].ToString();

            //    Session["Bookingdetails"] = Request.QueryString["BookingData"].ToString();
            //    string bookdet = Session["Bookingdetails"].ToString();

            //    //2]TBOroomRS_Travstarz_20160510124342.txt$J7pYWOOHd0wKnInhOZ57 g==|DM-ON|FIT|322(HASH)(HASH)(HASH)
            //    string[] arr = bookdet.Split('!');
            //    string policydet = "";
            //    if (arr[5].ToUpper() == "HOTELBEDS")
            //    {
            //        policydet = arr[16] + "$" + arr[11];
            //    }
            //    nav_dob.commoncls obj = new nav_dob.commoncls();
            //    string response = obj.GetCancelPolicy(policydet, "", "HOTELBEDS", "INR");

            //    if (!string.IsNullOrEmpty(response))
            //    {
            //        //XmlDocument doc = cf.CommonFunction.JSONtoXML(response);
            //        Xml doc = naveen.CommonFunction.JSONtoXML(response);
            //        XmlNodeList cnlplcy = doc.GetElementsByTagName("Cancellationpolicies");
            //        foreach (XmlNode rootnode in cnlplcy)
            //        {
            //            foreach (XmlNode chnode in rootnode)
            //            {
            //                string cancellationcharge = chnode["Cancellationcharge"].InnerText;
            //                if (cancellationcharge.Contains("|"))
            //                {
            //                    response = cancellationcharge.Replace("|", "</li><li>").Replace("!", "");
            //                }
            //                else
            //                {
            //                    response = cancellationcharge.Replace("!", "");
            //                }
            //            }
            //            cancelpolicy.InnerHtml = "<h3> Cancellation Policy Details </h3><ul><li>" + response + "</li></ul><hr/>";
            //}
        //}

    }
}