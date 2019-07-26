using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Server = System.Web.HttpRequest;
using System.Data.SqlClient;

public partial class CheckLogs : System.Web.UI.Page
{
    public SqlDataReader sdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["userid"].ToString()))
        {
            Response.Redirect("AdminLogin.aspx");
        }
        if (Page.IsPostBack == false)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["session"]))
            {
                updatetype.SelectedValue = Request.QueryString["session"];
            }
            string StDate = GetParam("SelectDates");
            if (string.IsNullOrEmpty(Request.QueryString["SelectDates"]))
            {
                StDate = System.DateTime.Today + "," + System.DateTime.Today;
            }
            else
            {
                StDate = Request.QueryString["SelectDates"];
            }
            if (StDate.Length > 0)
            {
                string[] txtNew = StDate.Split(',');
                Depart.Text = txtNew[0];
                Back.Text = txtNew[1];
            }
        }
    }

    public string GetParam(string ParamName)
    {
        string functionReturnValue = null;
        string param = "";
        if ((Request.QueryString.Count > 0))
        {
            param = Request.QueryString[ParamName];
        }
        else
        {
            param = "";
        }
        if (string.IsNullOrEmpty(param))
        {
            functionReturnValue = "";
        }
        else
        {
            functionReturnValue = param;
        }
        return functionReturnValue;
    }

    public string func_Sorted_By(string Form_Sorted, string Sorted_By)
    {
        string Str = Request.QueryString["idnow"].ToString();
        return "idnow=" + Str + "&Form_Sorted=" + Form_Sorted + "&Sorted_By=" + Sorted_By;
    }
    
    public string func_Form_Sorted(string vValue)
    {
        string functionReturnValue = null;
        if ((vValue == "1"))
        {
            functionReturnValue = "convert(char(14),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2) + substring(LastUpdateDate,12,2) + substring(LastUpdateDate,15,2) + substring(LastUpdateDate,18,2))";
        }
        else
        {
            functionReturnValue = "convert(char(14),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2) + substring(LastUpdateDate,12,2) + substring(LastUpdateDate,15,2) + substring(LastUpdateDate,18,2))";
        }
        return functionReturnValue;
    }
}