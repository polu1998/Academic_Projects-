<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOptions.aspx.cs" Inherits="Food_App.AdminOptions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnAddNewRestaurant" runat="server" Text="Add New Restaurant" OnClick="btnAddNewRestaurant_Click" />
            <br />
            <asp:DropDownList ID="ddlRestList" runat="server"></asp:DropDownList>
            <br />
            <asp:Button ID="btnViewRestaurant" runat="server" Text="View Restaurant" OnClick="btnViewRestaurant_Click" />
            <br />
            <br />
            <asp:GridView ID="gvRestaurant" runat="server">
            </asp:GridView>
            <asp:Button ID="btnVC" runat="server" Text="View Comments" OnClick="btnVC_Click" /><br />
            <asp:GridView ID="gvComments" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Restaurant" />
                    <asp:BoundField DataField="ratings" HeaderText="Ratings" />
                    <asp:BoundField DataField="comments" HeaderText="Review" />
                    <asp:TemplateField HeaderText="Check">
                        <EditItemTemplate>
                            <asp:CheckBox ID="check" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="check"></asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView><br />
            <asp:Button ID="btnApprove" runat="server" Text="Approve" OnClick="btnApprove_Click" /><br />
            <asp:Button ID="btnDiscard" runat="server" Text="Discard" OnClick="btnDiscard_Click"/><br />
            <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
            <br /><br /><br /><br />
            <asp:Button ID="btn_Logout" runat="server" Text="Logout" OnClick="btn_Logout_Click" />
        </div>
    </form>
</body>
</html>
