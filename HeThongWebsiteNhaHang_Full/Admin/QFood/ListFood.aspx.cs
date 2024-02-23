using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Globalization;

public partial class Admin_QFood_ListFood : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Food> getListMembers = data.getListFood();
            CultureInfo cultureInfo = new CultureInfo("vi-VN");
        }
    }

    [WebMethod]
    public static string XoaFood(int idFood)
    {
        DataUtil data = new DataUtil();
        data.DeleteFood(idFood);
        return "Xóa thành công !";
    }

    [WebMethod]
    public static List<Food> TimKiem(string keywords)
    {
        DataUtil dt = new DataUtil();

        List<Food> li = new List<Food>();

        li = dt.getListFood_Search(keywords);

        return li;
    }
}