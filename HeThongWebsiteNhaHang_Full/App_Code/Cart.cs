using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{
    public List<OrderDetail> ListFood { get; set; }
    public int? idtable { get; set; }
    public int? idmember { get; set; }
    public string tenBan { get; set; }
    public string tenKH { get; set; }
    public string dienthoaiKH { get; set; }
    public string emailKH { get; set; }
    public DateTime ordertable_dateset { get; set; }
    public TimeSpan ordertable_timeset { get; set; }
    public TimeSpan ordertable_timereturn { get; set; }
    public Cart()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}