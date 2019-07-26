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

public partial class DefineCredit : System.Web.UI.Page
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

    protected void export2Excel_Click(object sender, EventArgs e)
    {
        export_excel();
    }

    protected void export_excel()
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

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string sql = "Select a.sid,a.ActiveFlag,a.AvailableCredit,a.AvailableCash,a.StatementBalance,a.MinLimit,a.Uid,b.agencyName,b.Usertype,b.Currency,b.Agentcode from AdminCreditLimit a, tblAgentDetails b where a.Uid=b.userid";
        if (ddlType.SelectedItem.ToString() != "ALL")
        {
            sql += " and b.loginType='" + ddlType.SelectedItem + "'";
        }
        else if (txtAgencyName.Text != "")
        {
            sql += " and b.agencyName like '%" + txtAgencyName.Text + "%'";
        }
        sdr = DB.CommonDatabase.DataReader(sql);
    }
}