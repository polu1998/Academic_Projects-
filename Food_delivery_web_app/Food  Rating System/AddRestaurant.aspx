<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRestaurant.aspx.cs" Inherits="Food_App.AddRestaurant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Name:
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br />
            Cuisine:
            <asp:TextBox ID="txtCuisine" runat="server"></asp:TextBox>
            <br />
            Location:
            <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
            <br /><br /><br /><br />
            <asp:Button ID="btn_Logout" runat="server" Text="Logout" OnClick="btn_Logout_Click" />
        </div>
    </form>
</body>
</html>
