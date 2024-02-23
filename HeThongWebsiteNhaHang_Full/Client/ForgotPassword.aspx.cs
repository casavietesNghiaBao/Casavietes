using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_ForgotPassword : System.Web.UI.Page
{
    DataUtil data = new DataUtil();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        var email = txtemail.Text;
        if (!string.IsNullOrEmpty(email) && data.CheckMail(email))
        {
            if (SendMail(email))
            {
                txtemail.Text = "";
                msg.Text = "Success! Let's check email and change your password!";
                msg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                msg.Text = "Something wrong!";
                msg.ForeColor = System.Drawing.Color.Red;
            }

        }
        else
        {
            msg.Text = "Email not valid in database!";
            msg.ForeColor = System.Drawing.Color.Red;
        }
    }

    private bool SendMail(string toEmail)
    {
        try
        {
            var fromEmail = "demoproject.3fgroup@gmail.com";
            var senderEmail = new MailAddress(fromEmail, "Jamil");
            var receiverEmail = new MailAddress(toEmail, "Receiver");
            var password = "3fk11997";
            var sub = "DDHT - RESET PASSWORD";
            var passnew = Encryptor.RandomPass(6);
            var message = " Hello!! Your password is: " + passnew;
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
            data.UpdatePassUserByEmail(Encryptor.MD5Hash(passnew), toEmail);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
}