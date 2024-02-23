using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.Odbc;

/// <summary>
/// Summary description for DataUtil
/// </summary>
public class DataUtil
{
    SqlConnection con;

    string sqlcon = @"Data Source=.;Initial Catalog=WebsiteNhaHang;Integrated Security=True;TrustServerCertificate=True;";

    public DataUtil()
    {
        con = new SqlConnection(sqlcon);
    }


    #region DatRegion
    /// <summary>
    /// Get list members
    /// created by : Dat 25-11-2018
    /// </summary>
    /// <returns></returns>
    public List<Member> GetListMembers()
    {
        List<Member> listMember = new List<Member>();
        string sqlslTable = "SELECT * FROM MEMBER;";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Member mb = new Member();
            mb.member_id = (int)dr["member_id"];
            mb.member_status = (int)dr["member_status"];
            mb.member_type = (int)dr["member_type"];
            mb.member_fullname = (string)dr["member_fullname"];
            mb.member_mail = (string)dr["member_mail"];
            mb.member_password = (string)dr["member_password"];
            mb.member_phone = (string)dr["member_phone"];
            mb.member_username = (string)dr["member_username"];
            mb.member_avatar = (string)dr["member_avatar"];

            listMember.Add(mb);

        }
        con.Close();
        return listMember;
    }

    /// <summary>
    /// add new user
    /// </summary>
    /// <param name="member"></param>
    public void AddNewUser(Member member)
    {
        string sql = "insert into Member values(@fullname,@phone, @mail, @username, @password, @status, @type, @avatar)";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("fullname", member.member_fullname);
        cmd.Parameters.AddWithValue("phone", member.member_phone);
        cmd.Parameters.AddWithValue("mail", member.member_mail);
        cmd.Parameters.AddWithValue("username", member.member_username);
        cmd.Parameters.AddWithValue("password", member.member_password);
        cmd.Parameters.AddWithValue("status", member.member_status);
        cmd.Parameters.AddWithValue("type", member.member_type);
        cmd.Parameters.AddWithValue("avatar", member.member_avatar);

        cmd.ExecuteNonQuery();
        con.Close();
    }


    /// <summary>
    /// Get info User by id
    /// </summary>
    /// <param name="idmember"></param>
    /// <returns></returns>
    public Member GetUser(int idmember)
    {

        string sql = "select * from Member where member_id=@idmember";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("idmember", idmember);
        SqlDataReader dr = cmd.ExecuteReader();

        Member mb = new Member();

        while (dr.Read())
        {
            mb.member_id = (int)dr["member_id"];
            mb.member_status = (int)dr["member_status"];
            mb.member_type = (int)dr["member_type"];
            mb.member_fullname = (string)dr["member_fullname"];
            mb.member_mail = (string)dr["member_mail"];
            mb.member_password = (string)dr["member_password"];
            mb.member_phone = (string)dr["member_phone"];
            mb.member_username = (string)dr["member_username"];
            mb.member_avatar = (string)dr["member_avatar"];
        }
        con.Close();
        return mb;
    }


    public Member GetUserByName(string username)
    {

        string sql = "select * from Member where member_username=@username or member_mail=@username";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("username", username);
        SqlDataReader dr = cmd.ExecuteReader();

        Member mb = new Member();

        while (dr.Read())
        {
            mb.member_id = (int)dr["member_id"];
            mb.member_status = (int)dr["member_status"];
            mb.member_type = (int)dr["member_type"];
            mb.member_fullname = (string)dr["member_fullname"];
            mb.member_mail = (string)dr["member_mail"];
            mb.member_password = (string)dr["member_password"];
            mb.member_phone = (string)dr["member_phone"];
            mb.member_username = (string)dr["member_username"];
            mb.member_avatar = (string)dr["member_avatar"];
        }
        con.Close();
        return mb;
    }


    /// <summary>
    /// Update user
    /// </summary>
    /// <param name="member"></param>
    public void UpdateUser(Member member)
    {
        string sql = "update Member set member_fullname=@fullname, member_mail=@mail, member_phone=@phone, member_status=@status, member_type=@type, member_avatar=@avatar where member_id=@id";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("fullname", member.member_fullname);
        cmd.Parameters.AddWithValue("phone", member.member_phone);
        cmd.Parameters.AddWithValue("mail", member.member_mail);
        cmd.Parameters.AddWithValue("status", member.member_status);
        cmd.Parameters.AddWithValue("type", member.member_type);
        cmd.Parameters.AddWithValue("avatar", member.member_avatar);
        cmd.Parameters.AddWithValue("id", member.member_id);

        cmd.ExecuteNonQuery();
        con.Close();
    }


    public void UpdatePassUser(Member member)
    {
        string sql = "update Member set member_password=@password where member_id=@id";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("password", member.member_password);
        cmd.Parameters.AddWithValue("id", member.member_id);

        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void UpdatePassUserByEmail(string pass, string email)
    {
        string sql = "update Member set member_password=@password where member_mail=@mail";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("password", pass);
        cmd.Parameters.AddWithValue("mail", email);

        cmd.ExecuteNonQuery();
        con.Close();
    }



    public bool CheckLogin(string username, string password, int type)
    {
        string sql = "select * from Member where (member_username = @username or member_mail = @username) and member_password = @password and member_type=@type and member_status=1";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("username", username);
        cmd.Parameters.AddWithValue("password", password);
        cmd.Parameters.AddWithValue("type", type);

        Int32 count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if (count > 0)
            return true;
        else
            return false;
    }



    public bool CheckRegister(string username, string mail, string phone)
    {
        string sql = "select * from Member where member_username=@username or member_mail = @mail or member_phone= @phone";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("username", username);
        cmd.Parameters.AddWithValue("mail", mail);
        cmd.Parameters.AddWithValue("phone", phone);

        Int32 count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if (count > 0)
            return true;
        else
            return false;
    }


    public bool CheckMail(string mail)
    {
        string sql = "select * from Member where member_mail = @mail";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("mail", mail);

        Int32 count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if (count > 0)
            return true;
        else
            return false;
    }

    public bool DeleteUser(int iduser)
    {
        string sql = "delete from Member where member_id=@iduser";
        con.Open();
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("iduser", iduser);

        cmd.ExecuteNonQuery();
        con.Close();
        return true;
    }
    #endregion

    #region DUC
    public List<Food> getListFood()
    {
        List<Food> li = new List<Food>();
        string strSql = "select * from Food";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            Food f = new Food();
            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

            li.Add(f);
        }
        con.Close();
        return li;
    }
    public void DeleteFood(int idFood)
    {
        string strSql = "delete from Food where food_id=@idFood";
        con.Open();
        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("idFood", idFood);
        cmd.ExecuteNonQuery();

        con.Close();
    }
    public void AddFood(Food f)
    {
        string strSql = "insert into Food values(@food_name, @food_price, @food_sale, @food_avatar, @food_description, @foodtype_id)";
        con.Open();
        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("food_name", f.food_name);
        cmd.Parameters.AddWithValue("food_price", f.food_price);
        cmd.Parameters.AddWithValue("food_sale", f.food_sale);
        cmd.Parameters.AddWithValue("food_avatar", f.food_avatar);
        cmd.Parameters.AddWithValue("food_description", f.food_description);
        cmd.Parameters.AddWithValue("foodtype_id", f.foodtype_id);

        cmd.ExecuteNonQuery();

        con.Close();
    }

    public List<FoodType> getListFoodType()
    {
        List<FoodType> liFoodType = new List<FoodType>();
        string strSql = "select * from FoodType";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            FoodType d = new FoodType();
            d.foodtype_id = (int)dr["foodtype_id"];
            d.foodtype_name = (string)dr["foodtype_name"];

            liFoodType.Add(d);
        }
        con.Close();
        return liFoodType;

    }

    // Sửa
    public Food get1Food(int food_id)
    {
        List<Food> lifood = new List<Food>();
        string strSql = "select * from Food where food_id=@food_id";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("food_id", food_id);

        SqlDataReader dr = cmd.ExecuteReader();

        Food f = new Food();
        if (dr.Read())
        {
            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

        }
        con.Close();
        return f;
    }

    public void EditFood(Food food)
    {
        string strsql = "update Food set food_name=@food_name, food_price=@food_price, food_sale=@food_sale, food_avatar=@food_avatar, food_description=@food_description, foodtype_id=@foodtype_id where food_id=@id";
        con.Open();
        SqlCommand cmd = new SqlCommand(strsql, con);

        cmd.Parameters.AddWithValue("food_name", food.food_name);
        cmd.Parameters.AddWithValue("food_price", food.food_price);
        cmd.Parameters.AddWithValue("food_sale", food.food_sale);
        cmd.Parameters.AddWithValue("food_avatar", food.food_avatar);
        cmd.Parameters.AddWithValue("food_description", food.food_description);
        cmd.Parameters.AddWithValue("foodtype_id", food.foodtype_id);
        cmd.Parameters.AddWithValue("id", food.food_id);

        cmd.ExecuteNonQuery();
        con.Close();
    }

    //FOOD_TYPE
    public void AddFoodType(FoodType ft)
    {
        string strSql = "insert into FoodType values(@name)";
        con.Open();
        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("name", ft.foodtype_name);

        cmd.ExecuteNonQuery();
        con.Close();
    }

    public FoodType get1FoodType(int foodtype_id)
    {
        List<FoodType> li_ft = new List<FoodType>();
        string strSql = "select * from FoodType where foodtype_id=@id";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("id", foodtype_id);

        SqlDataReader dr = cmd.ExecuteReader();

        FoodType ft = new FoodType(); ;
        while (dr.Read())
        {
            ft.foodtype_id = (int)dr["foodtype_id"];
            ft.foodtype_name = (string)dr["foodtype_name"];
        }
        con.Close();
        return ft;
    }

    public void EditFoodType(FoodType ft)
    {
        string strSql = "update FoodType set foodtype_name=@name where foodtype_id=@id";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("name", ft.foodtype_name);
        cmd.Parameters.AddWithValue("id", ft.foodtype_id);

        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void DeleteFoodType(int foodtype_id)
    {
        string strSql = "delete from Food where foodtype_id=@id delete from FoodType where foodtype_id=@id ";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("id", foodtype_id);

        cmd.ExecuteNonQuery();
        con.Close();
    }

    // Client
    public List<Food> getListFoodDiscount()
    {
        List<Food> li = new List<Food>();
        string strSql = "select * from Food where food_sale > 0";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Food f = new Food();

            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

            li.Add(f);
        }
        con.Close();
        return li;
    }
    public List<Food> getNewListFood()
    {
        List<Food> li = new List<Food>();
        string strSql = "SELECT * FROM Food ORDER BY food_id DESC";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Food f = new Food();

            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

            li.Add(f);
        }
        con.Close();
        return li;
    }
    public List<Food> getList_FoodLimit6()
    {
        List<Food> liFoDiscount = new List<Food>();
        string strSql = "SELECT TOP 6 * FROM Food";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Food f = new Food();
            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

            liFoDiscount.Add(f);
        }
        con.Close();
        return liFoDiscount;
    }
    // Select theo THẺ lOẠI MÓN ĂN

    //public void DeleteFood(int idFood)
    //{
    //    string strSql = "delete from Food where food_id=@idFood";
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand(strSql, con);

    //    cmd.Parameters.AddWithValue("idFood", idFood);
    //    cmd.ExecuteNonQuery();

    //    con.Close();
    //}

    //public List<Food> getListFood_FoodType(int foodtype_id)
    public List<Food> getListFood_FoodType(int foodtype_id)
    {
        List<Food> liFoDiscount = new List<Food>();
        string strSql = "select * from Food where foodtype_id=@foodtype_id";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("foodtype_id", foodtype_id);

        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Food f = new Food();
            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

            liFoDiscount.Add(f);
        }
        con.Close();
        return liFoDiscount;
    }
    // Select theo THẺ lOẠI MÓN ĂN
    public List<Food> getListFoodDiscount(int foodtype_id)
    {
        List<Food> liFoDiscount = new List<Food>();
        string strSql = "select * from Food where foodtype_id=@foodtype_id";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("foodtype_id", foodtype_id);

        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Food f = new Food();
            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

            liFoDiscount.Add(f);
        }
        con.Close();
        return liFoDiscount;
    }

    public List<Food> getListFood_Search(string key)
    {
        List<Food> liF = new List<Food>();
        string strSql = "SELECT * FROM Food where food_name LIKE '%'+@SearchText+'%'";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("SearchText", key);

        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Food f = new Food();
            f.food_id = (int)dr["food_id"];
            f.food_name = (string)dr["food_name"];
            f.food_price = (double)dr["food_price"];
            f.food_sale = (int)dr["food_sale"];
            f.food_avatar = (string)dr["food_avatar"];
            f.food_description = (string)dr["food_description"];
            f.foodtype_id = (int)dr["foodtype_id"];

            liF.Add(f);
        }
        con.Close();
        return liF;
    }

    public List<FoodType> getListFood_SearchFType(string key)
    {
        List<FoodType> liF = new List<FoodType>();
        string strSql = "SELECT * FROM FoodType where foodtype_name LIKE '%'+@SearchText+'%'";
        con.Open();

        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("SearchText", key);

        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            FoodType f = new FoodType();
            f.foodtype_id = (int)dr["foodtype_id"];
            f.foodtype_name = (string)dr["foodtype_name"];

            liF.Add(f);
        }
        con.Close();
        return liF;
    }

    // CONTACT
    //public List<Contact> getListContact()
    //{
    //    List<Contact> li = new List<Contact>();
    //    string strSql = "select * from Contact";
    //    con.Open();

    //    SqlCommand cmd = new SqlCommand(strSql, con);
    //    SqlDataReader dr = cmd.ExecuteReader();

    //    while (dr.Read())
    //    {
    //        Contact c = new Contact();
    //        c.idContact = (int)dr["idContact"];
    //        c.name = (string)dr["name"];
    //        c.email = (string)dr["email"];
    //        c.message = (string)dr["message"];
    //        c.thoigiangui = (DateTime)dr["ngaygui"];

    //        li.Add(c);
    //    }
    //    con.Close();
    //    return li;
    //}
    public void AddContact(Contact c)
    {
        string strSql = "insert into Contact(name, email, message, thoigiangui) values(@name, @email, @message, @thoigiangui)";
        con.Open();
        SqlCommand cmd = new SqlCommand(strSql, con);

        cmd.Parameters.AddWithValue("name", c.name);
        cmd.Parameters.AddWithValue("email", c.email);
        cmd.Parameters.AddWithValue("message", c.message);
        cmd.Parameters.AddWithValue("thoigiangui", c.thoigiangui);

        cmd.ExecuteNonQuery();

        con.Close();
    }

    //public void DeleteContact(int idContact)
    //{
    //    string strSql = "delete from Contact where idContact=@idContact";
    //    con.Open();

    //    SqlCommand cmd = new SqlCommand(strSql, con);

    //    cmd.Parameters.AddWithValue("idContact", idContact);

    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //}

    #endregion

    #region Huy
    //Contact
    public List<Contact> GetDSContact()
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            List<Contact> list = new List<Contact>();
            string query = "select * from Contact";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Contact c = new Contact();

                c.idContact = (int)dr["idContact"];
                c.name = (string)dr["name"];
                c.email = (string)dr["email"];
                c.message = (string)dr["message"];
                c.thoigiangui = (DateTime)dr["thoigiangui"];
                if (dr["noidungTraloi"] != System.DBNull.Value)
                {
                    c.noidungTraloi = (string)dr["noidungTraloi"];
                }
                if (dr["thoigianTraloi"] != System.DBNull.Value)
                {
                    c.thoigianTraloi = (DateTime)dr["thoigianTraloi"];
                }
                if (dr["tinhtrangTraloi"] != System.DBNull.Value)
                {
                    c.tinhtrangTraloi = (Boolean)dr["tinhtrangTraloi"];
                }
                list.Add(c);
            }
            conn.Close();
            return list;
        }
    }
    //public bool ReplyLienHe(int idLienHe, string EmailLienHe, string SbEmail, string ContentEmail)
    //{

    //    using (var conn = new SqlConnection(sqlcon))
    //    {
    //        bool rs = MailProvider.sendEmail(ContentEmail, SbEmail, EmailLienHe);
    //        if (rs)
    //        {
    //            string query = "update Contact set noidungTraloi='" + ContentEmail + "' ,thoigianTraloi='" + DateTime.Now + "', tinhtrangTraloi='true' where idContact=" + idLienHe;
    //            conn.Open();
    //            SqlCommand cmd = new SqlCommand(query, conn);
    //            cmd.ExecuteNonQuery();
    //            conn.Close();
    //            return true;
    //        }
    //        return false;
    //    }
    //}
    public void ReplyLienHe(Contact c)
    {
        string query = "update Contact set noidungTraloi=@nd ,thoigianTraloi=@tgtl, tinhtrangTraloi='true' where idContact=@idContact";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("tgtl", c.thoigianTraloi);
        cmd.Parameters.AddWithValue("nd", c.noidungTraloi); 
        cmd.Parameters.AddWithValue("idContact", c.idContact);

        cmd.ExecuteNonQuery();
        con.Close();
               
    }
    public void XoaLienHe(int idLienHe)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "delete from Contact where idContact=" + idLienHe;
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }   
    
    // ---------------------- END CONTACT --------------------------- 
    public List<OrderVM> TimHoaDon(DateTime ngaybd, DateTime ngaykt, int ttthanhtoan)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            DateTime defaultdate = new DateTime();
            List<OrderVM> listRS = new List<OrderVM>();
            if (ngaybd > defaultdate || ngaykt > defaultdate || ttthanhtoan != -1)
            {
                string query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_status=" + ttthanhtoan + " and odtbl.ordertable_dateset >='" + ngaybd + "' and odtbl.ordertable_dateset <='" + ngaykt + "'";
                if (ngaybd == defaultdate && ngaykt > defaultdate && ttthanhtoan != -1)
                    query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_status=" + ttthanhtoan + "' and odtbl.ordertable_dateset <='" + ngaykt + "'";
                if (ngaybd > defaultdate && ngaykt == defaultdate && ttthanhtoan != -1)
                    query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_status=" + ttthanhtoan + " and odtbl.ordertable_dateset >='" + ngaybd + "'";
                if (ngaybd > defaultdate && ngaykt > defaultdate && ttthanhtoan == -1)
                    query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where ordertable_dateset >='" + ngaybd + "' and odtbl.ordertable_dateset <='" + ngaykt + "'";
                if (ngaybd == defaultdate && ngaykt == defaultdate && ttthanhtoan != -1)
                    query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_status=" + ttthanhtoan;
                if (ngaybd > defaultdate && ngaykt == defaultdate && ttthanhtoan == -1)
                    query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_dateset >='" + ngaybd + "'";
                if (ngaybd == defaultdate && ngaykt > defaultdate && ttthanhtoan == -1)
                    query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_dateset <='" + ngaykt + "'";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    OrderVM tbVM = new OrderVM();
                    tbVM.ordertable_id = (int)dr["ordertable_id"];
                    tbVM.ordertable_status = (Boolean)dr["ordertable_status"];
                    if (dr["ordertable_iduser"] != System.DBNull.Value)
                    {
                        tbVM.ordertable_iduser = (int)(dr["ordertable_iduser"] ?? -1);
                    }
                    tbVM.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
                    if (dr["ordertable_idtable"] != System.DBNull.Value)
                    {
                        tbVM.ordertable_idtable = (int)(dr["ordertable_idtable"]);
                    }
                    if (dr["tenKH"] != System.DBNull.Value)
                    {
                        tbVM.tenKH = (string)dr["tenKH"];
                    }
                    if (dr["emailKH"] != System.DBNull.Value)
                    {
                        tbVM.emailKH = (string)(dr["emailKH"]);
                    }
                    if (dr["dienthoaiKH"] != System.DBNull.Value)
                    {
                        tbVM.dienthoaiKH = (string)(dr["dienthoaiKH"]);
                    }
                    if (dr["table_name"] != System.DBNull.Value)
                    {
                        tbVM.table_name = (string)(dr["table_name"]);
                    }
                    if (dr["loaiHD"] != System.DBNull.Value)
                    {
                        tbVM.loaiHD = (bool)(dr["loaiHD"]);
                    }
                    if (dr["loaiKH"] != System.DBNull.Value)
                    {
                        tbVM.loaiKH = (bool)(dr["loaiKH"] ?? false);
                    }
                    tbVM.TotalMoney = 0;
                    tbVM.ListOrderDetail = this.dsOrderDetailByTable((int)dr["ordertable_id"]);
                    var li = tbVM.ListOrderDetail;
                    if (li.Count > 0)
                    {
                        Double t = 0;
                        foreach (var item in li)
                        {
                            t += (Double)(item.quantity * item.food_price * (Double)(100 - item.food_sale) / 100);
                        }
                        tbVM.TotalMoney = t;
                    }
                    listRS.Add(tbVM);
                }
                conn.Close();
                dr.Close();
            }
            return listRS;
        }
    }
    public void XoaOrderTbl(int idodtbl)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "delete from OrderTable where ordertable_id=" + idodtbl;
            string query1 = "delete from OrderDetail where ordertableid=" + idodtbl;
            string query2 = "select top 1 ordertable_idtable from OrderTable where ordertable_id=" + idodtbl;
            conn.Open();            
            SqlCommand cmd2 = new SqlCommand(query2, conn);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            int idtbl = -1;
            if (dr2.Read())
            {
                idtbl = (int)dr2["ordertable_idtable"];
            }
            conn.Close();
            conn.Open();
            if (idtbl != -1)
            {
                string query3 = "update  qlTable set table_status='false' where table_id=" + idtbl;
                SqlCommand cmd3 = new SqlCommand(query3, conn);
                cmd3.ExecuteNonQuery();
            }            
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlCommand cmd1 = new SqlCommand(query1, conn);            
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            conn.Close();
        }
    }
    public void ThanhToanOrderTbl(int idodtbl)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "update  OrderTable set ordertable_status='true' where ordertable_id=" + idodtbl;
            string query1 = "select top 1 ordertable_idtable from OrderTable where ordertable_id=" + idodtbl;
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlCommand cmd1 = new SqlCommand(query1, conn);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            int idtbl = -1;
            if (dr1.Read())
            {
                idtbl = (int)dr1["ordertable_idtable"];
            }
            conn.Close();
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            conn.Close();            
            if (idtbl != -1)
            {
                bool kt = false;
                conn.Open();
                string query4 = "select *  from OrderTable where ordertable_idtable=" + idtbl+ "and ordertable_status='false'";
                SqlCommand cmd4 = new SqlCommand(query4, conn);
                SqlDataReader dr4 = cmd4.ExecuteReader();
                if (!dr4.Read())
                {
                    kt = true;
                }
                conn.Close();
                if (kt)
                {
                    conn.Open();
                    string query3 = "update  qlTable set table_status='false' where table_id=" + idtbl;
                    SqlCommand cmd3 = new SqlCommand(query3, conn);
                    cmd3.ExecuteNonQuery();
                    conn.Close();
                }                
            }                        
        }
    }
    public List<OrderDetail> dsOrderDetail()
    {
        List<OrderDetail> list = new List<OrderDetail>();
        string query = "select od.orderdetail_id,od.foodid,od.quantity,od.ordertableid,f.food_name,f.food_price,f.food_sale,f.food_avatar from OrderDetail od inner join Food f on od.foodid=f.food_id inner join OrderTable tb on od.ordertableid=tb.ordertable_id";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            OrderDetail od = new OrderDetail();
            od.orderdetailid = (int)dr["orderdetail_id"];
            od.foodid = (int)dr["foodid"];
            od.ordertableid = (int)dr["ordertableid"];
            od.quantity = (int)dr["quantity"];
            od.food_name = (string)dr["food_name"];
            od.food_price = (Double)dr["food_price"];
            od.food_sale = (int)dr["food_sale"];
            od.food_avatar = (string)dr["food_avatar"];
            od.thanhtien = od.quantity * od.food_price * (Double)(100 - od.food_sale) / 100;
            list.Add(od);
        }
        con.Close();
        return list;
    }

    public List<OrderDetail> dsOrderDetailByTable(int tableid)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            List<OrderDetail> list = new List<OrderDetail>();
            string query = "select od.orderdetail_id,od.foodid,od.quantity,od.ordertableid,f.food_name,f.food_price,f.food_sale,f.food_avatar from OrderDetail od inner join Food f on od.foodid=f.food_id inner join OrderTable tb on od.ordertableid=tb.ordertable_id where od.ordertableid=@tableid";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("tableid", tableid);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                OrderDetail od = new OrderDetail();

                od.orderdetailid = (int)dr["orderdetail_id"];
                od.foodid = (int)dr["foodid"];
                od.ordertableid = (int)dr["ordertableid"];
                od.quantity = (int)dr["quantity"];
                od.food_name = (string)dr["food_name"];
                od.food_price = (Double)dr["food_price"];
                od.food_sale = (int)dr["food_sale"];
                od.food_avatar = (string)dr["food_avatar"];
                od.thanhtien = od.quantity * od.food_price * (Double)(100 - od.food_sale) / 100;
                list.Add(od);

            }
            conn.Close();
            return list;
        }
    }

    public List<OrderDetail> dsOrderDetailByFood(int foodid)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            List<OrderDetail> list = new List<OrderDetail>();
            string query = "select od.orderdetail_id,od.foodid,od.quantity,od.ordertableid,f.food_name,f.food_price,f.food_sale,f.food_avatar from OrderDetail od inner join Food f on od.foodid=f.food_id inner join OrderTable tb on od.ordertableid=tb.ordertable_id where od.foodid=@foodid";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("foodid", foodid);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                OrderDetail od = new OrderDetail()
                {
                    orderdetailid = (int)dr["orderdetailid"],
                    foodid = (int)dr["foodid"],
                    ordertableid = (int)dr["ordertableid"],
                    quantity = (int)dr["quantity"],
                    food_name = (string)dr["food_name"],
                    food_price = (Double)dr["food_price"],
                    food_sale = (int)dr["food_sale"],
                    food_avatar = (string)dr["f.food_avatar"]
                };
                od.thanhtien = od.quantity * od.food_price * (Double)(100 - od.food_sale) / 100;
                list.Add(od);

            }
            conn.Close();
            return list;
        }
    }

    public void ThemOrderDetail(OrderDetail od)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "insert into OrderDetail values(@foodid,@quantity,@ordertableid)";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("foodid", od.foodid);
            cmd.Parameters.AddWithValue("quantity", od.quantity);
            cmd.Parameters.AddWithValue("ordertableid", od.ordertableid);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    public void xoaOrderDetail(int matb)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "delete from OrderDetail where orderdetail_id=" + matb;
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    public List<OrderVM> GetListOrderVMByUser(int iduser)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_iduser=" + iduser;
            conn.Close();
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            List<OrderVM> listRS = new List<OrderVM>();
            while (dr.Read())
            {
                OrderVM tbVM = new OrderVM();
                tbVM.ordertable_id = (int)dr["ordertable_id"];
                tbVM.ordertable_status = (Boolean)dr["ordertable_status"];
                if (dr["ordertable_iduser"] != System.DBNull.Value)
                {
                    tbVM.ordertable_iduser = (int)(dr["ordertable_iduser"] ?? -1);
                }
                tbVM.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
                if (dr["ordertable_idtable"] != System.DBNull.Value)
                {
                    tbVM.ordertable_idtable = (int)(dr["ordertable_idtable"]);
                }
                if (dr["tenKH"] != System.DBNull.Value)
                {
                    tbVM.tenKH = (string)dr["tenKH"];
                }
                if (dr["emailKH"] != System.DBNull.Value)
                {
                    tbVM.emailKH = (string)(dr["emailKH"]);
                }
                if (dr["dienthoaiKH"] != System.DBNull.Value)
                {
                    tbVM.dienthoaiKH = (string)(dr["dienthoaiKH"]);
                }
                if (dr["table_name"] != System.DBNull.Value)
                {
                    tbVM.table_name = (string)(dr["table_name"]);
                }
                if (dr["loaiHD"] != System.DBNull.Value)
                {
                    tbVM.loaiHD = (bool)(dr["loaiHD"]);
                }
                if (dr["loaiKH"] != System.DBNull.Value)
                {
                    tbVM.loaiKH = (bool)(dr["loaiKH"] ?? false);
                }
                tbVM.TotalMoney = 0;
                tbVM.ListOrderDetail = this.dsOrderDetailByTable((int)dr["ordertable_id"]);
                var li = tbVM.ListOrderDetail;
                if (li.Count > 0)
                {
                    Double t = 0;
                    foreach (var item in li)
                    {
                        t += (Double)(item.quantity * item.food_price * (Double)(100 - item.food_sale) / 100);
                    }
                    tbVM.TotalMoney = t;
                }
                listRS.Add(tbVM);
            }
            conn.Close();
            return listRS;
        }
    }

    public List<OrderVM> GetListOrderVM()
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            List<OrderVM> listRS = new List<OrderVM>();
            string query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                OrderVM tbVM = new OrderVM();
                tbVM.ordertable_id = (int)dr["ordertable_id"];
                tbVM.ordertable_status = (Boolean)dr["ordertable_status"];
                if (dr["ordertable_iduser"] != System.DBNull.Value)
                {
                    tbVM.ordertable_iduser = (int)(dr["ordertable_iduser"] ?? -1);
                }
                tbVM.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
                if (dr["ordertable_idtable"] != System.DBNull.Value)
                {
                    tbVM.ordertable_idtable = (int)(dr["ordertable_idtable"]);
                }
                if (dr["tenKH"] != System.DBNull.Value)
                {
                    tbVM.tenKH = (string)dr["tenKH"];
                }
                if (dr["emailKH"] != System.DBNull.Value)
                {
                    tbVM.emailKH = (string)(dr["emailKH"]);
                }
                if (dr["dienthoaiKH"] != System.DBNull.Value)
                {
                    tbVM.dienthoaiKH = (string)(dr["dienthoaiKH"]);
                }
                if (dr["table_name"] != System.DBNull.Value)
                {
                    tbVM.table_name = (string)(dr["table_name"]);
                }
                if (dr["loaiHD"] != System.DBNull.Value)
                {
                    tbVM.loaiHD = (bool)(dr["loaiHD"]);
                }
                if (dr["loaiKH"] != System.DBNull.Value)
                {
                    tbVM.loaiKH = (bool)(dr["loaiKH"] ?? false);
                }
                tbVM.TotalMoney = 0;
                tbVM.ListOrderDetail = this.dsOrderDetailByTable((int)dr["ordertable_id"]);
                var li = tbVM.ListOrderDetail;
                if (li.Count > 0)
                {
                    Double t = 0;
                    foreach (var item in li)
                    {
                        t += (Double)(item.quantity * item.food_price * (Double)(100 - item.food_sale) / 100);
                    }
                    tbVM.TotalMoney = t;
                }
                listRS.Add(tbVM);
            }
            conn.Close();
            dr.Close();
            return listRS;
        }
    }

    public List<OrderVM> GetListOrderVMByIdUser(int idUser)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            List<OrderVM> listRS = new List<OrderVM>();
            string query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_timeset,odtbl.ordertable_dateset,odtbl.ordertable_timereturn,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_iduser = @iduser";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("iduser", idUser);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                OrderVM tbVM = new OrderVM();
                tbVM.ordertable_id = (int)dr["ordertable_id"];
                tbVM.ordertable_status = (Boolean)dr["ordertable_status"];
                if (dr["ordertable_iduser"] != System.DBNull.Value)
                {
                    tbVM.ordertable_iduser = (int)(dr["ordertable_iduser"] ?? -1);
                }
                tbVM.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
                if (dr["ordertable_idtable"] != System.DBNull.Value)
                {
                    tbVM.ordertable_idtable = (int)(dr["ordertable_idtable"]);
                }
                if (dr["tenKH"] != System.DBNull.Value)
                {
                    tbVM.tenKH = (string)dr["tenKH"];
                }
                if (dr["emailKH"] != System.DBNull.Value)
                {
                    tbVM.emailKH = (string)(dr["emailKH"]);
                }
                if (dr["dienthoaiKH"] != System.DBNull.Value)
                {
                    tbVM.dienthoaiKH = (string)(dr["dienthoaiKH"]);
                }
                if (dr["table_name"] != System.DBNull.Value)
                {
                    tbVM.table_name = (string)(dr["table_name"]);
                }
                if (dr["loaiHD"] != System.DBNull.Value)
                {
                    tbVM.loaiHD = (bool)(dr["loaiHD"]);
                }
                if (dr["loaiKH"] != System.DBNull.Value)
                {
                    tbVM.loaiKH = (bool)(dr["loaiKH"] ?? false);
                }
                tbVM.TotalMoney = 0;
                tbVM.ListOrderDetail = this.dsOrderDetailByTable((int)dr["ordertable_id"]);
                var li = tbVM.ListOrderDetail;
                if (li.Count > 0)
                {
                    Double t = 0;
                    foreach (var item in li)
                    {
                        t += (Double)(item.quantity * item.food_price * (Double)(100 - item.food_sale) / 100);
                    }
                    tbVM.TotalMoney = t;
                }
                listRS.Add(tbVM);
            }
            conn.Close();
            dr.Close();
            return listRS;
        }
    }

    public OrderVM GetOrderVM(int idorderTable)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "select odtbl.ordertable_id,odtbl.ordertable_iduser,odtbl.ordertable_dateset,odtbl.ordertable_idtable,odtbl.ordertable_status,odtbl.tenKH,odtbl.emailKH,odtbl.emailKH,odtbl.dienthoaiKH,odtbl.loaiHD,odtbl.loaiKH,tbl.table_name from OrderTable odtbl left join Member m on odtbl.ordertable_iduser= m.member_id left join qlTable tbl on odtbl.ordertable_idtable= tbl.table_id where odtbl.ordertable_id=" + idorderTable;
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            OrderVM tbVM = new OrderVM();
            if (dr.Read())
            {
                tbVM.ordertable_id = (int)dr["ordertable_id"];
                tbVM.ordertable_status = (Boolean)dr["ordertable_status"];
                if (dr["ordertable_iduser"] != System.DBNull.Value)
                {
                    tbVM.ordertable_iduser = (int)(dr["ordertable_iduser"] ?? -1);
                }
                tbVM.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
                if (dr["ordertable_idtable"] != System.DBNull.Value)
                {
                    tbVM.ordertable_idtable = (int)(dr["ordertable_idtable"]);
                }
                if (dr["tenKH"] != System.DBNull.Value)
                {
                    tbVM.tenKH = (string)dr["tenKH"];
                }
                if (dr["emailKH"] != System.DBNull.Value)
                {
                    tbVM.emailKH = (string)(dr["emailKH"]);
                }
                if (dr["dienthoaiKH"] != System.DBNull.Value)
                {
                    tbVM.dienthoaiKH = (string)(dr["dienthoaiKH"]);
                }
                if (dr["table_name"] != System.DBNull.Value)
                {
                    tbVM.table_name = (string)(dr["table_name"]);
                }
                if (dr["loaiHD"] != System.DBNull.Value)
                {
                    tbVM.loaiHD = (bool)(dr["loaiHD"]);
                }
                if (dr["loaiKH"] != System.DBNull.Value)
                {
                    tbVM.loaiKH = (bool)(dr["loaiKH"] ?? false);
                }
                tbVM.TotalMoney = 0;
                tbVM.ListOrderDetail = this.dsOrderDetailByTable(idorderTable);
                var li = tbVM.ListOrderDetail;
                if (li.Count > 0)
                {
                    Double t = 0;
                    foreach (var item in li)
                    {
                        t += (Double)(item.quantity * item.food_price * (Double)(100 - item.food_sale) / 100);
                    }
                    tbVM.TotalMoney = t;
                }
            }
            conn.Close();
            return tbVM;
        }
    }

    public int ThemOrderTable(OrderTable odtbl)
    {
        using (var conn = new SqlConnection(sqlcon))
        {
            string query = "insert into OrderTable (ordertable_iduser,ordertable_dateset,ordertable_timeset,ordertable_timereturn,ordertable_idtable,ordertable_status,tenKH,emailKH,dienthoaiKH,loaiKH,loaiHD) values(@ordertable_iduser,@ordertable_dateset,@ordertable_timeset,@ordertable_timereturn,@ordertable_idtable,@ordertable_status,@tenKH,@emailKH,@dienthoaiKH,@loaiKH,@loaiHD)";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("ordertable_iduser", odtbl.ordertable_iduser);
            cmd.Parameters.AddWithValue("ordertable_timeset", odtbl.ordertable_timeset);
            cmd.Parameters.AddWithValue("ordertable_timereturn", odtbl.ordertable_timereturn);
            cmd.Parameters.AddWithValue("ordertable_dateset", odtbl.ordertable_dateset);
            cmd.Parameters.AddWithValue("ordertable_idtable", odtbl.ordertable_idtable);
            cmd.Parameters.AddWithValue("ordertable_status", odtbl.ordertable_status);
            cmd.Parameters.AddWithValue("tenKH", odtbl.tenKH);
            cmd.Parameters.AddWithValue("emailKH", odtbl.emailKH);
            cmd.Parameters.AddWithValue("dienthoaiKH", odtbl.dienthoaiKH);
            cmd.Parameters.AddWithValue("loaiHD", odtbl.loaiHD);
            cmd.Parameters.AddWithValue("loaiKH", odtbl.loaiKH);
            cmd.ExecuteNonQuery();
            if (odtbl.ordertable_idtable != -1)
            {
                string query2 = "update  qlTable set table_status='true' where table_id=" + odtbl.ordertable_idtable;
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                cmd2.ExecuteNonQuery();
            }
            string query1 = "select top 1 * from OrderTable order by ordertable_id desc";
            SqlCommand cmd1 = new SqlCommand(query1, conn);
            SqlDataReader dr = cmd1.ExecuteReader();
            int idOrderTbl = -1;
            while (dr.Read())
            {
                idOrderTbl = (int)dr["ordertable_id"];
            }
            conn.Close();
            return idOrderTbl;
        }
    }
    #endregion

    #region Trong
    public List<table> dsTableNull()
    {
        List<table> listTable = new List<table>();
        string sqlslTable = "select * from qlTable where table_status=0";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            table tb = new table();
            tb.table_id = (int)dr["table_id"];
            tb.table_name = (string)dr["table_name"];
            //tb.table_status = (bool)dr["table_status"];
            tb.table_description = (int)dr["table_description"];

            listTable.Add(tb);

        }
        con.Close();
        return listTable;
    }
    public List<table> dsTable()
    {
        List<table> listTable = new List<table>();
        string sqlslTable = "select * from qlTable";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            table tb = new table();
            tb.table_id = (int)dr["table_id"];
            tb.table_name = (string)dr["table_name"];
            tb.table_status = (bool)dr["table_status"];
            tb.table_description = (int)dr["table_description"];

            listTable.Add(tb);

        }
        con.Close();
        return listTable;
    }
    public List<table> dsTableL(int l)
    {
        List<table> listTable = new List<table>();
        string sqlslTable = "select * from qlTable where table_description=" + l + "";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            table tb = new table();
            tb.table_id = (int)dr["table_id"];
            tb.table_name = (string)dr["table_name"];
            tb.table_status = (bool)dr["table_status"];
            tb.table_description = (int)dr["table_description"];

            listTable.Add(tb);

        }
        con.Close();
        return listTable;
    }



    public void AddTable(table tb)
    {
        string sqladdtb = "insert into qlTable values(@nametb," + 0 + ",@mota)";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqladdtb, con);
        cmd.Parameters.AddWithValue("nametb", tb.table_name);
        //cmd.Parameters.AddWithValue("stt", tb.table_status);
        cmd.Parameters.AddWithValue("mota", tb.table_description);

        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void xoatb(int matb)
    {
        string sqlxoatb = "delete from qlTable where table_id=@matb";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlxoatb, con);
        cmd.Parameters.AddWithValue("matb", matb);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public table lay1tb(int matb)
    {

        string sqlsl = "select * from qlTable where table_id=@matb";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlsl, con);
        cmd.Parameters.AddWithValue("matb", matb);
        SqlDataReader dr = cmd.ExecuteReader();
        table tb = null;
        while (dr.Read())
        {
            tb = new table();
            tb.table_id = (int)dr["table_id"];
            tb.table_name = (string)dr["table_name"];
            tb.table_status = (bool)dr["table_status"];
            tb.table_description = (int)dr["table_description"];



        }
        con.Close();
        return tb;
    }
    public void suatb(table tb)
    {
        string sqlsuqtb = "update  qlTable set table_name=@table_name,table_status=@table_status,table_description=@table_description where table_id=@table_id";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlsuqtb, con);
        cmd.Parameters.AddWithValue("table_name", tb.table_name);
        cmd.Parameters.AddWithValue("table_status", tb.table_status);
        cmd.Parameters.AddWithValue("table_description", tb.table_description);
        cmd.Parameters.AddWithValue("table_id", tb.table_id);

        cmd.ExecuteNonQuery();
        con.Close();
    }
    public List<table> dslb()
    {
        List<table> listTable = new List<table>();
        string sqlslTable = "select table_description from qlTable group by table_description ";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            table tb = new table();

            tb.table_description = (int)dr["table_description"];

            listTable.Add(tb);

        }
        con.Close();
        return listTable;
    }

    public void xoaotb(int maotb)
    {
        string sqlxoatb = "delete from OrderTable where ordertable_id=@maotb";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlxoatb, con);
        cmd.Parameters.AddWithValue("maotb", maotb);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public OrderTable lay1otb(int maotb)
    {

        string sqlsl = "select * from OrderTable where ordertable_id=@maotb";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlsl, con);
        cmd.Parameters.AddWithValue("maotb", maotb);
        SqlDataReader dr = cmd.ExecuteReader();
        OrderTable otb = null;
        while (dr.Read())
        {
            otb = new OrderTable();
            otb.ordertable_id = (int)dr["ordertable_id"];
            otb.ordertable_iduser = (int)dr["ordertable_iduser"];
            otb.ordertable_timeset = (TimeSpan)dr["ordertable_timeset"];
            otb.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
            otb.ordertable_timereturn = (TimeSpan)dr["ordertable_timeset"];
            otb.ordertable_idtable = (int)dr["ordertable_idtable"];
            otb.ordertable_status = (bool)dr["ordertable_status"];


        }
        con.Close();
        return otb;
    }
    public void suaotb(OrderTable otb)
    {
        string sqlsuotb = "update  OrderTable set ordertable_iduser=@ordertable_iduser,ordertable_dateset=@ordertable_dateset,ordertable_timeset=@ordertable_timeset,ordertable_timereturn=@ordertable_timereturn,ordertable_idtable=@ordertable_idtable,ordertable_status=@ordertable_status where ordertable_id=@ordertable_id";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlsuotb, con);

        cmd.Parameters.AddWithValue("ordertable_iduser", otb.ordertable_iduser);
        cmd.Parameters.AddWithValue("ordertable_dateset", otb.ordertable_dateset);
        cmd.Parameters.AddWithValue("ordertable_timeset", otb.ordertable_timeset);
        cmd.Parameters.AddWithValue("ordertable_timereturn", otb.ordertable_timereturn);
        cmd.Parameters.AddWithValue("ordertable_idtable", otb.ordertable_idtable);
        cmd.Parameters.AddWithValue("ordertable_status", otb.ordertable_status);
        cmd.Parameters.AddWithValue("ordertable_id", otb.ordertable_id);

        cmd.ExecuteNonQuery();
        con.Close();
    }
    public List<OrderTable> dsOrderTable()
    {
        List<OrderTable> listOrderTable = new List<OrderTable>();
        string sqlslOrderTable = "select * from OrderTable";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslOrderTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            OrderTable tb = new OrderTable();
            tb.ordertable_id = (int)dr["ordertable_id"];
            tb.ordertable_iduser = (int)dr["ordertable_iduser"];
            tb.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
            tb.ordertable_timeset = (TimeSpan)dr["ordertable_timeset"];
            tb.ordertable_timereturn = (TimeSpan)dr["ordertable_timereturn"];
            tb.ordertable_idtable = (int)dr["ordertable_idtable"];
            tb.ordertable_status = (bool)dr["ordertable_status"];
            tb.tenKH = (string)dr["tenKH"];




            listOrderTable.Add(tb);

        }
        con.Close();
        return listOrderTable;
    }
    public List<OrderTable> dsOTableN(string n)
    {
         
        List<OrderTable> listOrderTable = new List<OrderTable>();
        string ds= DateTime.Parse(n).ToString("yyyy - MM - dd")+" 00:00:00.000";
        string sqlslOrderTable = "select * from OrderTable where ordertable_dateset='"+ds+"'";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslOrderTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            OrderTable tb = new OrderTable();
            tb.ordertable_id = (int)dr["ordertable_id"];
            tb.ordertable_iduser = (int)dr["ordertable_iduser"];
            tb.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
            tb.ordertable_timeset = (TimeSpan)dr["ordertable_timeset"];
            tb.ordertable_timereturn = (TimeSpan)dr["ordertable_timereturn"];
            tb.ordertable_idtable = (int)dr["ordertable_idtable"];
            tb.ordertable_status = (bool)dr["ordertable_status"];




            listOrderTable.Add(tb);

        }
        con.Close();
        return listOrderTable;
    }
    public List<OrderTable> dsngay()
    {
        List<OrderTable> listOrderTable = new List<OrderTable>();
        string sqlslOrderTable = "select ordertable_dateset from OrderTable group by ordertable_dateset";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslOrderTable, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            OrderTable tb = new OrderTable();
            
            tb.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
            




            listOrderTable.Add(tb);

        }
        con.Close();
        return listOrderTable;
    }
    public List<OrderTable> dsOrderTableMa(int ma)
    {
        List<OrderTable> listOrderTable = new List<OrderTable>();
        string sqlslOrderTable = "select * from OrderTable where ordertable_idtable=@ma and ordertable_status='false'";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlslOrderTable, con);
        cmd.Parameters.AddWithValue("ma", ma);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            OrderTable tb = new OrderTable();
            tb.ordertable_id = (int)dr["ordertable_id"];
            tb.ordertable_iduser = (int)dr["ordertable_iduser"];
            tb.ordertable_dateset = (DateTime)dr["ordertable_dateset"];
            tb.ordertable_timeset = (TimeSpan)dr["ordertable_timeset"];
            tb.ordertable_timereturn = (TimeSpan)dr["ordertable_timereturn"];            
            //tb.ordertable_idtable = (int)dr["ordertable_idtable"];
            tb.ordertable_status = (bool)dr["ordertable_status"];




            listOrderTable.Add(tb);

        }
        con.Close();
        return listOrderTable;
    }
    public string dstbod(string ds, string ts, string tr, int lb)
    {
        if (ds == "" || ts == "" || tr == "")
        {
            return "chưa nhập đủ thời gian";
        }
        else
        {



            //string sqlsltbo = "select * from qlTable where table_id !=( select ordertable_idtable from OrderTable where ordertable_dateset='"+DateTime.Parse( ds).ToString("yyyy-MM-dd")+"' and ((ordertable_timeset>='"+TimeSpan.Parse(ts)+ "' and ordertable_timeset<='" + TimeSpan.Parse(ts) + "') or (ordertable_timereturn>='" + TimeSpan.Parse(tr) + "' and ordertable_timereturn<='" + TimeSpan.Parse(tr) + "'))) and table_description="+lb+" ";
            string sl = " select ordertable_idtable from OrderTable where ordertable_dateset = '" + DateTime.Parse(ds).ToString("yyyy-MM-dd") + "' and(('" + TimeSpan.Parse(ts) + "' BETWEEN  ordertable_timeset and ordertable_timereturn) or('" + TimeSpan.Parse(tr) + "' BETWEEN  ordertable_timeset and ordertable_timereturn)  or (ordertable_timeset >='" + TimeSpan.Parse(ts) + "' and ordertable_timereturn <='" + TimeSpan.Parse(tr) + "')) and ordertable_status='false'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sl, con);
            SqlDataReader dr = cmd.ExecuteReader();

            int id;
            if (dr.Read())
            {
                id = (int)dr["ordertable_idtable"];


            }
            else
            {
                id = 0;
            }



            con.Close();
            string sqlsltbo = "select * from qlTable where table_id !=" + id + " and table_description=" + lb + " ";
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand(sqlsltbo, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();

            string st = "<select id = 'tb' class='form-control'>";
            if (dr1.Read())
            {
                con.Close();
                con.Open();
                SqlCommand cmd2 = new SqlCommand(sqlsltbo, con);
                SqlDataReader dr2 = cmd1.ExecuteReader();
                while (dr2.Read())
                {
                    st += "<option tenban="+ (string)dr2["table_name"] + " value = " + (int)dr2["table_id"] + " > " + (string)dr2["table_name"] + "</option>";

                }

            }
            else
            {
                st += "<option >Hết bàn </option>";
            }

            st += "</select>";
            return st;
            con.Close();

        }
    }
    //Web
    public QLWeb qlweb()
    {

        string sqlsl = "select * from QLWeb";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlsl, con);
        
        SqlDataReader dr = cmd.ExecuteReader();
        QLWeb tb = null;
        while (dr.Read())
        {
            tb = new QLWeb();
            tb.id_nh = (int)dr["id_nh"];
            tb.ten_nh = (string)dr["ten_nh"];
            tb.diachi_nh = (string)dr["diachi_nh"];
            tb.sdt_nh = (string)dr["sdt_nh"];
            tb.email_nh = (string)dr["email_nh"];
            tb.gt_nh = (string)dr["gt_nh"];
            tb.banner_nh = (string)dr["banner_nh"];
            tb.anh_nh = (string)dr["anh_nh"];
            

        }
        con.Close();
        return tb;
    }
    public QLWeb qlwebn(int id_nh)
    {

        string sqlsl = "select * from QLWeb where id_nh='"+ id_nh + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlsl, con);

        SqlDataReader dr = cmd.ExecuteReader();
        QLWeb tb = null;
        while (dr.Read())
        {
            tb = new QLWeb();
            tb.id_nh = (int)dr["id_nh"];
            tb.ten_nh = (string)dr["ten_nh"];
            tb.diachi_nh = (string)dr["diachi_nh"];
            tb.sdt_nh = (string)dr["sdt_nh"];
            tb.email_nh = (string)dr["email_nh"];
            tb.banner_nh = (string)dr["banner_nh"];
            tb.gt_nh = (string)dr["gt_nh"];
            tb.anh_nh = (string)dr["anh_nh"];


        }
        con.Close();
        return tb;
    }
    public void suaif(QLWeb nh)
    {
        string sqlsua = "update  QLWeb set ten_nh=@ten_nh,diachi_nh=@diachi_nh,sdt_nh=@sdt_nh,email_nh=@email_nh,gt_nh=@gt_nh,banner_nh=@banner_nh,anh_nh=@anh_nh where id_nh=@id_nh";
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlsua, con);

        cmd.Parameters.AddWithValue("diachi_nh", nh.diachi_nh);
        cmd.Parameters.AddWithValue("sdt_nh", nh.sdt_nh);
        cmd.Parameters.AddWithValue("email_nh",nh.email_nh);
        cmd.Parameters.AddWithValue("gt_nh", nh.gt_nh);
        cmd.Parameters.AddWithValue("banner_nh", nh.banner_nh);
        cmd.Parameters.AddWithValue("anh_nh",nh.anh_nh);
        cmd.Parameters.AddWithValue("ten_nh", nh.ten_nh);
        cmd.Parameters.AddWithValue("id_nh", nh.id_nh);


        cmd.ExecuteNonQuery();
        con.Close();
    }


    #endregion

}


