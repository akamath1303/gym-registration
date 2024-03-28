using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class WebPages_memberinfo : System.Web.UI.Page
{
    DataManager dm = new DataManager();

    SqlConnection objsql = new SqlConnection(ConfigurationManager.AppSettings["ConnStr"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGrid();
            if (PreviewImage.ImageUrl == "")
            {
                PreviewImage.ImageUrl = "~/ASPX_Images/no-image-icon-15.png";
            }
        }
    }
    protected void ButtonView_Click(object sender, EventArgs e)
    {
        divViewMaster.Visible = true;
        Add.Visible = false;
    }

    protected void buttonAdd_Click(object sender, EventArgs e)
    {
        Add.Visible = true;
        divViewMaster.Visible = false;
    }
    protected void buttonSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected void buttonReset_Click(object sender, EventArgs e)
    {
        TxtName.Text = "";
        Txtmblno.Text = "";
    }

    private void BindGrid()
    {
        try
        {
            Gvintroducer.DataSource = null;
            Gvintroducer.DataBind();
            string count = "";
            //string dob = DateTime.Today.ToString("dd/MM/yyyy");
            string Qry = "SELECT  " + count + " *,convert(varchar,Member_DOB,103) as DOB1 FROM dbo.Tbl_MemberInfo WHERE Member_ActiveFlag=1";

            if (TxtName.Text != "")
                Qry += " AND Member_Name LIKE '%" + TxtName.Text + "%'";

            if (Txtmblno.Text != "")
                Qry += " AND Member_Mobile LIKE '%" + Txtmblno.Text + "%'";



            Qry += "order by Member_MasterId desc";
            Qry += " Select count(Member_MasterId) TotalRecords from Tbl_MemberInfo where Member_ActiveFlag=1";
            DataSet ds = dm.GetDataSet(Qry);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblCount.Text = ds.Tables[0].Rows.Count + " Records Found Out Of " + ds.Tables[1].Rows[0]["TotalRecords"].ToString();
                    Gvintroducer.DataSource = ds.Tables[0];
                    Gvintroducer.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }

    private void GetDetails(int Mid)
    {
        string Query = "SELECT * FROM Tbl_MemberInfo where Member_MasterId=" + Mid + " and Member_ActiveFlag=1";
        DataSet ds = dm.GetDataSet(Query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            TextName.Text = ds.Tables[0].Rows[0]["Member_Name"].ToString();
            TextID.Text = ds.Tables[0].Rows[0]["Member_ID"].ToString();
            PreviewImage.ImageUrl = ds.Tables[0].Rows[0]["Member_Photo"].ToString().Replace("~", "..");
            if (PreviewImage.ImageUrl != "")
            {
                lblfile.Enabled = false;
            }
            else
            {
                PreviewImage.ImageUrl = "~/ASPX_Images/no-image-icon-15.png";
                lblfile.Enabled = true;
            }
            lblPath.Text = ds.Tables[0].Rows[0]["Member_Photo"].ToString().Replace("~", "..");
            TextMobile.Text = ds.Tables[0].Rows[0]["Member_Mobile"].ToString();
            TextBoxEmail.Text = ds.Tables[0].Rows[0]["Member_Email"].ToString();
            TextAddress.Text = ds.Tables[0].Rows[0]["Member_Address"].ToString();
            RadioGender.SelectedValue = ds.Tables[0].Rows[0]["Member_Gender"].ToString();
            TextDOB.Text = ds.Tables[0].Rows[0]["Member_DOB"].ToString().Replace("-", "/").Replace("00:00:00", "");
        
            RadioWeight.SelectedValue = ds.Tables[0].Rows[0]["Member_weight"].ToString();
            CheckBoxHealth.SelectedValue = ds.Tables[0].Rows[0]["Member_Health"].ToString();
            lblmid.Text = ds.Tables[0].Rows[0]["Member_MasterId"].ToString();
            ButtonSubmit.Text = "Update";
            ButtonRefresh1.Text = "Cancel";
            ButtonSubmit.CausesValidation = false;
            Add.Visible = true;
            divViewMaster.Visible = false;
        }
    }

    protected void Gvintroducer_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "Edt")
        {
            int Mid = int.Parse(e.CommandArgument.ToString());
            GetDetails(Mid);
        }

        if (e.CommandName.ToString() == "Del")
        {
            int Mid = int.Parse(e.CommandArgument.ToString());
            string query = "update Tbl_MemberInfo set Member_ActiveFlag=0 where Member_MasterId='" + Mid + "'";
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
    public void ShowMessage(string msg)
    {
        StringBuilder bd = new StringBuilder();
        bd.Append(@"<script type='txt/javascript'>");
        bd.Append("Alert('" + msg + "');");
        bd.Append(@"</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", bd.ToString(), false);
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string name = TextName.Text.ToUpper();
            string ID = TextID.Text;
            string mobile = TextMobile.Text;
            string address = TextAddress.Text;
            string email = TextBoxEmail.Text;
            string weight = RadioWeight.SelectedValue;
            string gender = RadioGender.SelectedValue;
            string health = CheckBoxHealth.SelectedValue;
            string dob = "";
       
            string photo = "";



            if (ButtonSubmit.Text == "Submit")
            {
                if (TextDOB.Text != "")
                {
                    dob = DateTime.ParseExact(TextDOB.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InstalledUICulture).ToString("yyyy/MM/dd");
                }
               
                if (filephoto.HasFile)
                {
                    UploadImage();
                }
                if (lblPath.Text == "Please Select Valid Photo")
                {
                    Response.Write("<script>alert('" + lblPath.Text + "');</script>");
                }
                else
                {
                    if (lblPath.Text == "")
                        lblPath.Text = "~/ASPX_Images/no-image-icon-15.png";
                    photo = lblPath.Text;

                    string qry = "Insert into Tbl_MemberInfo(Member_Name,Member_ID,Member_DOB,Member_Mobile,Member_Email,Member_Photo,Member_Address,Member_Gender,Member_Weight,Member_Health)values('" + name + "','" + ID + "','" + dob + "','" + mobile + "','" + email + "','" + photo + "','" + address + "','" + gender + "','" + weight + "','" + health + "')";
                    objsql.Open();
                    SqlCommand cmd = new SqlCommand(qry, objsql);
                    int res = cmd.ExecuteNonQuery();
                    objsql.Close();
                    if (res > 0)
                    {
                        ShowMessageAndRedirect("Submitted Successfully", "memberinfo.aspx");
                    }
                    else
                    {
                        ShowMessageAndRedirect("Sorry Try Again!", "memberinfo.aspx");
                    }
                }
            }

            else if (ButtonSubmit.Text == "Update")
            {
                if (filephoto.HasFile)
                {
                    UploadImage();
                }
                if (lblPath.Text == "Please Select Valid Photo")
                {
                    Response.Write("<script>alert('" + lblPath.Text + "');</script>");
                }
                else
                {
                    if (lblPath.Text == "")
                        lblPath.Text = "~/ASPX_Images/no-image-icon-15.png";
                    photo = lblPath.Text;
                }
                dob = TextDOB.Text;
                int mid = int.Parse(lblmid.Text);

                string qry1 = "Update Tbl_MemberInfo set Member_Name='" + name + "',Member_ID='" + ID + "',Member_DOB='" + dob + "',Member_Mobile='" + mobile + "',Member_Email='" + email + "',Member_Photo='" + photo + "',Member_Address='" + address + "',Member_Gender='" + gender + "',Member_Weight='" + weight + "',Member_Health='" + health + "' where Member_MasterId=" + mid + " and Member_ActiveFlag=1";
                objsql.Open();
                SqlCommand cmd = new SqlCommand(qry1, objsql);
                int res = cmd.ExecuteNonQuery();
                    
                objsql.Close();
                if (res > 0)
                {
                    ShowMessageAndRedirect("Updated Successfully", "memberinfo.aspx");
                    Add.Visible = false;
                    divViewMaster.Visible = true;
                }
                else
                {
                    ShowMessageAndRedirect("Sorry Try Again!", "memberinfo.aspx");
                    Add.Visible = true;
                    divViewMaster.Visible = false;
                }
            }
            else
            {
                ShowMessageAndRedirect("Sorry Try Again!", "memberinfo.aspx");
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }



    private void ClearAll()
    {
        TextName.Text = "";
        TextID.Text = "";
        TextDOB.Text = "";
        TextMobile.Text = "";
        TextBoxEmail.Text = "";
        PreviewImage.ImageUrl = "";
        TextAddress.Text = "";
        RadioGender.SelectedIndex = 0;
        
        RadioWeight.SelectedIndex = 0;
        CheckBoxHealth.SelectedIndex = 0;
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
            //Response.Redirect("oops.aspx");
        }
    }

    public void UploadImage()
    {
        //Save Home Image
        try
        {
            string filename = System.IO.Path.GetFileName(filephoto.PostedFile.FileName);
            string randomno = DateTime.Now.Ticks.ToString();
            HttpPostedFile file = filephoto.PostedFile;
            if ((file != null) && (file.ContentLength > 0))
            {
                int iFileSize = file.ContentLength;
                if (iFileSize <= 2097152)  //2mb
                {
                    string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
                    if (sImageFileExtension == ".gif" || sImageFileExtension == ".png" || sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".bmp")
                    {
                        string newfilename = randomno + sImageFileExtension;

                        string strFPath = "~/RegPhoto/" + TextName.Text.ToUpper().Replace(' ', '_') + "_" + newfilename;
                        filephoto.PostedFile.SaveAs(Server.MapPath(strFPath));
                        lblPath.Text = strFPath;
                        //Session["MYPHOTO_Reg"] = strFPath;
                    }
                    else
                    {
                        lblPath.Text = "Please Select Valid Photo";
                        // Session["MYPHOTO_Reg"] = "Please Select Valid Photo";
                    }
                }
                else
                {
                    CompressAndUploadPhoto(filephoto);
                }
            }
            else
            {
                lblPath.Text = "Please Select Valid Photo";
                //Session["MYPHOTO_Reg"] = "Please Select Valid Photo";
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }

    #region Compress_Image
    protected void CompressAndUploadPhoto(FileUpload FileUploadImg)
    {
        try
        {
            // First we check to see if the user has selected a file
            if (FileUploadImg.HasFile)
            {
                // Find the fileUpload control
                string filename = FileUploadImg.FileName;

                // Specify the upload directory
                string directory = Server.MapPath("~/RegPhoto/");

                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

                int newWidth = 150;
                int newHeight = newWidth;

                double actualHeight = originalBMP.Height;
                double actualWidth = originalBMP.Width;
                double maxHeight = 600.0;
                double maxWidth = 800.0;
                double imgRatio = actualWidth / actualHeight;
                double maxRatio = maxWidth / maxHeight;
                double compressionQuality = 0.5;//50 percent compression
                if (actualHeight > maxHeight || actualWidth > maxWidth)
                {
                    if (imgRatio < maxRatio)
                    {
                        //adjust width according to maxHeight
                        imgRatio = maxHeight / actualHeight;
                        actualWidth = imgRatio * actualWidth;
                        actualHeight = maxHeight;
                    }
                    else if (imgRatio > maxRatio)
                    {
                        //adjust height according to maxWidth
                        imgRatio = maxWidth / actualWidth;
                        actualHeight = imgRatio * actualHeight;
                        actualWidth = maxWidth;
                    }
                    else
                    {
                        actualHeight = maxHeight;
                        actualWidth = maxWidth;
                    }
                }

                newWidth = Convert.ToInt16(actualWidth);
                newHeight = Convert.ToInt16(actualHeight);
                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                // Create a graphic based on the new bitmap
                Graphics oGraphics = Graphics.FromImage(newBMP);

                // Set the properties for the new graphic file
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                // Draw the new graphic based on the resized bitmap
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

                // Save the new graphic file to the server              
                Random rm = new Random();
                string randomno = rm.Next(11111, 99999).ToString();
                string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
                string newfilename = randomno + sImageFileExtension;
                string strPath = directory + TextName.Text.ToUpper().Replace(' ', '_') + "_" + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath = "~/RegPhoto/" + TextName.Text.ToUpper().Replace(' ', '_') + "_" + randomno + sImageFileExtension;
                Session["MYPHOTO_Reg"] = strFPath;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../oops.aspx");
        }
    }
    #endregion
    protected void ButtonRefresh1_Click(object sender, EventArgs e)
    {
        ClearAll();
    }
}