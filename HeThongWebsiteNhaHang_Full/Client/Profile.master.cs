using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Profile : System.Web.UI.MasterPage
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
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
            nameuser.Text = member.member_fullname;
            avatarImageTop.Attributes["src"] = member.member_avatar;
        }
    }
    protected void LogOut_Click(Object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect("/TrangChu.aspx");
    }
}
