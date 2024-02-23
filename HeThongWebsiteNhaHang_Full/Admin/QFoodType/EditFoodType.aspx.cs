using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QFoodType_EditFoodType : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            ShowInfoFoodType();
    }

    private void ShowInfoFoodType()
    {
        var id = Request.QueryString["IdFoodType"];
        if (!string.IsNullOrEmpty(id))
        {
            var fooftype = data.get1FoodType(Convert.ToInt16(id));
            Session["IdFoodType"] = id;

            txtName.Text = fooftype.foodtype_name;
            txtId.Text = fooftype.foodtype_id.ToString();

        }
    }


    protected void btnEditFoodType_Click(object sender, EventArgs e)
    {
        try
        {
            FoodType ft = new FoodType();

            ft.foodtype_name = txtName.Text;
            ft.foodtype_id = int.Parse(Session["IdFoodType"].ToString());

            data.EditFoodType(ft);

            msg.ForeColor = System.Drawing.Color.Green;
            msg.Text = "Cập nhật thành công!";

            ShowInfoFoodType();
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