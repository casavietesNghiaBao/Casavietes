using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QlMembers_UpdateProfile : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var user = (Member)Session["UserAdmin"];
            
            if(user != null)
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string avatar = "";
            var userGet = (Member)Session["UserAdmin"];
            var member = data.GetUser(userGet.member_id);
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
                member_id = member.member_id,
                member_avatar = avatar,
                member_status = member.member_status,
                member_type = member.member_type
            };
            data.UpdateUser(user);
            Session["Msg"] = "Update profile success!";
            Session["MsgCode"] = 1;
            Response.Redirect("/Admin/QlMembers/Profile.aspx", false);
        }
        catch (Exception ex)
        {
            Session["MsgCode"] = 0;
            Session["Msg"] = "Update profile fail!";
        }
    }
}