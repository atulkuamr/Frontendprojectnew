using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Security;
using System.IO;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;
using System.Data;
using System.Globalization;
using System.Web.Services;

public partial class authenticate : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataSet ds;

    public string loginval;
    public string pass;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            loginval = Session["logi"].ToString();
            pass = Session["pass"].ToString();
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //string otp = "TRV_1699";
        string passes_id = ConfigurationManager.AppSettings.Get("nootp");
        //string Product = "Select * from otp where otp='" + otp.Value + "' and emai='" + loginval + "'";
        string Product = "Select * from otp where emai='" + loginval + "'";
        SqlDataReader reader3 = DB.CommonDatabase.DataReader(Product);
        if (reader3.Read() || passes_id.Contains(loginval))
        {
            string sql = "Select * from adminlogin where LoginFlag=1 and username='" + loginval + "' and Password ='" + pass + "'";
            SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
            try
            {
                if (sdr.Read())
                {
                    Session["loginVal"] = sdr["username"].ToString();
                    Session["AgencyName"] = sdr["agencyName"].ToString();
                    Session["Category"] = sdr["agentCategory"].ToString();
                    Session["AgentCode"] = sdr["Agencyid"].ToString();
                    Session["RefAgency"] = sdr["refagency"].ToString();
                    Session["Email"] = sdr["Email"].ToString();
                    Session["userid"] = sdr["username"].ToString();
                    Session["Usertype"] = sdr["type"].ToString();

                    CheckSelfWhiteLabelStaus();
                    Reference_Agency();

                    if (Session["white_selflabel"].ToString() == "Approved")
                    {
                        BindTravstarz();
                        DateTime serverTime = DateTime.Now;
                        string date = serverTime.ToLongDateString();
                        string time = serverTime.ToLongTimeString();
                        string sq = "INSERT into userlogindetails (currentdate,userid,logintime) Values ('" + date + "','" + loginval + "','" + time + "')";
                        DB.CommonDatabase.RunQuery(sq);
                        Session["dt"] = date + '^' + time;

                        try
                        {
                            string agencyid = string.Empty;
                            string ssql = "Select Agencyid from adminLogin where username = (select refagency from adminLogin where Agencyid='" + Session["AgentCode"].ToString() + "')";
                            SqlDataReader ssdr = DB.CommonDatabase.DataReader(ssql);
                            if (ssdr.Read())
                            {
                                Session["RefAgencyId"] = ssdr["Agencyid"].ToString();
                            }
                        }
                        catch (Exception ex)
                        {
                        }
                        try
                        {
                            string ssql1 = "Select * from userlogindetails where [userid] = '" + loginval + "' and currentdate='" + date + "' and logintime='" + time + "';";
                            SqlDataReader ssdr1 = DB.CommonDatabase.DataReader(ssql1);
                            if (ssdr1.Read())
                            {
                                Session["sid"] = ssdr1["sid"].ToString();
                            }
                        }
                        catch (Exception ex)
                        {
                        }

                        //try
                        //{
                        //    string sqll2 = "Delete otp where emai='" + loginval + "';";
                        //    DB.CommonDatabase.RunQuery(sqll2);
                        //}
                        //catch (Exception ex)
                        //{
                        //}
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "redirect", "location=('SearchPage.aspx');", true);
                    }
                    else
                    {
                        Reference_Agency();
                        CheckWhiteLabelStaus();

                        if (Session["whitelabel"].ToString() == "Approved")
                        {
                            Bind();
                            BindExtra();

                            DateTime serverTime = DateTime.Now;
                            string date = serverTime.ToLongDateString();
                            string time = serverTime.ToLongTimeString();
                            string sq = "INSERT into userlogindetails (currentdate,userid,logintime) Values ('" + date + "','" + loginval + "','" + time + "')";
                            DB.CommonDatabase.RunQuery(sq);
                            Session["dt"] = date + '^' + time;

                            try
                            {
                                string agencyid = string.Empty;
                                string ssql = "Select Agencyid from adminLogin where username = (select refagency from adminLogin where Agencyid='" + Session["AgentCode"].ToString() + "')";
                                SqlDataReader ssdr = DB.CommonDatabase.DataReader(ssql);
                                if (ssdr.Read())
                                {
                                    Session["RefAgencyId"] = ssdr["Agencyid"].ToString();
                                }
                            }
                            catch (Exception ex)
                            {
                            }
                            try
                            {
                                string ssql1 = "Select * from userlogindetails where [userid] = '" + loginval + "' and currentdate='" + date + "' and logintime='" + time + "';";
                                SqlDataReader ssdr1 = DB.CommonDatabase.DataReader(ssql1);
                                if (ssdr1.Read())
                                {
                                    Session["sid"] = ssdr1["sid"].ToString();
                                }
                            }
                            catch (Exception ex)
                            {
                            }

                            try
                            {
                                string sqll2 = "Delete otp where emai='" + loginval + "'";
                                DB.CommonDatabase.RunQuery(sqll2);
                            }
                            catch (Exception ex)
                            {
                            }
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "redirect", "location=('SearchPage.aspx');", true);
                        }
                        else
                        {
                            BindTravstarz();
                            DateTime serverTime = DateTime.Now;
                            string date = serverTime.ToLongDateString();
                            string time = serverTime.ToLongTimeString();
                            string sq = "INSERT into userlogindetails (currentdate,userid,logintime) Values ('" + date + "','" + loginval + "','" + time + "')";
                            DB.CommonDatabase.RunQuery(sq);
                            Session["dt"] = date + '^' + time;

                            try
                            {
                                string agencyid = string.Empty;
                                string ssql = "Select Agencyid from adminLogin where username = (select refagency from adminLogin where Agencyid='" + Session["AgentCode"].ToString() + "')";
                                SqlDataReader ssdr = DB.CommonDatabase.DataReader(ssql);
                                if (ssdr.Read())
                                {
                                    Session["RefAgencyId"] = ssdr["Agencyid"].ToString();
                                }
                            }
                            catch (Exception ex)
                            {
                            }
                            try
                            {
                                string ssql1 = "Select * from userlogindetails where [userid] = '" + loginval + "' and currentdate='" + date + "' and logintime='" + time + "';";
                                SqlDataReader ssdr1 = DB.CommonDatabase.DataReader(ssql1);
                                if (ssdr1.Read())
                                {
                                    Session["sid"] = ssdr1["sid"].ToString();
                                }
                            }
                            catch (Exception ex)
                            {
                            }

                            try
                            {
                                string sqll2 = "Delete otp where emai='" + loginval + "'";
                                DB.CommonDatabase.RunQuery(sqll2);
                            }
                            catch (Exception ex)
                            {
                            }
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "redirect", "location=('SearchPage.aspx');", true);
                        }
                    }
                }
            }
            catch (Exception)
            {
            }
        }
        else
        {
            ErrorMessage.Text = "Please enter correct OTP";
            ErrorMessage.ForeColor = Color.Red;
        }
    }

    public void Bind()
    {
        con = DB.CommonDatabase.OpenConn();
        cmd = new SqlCommand("WhiteLabelDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "SelectMaster");
        cmd.Parameters.AddWithValue("@username", Session["loginVal"].ToString());
        cmd.Parameters.AddWithValue("@RefAgency", Session["Ref_Agency"].ToString());
        cmd.Parameters.AddWithValue("@About_Us", "");
        cmd.Parameters.AddWithValue("@Map_Url", "");
        cmd.Parameters.AddWithValue("@Logo", "");
        sda = new SqlDataAdapter(cmd);
        ds = new DataSet();
        sda.Fill(ds);
        Session["Supp_Phone"] = ds.Tables[0].Rows[0]["SupportPhone"].ToString();
        Session["Supp_Email"] = ds.Tables[0].Rows[0]["SupportEmail"].ToString();
        Session["Logo"] = ds.Tables[0].Rows[0]["Logo"].ToString();
        Session["Title"] = ds.Tables[0].Rows[0]["Title"].ToString();
        Session["Facebook_Url"] = ds.Tables[0].Rows[0]["Facebook_Url"].ToString();
        Session["Linkedin_Url"] = ds.Tables[0].Rows[0]["Linkedin_Url"].ToString();
        Session["Slider"] = ds.Tables[0].Rows[0]["Slider_Images"].ToString();
        Session["Mobile"] = ds.Tables[0].Rows[0]["Mobile"].ToString();
        Session["Ab_us"] = ds.Tables[0].Rows[0]["About_Us"].ToString();
        Session["Map_Url"] = ds.Tables[0].Rows[0]["Map_Url"].ToString();
        Session["address"] = ds.Tables[0].Rows[0]["address"].ToString() + " " + ds.Tables[0].Rows[0]["City"].ToString() + " " + ds.Tables[0].Rows[0]["State"].ToString() + " " + ds.Tables[0].Rows[0]["PinCode"].ToString();
        Session["city"] = ds.Tables[0].Rows[0]["City"].ToString();

    }

    public void BindExtra()
    {
        con = DB.CommonDatabase.OpenConn();
        cmd = new SqlCommand("WhiteLabelDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "extra");
        cmd.Parameters.AddWithValue("@username", Session["loginVal"].ToString());
        cmd.Parameters.AddWithValue("@RefAgency", Session["Ref_Agency"].ToString());
        cmd.Parameters.AddWithValue("@About_Us", "");
        cmd.Parameters.AddWithValue("@Map_Url", "");
        cmd.Parameters.AddWithValue("@Logo", "");
        sda = new SqlDataAdapter(cmd);
        ds = new DataSet();
        sda.Fill(ds);
        Session["pan"] = ds.Tables[0].Rows[0]["PanNo"].ToString();
        Session["gst"] = ds.Tables[0].Rows[0]["ServiceTaxNo"].ToString();
    }

    public void BindTravstarz()
    {
        con = DB.CommonDatabase.OpenConn();
        cmd = new SqlCommand("WhiteLabelDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "Agent_Whitelable");
        cmd.Parameters.AddWithValue("@username", Session["loginVal"].ToString());
        cmd.Parameters.AddWithValue("@About_Us", "");
        cmd.Parameters.AddWithValue("@Map_Url", "");
        cmd.Parameters.AddWithValue("@Logo", "");
        sda = new SqlDataAdapter(cmd);
        ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Supp_Phone"] = ds.Tables[0].Rows[0]["SupportPhone"].ToString();
            Session["Supp_Email"] = ds.Tables[0].Rows[0]["SupportEmail"].ToString();
            Session["Logo"] = ds.Tables[0].Rows[0]["Logo"].ToString();
            Session["Title"] = ds.Tables[0].Rows[0]["Title"].ToString();
            Session["Facebook_Url"] = ds.Tables[0].Rows[0]["Facebook_Url"].ToString();
            Session["Linkedin_Url"] = ds.Tables[0].Rows[0]["Linkedin_Url"].ToString();
            Session["Slider"] = ds.Tables[0].Rows[0]["Slider_Images"].ToString();
            Session["Mobile"] = ds.Tables[0].Rows[0]["Mobile"].ToString();
            Session["Ab_us"] = ds.Tables[0].Rows[0]["About_Us"].ToString();
            Session["Map_Url"] = ds.Tables[0].Rows[0]["Map_Url"].ToString();
            Session["address"] = ds.Tables[0].Rows[0]["address"].ToString() + " " + ds.Tables[0].Rows[0]["City"].ToString() + " " + ds.Tables[0].Rows[0]["State"].ToString() + " " + ds.Tables[0].Rows[0]["PinCode"].ToString();
            Session["city"] = ds.Tables[0].Rows[0]["City"].ToString();
        }
    }

    public void Reference_Agency()
    {
        con = DB.CommonDatabase.OpenConn();
        cmd = new SqlCommand("WhiteLabelDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "Ref_Agency_Details");
        cmd.Parameters.AddWithValue("@username", Session["loginVal"].ToString());
        cmd.Parameters.AddWithValue("@About_Us", "");
        cmd.Parameters.AddWithValue("@Map_Url", "");
        cmd.Parameters.AddWithValue("@Logo", "");
        sda = new SqlDataAdapter(cmd);
        ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Ref_Agency"] = ds.Tables[0].Rows[0]["RefAgency"].ToString();
        }
    }

    public void CheckWhiteLabelStaus()
    {
        con = DB.CommonDatabase.OpenConn();
        cmd = new SqlCommand("WhiteLabelDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "Check_Whitelable");
        cmd.Parameters.AddWithValue("@RefAgency", Session["Ref_Agency"].ToString());
        cmd.Parameters.AddWithValue("@About_Us", "");
        cmd.Parameters.AddWithValue("@Map_Url", "");
        cmd.Parameters.AddWithValue("@Logo", "");
        sda = new SqlDataAdapter(cmd);
        ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["whitelabel"] = ds.Tables[0].Rows[0]["WhiteLabel_Approval"].ToString();
        }
    }
    public void CheckSelfWhiteLabelStaus()
    {
        con = DB.CommonDatabase.OpenConn();
        cmd = new SqlCommand("WhiteLabelDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mode", "Check_Self_WhiteLabel");
        cmd.Parameters.AddWithValue("@username", Session["loginVal"].ToString());
        cmd.Parameters.AddWithValue("@About_Us", "");
        cmd.Parameters.AddWithValue("@Map_Url", "");
        cmd.Parameters.AddWithValue("@Logo", "");
        sda = new SqlDataAdapter(cmd);
        ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["white_selflabel"] = ds.Tables[0].Rows[0]["WhiteLabel_Approval"].ToString();
        }
    }
}