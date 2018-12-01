<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrdersPage.aspx.cs" Inherits="OrdersPage.OrdersPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Restaurant Selection:
            <br />
            <asp:RadioButton runat="server" GroupName="Restaurant" ID="RB_EpicBurger" Text="Epic Burger"></asp:RadioButton>
            <asp:RadioButton runat="server" GroupName="Restaurant" ID="RB_Cafe" Text="Main Cafeteria"></asp:RadioButton>
            <asp:RadioButton runat="server" GroupName="Restaurant" ID="RB_PizzaPizza" Text="Pizza Pizza"></asp:RadioButton>
            <asp:RadioButton runat="server" GroupName="Restaurant" ID="RB_Poutinerie" Text="Smoke's Poutinerie"></asp:RadioButton>
            <asp:RadioButton runat="server" GroupName="Restaurant" ID="RB_Subway" Text="Subway"></asp:RadioButton>
            <asp:RadioButton runat="server" GroupName="Restaurant" ID="RB_Timmies" Text="Tim Horton's"></asp:RadioButton>
        </div>
        <br />
        <br />
        <div>
            Menu: <br />
            <!-- when/if we add menu images, they'll go in here somewhere -->
            <asp:GridView id="MenuGridView" runat="server"
                      AutoGenerateColumns="false"
                      ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="RestaurantName"
                      HeaderText="Restaurant" ReadOnly="true"/>
                <asp:BoundField DataField="Name"
                      HeaderText="Food" ReadOnly="true"/>
                <asp:BoundField DataField="Price"
                      HeaderText="Price"/>
                <asp:TemplateField HeaderText="Qty">
                   <ItemTemplate>
                       <asp:DropDownList ID="QtyList" runat="server">
                           <asp:ListItem Text="0" Value="0" Selected="True"></asp:ListItem>
                           <asp:ListItem Text="1" Value="1"></asp:ListItem>
                           <asp:ListItem Text="2" Value="2"></asp:ListItem>
                           <asp:ListItem Text="3" Value="3"></asp:ListItem>
                           <asp:ListItem Text="4" Value="4"></asp:ListItem>
                           <asp:ListItem Text="5" Value="5"></asp:ListItem>
                           <asp:ListItem Text="6" Value="6"></asp:ListItem>
                           <asp:ListItem Text="7" Value="7"></asp:ListItem>
                           <asp:ListItem Text="8" Value="8"></asp:ListItem>
                           <asp:ListItem Text="9" Value="9"></asp:ListItem>
                           <asp:ListItem Text="10" Value="10"></asp:ListItem>
                           <asp:ListItem Text="11" Value="11"></asp:ListItem>
                           <asp:ListItem Text="12" Value="12"></asp:ListItem>
                           <asp:ListItem Text="13" Value="13"></asp:ListItem>
                           <asp:ListItem Text="14" Value="14"></asp:ListItem>
                           <asp:ListItem Text="15" Value="15"></asp:ListItem>
                           <asp:ListItem Text="16" Value="16"></asp:ListItem>
                           <asp:ListItem Text="17" Value="17"></asp:ListItem>
                           <asp:ListItem Text="18" Value="18"></asp:ListItem>
                           <asp:ListItem Text="19" Value="19"></asp:ListItem>
                           <asp:ListItem Text="20" Value="20"></asp:ListItem>
                           <asp:ListItem Text="21" Value="21"></asp:ListItem>
                           <asp:ListItem Text="22" Value="22"></asp:ListItem>
                           <asp:ListItem Text="23" Value="23"></asp:ListItem>
                           <asp:ListItem Text="24" Value="24"></asp:ListItem>
                           <asp:ListItem Text="25" Value="25"></asp:ListItem>
                           <asp:ListItem Text="26" Value="26"></asp:ListItem>
                           <asp:ListItem Text="27" Value="27"></asp:ListItem>
                           <asp:ListItem Text="28" Value="28"></asp:ListItem>
                           <asp:ListItem Text="29" Value="29"></asp:ListItem>
                           <asp:ListItem Text="30" Value="30"></asp:ListItem>
                           <asp:ListItem Text="31" Value="31"></asp:ListItem>
                           <asp:ListItem Text="32" Value="32"></asp:ListItem>
                           <asp:ListItem Text="33" Value="33"></asp:ListItem>
                           <asp:ListItem Text="34" Value="34"></asp:ListItem>
                           <asp:ListItem Text="35" Value="35"></asp:ListItem>
                           <asp:ListItem Text="36" Value="36"></asp:ListItem>
                       </asp:DropDownList>
                   </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>
        <br />
        Ready to pick up in the next&nbsp;
        <asp:DropDownList ID="DelayDropDownList" runat="server">
            <asp:ListItem Text="20:00" Value="20" Selected="True"></asp:ListItem>
            <asp:ListItem Text="25:00" Value="25"></asp:ListItem>
            <asp:ListItem Text="30:00" Value="30"></asp:ListItem>
            <asp:ListItem Text="35:00" Value="35"></asp:ListItem>
            <asp:ListItem Text="40:00" Value="40"></asp:ListItem>
            <asp:ListItem Text="45:00" Value="45"></asp:ListItem>
            <asp:ListItem Text="50:00" Value="50"></asp:ListItem>
            <asp:ListItem Text="55:00" Value="55"></asp:ListItem>
            <asp:ListItem Text="60:00" Value="60"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;minutes.<br />
&nbsp;<asp:Button ID="PlaceOrder" runat="server" OnClientClick="OnOrderButtonClicked" Text="Place Order" />
        <br />
        <br />
        <br />
        <div>
            Order History
            <br />
            <br />
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
                <asp:BoundField DataField="Subtotal"
                      HeaderText="Subtotal"/>
                <asp:BoundField DataField="Tax"
                      HeaderText="Tax"/>
                <asp:BoundField DataField="ServiceFee"
                      HeaderText="Service Fee"/>
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
            <!-- change of plans, I said DetailsView a lot, but it looks like this needed to be a GridView b/c it has more than one entry -->
            <asp:GridView ID="OrderItemDetailsView" runat="server" AutoGenerateRows="false">
                <Columns>
                    <asp:BoundField DataField="Menu_Item_Name" HeaderText="Name" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-Font-Bold="true" />
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" HeaderStyle-Font-Bold="true" />
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>
