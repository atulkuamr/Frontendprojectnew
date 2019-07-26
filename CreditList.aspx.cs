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

public partial class CreditList : System.Web.UI.Page
{
    public string UserType = "OO";
    public string curSymbol = "";
    public SqlDataReader sdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        string SQL = "";
        SQL = "Select a.sid,a.ActiveFlag,a.AvailableCredit,a.AvailableCash,a.StatementBalance,a.MinLimit,a.Uid,b.agencyName,b.Usertype,b.Currency,b.Agentcode from AdminCreditLimit a, tblAgentDetails b where a.Uid=b.userid";
        sdr = DB.CommonDatabase.DataReader(SQL);
    }

    //protected void export2Excel_Click(object sender, EventArgs e)
    //{
    //    export_excel();
    //}

    //protected void export_excel()
    //{
    //    string strLine = "";
    //    string sfileName = null;
    //    string filePath = null;
    //    FileStream objFileStream = default(FileStream);
    //    StreamWriter objStreamWriter = default(StreamWriter);
    //    Random nRandom = new Random(DateTime.Now.Millisecond);
    //    filePath = Server.MapPath("ExcelReport");
    //    sfileName = filePath + "\\" + DateTime.Now.ToString("yyyyMMdd") + ".csv";
    //    objFileStream = new FileStream(sfileName, FileMode.OpenOrCreate, FileAccess.Write);
    //    objStreamWriter = new StreamWriter(objFileStream);

    //    string sSQL = "select b.agencyName, b.Agentcode, b.FirstName, b.LastName, a.ActiveFlag, a.MinLimit, a.AvailableCredit, b.City, b.State, b.Country, b.Emailid, b.PhoneNo, b.Contact, b.address from AdminCreditLimit a, tblAgentDetails b where a.Uid=b.userid";

    //    if (Session["UserType"] == "OO" | Session["UserType"] == "OOU" | Session["UserType"] == "O")
    //    {
    //        sSQL = sSQL + " and b.ValidationCode <> 'D'";
    //    }
    //    int Count = 1;
    //    SqlDataReader sdr = default(SqlDataReader);
    //    string Airline = null;
    //    sdr = DB.CommonDatabase.DataReader(sSQL);
    //    if (sdr.HasRows)
    //    {
    //        try
    //        {
    //            strLine = "\"S.No." + "\",\"" + "Agency Name" + "\",\"" + "Agent Code" + "\",\"" + "Contact Person" + "\",\"" + "Active" + "\",\"" + "Credit Limit" + "\",\"" + "Account Balance" + "\",\"" + "City" + "\",\"" + "State" + "\",\"" + "Country" + "\",\"" + "EMail" + "\",\"" + "Mobile" + "\",\"" + "Phone" + "\",\"" + "Address\"";
    //            objStreamWriter.WriteLine(strLine);
    //            strLine = "";
    //            while (sdr.Read())
    //            {
    //                if (sdr["ActiveFlag"].ToString() == "true") { Airline = "Active"; }
    //                else { Airline = "In-Active"; }
    //                string contactperson = sdr["FirstName"].ToString() + " " + sdr["LastName"].ToString();
    //                strLine = "\"" + Count + "\",\"" + sdr["agencyName"].ToString() + "\",\"" + sdr["Agentcode"].ToString() + "\",\"" + contactperson + "\",\"" + Airline + "\",\"" + sdr["MinLimit"].ToString() + "\",\"" + sdr["AvailableCredit"].ToString() + "\",\"" + sdr["City"].ToString() + "\",\"" + sdr["State"].ToString() + "\",\"" + sdr["Country"].ToString() + "\",\"" + sdr["Emailid"].ToString() + "\",\"" + sdr["PhoneNo"].ToString() + "\",\"" + sdr["Contact"].ToString() + "\",\"" + sdr["address"].ToString() + "\"";

    //                objStreamWriter.WriteLine(strLine);
    //                strLine = "";
    //                Count = Count + 1;
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //        }
    //        finally
    //        {
    //            sdr.Close();
    //            sdr = null;
    //        }
    //    }
    //    else
    //    {
    //        strLine = "No Records Found";
    //    }

    //    objStreamWriter.Close();
    //    objFileStream.Close();
    //    Response.ClearContent();
    //    Response.ClearHeaders();
    //    Response.Buffer = true;
    //    Response.AddHeader("Content-Disposition", "attachment;filename=" + DateTime.Now.ToString("yyyyMMdd") + ".csv");
    //    Response.Charset = "";
    //    Response.ContentType = "text/csv";
    //    Response.AppendHeader("Content-Encoding", "deflate");
    //    Response.TransmitFile(sfileName);
    //    Response.End();
    //    Response.Clear();
    //    Response.WriteFile(sfileName);
    //    HttpResponse.RemoveOutputCacheItem(sfileName);
    //    Response.Output.Write(sfileName.ToString());
    //    Response.Flush();
    //}

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string sql = "Select a.sid,a.ActiveFlag,a.AvailableCredit,a.AvailableCash,a.StatementBalance,a.MinLimit,a.Uid,b.agencyName,b.Usertype,b.Currency,b.Agentcode from AdminCreditLimit a, tblAgentDetails b where a.Uid=b.userid";
        if (ddlType.SelectedItem.ToString() != "ALL")
        {
            sql += " and b.loginType='" + ddlType.SelectedItem + "'";
        }
        sdr = DB.CommonDatabase.DataReader(sql);
        
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql = "Select a.sid,a.ActiveFlag,a.AvailableCredit,a.AvailableCash,a.StatementBalance,a.MinLimit,a.Uid,b.agencyName,b.Usertype,b.Currency,b.Agentcode from AdminCreditLimit a, tblAgentDetails b where a.Uid=b.userid";
        if (ddlType.SelectedItem.ToString() != "ALL")
        {
            sql += " and b.loginType='" + ddlType.SelectedItem + "'";
        }
        sdr = DB.CommonDatabase.DataReader(sql);
    }

    protected void ExportCSV(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select b.agencyName, b.Agentcode, b.FirstName, b.LastName, a.ActiveFlag, a.MinLimit, a.AvailableCredit, b.City, b.State, b.Country, b.Emailid, b.PhoneNo, b.Contact, b.address from AdminCreditLimit a, tblAgentDetails b where a.Uid=b.userid"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);                 
                        string csv = string.Empty;
                        foreach (DataColumn column in dt.Columns)
                        {                          
                            csv += column.ColumnName + ',';
                        }                
                        csv += "\r\n";
                        foreach (DataRow row in dt.Rows)
                        {
                            foreach (DataColumn column in dt.Columns)
                            {                                
                                csv += row[column.ColumnName].ToString().Replace(",", ";") + ',';
                            }                     
                            csv += "\r\n";
                        }                       
                        Response.Clear();
                        Response.Buffer = true;
                        Response.AddHeader("content-disposition", "attachment;filename=Akshay.csv");
                        Response.Charset = "";
                        Response.ContentType = "application/text";
                        Response.Output.Write(csv);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
        }
    }

}