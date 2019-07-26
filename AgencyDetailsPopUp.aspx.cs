using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AgencyDetailsPopUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string SQL = "";
        SQL = "Select * from tblAgentDetails where userid='" + Request.QueryString["AgencyID"].ToString() + "'";
        SqlDataReader sdr;
        sdr = DB.CommonDatabase.DataReader(SQL);
        if (sdr.Read())
        {
            Agency.Text = sdr["agencyName"].ToString();
            Label1.Text = sdr["FirstName"].ToString() + " " + sdr["LastName"].ToString();
            Phone.Text = sdr["PhoneNo"].ToString();
            Mobile.Text = sdr["Contact"].ToString();
            Label2.Text = sdr["Emailid"].ToString();
            Address.Text = sdr["address"].ToString();
            PinCode.Text = sdr["PinCode"].ToString();
            City.Text = sdr["City"].ToString();
            State.Text = sdr["State"].ToString();
            Country.Text = sdr["Country"].ToString();
            sdr.Close();
        }
    }
}