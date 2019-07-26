using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cancelremark : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Page.IsPostBack))
        {
            string Sql = "select remarks from reservationtable where ReservationID = '" + Request.QueryString["RefID"] + "'";
            SqlDataReader sdr =DB.CommonDatabase.DataReader(Sql);
            try
            {
                sdr.Read();
                Remarks.Text = sdr["remarks"].ToString();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                sdr.Close();
            }
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request.QueryString["RefID"]))
            {
                string sSQL = "Update reservationtable Set " + "remarks=" + "'" + Remarks.Text + "'" + " " + " Where reservationid='" + Request.QueryString["RefID"] + "'";
                DB.CommonDatabase.RunQuery(sSQL);
            }
        }
        catch (Exception ex)
        {
        }
      
    }
}