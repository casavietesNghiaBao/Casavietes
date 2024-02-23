using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QlMembers_Profile : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var user = (Member)Session["UserAdmin"];
            if (user != null)
            {
                var member = data.GetUser(user.member_id);
                amail.HRef = "mailto:" + member.member_mail;
                lbfullname.Text = member.member_fullname;
                lbmail.Text = member.member_mail;
                lbphone.Text = member.member_phone;
                lbusername.Text = member.member_username;
                avatarImage.Attributes["src"] = member.member_avatar;
                if (Session["Msg"] != null && !string.IsNullOrEmpty(Session["Msg"].ToString()))
                {
                    var msgCode = Convert.ToInt16(Session["MsgCode"].ToString());
                    if (msgCode == 1)
                    {
                        msg.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        msg.ForeColor = System.Drawing.Color.Red;
                    }
                    msg.Text = Session["Msg"].ToString();
                    Session["Msg"] = null;
                    Session["MsgCode"] = null;
                }
            }
        }
    }
}