using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPageAdmin : System.Web.UI.MasterPage
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        var user = (Member)Session["UserAdmin"];
        if (user != null)
        {
            var member = data.GetUser(user.member_id);
            nameuser.Text = member.member_fullname;
            imageadmin.Attributes["src"] = member.member_avatar;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notice", "alert('Sign up fail! Username or email or phone exists!')", true);
            Response.Redirect("/Admin/AdminLogin.aspx");
        }
    }

    protected void Logout_Click(Object sender, EventArgs e)
    {
        Session["UserAdmin"] = null;
        Response.Redirect("/Admin/AdminLogin.aspx");
    }
}
