using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderTableVM
/// </summary>
public class OrderVM
{
    public int? ordertable_id { get; set; }
    public DateTime ordertable_dateset { get; set; }
    public TimeSpan ordertable_timeset { get; set; }
    public TimeSpan ordertable_timereturn { get; set; }
    public Boolean? ordertable_status { get; set; }
    public int? ordertable_iduser { get; set; }
    public int? ordertable_idtable { get; set; }

    public string table_name { get; set; }

    public string tenKH { get; set; }
    public string emailKH { get; set; }
    public string dienthoaiKH { get; set; }
    public bool? loaiHD { get; set; }

    public bool? loaiKH { get; set; }

    public Double? TotalMoney { get; set; }

    public List<OrderDetail> ListOrderDetail { get; set; }

    public OrderVM()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}