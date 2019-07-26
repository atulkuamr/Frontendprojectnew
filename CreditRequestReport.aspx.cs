using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreditRequestReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["usertype"].ToString() == "OO" || Session["usertype"].ToString() == "D" || Session["usertype"].ToString() == "OOU")
            {
                string StDate = "";

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
                    datepicker.Value = txtNew[0];
                    datepickerto.Value = txtNew[1];
                }
                //code test
                string sSQL = null;
                SqlDataReader sdr = default(SqlDataReader);
                if ((GetParam("delete") == "yes"))
                {
                    sSQL = "select * from OfflineCreditLog Where sID = " + ToSQL(GetParam("idnow"), "Number");
                    sdr = DB.CommonDatabase.DataReader(sSQL);
                    try
                    {
                        if (sdr.HasRows)
                        {
                            sdr.Read();
                            sSQL = "Delete from OfflineCreditLog where sID=" + ToSQL(GetParam("idnow"), "Number");
                            DB.CommonDatabase.DataReader(sSQL);
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    finally
                    {
                        sdr.Close();
                        sdr = null;
                    }
                }
            }
            else
            {
                Response.Redirect("index.htm");
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

    public static string ToSQL(string Value, string sType)
    {
        string functionReturnValue = null;
        //on error resume next
        string Param = Value;
        if ((Param.Length == 0))
        {
            functionReturnValue = "Null";
        }
        else
        {
            if (sType == "Number")
            {
                functionReturnValue = Convert.ToDouble(Param.Replace(",", ".")).ToString();
            }
            else
            {
                functionReturnValue = "'" + Param.Replace("'", "''") + "'";
            }
        }
        return functionReturnValue;
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        Response.Redirect("creditrequestreport.aspx?SelectDates=" + datepicker.Value + "," + datepickerto.Value);
    }
}