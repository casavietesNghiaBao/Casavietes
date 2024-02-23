using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QFoofType_AddFoodType : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddFoodType_Click(object sender, EventArgs e)
    {
        try
        {
            FoodType ft = new FoodType();

            ft.foodtype_name = txtName.Text;

            data.AddFoodType(ft);

            msg.ForeColor = System.Drawing.Color.Blue;
            msg.Text = "Thêm mới thể loại món ăn thành công !";
        }
        catch (Exception ex)
        {
            msg.Text = "Có lỗi xảy ra: " + ex.Message;
        }

    }

    protected void reset_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
    }
}