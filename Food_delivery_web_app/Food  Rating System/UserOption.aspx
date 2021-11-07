<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserOption.aspx.cs" Inherits="Food_App.UserOption" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSearch" runat="server" Text="Find" OnClick="btnSearch_Click"/><br />
            <asp:GridView ID="gvRestaurant" runat="server" AutoGenerateColumns="false" DataKeyNames="Name">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name:" />
                    <asp:BoundField DataField="Location" HeaderText="Location:" />
                    <asp:BoundField DataField="Cuisine" HeaderText="Cuisine:" />
                   
                    
                </Columns>
              

            </asp:GridView>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Select:" Visible="false"></asp:Label><br />
            <asp:DropDownList ID="ddlRest" runat="server" Visible="false"></asp:DropDownList><br />
            <asp:Label ID="Label1" runat="server" Text="Rating" Visible="false"></asp:Label><br />
            <asp:DropDownList ID="ddlRatings" runat="server" Visible="false"></asp:DropDownList><br />
            <asp:Label ID="Label2" runat="server" Text="Comment" Visible="false"></asp:Label><br />
            <asp:TextBox ID="txtComment" runat="server" Visible="false"></asp:TextBox><br />
            <asp:Button ID="btnAdd" runat="server" Text="Add Review" OnClick="btnAdd_Click" Visible="false"/>

            <br /><br /><br /><br />
            <asp:Button ID="btn_Logout" runat="server" Text="Logout" OnClick="btn_Logout_Click" />
        </div>
    </form>
</body>
</html>
