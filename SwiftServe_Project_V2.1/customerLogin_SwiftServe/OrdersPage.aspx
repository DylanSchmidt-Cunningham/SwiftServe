<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="OrdersPage.OrdersPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView id="OrderGridView" runat="server"
                      AutoGenerateColumns="false"
                      ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="OrderID"
                      HeaderText="Order ID" ReadOnly="true"/>
                <asp:BoundField DataField="RestaurantName"
                      HeaderText="Restaurant" ReadOnly="true"/>
                <asp:BoundField DataField="CreationTime"
                      HeaderText="Date & Time"/>
                <asp:BoundField DataField="Total"
                      HeaderText="Total Cost"/>
                <asp:BoundField DataField="Status"
                      HeaderText="Status"/>
                <asp:ButtonField Text="Select" CommandName="Select" />
            </Columns>

            </asp:GridView>
            <br />
            <u>Selected Order:</u>
            <br />
            <br />
            <!-- change of plans, I said DetailsView a lot, but it looks like this needed to be a GridView b/c it has more than one entry -->
            <asp:GridView ID="OrderItemDetailsView" runat="server" AutoGenerateRows="false">
                <Columns>
                    <asp:BoundField DataField="Menu_Item_Name" HeaderText="Name" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-Font-Bold="true" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <br />
        <br />
        <div>
            Order History
            <!-- We'll need another GridView in here, look at the first one to see how it's done -->
        </div>
        

    </form>
</body>
</html>
