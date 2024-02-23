using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QlTable_ListTable : System.Web.UI.Page
{

    
    protected void Page_Load(object sender, EventArgs e)
    {

        


    }
    [WebMethod]

    public static string XoaTable(int idtable)
    {
        DataUtil data = new DataUtil();
        data.xoatb(idtable);
        return "Đã xóa";
    }
    [WebMethod]

    public static string slTable(string lb)
    {
        if (lb!="ALL")
        {
            string st = "";
            string tt = "";
            var listTable = new DataUtil().dsTableL(Int16.Parse(lb));
            foreach (var tb in listTable)
            {
                if (tb.table_status == true)
                {
                    tt = "<td>Đã được đặt  | <a href='/Admin/QLTable/detailOTable.aspx?idotable=" + tb.table_id + "'>Chi tiết</a></td>";
                }
                else
                {
                    tt = "<td>Chưa được đặt</td>";
                }

                st += "<tr role=row class=odd> <td tabindex=0  class=sorting_1>" + tb.table_id + "</td><td>" + tb.table_name + "</td> <td>" + tb.table_description + "" + tt + "'<td><a href='javascript:void(0)' onclick='funcXoa(" + tb.table_id + ")'>Xóa</a> | <a href='/Admin/QLTable/UpdateTable.aspx?idtable=" + tb.table_id + "'>Sửa</a></td></tr>";
            }

            return st;
        }
        else
        {
            string st = "";
            string tt = "";
            var listTable1 = new DataUtil().dsTable();
            foreach (var tb in listTable1)
            {
                if (tb.table_status == true)
                {
                    tt = "<td>Đã được đặt  | <a href='/Admin/QLTable/detailOTable.aspx?idotable=" + tb.table_id + "'>Chi tiết</a></td>";
                }
                else
                {
                    tt = "<td>Chưa được đặt</td>";
                }

                st += "<tr role=row class=odd> <td tabindex=0  class=sorting_1>" + tb.table_id + "</td><td>" + tb.table_name + "</td> <td>" + tb.table_description + "" + tt + "'<td><a href='javascript:void(0)' onclick='funcXoa(" + tb.table_id + ")'>Xóa</a> | <a href='/Admin/QLTable/UpdateTable.aspx?idtable=" + tb.table_id + "'>Sửa</a></td></tr>";
            }

            return st;
        }

        


    }

}