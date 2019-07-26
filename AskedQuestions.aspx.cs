using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AskedQuestions : System.Web.UI.Page
{
    public string tag = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["ID"] != "" && Request.QueryString["ID"] != null)
            {
                tag = Request.QueryString["ID"].ToString();
                if (tag == "F") { freeaskque_flight.Visible = true; }
                            
              
                if (tag == "H") { freeaskque_hotel.Visible = true; }
            }
        }
        catch (Exception)
        {


        }
    }
}
