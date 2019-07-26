using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class citysightseeinglist : System.Web.UI.Page
{
    public string sql = "";
    public SqlDataReader sdr;
    public string usertype = string.Empty;
    public string nm = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //usertype = Session["usertype"].ToString();
        //nm = Session["loginVal"].ToString();
        sql = "Select * from HopOnHopOffBookingDetails where bookingdate='" + System.DateTime.Now.ToString("dd-MM-yyyy") + "'";
        sdr = DB.CommonDatabase.DataReader(sql);

    }

    protected void btn_Click(object sender, EventArgs e)
    {
        if (bid.Value != "" && datepicker.Value == "" && px.Value == "" && ddl.SelectedValue == "Confirmed")
        {
            sql = "Select * from HopOnHopOffBookingDetails where bookingid='" + bid.Value + "' and status='" + ddl.SelectedValue + "'";
        }
        else if (bid.Value != "" && datepicker.Value == "" && px.Value == "" && ddl.SelectedValue == "Cancelled")
        {
            sql = "Select * from HopOnHopOffBookingDetails where bookingid='" + bid.Value + "' and status='" + ddl.SelectedValue + "'";
        }
        else if (bid.Value == "" && datepicker.Value != "" && px.Value == "" && ddl.SelectedValue == "Cancelled")
        {
            sql = "Select * from HopOnHopOffBookingDetails where bookingdate='" + datepicker.Value + "' and status='" + ddl.SelectedValue + "'";
        }
        else if (bid.Value == "" && datepicker.Value != "" && px.Value == "" && ddl.SelectedValue == "Confirmed")
        {
            sql = "Select * from HopOnHopOffBookingDetails where bookingdate='" + datepicker.Value + "'and status='" + ddl.SelectedValue + "'";
        }
        else
        {
            sql = "Select * from HopOnHopOffBookingDetails where bookingdate='" + System.DateTime.Now.ToString("dd-MM-yyyy") + "'";
        }
        //else if (bid.Value == "" && datepicker.Value == "" && px.Value != "")
        //{
        //    sql = "Select * from HopOnHopOffBookingDetails where bookingdate='" + datepicker.Value + "'";
        //}
        sdr = DB.CommonDatabase.DataReader(sql);
    }

    
//    protected void btn2_Click(object sender, EventArgs e)
//    {
//        string Sql = "";
//        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
//         using (SqlConnection con = new SqlConnection(constr))
//        {
//            if (usertype == "OO")
//            {
//                Sql = "Select * from HotelBookingDetails";
//            }
//            else if (usertype == "OOU")
//            {
//                Sql = "Select * from HotelBookingDetails where EmailID ='" + nm + "'";
//            }
//             else
//            {
//                Sql = "Select SNo,BookingReference,BookingId,HotelName,EmailID,BookingDate,Status,CheckOut,CheckIn,PhoneNo,Address,Price,deadline from HotelBookingDetails where EmailID ='" + nm + "'";
//            }
//    }
}