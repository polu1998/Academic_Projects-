<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" 
    CodeBehind="Login.aspx.cs" Inherits="Food_App.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Button ID="adminBtn" runat="server" Text="Admin" OnClick="adminBtn_Click" />
    <asp:Button ID="userBtn" runat="server" Text="User" OnClick="userBtn_Click"/>
    <br />
    <br />
    <!--Choose Theme:<asp:DropDownList ID="ddlTheme" runat="server"></asp:DropDownList>
    <br /><br />
    <asp:Button ID="Button1" runat="server" Text="Change Theme" OnClick="Button1_Click"  />!-->
</asp:Content>
