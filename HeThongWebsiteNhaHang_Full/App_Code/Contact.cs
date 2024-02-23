using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Contact
/// </summary>
public class Contact
{
    public Contact()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int? idContact { get; set; }
    public string name { get; set; }
    public string email { get; set; }
    public string message { get; set; }
    public DateTime thoigiangui { get; set; }
    public  Boolean tinhtrangTraloi { get; set; }
    public DateTime thoigianTraloi { get; set; }
    public string noidungTraloi { get; set; }
    
}