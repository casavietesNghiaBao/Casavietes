using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tranchu : System.Web.UI.Page
{
    DataUtil data = new DataUtil();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //trong
            var cko = Session["cko"] = false;
            //end trong
            var user = (Member)Session["User"];
            if (user != null)
            {
                var member = data.GetUser(user.member_id);
                nameuser.Text = member.member_fullname;
                avatarImage.Attributes["src"] = member.member_avatar;
                avatar.Style.Add("display", "block");
                login.Style.Add("display", "none");
            }
            //Huy
            if ((Cart)Session["Cart"] == null)
            {
                Cart CART = new Cart()
                {
                    ListFood = new List<OrderDetail>(),
                    emailKH = Session["User"] == null ? "" : ((Member)Session["User"]).member_mail,
                    tenKH = Session["User"] == null ? "" : ((Member)Session["User"]).member_fullname,
                    dienthoaiKH = Session["User"] == null ? "" : ((Member)Session["User"]).member_phone,
                    idtable = -1,
                    idmember = Session["User"] == null ? -1 : ((Member)Session["User"]).member_id,
                    tenBan = "",
                };
                Session["Cart"] = CART;
            }
            //endHuy
        }

    }

    protected void LogOut_Click(Object sender, EventArgs e)
    {
        Session["User"] = null;
        Session["Cart"] = null;
        Response.Redirect("TrangChu.aspx");
    }
    #region trong


    [WebMethod(EnableSession = true)]
    public static string sltb(string ds, string ts, string tr, string lb)
    {
        if (ds != "" || ts != "" || tr != "")
        {

            DataUtil dt = new DataUtil();
            int lb1 = int.Parse(lb);
            //Food food = new Food();

            string st = dt.dstbod(ds, ts, tr, lb1);


            return st;
        }
        else
        {
            return "";
        }

    }
    [WebMethod(EnableSession = true)]   
    public static string ckeds(string ds, string ts)
    {
        if (ds == "")
        {
            return "chưa nhập ngày đặt";

        }
        else
        {
            DateTime tn = DateTime.Now.Date;
            var todn = DateTime.Now.TimeOfDay;
            TimeSpan tso = TimeSpan.Parse(ts);
            DateTime to = DateTime.Parse(ds).Date;
            if (tn == to)
            {
                if (TimeSpan.Compare(tso, todn) < 0)
                {
                    return "thời gian đặt không hợp lệ";
                }
                else
                {
                    return "";
                }
            }
            return "";
        }

    }

    [WebMethod(EnableSession = true)]
    public static string ckd(string ds, string ts, string tr)
    {

        DateTime tn = DateTime.Now.Date;
        DateTime to = DateTime.Parse(ds).Date;
        if (tn > to)
        {
            return "ngày chọn không hợp lệ";
        }
        else
        {
            if (ts != "" || tr != "")
            {
                if (TimeSpan.Parse(ts) > TimeSpan.Parse(tr))
                {
                    return "thời gian đặt và trả không hợp lệ";
                }
                else
                {
                    return "";
                }
            }
            else
            {
                return "";
            }

        }


    }
    [WebMethod(EnableSession = true)]
    public static string ckedsts(string ds, string ts, string tr)
    {
        if (ds == "" && ts != "")
        {
            return "chưa nhập đặt ngày";

        }
        else
        {
            if (ds != "" && ts == "")
            {
                return "bạn chưa nhập time đặt bàn ";

            }
            else
            {
                if (ds == "" && ts == "")
                {
                    return "Bạn chưa nhập ngày và giờ đặt bàn";
                }
                else
                {

                    if (TimeSpan.Parse(ts) > TimeSpan.Parse(tr))
                    {
                        return "thời gian đặt và trả không hợp lệ";
                    }
                    else
                    {
                        return "";
                    }
                }
            }
        }


    }
    [WebMethod(EnableSession = true)]
    public static string ckedststr(string ds, string ts, string tr)
    {

        if (ds == "" || ts == "" || tr == "")
        {
            return "Bạn phải nhập đủ thời gian đặt và trả";

        }
        else
        {
            return "";
        }


    }
    [WebMethod(EnableSession = true)]
    public static string cko(string ds, string ts, string tr, string lb, string tb,string tenban)
    {

        if (ds == "" || ts == "" || tr == "" || lb == "")
        {
            return "0";

        }
        else
        {
            DateTime tn = DateTime.Now.Date;
            var todn = DateTime.Now.TimeOfDay;
            TimeSpan tso = TimeSpan.Parse(ts);
            DateTime to = DateTime.Parse(ds).Date;
            if (tn == to && (TimeSpan.Compare(tso, todn) < 0))
            {
                return "1";
            }
            else
            {
                if (tn > to || TimeSpan.Parse(ts) > TimeSpan.Parse(tr))
                {
                    return "1";
                }
                else
                {
                    Cart cart = (Cart)HttpContext.Current.Session["Cart"];
                    cart.idtable = Convert.ToInt32(tb);
                    cart.tenBan = tenban;
                    cart.ordertable_dateset = DateTime.Parse(ds);
                    cart.ordertable_timeset = TimeSpan.Parse(ts);
                    cart.ordertable_timereturn = TimeSpan.Parse(tr);
                    HttpContext.Current.Session["Cart"] = cart;
                    return "true";
                }
            }            
        }
    }

    #endregion

    #region Huy
    [WebMethod(EnableSession = true)]
    public static List<table> ListTableNull()
    {
        DataUtil dt = new DataUtil();
        List<table> rs = new List<table>();
        rs=dt.dsTableNull();
        return rs;
    }
    [WebMethod(EnableSession = true)]
    public static Food getFoodOrderNow(int idfood)
    {
        DataUtil dt = new DataUtil();
        Food food = new Food();
        food = dt.get1Food(idfood);
        return food;
    }
    [WebMethod(EnableSession = true)]
    [System.Web.Script.Services.ScriptMethod()]
    public static Cart AddToCart(int idfood, int soluong)
    {
        DataUtil dt = new DataUtil();
        if ((Cart)HttpContext.Current.Session["Cart"] == null)
        {
            Cart CART = new Cart()
            {
                ListFood = new List<OrderDetail>(),
                emailKH = HttpContext.Current.Session["User"] == null ? "" : ((Member)HttpContext.Current.Session["User"]).member_mail,
                tenKH = HttpContext.Current.Session["User"] == null ? "" : ((Member)HttpContext.Current.Session["User"]).member_fullname,
                dienthoaiKH = HttpContext.Current.Session["User"] == null ? "" : ((Member)HttpContext.Current.Session["User"]).member_phone,
                idtable = -1,
                idmember = HttpContext.Current.Session["User"] == null ? -1 : ((Member)HttpContext.Current.Session["User"]).member_id,
                tenBan = "",
            };
            HttpContext.Current.Session["Cart"] = CART;
        }
        Cart cart = (Cart)HttpContext.Current.Session["Cart"];
        List<OrderDetail> list = cart.ListFood;
        foreach (var item in list)
        {
            if (item.foodid == idfood)
            {
                item.quantity += soluong;
                item.thanhtien = (item.food_price - (item.food_price * item.food_sale / 100)) * item.quantity;
                cart.ListFood = list;
                HttpContext.Current.Session["Cart"] = cart;
                return cart;
            }
        }
        Food f = dt.get1Food(idfood);
        OrderDetail od = new OrderDetail()
        {
            foodid = f.food_id,
            food_name = f.food_name,
            food_price = f.food_price,
            food_sale = f.food_sale,
            quantity = soluong,
            food_avatar = f.food_avatar,
            thanhtien = (f.food_price - (f.food_price * f.food_sale / 100)) * soluong,
        };
        list.Add(od);
        cart.ListFood = list;
        HttpContext.Current.Session["Cart"] = cart;
        return cart;
    }
    [WebMethod(EnableSession = true)]
    [System.Web.Script.Services.ScriptMethod()]
    public static Cart ChangeQuantityFood(int idfood, int soluong)
    {
        DataUtil dt = new DataUtil();
        Cart cart = (Cart)HttpContext.Current.Session["Cart"];
        List<OrderDetail> list = cart.ListFood;
        foreach (var item in list)
        {
            if (item.foodid == idfood)
            {
                item.quantity = soluong;
                item.thanhtien = (item.food_price - (item.food_price * item.food_sale / 100)) * item.quantity;
                cart.ListFood = list;
                HttpContext.Current.Session["Cart"] = cart;
            }
        }
        return cart;
    }
    [WebMethod(EnableSession = true)]
    [System.Web.Script.Services.ScriptMethod()]
    public static Cart XoaKkhoiCart(int idfood)
    {
        DataUtil dt = new DataUtil();
        Cart cart = (Cart)HttpContext.Current.Session["Cart"];
        List<OrderDetail> list = cart.ListFood;
        OrderDetail tempf = new OrderDetail();
        foreach (var item in list)
        {
            if (item.foodid == idfood)
            {
                tempf = item;
            }
        }
        list.Remove(tempf);
        cart.ListFood = list;
        HttpContext.Current.Session["Cart"] = cart;
        return cart;
    }
    [WebMethod(EnableSession = true)]
    [System.Web.Script.Services.ScriptMethod()]
    public static Cart changeTableCart(int idtbl)
    {
        DataUtil dt = new DataUtil();
        Cart cart = (Cart)HttpContext.Current.Session["Cart"];
        cart.idtable = idtbl;
        HttpContext.Current.Session["Cart"] = cart;
        return cart;
    }
    [WebMethod(EnableSession = true)]
    [System.Web.Script.Services.ScriptMethod()]
    public static Cart XacNhanMuaHang(string tenKH, string emailKH, string dienthoaiKH)
    {
        DataUtil dt = new DataUtil();
        Cart cart = (Cart)HttpContext.Current.Session["Cart"];
        OrderTable odtbl = new OrderTable
        {
            ordertable_idtable = cart.idtable ?? -1,
            ordertable_iduser = cart.idmember ?? -1,
            ordertable_status = false,            
            dienthoaiKH = dienthoaiKH,
            emailKH = emailKH,
            tenKH = tenKH,
            loaiKH = cart.idmember > 0 ? true : false,
            loaiHD = cart.idtable > 0 ? true : false,
            ordertable_dateset = DateTime.Now,
        };
        if (cart.idtable > 0)
        {
            odtbl.ordertable_dateset = cart.ordertable_dateset;
            odtbl.ordertable_timeset = cart.ordertable_timeset;
            odtbl.ordertable_timereturn = cart.ordertable_timereturn;
        }
        int idordertbl = dt.ThemOrderTable(odtbl);
        if (idordertbl > 0)
        {
            foreach (var item in cart.ListFood)
            {
                OrderDetail orderDetail = item;
                orderDetail.ordertableid = idordertbl;
                dt.ThemOrderDetail(orderDetail);
            }
        }
        Cart C = new Cart()
        {
            ListFood = new List<OrderDetail>(),
            emailKH = HttpContext.Current.Session["User"] == null ? "" : ((Member)HttpContext.Current.Session["User"]).member_mail,
            tenKH = HttpContext.Current.Session["User"] == null ? "" : ((Member)HttpContext.Current.Session["User"]).member_fullname,
            dienthoaiKH = HttpContext.Current.Session["User"] == null ? "" : ((Member)HttpContext.Current.Session["User"]).member_phone,
            idtable = -1,
            idmember = HttpContext.Current.Session["User"] == null ? -1 : ((Member)HttpContext.Current.Session["User"]).member_id,
            tenBan = "",           
        };
        HttpContext.Current.Session["Cart"] = C;
        return C;
    }
    #endregion

    #region DUC
    [WebMethod]
    public static List<Food> ShowListFoodType(int IdFoodType)
    {
        DataUtil dt = new DataUtil();

        List<Food> li = new List<Food>();

        li = dt.getListFood_FoodType(IdFoodType);

        return li;
    }
    [WebMethod]
    public static string Contact(string Name, string Email, string Message)
    {
        DataUtil data = new DataUtil();
        Contact ct = new Contact { email = Email, name = Name, message = Message, thoigiangui = DateTime.Now };
        data.AddContact(ct);
        return "Bạn đã gửi liên hệ thành công!";
    }
    #endregion
}
