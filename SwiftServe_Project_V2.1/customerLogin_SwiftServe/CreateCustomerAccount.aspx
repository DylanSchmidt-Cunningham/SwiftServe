<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateCustomerAccount.aspx.cs" Inherits="CreateCustomerAccount" %>

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
               First Name
           </td>
           <td>
               
               <asp:TextBox ID="txtFName" runat="server" Width="166px"></asp:TextBox>
               
           </td>
       </tr>
       <tr>
           <td>
               Last Name
           </td>
           <td>
               
               <asp:TextBox ID="txtLName" runat="server" Width="166px"></asp:TextBox>
               
           </td>
       </tr>
       <tr>
           <td>
               Centennial Email
           </td>
           <td>
               
               <asp:TextBox ID="txtEmail" runat="server" Width="166px"></asp:TextBox>
               
           </td>
       </tr>
       <tr>
           <td>
               Address
           </td>
           <td>
               
               <asp:TextBox ID="txtAddress" runat="server" Height="72px" Width="166px"></asp:TextBox>
               
           </td>
       </tr>
       <tr>
           <td>
              Phone Number
           </td>
           <td>
               
               <asp:TextBox ID="txtPhone" runat="server" Width="166px"></asp:TextBox>
               
           </td>
       </tr>
            <tr>
                <td>
                    Enter Security Question?
                </td>
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
                <td>
                    Enter Security Answer
                </td>
                <td>
                    <asp:TextBox ID="txtSecurityA" runat="server"></asp:TextBox>
                </td>
            </tr>
       <tr>
           <td>
               Password
           </td>
           <td>
               
               <asp:TextBox ID="txtPwd" runat="server" Width="166px"></asp:TextBox>
               
           </td>
           <td>
               <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPwd" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>
              
           </td>
       </tr>
       <tr>
           <td>
               Confirm Password
           </td>
           <td>
               
               <asp:TextBox ID="txtConfirmPwd" runat="server" Width="166px"></asp:TextBox>
               
           </td>
       </tr>
            <tr>
                <td>
                    <asp:Button ID="btnCreateCustomerAccount" runat="server" Text="Create Account" OnClick="btnCreateCustomerAccount_Click" />
                </td>
            </tr>
   </table>
    </form>
</body>
</html>
