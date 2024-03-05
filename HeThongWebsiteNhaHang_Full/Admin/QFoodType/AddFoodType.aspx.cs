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
            msg.Text = "Add Types Of Dishes Successfully !";
        }
        catch (Exception ex)
        {
            msg.Text = "An Error Occurred: " + ex.Message;
        }

    }

    protected void reset_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
    }
}