<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IdentityVerify.aspx.cs" Inherits="IdentityVerify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Enter Mobile Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSend" runat="server" Text="Send OTP" OnClick="btnSend_Click" />
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Enter Mobile Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtVerifyNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnverify" runat="server" Text="Verify OTP" OnClick="btnverify_Click"  />
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
