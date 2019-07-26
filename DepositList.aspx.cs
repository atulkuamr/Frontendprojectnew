using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class DepositList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Page.IsPostBack))
        {
            //CheckSecurity(0);
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
                DUR_Depart.Text = txtNew[0];
                DUR_Back.Text = txtNew[1];
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

    protected void Button1_Click(object sender, System.EventArgs e)
    {
        string url = "DepositList.aspx?SelectDates=" + DUR_Depart.Text + "," + DUR_Back.Text + ",";
        Response.Redirect(url);
    }

    protected void Button2_Click(object sender, System.EventArgs e)
    {
        string strLine = "";
        string sfileName = null;
        string filePath = null;
        FileStream objFileStream = default(FileStream);
        StreamWriter objStreamWriter = default(StreamWriter);
        Random nRandom = new Random(DateTime.Now.Millisecond);
        filePath = Server.MapPath("ExcelReport");
        sfileName = filePath + "\\" + DateTime.Now.ToString("yyyyMMdd") + ".csv";

        objFileStream = new FileStream(sfileName, FileMode.OpenOrCreate, FileAccess.Write);
        objStreamWriter = new StreamWriter(objFileStream);

        string RefAgency = Session["RefAgency"].ToString();
        int count = 1;
        string AgentID = "";
        if (Session["BookUserID"].ToString() == "")
        {
            AgentID = Session["BookUserID"].ToString();
        }
        else
        {
            AgentID = Session["GUserID"].ToString();
        }
        string sql = "";
        string txt00 = "";
        string txt01 = "";
        string[] txt1 = Regex.Split(DUR_Depart.Text + "," + DUR_Depart.Text, ",");
        if (txt1[0] == "" && txt1[1] == "")
        {
            txt1[0] = System.DateTime.Now.ToString();
            txt1[1] = System.DateTime.Now.ToString();
        }

        if (txt1[0] == "")
        {
            txt00 = ConvertDateFormat(txt1[0]);
        }

        if (txt1[1] == "")
        {
            txt01 = ConvertDateFormat(txt1[1]);
        }
        if (!string.IsNullOrEmpty(txt1[0]) & !string.IsNullOrEmpty(txt1[1]))
        {
            sql = "select * from BankDeposit where depositupdateflag=1 and convert(char(8),substring(UpdateDate,7,4) + substring(UpdateDate,4,2) + substring(UpdateDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
        }
        else if (!string.IsNullOrEmpty(txt1[0]))
        {
            sql = "select * from BankDeposit where depositupdateflag=1 and convert(char(8),substring(UpdateDate,7,4) + substring(UpdateDate,4,2) + substring(UpdateDate,1,2)) >= '" + txt00 + "'";
        }
        else if (!string.IsNullOrEmpty(txt1[1]))
        {
            sql = "select * from BankDeposit where depositupdateflag=1 and convert(char(8),substring(UpdateDate,7,4) + substring(UpdateDate,4,2) + substring(UpdateDate,1,2)) <= '" + txt01 + "'";
        }
        SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
        if (sdr.HasRows)
        {
            strLine = "\"S.No." + "\",\"" + "Agent Code" + "\",\"" + "Agency Name" + "\",\"" + "Requested Amount" + "\",\"" + "Bank Name" + "\",\"" + "Deposited Amount" + "\",\"" + "Requested date" + "\",\"" + "Deposited Date" + "\",\"" + "Executive Name" + "\",\"" + "Bank Narration\"";
            objStreamWriter.WriteLine(strLine);
            while (sdr.Read())
            {
                strLine = "\"" + count + "\",\"" + DB.CommonDatabase.GetValue(sdr, "agentcode") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "Description") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "DepositAmt") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "BankName") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "CreditedAmt") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "Creationdate") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "Updatedate") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "executivename") + "\",\"" + DB.CommonDatabase.GetValue(sdr, "banknarration") + "\"";
                objStreamWriter.WriteLine(strLine);
                count = count + 1;
            }
        }
        strLine = "";
        sdr.Close();
        objStreamWriter.Close();
        objFileStream.Close();
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Buffer = true;
        Response.AddHeader("Content-Disposition", "attachment;filename=" + DateTime.Now.ToString("yyyyMMdd") + ".csv");
        Response.Charset = "";
        Response.ContentType = "text/csv";
        Response.AppendHeader("Content-Encoding", "deflate");
        Response.TransmitFile(sfileName);
        Response.End();
        Response.Clear();
        Response.WriteFile(sfileName);
        HttpResponse.RemoveOutputCacheItem(sfileName);
        Response.Output.Write(sfileName.ToString());
        Response.Flush();
    }

    public static string ConvertDateFormat(string DateVal)
    {
        string functionReturnValue = null;
        if (!string.IsNullOrEmpty(DateVal))
        {
            string[] dtval = Regex.Split(DateVal, "/");
            string day1 = dtval[0];
            if (day1.Length == 1)
            {
                day1 = "0" + day1;
            }
            string mnth1 = dtval[1];
            if (mnth1.Length == 1)
            {
                mnth1 = "0" + mnth1;
            }
            string yr1 = dtval[2];
            if (yr1.Length == 2)
            {
                yr1 = "20" + yr1;
            }
            functionReturnValue = yr1 + mnth1 + day1;
        }
        return functionReturnValue;
    }
}