using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_equipment : System.Web.UI.Page
{
    DataManager dm = new DataManager();

    SqlConnection objsql = new SqlConnection(ConfigurationManager.AppSettings["ConnStr"].ToString());
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGrid();
        }
    }
    protected void ButtonView2_Click(object sender, EventArgs e)
    {
        divViewMaster.Visible = true;
        Add.Visible = false;
    }
    protected void ButtonSubmit1_Click(object sender, EventArgs e)
    {
        try
        {
            string equipname = Textequipname.Text;
            string ID = TextID.Text;
            string quantity = TextQuantity.Text;
            string cost = DropDownCost.SelectedValue;
            string dop = "";

            if (ButtonSubmit1.Text == "Submit")
            {
                if (TextDOP.Text != "")
                {
                    dop = DateTime.ParseExact(TextDOP.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InstalledUICulture).ToString("yyyy/MM/dd");
                }


                string qry = "Insert into Tbl_Equip(Equip_Name,Equip_ID,Equip_DOP,Equip_Cost,Equip_Quantity)values('" + equipname + "','" + ID + "','" + dop + "','" + cost + "','" + quantity + "')";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry, objsql);
                int res = cmd.ExecuteNonQuery();
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Entered Successfully", "equipment.aspx");
                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", ".aspx");
                }
            }

            else if (ButtonSubmit1.Text == "Update")
            {
                dop = TextDOP.Text;
                int mid = int.Parse(lblmid.Text);

                string qry1 = "Update Tbl_Equip set Equip_Name='" + equipname + "',Equip_ID='" + ID + "',Equip_DOP='" + dop + "',Equip_Cost='" + cost + "',Equip_Quantity='" + quantity + "' where Equip_MasterId=" + mid + " and Equip_ActiveFlag=1";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry1, objsql);
                int res = cmd.ExecuteNonQuery();

                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Updated Successfully", "equipment.aspx");
                    Add.Visible = false;
                    divViewMaster.Visible = true;
                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "equipment.aspx");
                    Add.Visible = true;
                    divViewMaster.Visible = false;
                }
            }
            else
            {
                ShowMessageAndRedirect("Sorry Try Again!", "equipment.aspx");
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    protected void ButtonRefresh2_Click(object sender, EventArgs e)
    {
        Textequipname.Text = "";
        TextID.Text = "";
        TextQuantity.Text = "";
        DropDownCost.SelectedIndex = 0;
        TextDOP.Text = "";
    }
    protected void buttonAdd1_Click(object sender, EventArgs e)
    {
        Add.Visible = true;
        divViewMaster.Visible = false;
    }
    protected void buttonSearch1_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected void buttonReset1_Click(object sender, EventArgs e)
    {
        TxtName.Text = "";
    }
    protected void Gvintroducer1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "Edt")
        {
            int Mid = int.Parse(e.CommandArgument.ToString());
            GetDetails(Mid);
        }

        if (e.CommandName.ToString() == "Del")
        {
            int Mid = int.Parse(e.CommandArgument.ToString());
            string query = "update Tbl_Equip set Equip_ActiveFlag=0 where Equip_MasterId='" + Mid + "'";
            objsql.Open();
            SqlCommand cmd = new SqlCommand(query, objsql);
            int res = cmd.ExecuteNonQuery();
            objsql.Close();
            if (res > 0)
            {
                BindGrid();
                ShowMessage("Successfully Deleted");
            }
            else
            {
                ShowMessage("Sorry!! Try Again");
            }
        }
    }
    private void ShowMessageAndRedirect(string msg, string url)
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("function Redirect()");
            sb.Append("{");
            sb.Append(" window.location.href='" + url + "'");
            sb.Append("}");
            sb.Append("alert('" + msg + "');");
            sb.Append("setTimeout('Redirect()',1000);");
            Response.Write("<script>" + sb + "</script>");
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    private void BindGrid()
    {
        try
        {
            Gvintroducer1.DataSource = null;
            Gvintroducer1.DataBind();
            string count = "";

            string Qry = "SELECT  " + count + " *,convert(varchar,Equip_DOP,103) as DOP1 FROM dbo.Tbl_Equip WHERE Equip_ActiveFlag=1";

            if (TxtName.Text != "")
                Qry += " AND Equip_Name LIKE '%" + TxtName.Text + "%'";

            


            Qry += "order by Equip_MasterId desc";
            Qry += " Select count(Equip_MasterId) TotalRecords from Tbl_Equip where Equip_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(Qry);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblCount.Text = ds.Tables[0].Rows.Count + " Records Found Out Of " + ds.Tables[1].Rows[0]["TotalRecords"].ToString();
                    Gvintroducer1.DataSource = ds.Tables[0];
                    Gvintroducer1.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    public void ShowMessage(string msg)
    {
        StringBuilder bd = new StringBuilder();
        bd.Append(@"<script type='txt/javascript'>");
        bd.Append("Alert('" + msg + "');");
        bd.Append(@"</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", bd.ToString(), false);
    }
    private void GetDetails(int Mid)
    {
        string Query = "SELECT * FROM Tbl_Equip where Equip_MasterId=" + Mid + " and Equip_ActiveFlag=1";
        DataSet ds = dm.GetDataSet(Query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Textequipname.Text = ds.Tables[0].Rows[0]["Equip_Name"].ToString();
            TextID.Text = ds.Tables[0].Rows[0]["Equip_ID"].ToString();
            TextQuantity.Text = ds.Tables[0].Rows[0]["Equip_Quantity"].ToString();
            DropDownCost.SelectedValue = ds.Tables[0].Rows[0]["Equip_Cost"].ToString();
            TextDOP.Text = ds.Tables[0].Rows[0]["Equip_DOP"].ToString().Replace("-", "/").Replace("00:00:00", "");
            lblmid.Text = ds.Tables[0].Rows[0]["Equip_MasterId"].ToString();
            ButtonSubmit1.Text = "Update";
            ButtonRefresh2.Text = "Cancel";
            ButtonSubmit1.CausesValidation = false;
            Add.Visible = true;
            divViewMaster.Visible = false;
        }
    }
}