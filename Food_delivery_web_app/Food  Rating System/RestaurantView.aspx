<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RestaurantView.aspx.cs" Inherits="Food_App.RestaurantView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Restaurant Details:
            <br />
            <asp:Label ID="Label1" runat="server" Text="Restaurant View Count: "></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:FoodConnectionString %>' SelectCommand="SELECT * FROM [restaurant] WHERE ([Name] = @Name)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="restaurant" Name="Name" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:FoodConnectionString %>' SelectCommand="SELECT * FROM [reviewtable] WHERE ([Name] = @Name)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="restaurant" Name="Name" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            Customer Reviews:
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2"></asp:GridView>
            <br />
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" />
        </div>
    </form>
</body>
</html>
