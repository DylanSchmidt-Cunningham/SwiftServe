<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="OrdersPage.OrdersPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <th colspan="2">Menu</th>
                </tr>
                <%--just random food items. Have to collect food items from database?--%>
                <tr>
                    <td>Pizza</td>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Poutine</td>
                    <td>
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Chicken Wings</td>
                    <td>
                        <asp:CheckBox ID="CheckBox3" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Fries</td>
                    <td>
                        <asp:CheckBox ID="CheckBox4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Smoothie</td>
                    <td>
                        <asp:CheckBox ID="CheckBox5" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="BtnConfirmOrder" runat="server" Text="Confirm Order" OnClick="BtnConfirmOrder_Click"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <th colspan="2">Order History</th>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
