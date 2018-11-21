<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerLogin.aspx.cs" Inherits="customerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-color:wheat;
        }
    </style>
</head>  
    <%--/*
 * Name: Dennis Kanzira
 * Date: November 06 , 2018
 * Description: This is the web form for customer login
 * Version: 0.1 - Created the customer login
 */--%>
<body>
    <form id="form1" runat="server">
        <div>
             <table style="margin:auto;border:5px solid white">
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Username"></asp:Label></td>
                    <td><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                    <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td><asp:Button ID="btnClear" runat="server" Text="clear"/></td>
                    <td><asp:Button ID="btnLog" runat="server" Text="Login" OnClick="btnLog_Click"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Label ID="lblErrorMessage" runat="server" Text="Incorrect Username/Password" ForeColor="Red"></asp:Label></td>
                    <td><asp:Label ID="lblUsernameMessage" runat="server" Text="Incorrect Username" ForeColor="Red"></asp:Label></td>
                    <td><asp:Label ID="lblPasswordMessage" runat="server" Text="Incorrect Password" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lbl3" runat="server" Text="Not an existing user"></asp:Label></td>
                    <td><asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"/></td> 
                </tr>
                 <tr>
                     <td>
                         <asp:HyperLink ID="hyperLinkForgotPassword" runat="server" NavigateUrl="~/EmailVerification.aspx">Forgot Password?</asp:HyperLink>
                     </td>
                 </tr>

            </table>
        </div>
    </form>
</body>
</html>
