using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommonLogin;
using CommonLoginEntity;

public partial class ChangePassword : System.Web.UI.Page
{

    ChangePas ChangePassEn = new ChangePas();
    CommonLogin.Login SL = new CommonLogin.Login();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["logi"].ToString().Trim() == null && Session["logi"].ToString().Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Your Session is  Expire Please Login First.');window.location='Loginpage1.aspx';", true);
                return;
            }
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Your Session is  Expire Please Login First.');window.location='Loginpage1.aspx';", true);
            return;
        }

    }
       
    

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }

   
    protected void btnotp_Click(object sender, EventArgs e)
    {
      
            ChangePassEn.OldPassword = oldpas.Value.Trim();
            ChangePassEn.Password = newpas.Value.Trim();
            ChangePassEn = SL.UpdatePassword(ChangePassEn);
            if (ChangePassEn.Description == "Success")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Your Password has been Changed Successfully.Please login with new password');window.location='Loginpage1.aspx';", true);
                return;
            }
        
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please Enter Correct OTP');", true);
            return;
        }
    }
}