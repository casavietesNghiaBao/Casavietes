using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;

public partial class Admin_QLContact_ListContact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    //public static bool ReplyLienHe(int idLienHe, string EmailLienHe, string SbEmail,string ContentEmail)
    //{
    //    DataUtil dt = new DataUtil();
    //    dt.ReplyLienHe(idLienHe, EmailLienHe, SbEmail, ContentEmail);
    //    return dt.ReplyLienHe(idLienHe, EmailLienHe, SbEmail, ContentEmail);
    //}
    public static string ReplyLienHe(int idLienHe, string EmailLienHe, string SbEmail, string ContentEmail)
    {
        try
        {
            var fromEmail = "anhlotest@gmail.com";
            var senderEmail = new MailAddress(fromEmail, "CudLo");
            var receiverEmail = new MailAddress(EmailLienHe, "Receiver");
            var password = "thewingsanh";
            var sub = SbEmail;
            //var passnew = Encryptor.RandomPass(6);

            var message = ContentEmail;

            var body = message;
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(senderEmail.Address, password)
            };
            using (var mess = new MailMessage(senderEmail, receiverEmail)
            {
                Subject = sub,
                Body = message,
                IsBodyHtml = true
            })
            {
                smtp.Send(mess);
            }
            DataUtil dt = new DataUtil();

            Contact c = new Contact { thoigianTraloi = DateTime.Now, noidungTraloi = ContentEmail, idContact = idLienHe };

            dt.ReplyLienHe(c);
            return "OKe";
        }
        catch (Exception ex)
        {
            return "Loi";
        }
    }

    [WebMethod] public static string XoaLienHe(int idLienHe)
    {
        DataUtil dt = new DataUtil();
        dt.XoaLienHe(idLienHe);
        return "Bạn đã xóa liên hệ thành công!";
    }
}