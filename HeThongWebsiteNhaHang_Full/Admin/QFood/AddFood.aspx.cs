using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QFood_AddFood : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlFoodTypeID.DataSource = data.getListFoodType();
            ddlFoodTypeID.DataTextField = "foodtype_name";
            ddlFoodTypeID.DataValueField = "foodtype_id";
            DataBind();
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            Food f = new Food();

            f.food_name = txtName.Text;
            f.food_price = double.Parse(txtGia.Text);
            f.food_sale = int.Parse(txtKhuyenmai.Text);

            if (Page.IsValid && FileUpload1.HasFile)
            {
                string fileName = "../../Assets/images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                string filePath = MapPath(fileName);
                FileUpload1.SaveAs(filePath);
                //Image1.ImageUrl = fileName;
                f.food_avatar = fileName;
            }
            else
            {
                f.food_avatar = "../../Assets/images/no-image.png";
            }

            //f.food_avatar = txtAvt.Text;

            f.food_description = txtMieuta.Text;

            //f.foodtype_id = int.Parse(txtKieu.Text);
            f.foodtype_id = int.Parse(ddlFoodTypeID.SelectedValue);

            data.AddFood(f);

            msg.ForeColor = System.Drawing.Color.Blue;
            msg.Text = "Thêm mới món ăn thành công!";

        }
        catch (Exception ex)
        {
            msg.Text = "Có lỗi xảy ra: " + ex.Message;
        }

    }

    protected void reset_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtGia.Text = "";
        txtKhuyenmai.Text = "";
        txtMieuta.Text = "";
    }
}