<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
 <%--/*
 * Name: Dennis Kanzira
 * Date: November 06 , 2018
 * Description: This is the web form for Dashboard
 * Version: 0.1 - Created the Customer Dashboard
 */--%>
<body>
    <form id="form1" runat="server">
        <div>
            <%--Dummy page for sample redirecting--%>
            <asp:Label ID="lblUserDetails" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
