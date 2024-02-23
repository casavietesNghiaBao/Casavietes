using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QLWeb_editQlWeb : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ShowInfoNhaHang();
        }

    }
    private void ShowInfoNhaHang()
    {
        var id = Request.QueryString["id_nh"];
        if (!string.IsNullOrEmpty(id))
        {
            var nh = data.qlwebn(Int16.Parse(id));
            Session["id"] = id;
            Session["anh"] = nh.anh_nh;
            Session["banner"] = nh.banner_nh;

            txtName.Text = nh.ten_nh;
            txtDiaChi.Text = nh.diachi_nh;
            txtSDT.Text = nh.sdt_nh;
            txtmail.Text = nh.email_nh;



            ImageEdit1.ImageUrl = "../../Assets/images/" + nh.anh_nh;
            ImageEdit2.ImageUrl = "../../Assets/images/" + nh.banner_nh;




            txtMieuta.Text = nh.gt_nh;


        }
    }
    protected void btnSua_Click(object sender, EventArgs e)
    {
        try
        {


            var nh = new QLWeb();

            nh.id_nh = Convert.ToInt16(Session["id"].ToString());
            nh.ten_nh = txtName.Text;
            nh.diachi_nh = txtDiaChi.Text;
            nh.sdt_nh = txtSDT.Text;
            nh.email_nh = txtmail.Text;
            nh.gt_nh = txtMieuta.Text;
            if (Page.IsValid && FileUpload1.HasFile)
            {
                string fileName = "../../Assets/images/" + FileUpload1.FileName;

                string filePath = MapPath(fileName);
                FileUpload1.SaveAs(filePath);
                //ImageEdit1.ImageUrl = fileName;



                nh.anh_nh = fileName;
            }
            else
            {
                nh.anh_nh = Session["anh"].ToString();
            }
            if (Page.IsValid && FileUpload2.HasFile)
            {

                string fileName = "../../Assets/images/" + FileUpload2.FileName;

                string filePath = MapPath(fileName);
                FileUpload2.SaveAs(filePath);
                //ImageEdit2.ImageUrl = fileName;
                nh.banner_nh = fileName;
            }
            else
            {
                nh.banner_nh = Session["banner"].ToString();
            }



            data.suaif(nh);
            msg.Text = "Update success!";
            msg.ForeColor = System.Drawing.Color.Green;
            ShowInfoNhaHang();
            Response.Redirect("QLWeb.aspx");
        }
        catch (Exception ex)
        {
            msg.Text = "Update Fail. Erorr: " + ex.Message + ". Let try!";
            msg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnLammoi_Click(object sender, EventArgs e)
    {
        Response.Redirect("QLWeb.aspx");

    }
}

