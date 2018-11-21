﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmailVerification.aspx.cs" Inherits="EmailVerification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td></td>
                <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Your Activation Code"></asp:Label></td>
                <td><asp:TextBox ID="txtVerificationCode" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:Label ID="Label4" runat="server" Text="Security Question"></asp:Label></td>
                <td>
                   
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>My Mother&#39;s Maiden Name?</asp:ListItem>
                        <asp:ListItem>My first pet name?</asp:ListItem>
                        <asp:ListItem>My School Name?</asp:ListItem>
                        <asp:ListItem>My Best Friend&#39;s Name?</asp:ListItem>
                        <asp:ListItem>My Favourite Restaurant?</asp:ListItem>
                    </asp:DropDownList>
                   
                </td> 
            </tr>
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="Your Security Answer: "></asp:Label></td>
                <td><asp:TextBox ID="txtSecurityA" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                
                <td><asp:Button ID="btnVerifyCode" runat="server" Text="Verify Email" OnClick="btnVerifyCode_Click" /></td>
                <td><asp:Button ID="btnVerifySecurityAnswer" runat="server" Text="Verify Security Answer" OnClick="btnVerifySecurityAnswer_Click"  /></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label3" runat="server" ForeColor="#33CC33"></asp:Label></td>
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/customerLogin.aspx">Go Back to Login</asp:HyperLink> <br /></td>
            </tr>
        </table>
    </form>
</body>
</html>
