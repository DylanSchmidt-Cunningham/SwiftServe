<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirm.aspx.cs" Inherits="OrdersPage.OrderConfirm" %>

<!DOCTYPE html>
<style>
    table, th, td {
        border: 1px solid black;
    }
    .auto-style1 {
        direction: ltr;
    }
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tbody class="auto-style1">
                <tr>
                    <th colspan="2">Your Order</th>
                    <th colspan="2">Order Total</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblItem01" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        Price</td>
                    <td>Order Charge: </td>
                    <td>
                        <asp:Label ID="LblOrderCharge" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblItem02" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                    <td>Tax Total: </td>
                    <td>
                        <asp:Label ID="LblTaxTotal" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblItem03" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                    </td>
                    <td>Delivery Charge:</td>
                    <td>
                        <asp:Label ID="LblDeliveryCharge" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblItem04" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server"></asp:Label>
                    </td>
                    <td>Total:</td>
                    <td>
                        <asp:Label ID="LblTotal" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblItem05" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblItem06" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="LblItem07" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label14" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
