﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateCustomerAccount : System.Web.UI.Page
{

    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    static String activationCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        con.ConnectionString = ConfigurationManager.ConnectionStrings["swiftServeDB2"].ConnectionString;
        con.Open();
    }

    protected void btnCreateCustomerAccount_Click(object sender, EventArgs e)
    {
        Random random = new Random();
        activationCode = random.Next(1001, 9999).ToString();
        SqlCommand cmd = new SqlCommand("insert into tbl_CustomerLogin" + "(Username,Password)values(@Username,@Password)", con);
        cmd.Parameters.AddWithValue("@Username", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", txtPwd.Text);
        cmd.ExecuteNonQuery();
        SqlCommand cmd1 = new SqlCommand("insert into CustomerAccount" + "(Firstname,Lastname,CentennialEmail,Address,Phonenumber,Status,Activationcode,SecurityA)values(@Firstname,@Lastname,@CentennialEmail,@Address,@Phonenumber,@Status,@Activationcode,@SecurityA)", con);
        cmd1.Parameters.AddWithValue("@Firstname", txtFName.Text);
        cmd1.Parameters.AddWithValue("@Lastname", txtLName.Text);
        cmd1.Parameters.AddWithValue("@CentennialEmail", txtEmail.Text);
        cmd1.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd1.Parameters.AddWithValue("@Phonenumber", txtPhone.Text);
        cmd1.Parameters.AddWithValue("@Status", "Unverified");
        cmd1.Parameters.AddWithValue("@Activationcode", activationCode);
        cmd1.Parameters.AddWithValue("@SecurityA", txtSecurityA.Text);
        cmd1.ExecuteNonQuery();
        sendCode();
        Response.Redirect("EmailVerification.aspx?emailadd=" + txtEmail.Text);
    }

    private void sendCode()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("swiftserve7@gmail.com", "Swiftserve@2018");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Activation Code to Verify Email Address";
        msg.Body = "Dear" + txtFName + ", Your Activation Code is " + activationCode + "\n\n\nThanks and Regards\nSwift Serve Team";
        string toAddress = txtEmail.Text;
        msg.To.Add(toAddress);
        string fromAddress = "Swift Serve <swiftserve7@gmail.com>";
        msg.From = new MailAddress(fromAddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }
}