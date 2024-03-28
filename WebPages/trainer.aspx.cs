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

public partial class WebPages_trainer : System.Web.UI.Page
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

    protected void ButtonEnter_Click(object sender, EventArgs e)
    {
         
        try
        {
            string trainername = Texttrainername.Text;
            string ID=TextID.Text;
        string mobile=TextMobile.Text;
        string email=TextEmail.Text;
        string address=TextAddress.Text;
         string type = RadioType.SelectedValue;
         string dob = "";
            
            if (ButtonEnter.Text == "Enter")
            {
                if (TextDOB.Text != "")
                {
                    dob = DateTime.ParseExact(TextDOB.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InstalledUICulture).ToString("yyyy/MM/dd");
                }
            
                
                    string qry = "Insert into Tbl_Trainer(Trainer_Name,Trainer_ID,Trainer_DOB,Trainer_Mobile,Trainer_Email,Trainer_Address,Trainer_Type)values('" + trainername + "','" + ID + "','" + dob +"','" + mobile + "','" + email + "','" + address + "','" + type +"')";
            objsql.Open();
            SqlCommand cmd = new SqlCommand(qry, objsql);
            int res = cmd.ExecuteNonQuery();
            objsql.Close();
            if (res > 0)
            {
                ShowMessageAndRedirect("Entered Successfully", "trainer.aspx");
            }
            else
            {
                ShowMessageAndRedirect("Sorry Try Again!", "trainer.aspx");
            }
       }
            
            else if(ButtonEnter.Text == "Update")
            {
                 dob = TextDOB.Text;
                int mid = int.Parse(lblmid.Text);

                string qry1 = "Update Tbl_Trainer set Trainer_Name='" + trainername + "',Trainer_ID='" + ID + "',Trainer_DOB='" + dob + "',Trainer_Mobile='" + mobile + "',Trainer_Email='" + email + "',Trainer_Address='" + address + "',Trainer_Type='" + type + "' where Trainer_MasterId=" + mid + " and Trainer_ActiveFlag=1";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry1, objsql);
                int res = cmd.ExecuteNonQuery();
                    
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Updated Successfully", "trainer.aspx");
                    Add.Visible = false;
                    divViewMaster.Visible = true;
                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "trainer.aspx");
                    Add.Visible = true;
                    divViewMaster.Visible = false;
                }
            }
            else
            {
                ShowMessageAndRedirect("Sorry Try Again!", "trainer.aspx");
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
                 

   
    
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        Texttrainername.Text = "";
        TextID.Text = "";
        TextMobile.Text = "";
        TextEmail.Text = "";
        TextAddress.Text = "";
        RadioType.SelectedIndex = 0;
        TextDOB.Text = "";
    }
    protected void ButtonView1_Click(object sender, EventArgs e)
    {
        divViewMaster.Visible = true;
        Add.Visible = false;
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

    private void BindGrid()
    {
        try
        {
            Gvintroducer1.DataSource = null;
            Gvintroducer1.DataBind();
            string count = "";

            string Qry = "SELECT  " + count + " *,convert(varchar,Trainer_DOB,103) as DOB1 FROM dbo.Tbl_Trainer WHERE Trainer_ActiveFlag=1";

            if (TxtName.Text != "")
                Qry += " AND Trainer_Name LIKE '%" + TxtName.Text + "%'";

            if (Txtmblno.Text != "")
                Qry += " AND Trainer_Mobile LIKE '%" + Txtmblno.Text + "%'";



            Qry += "order by Trainer_MasterId desc";
            Qry += " Select count(Trainer_MasterId) TotalRecords from Tbl_Trainer where Trainer_ActiveFlag=1";
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
    protected void buttonReset1_Click(object sender, EventArgs e)
    {
        TxtName.Text = "";
        Txtmblno.Text = "";

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
            string query = "update Tbl_Trainer set Trainer_ActiveFlag=0 where Trainer_MasterId='" + Mid + "'";
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

    private void ShowMessage(string msg)
    {
        StringBuilder bd = new StringBuilder();
        bd.Append(@"<script type='txt/javascript'>");
        bd.Append("Alert('" + msg + "');");
        bd.Append(@"</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", bd.ToString(), false);
    }

    private void GetDetails(int Mid)
    {
        string Query = "SELECT * FROM Tbl_Trainer where Trainer_MasterId=" + Mid + " and Trainer_ActiveFlag=1";
        DataSet ds = dm.GetDataSet(Query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Texttrainername.Text = ds.Tables[0].Rows[0]["Trainer_Name"].ToString();
            TextID.Text = ds.Tables[0].Rows[0]["Trainer_ID"].ToString();
            TextMobile.Text = ds.Tables[0].Rows[0]["Trainer_Mobile"].ToString();
            TextEmail.Text = ds.Tables[0].Rows[0]["Trainer_Email"].ToString();
            TextAddress.Text = ds.Tables[0].Rows[0]["Trainer_Address"].ToString();
            RadioType.SelectedValue = ds.Tables[0].Rows[0]["Trainer_Type"].ToString();
            TextDOB.Text = ds.Tables[0].Rows[0]["Trainer_DOB"].ToString().Replace("-", "/").Replace("00:00:00", "");
            lblmid.Text = ds.Tables[0].Rows[0]["Trainer_MasterId"].ToString();
            ButtonEnter.Text = "Update";
            ButtonReset.Text = "Cancel";
            ButtonEnter.CausesValidation = false;
            Add.Visible = true;
            divViewMaster.Visible = false;
        }
    }
}