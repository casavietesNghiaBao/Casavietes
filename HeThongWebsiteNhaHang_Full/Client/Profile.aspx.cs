using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Profile : System.Web.UI.Page
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
                amail.HRef = "mailto:" + member.member_mail;
                lbfullname.Text = member.member_fullname;
                lbmail.Text = member.member_mail;
                lbphone.Text = member.member_phone;
                lbusername.Text = member.member_username;
                avatarImage.Attributes["src"] = member.member_avatar;
            }
        }
    }

    protected void LogOut_Click(Object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect("/TrangChu.aspx");
    }
}