<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderConfirm.aspx.cs" Inherits="OrdersPage.OrderConfirm" %>

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
        <!-- this table is a dummy; it's pretty and all, but it has to be replaced -->
        <!--
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
        -->
        <!-- everything above must go -->
        <div>
            <asp:GridView id="OrderSummaryGridView" runat="server"
                      AutoGenerateColumns="false"
                      ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="RestaurantName"
                      HeaderText="Restaurant" ReadOnly="true"/>
                <asp:BoundField DataField="DelayTime"
                      HeaderText="Delivery Time"/>
                <asp:BoundField DataField="Semitotal"
                      HeaderText="Subtotal"/>
                <asp:BoundField DataField="Taxes"
                      HeaderText="Tax"/>
                <asp:BoundField DataField="ServiceCharge"
                      HeaderText="Service Fee"/>
                <asp:BoundField DataField="Total"
                      HeaderText="Total Cost"/>
            </Columns>

            </asp:GridView>
            <br />
            <asp:GridView ID="OrderItemsView" runat="server" AutoGenerateRows="false">
                <Columns>
                    <asp:BoundField DataField="Menu_Item_Name" HeaderText="Name" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" HeaderStyle-Font-Bold="true" />
                </Columns>
            </asp:GridView>
        </div>
        <p>
            <asp:Button ID="Btn_Cancel" runat="server" OnClientClick="OnCancelButtonClicked" Text="Cancel" OnClick="OnCancelButtonClicked" />
            <asp:Button ID="Btn_Confirm" runat="server" OnClientClick="OnConfirmButtonClicked" Text="Confirm Order" OnClick="OnConfirmButtonClicked" />
        </p>
    </form>
</body>
</html>
