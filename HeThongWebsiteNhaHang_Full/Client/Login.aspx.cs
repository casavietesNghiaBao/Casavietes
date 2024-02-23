using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Login : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var passwordHash = Encryptor.MD5Hash(txtpassword.Text);
        var type = 0; /// type 0 is user
        var checkLogin = data.CheckLogin(txtusername.Text, passwordHash, type);

        if (checkLogin)
        {
            Session["User"] = data.GetUserByName(txtusername.Text);
            Cart CART = (Cart)Session["Cart"];
            CART.emailKH = ((Member)Session["User"]).member_mail;
            CART.tenKH = ((Member)Session["User"]).member_fullname;
            CART.dienthoaiKH = ((Member)Session["User"]).member_phone;
            CART.idtable = -1;
            CART.idmember = ((Member)Session["User"]).member_id;
            CART.tenBan = "";
            Session["Cart"] = CART;
            Response.Redirect("/TrangChu.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notice", "alert('Sign in fail! Username or email invalid!')", true);
        }
    }

    private bool CheckLogin(string username, string password)
    {
        return false;
    }
}