using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;
using System.Text;

public partial class CancellationPolicy : System.Web.UI.Page
{
    public string response = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string policydata = Request.QueryString["CancelPolicy"].ToString().Replace("(HASH)","#");
        string searchparam = Session["Param"].ToString();
        cls.CommonClass obj = new cls.CommonClass();
        PopUp.Visible = true;
        string cat = Session["Category"].ToString();
        try
        {
            if (policydata.Split('$')[3].ToUpper() == "TBO")
            {
                response = obj.GetCancelPolicy(policydata, "", policydata.Split('$')[3], cat);
            }
            else if (policydata.Split('$')[3].ToUpper() == "DOTW")
            {
                response = obj.GetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], cat);
            }
            else if (policydata.Split('$')[3].ToUpper() == "DESIYA")
            {
                response = obj.GetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], cat);
            }
            else if (policydata.Split('$')[3].ToUpper() == "EZEEGO1")
            {
                response = obj.GetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], cat);
            }
            else if (policydata.Split('$')[3].ToUpper() == "HOTELBEDS")
            {
                response = obj.GetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], cat);
            }
            else if (policydata.Split('$')[3].ToUpper() == "ABREU")
            {
                response = obj.GetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], cat);//"INR" ckeck
            }
            else if (policydata.Split('$')[3].ToUpper() == "TRAVSTARZ")
            {
                response = obj.GetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], cat);
            }
            else if (policydata.Split('$')[3].ToUpper() == "JACTRAVEL")
            {
                response = obj.JacGetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], "INR");
            }
            else
            {
                response = obj.GetCancelPolicy(searchparam, policydata, policydata.Split('$')[3], cat);
            }
            string cancelpolicyjson = response;
            if (!string.IsNullOrEmpty(cancelpolicyjson))
            {
                XmlDocument doc = CF.CommonFunction.JSONtoXML(cancelpolicyjson);
                XmlNodeList cnlplcy = doc.GetElementsByTagName("Cancellationpolicies");
                foreach (XmlNode rootnode in cnlplcy)
                {
                    foreach (XmlNode chnode in rootnode)
                    {
                        string cancellationcharge = chnode["Cancellationcharge"].InnerText;
                        if (cancellationcharge.Contains("|"))
                        {
                            response = cancellationcharge.Replace("!", "");
                        }
                        else
                        {
                            response = cancellationcharge.Replace("!", "");
                        }
                    }
                    //PopUp.InnerHtml = "<div><div style='margin-left:95%; margin-top:-10px;'><span style='cursor:pointer;' onclick='javascript:cncly(event);'><u>Close</u></span></div><div><center><h4><b>Cancellation Policy</b></h4></center></div>" + response + "</div>";
                }
            }
            else
            {
                response = "No Cancellation Policy Found. Deadline: " + DateTime.Now.ToString("yyyy-MM-dd");
                //PopUp.InnerHtml = "<div><div style='margin-left:95%; margin-top:-10px;'><span style='cursor:pointer;' onclick='javascript:cncly(event);'><u>Close</u></span></div><div><center><h4><b>Cancellation Policy</b></h4></center></div>No cancellation Policy Found.</div>";
            }
        }
        catch (Exception ex)
        {
            string ServerPath = Server.MapPath("ErrorLogs");
            string DataFile1 = "CancellationPolicy" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
            FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
            StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
            try
            {
                fp1.WriteLine(ex.Message.ToString());
            }
            catch (Exception Ex)
            {
            }
            finally
            {
                fp1.Close();
                fp1 = null;
            }
            response = "No Cancellation Policy Found. Deadline: " + DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
}