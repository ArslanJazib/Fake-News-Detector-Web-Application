<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/MasterPages/Login_Signup.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FakeNewsDetector_ASP.MasterPages.Login_Page" %>
<asp:Content ID="loginForm" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group first">
        <asp:TextBox ID="email_tbox" class="form-control" placeholder="Email" runat="server" ></asp:TextBox>
    </div>
    <div class="form-group last mb-4">
        <asp:TextBox ID="pass_tbox" class="form-control" placeholder="Password" type="password" runat="server" ></asp:TextBox>
    </div>
    <asp:Button ID="login_submit_btn" class="btn btn-block btn-primary" OnClick="Login_click" Text="Log In" runat="server" />
    <asp:Button ID="signup_Page" class="btn btn-block btn-secondary" OnClick="SignUpPage_click" Text="Sign Up" runat="server" />
</asp:Content>