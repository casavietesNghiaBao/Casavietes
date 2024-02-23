using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QLOrderTable_ListOrderTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string XoaTable(int idtable)
    {
        DataUtil data = new DataUtil();
        data.xoaotb(idtable);
        return "Đã xóa";
    }
    [WebMethod]
    public static string slotable(string n)
    {
        if (n != "ALL")
        {
            string st = "";
            string tt = "";
            var listOTable = new DataUtil().dsOTableN(n);
            foreach (var tb in listOTable)
            {
                if (tb.ordertable_status == true)
                {
                    tt="<td>Đã thanh toán</td>";
                }
                else
                {
                    tt="<td>Chưa thanh toán</td>";
                }
               

                st += "<tr role=row class=odd><td tabindex=0  class=sorting_1>" + tb.ordertable_id + "</td><td>" + tb.ordertable_iduser + "</td><td>" + tb.ordertable_dateset.ToString("yyyy-MM-dd") + "</td><td>" + tb.ordertable_timeset + "</td><td>" + tb.ordertable_timereturn + "</td><td>" + tb.ordertable_idtable + "</td>"+tt+"<td><a href='javascript:void(0)' onclick='funcXoa(" + tb.ordertable_id + ")'>Xóa</a> | <a href='/Admin/QLOrderTable/UpdateOrderTable.aspx?idotable=" + tb.ordertable_id + "'>sửa</a></td></tr> ";
            }

            return st;
        }
        else
        {
            string st = "";
            string tt = "";
            var listTable1 = new DataUtil().dsOrderTable();
            foreach (var tb in listTable1)
            {
                if (tb.ordertable_status == true)
                {
                    tt = "<td>Đã thanh toán</td>";
                }
                else
                {
                    tt = "<td>Chưa thanh toán</td>";
                }


                st += "<tr role=row class=odd><td tabindex=0  class=sorting_1>" + tb.ordertable_id + "</td><td>" + tb.ordertable_iduser + "</td><td>" + tb.ordertable_dateset.ToString("yyyy-MM-dd") + "</td><td>" + tb.ordertable_timeset + "</td><td>" + tb.ordertable_timereturn + "</td><td>" + tb.ordertable_idtable + "</td>" + tt + "<td><a href='javascript:void(0)' onclick='funcXoa(" + tb.ordertable_id + ")'>Xóa</a> | <a href='/Admin/QLOrderTable/UpdateOrderTable.aspx?idotable=" + tb.ordertable_id + "'>sửa</a></td></tr> ";
            }

            return st;
        }
    }
}