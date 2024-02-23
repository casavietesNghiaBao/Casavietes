using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QlMembers_ListMembers : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Member> getListMembers = data.GetListMembers();
        }
    }

    [WebMethod]
    public static string ListNumberMembers(int number)
    {
        //DataUtil data = new DataUtil();
        //var resultDelte = data.DeleteUser(iduser);
        //if (resultDelte)
            return "Delete success!";
        //else
        //    return "Delete fail!";
    }


    [WebMethod]
    public static string DeleteUser(int iduser)
    {
        DataUtil data = new DataUtil();
        var resultDelte = data.DeleteUser(iduser);
        if (resultDelte)
            return "Delete success!";
        else
            return "Delete fail!";
    }

}