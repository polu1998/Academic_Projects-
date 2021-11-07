<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Food_App.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label4" runat="server" Text="User Login: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="UserName: "></asp:Label>
    <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter User Name:" ControlToValidate="tbUserName"></asp:RequiredFieldValidator>
    <br /><br />
    <asp:Label ID="Label3" runat="server" Text="Password: "></asp:Label>
    <asp:TextBox ID="tbPwd" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password:" ControlToValidate="tbPwd"></asp:RequiredFieldValidator>
    <br /><br />
    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br /><br /><br /><br />
            <asp:Button ID="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" CausesValidation="false"/>
</asp:Content>

