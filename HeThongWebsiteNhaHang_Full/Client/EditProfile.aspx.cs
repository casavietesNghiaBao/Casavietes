using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services;

public partial class Client_EditProfile : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var user = (Member)Session["User"];
            if (user == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notice", "alert('Please login first!')", true);
                Response.Redirect("/Client/Login.aspx");
            }
            else
            {
                var member = data.GetUser(user.member_id);
                txtemail.Text = member.member_mail;
                txtfullname.Text = member.member_fullname;
                txtusername.Text = member.member_username;
                txtphone.Text = member.member_phone;
                avatarUpdate.Attributes["src"] = member.member_avatar;

            }
        }
    }

    protected void LogOut_Click(Object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect("/TrangChu.aspx");
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string avatar = "";
            var member = (Member)Session["User"];
            if (Page.IsValid && FileUpload.HasFile)
            {
                string fileName = "images/" + FileUpload.FileName;

                // Xử lý upload lưu vào sv
                FileUpload.SaveAs(Server.MapPath("~/Assets/UploadAvatar/" + FileUpload.FileName));
                avatar = "/Assets/UploadAvatar/" + FileUpload.FileName;

            }
            else
            {
                avatar = member.member_avatar;
            }
            var user = new Member()
            {
                member_fullname = txtfullname.Text,
                member_mail = txtemail.Text,
                member_phone = txtphone.Text,
                member_status = 1,
                member_type = 0,
                member_id = member.member_id,
                member_avatar = avatar
            };
            data.UpdateUser(user);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notice", "alert('Update success!')", true);
            Response.Redirect("/Client/Profile.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notice", "alert('Update fail!')", true);
        }
    }


}
