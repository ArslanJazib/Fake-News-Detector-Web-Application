<%@ Page Title="SignUp Page" Language="C#" MasterPageFile="~/MasterPages/Login_Signup.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FakeNewsDetector_ASP.MasterPages.SignUp_page" %>
<asp:Content ID="loginForm" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group first">
        <asp:TextBox ID="name_tbox" class="form-control" placeholder="Name" runat="server" ></asp:TextBox>
    </div>
    <div class="form-group first">
        <asp:TextBox ID="email_tbox" class="form-control" placeholder="Email" runat="server" ></asp:TextBox>
    </div>
    <div class="form-group last mb-4">
        <asp:TextBox ID="pass_tbox"  class="form-control" placeholder="Password" type="password" runat="server" ></asp:TextBox>
    </div>
    <asp:Button ID="signup_submit_btn" class="btn btn-block btn-primary" OnClick="Signup_click" Text="Sign Up" runat="server" />
    <asp:Button ID="login_Page" class="btn btn-block btn-secondary" OnClick="LoginPage_click" Text="Login" runat="server" />
</asp:Content>