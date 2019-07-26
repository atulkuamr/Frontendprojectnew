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

public partial class AgentsList : System.Web.UI.Page
{
    public SqlConnection conn = new SqlConnection("Data Source=103.205.64.194,2499;Initial Catalog=tropriv;User ID=troprivu;Password=uergbWjerbg436455ERGAEBA");
    protected void Page_Load(object sender, EventArgs e)
    {
        gvbind();
    }

    protected void search_Click(object sender, EventArgs e)
    {
        gvbind();
    }

    protected void Exel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=AgentsList.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = false;
            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);


            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {        
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        conn.Open();
        string sql = "delete from adminlogin where username='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sql += " delete from tblagentdetails where userid='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sql += " delete from AdminCreditLimit where uid='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        DB.CommonDatabase.RunQuery(sql);
        conn.Close();
        gvbind();
    }

    protected void gvbind()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT username, AgencyName, usertype, ContactPerson, Mobile, Email, city, country, JoingDate, DCarduser FROM adminLogin where refagency='" + Session["loginVal"].ToString() + "'", conn);
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

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
}