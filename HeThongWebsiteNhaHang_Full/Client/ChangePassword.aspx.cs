using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_ChangePassword : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
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
            var userGet = (Member)Session["User"];
            var member = data.GetUser(userGet.member_id);
            var oldPass = Encryptor.MD5Hash(txtoldpassword.Text);
            if (oldPass.Equals(member.member_password))
            {
                var user = new Member()
                {
                    member_id = member.member_id,
                    member_password = Encryptor.MD5Hash(txtpassword.Text)
                };
                data.UpdatePassUser(user);
                msg.Text = "Update success!";
                msg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                msg.Text = "Old password is wrong!";
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (Exception ex)
        {
            msg.Text = "Update Fail. Erorr: " + ex.Message + ". Let try!";
            msg.ForeColor = System.Drawing.Color.Red;
        }
    }
}