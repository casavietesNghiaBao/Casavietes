using System;
using System.Linq;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;
public class MailProvider
{
    //private static string ACCOUNT_MAIL = WebConfigurationManager.AppSettings["ACCOUNT_MAIL"];
    //private static string PASS_MAIL = WebConfigurationManager.AppSettings["PASS_MAIL"];
    //private static string HOST_WEB = WebConfigurationManager.AppSettings["HOST_WEB"];

    public static string ACCOUNT_MAIL = "";
    public static string PASS_MAIL = "";

    public static bool sendEmail(string body, string subject, string address)
    {
        SmtpClient server = new SmtpClient();
        try
        {
            string from = ACCOUNT_MAIL;
            server.Host = "smtp.gmail.com";
            server.Port = 465;
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.From = new MailAddress(from);
            mail.To.Add(address);
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;
            server.Credentials = new NetworkCredential(from, PASS_MAIL);
            server.EnableSsl = true;
            server.Send(mail);
            return true;

        }
        catch
        {
            return false;
        }
    }
}
