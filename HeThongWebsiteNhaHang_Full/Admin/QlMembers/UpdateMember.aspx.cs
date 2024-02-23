using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QlMembers_UpdateMember : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowInfoUser();

        }
    }

    private void ShowInfoUser()
    {
        var id = Request.QueryString["idmember"];
        if (!string.IsNullOrEmpty(id))
        {
            var member = data.GetUser(Convert.ToInt16(id));
            Session["IdUser"] = id;
            txtfullname.Text = member.member_fullname;
            txtphone.Text = member.member_phone;
            txtemail.Text = member.member_mail;
            txtusername.Text = member.member_username;
            ddltype.SelectedValue = member.member_type.ToString();
            ddlstatus.SelectedValue = member.member_status.ToString();
            avatarUpdate.Attributes["src"] = member.member_avatar;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string avatar = "";
            if (Page.IsValid && FileUpload.HasFile)
            {
                string fileName = "images/" + FileUpload.FileName;
                //string filePath = MapPath(fileName);
                //string strFolder = Server.MapPath("./");
                //FileUpload.SaveAs(filePath);

                var pic = System.Web.HttpContext.Current.Request.Files["file"];
                // Validate
                // Xử lý upload lưu vào sv
                FileUpload.SaveAs(Server.MapPath("~/Assets/UploadAvatar/" + FileUpload.FileName));
                avatar = "/Assets/UploadAvatar/" + FileUpload.FileName;

            }
            else
            {
                avatar = data.GetUser(Convert.ToInt16((Session["IdUser"].ToString()))).member_avatar;
            }
            var user = new Member()
            {
                member_fullname = txtfullname.Text,
                member_mail = txtemail.Text,
                member_phone = txtphone.Text,
                member_status = Convert.ToInt16(ddlstatus.SelectedValue.ToString()), ///Active
                member_type = Convert.ToInt16(ddltype.SelectedValue.ToString()),
                member_id = Convert.ToInt16(Session["IdUser"].ToString()),
                member_avatar = avatar
            };
            data.UpdateUser(user);
            msg.Text = "Update success!";
            msg.ForeColor = System.Drawing.Color.Green;
            ShowInfoUser();
        }
        catch (Exception ex)
        {
            msg.Text = "Update Fail. Erorr: " + ex.Message + ". Let try!";
            msg.ForeColor = System.Drawing.Color.Red;
        }
    }
}