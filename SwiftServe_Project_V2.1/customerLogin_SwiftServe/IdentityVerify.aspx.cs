using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;



public partial class IdentityVerify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        Random random = new Random();
        int value = random.Next(1001, 9999);
        string destinationA = "1" + txtMobileNo;
        string message = "Your OTP number is" + value + "(Sent by : Swift Serve Team)";
        string message1 = HttpUtility.UrlEncode(message);

        using (var web = new WebClient())
        {
            byte[] response = web.UploadValues("https://api.textlocal.in/send/", new System.Collections.Specialized.NameValueCollection()
                {
                {"apikey" , "vAdQp1VG/kI-hP8j4AzhbKuxrp2gbtJ7gpaS8tKfbn"},
                {"numbers",destinationA },
                {"message",message1 },
                {"sender","TXTLCL" }

            });

            string result = System.Text.Encoding.UTF8.GetString(response);
            Session["otp"] = value;
        }

    }

    protected void btnverify_Click(object sender, EventArgs e)
    {
        if(txtVerifyNumber.Text == Session["otp"].ToString())
        {
            lblSuccess.Text = "Your number has been verified Successfully";
            
        }
    }
}