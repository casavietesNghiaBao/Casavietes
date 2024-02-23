using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class Admin_QFoofType_ListFoodType : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string XoaFoodType(int IdFoodType)
    {
        DataUtil data = new DataUtil();
        data.DeleteFoodType(IdFoodType);
        return "Bạn đã xóa thể loại món ăn thành công!";
    }

    [WebMethod]
    public static List<FoodType> TimKiemFType(string keywords)
    {
        DataUtil dt = new DataUtil();

        List<FoodType> li = new List<FoodType>();

        li = dt.getListFood_SearchFType(keywords);

        return li;
    }
}