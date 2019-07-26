using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Configuration;

public partial class ClearReservationtbl : System.Web.UI.Page
{
    public SqlConnection conn = new SqlConnection("Data Source=205.147.111.15;Initial Catalog=tropriv;User ID=troprivu;Password=uergbWjerbg436455ERGAEBA");
    protected void Page_Load(object sender, EventArgs e)
    {
        gvbind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        conn.Open();
        string sql = "delete from Reservationtable where reservationid='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        DB.CommonDatabase.RunQuery(sql);
        string sql1 = "delete from PassengreDetails where reservationid='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        DB.CommonDatabase.RunQuery(sql1);
        conn.Close();
        gvbind();
    }

    protected void gvbind()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select a.reservationid, a.AgencyName, a.AgentID, a.Airlinepnr, a.GdsPNR, a.TicketNo, a.BookStatus, a.ReservationDate, a.totalAmount from Reservationtable a", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "No Records Found";
        }
    }
}