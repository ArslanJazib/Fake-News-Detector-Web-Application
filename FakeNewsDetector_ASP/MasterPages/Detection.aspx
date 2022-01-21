<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detection.aspx.cs" Inherits="FakeNewsDetector_ASP.MasterPages.Detection" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detection Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!---- Fonts ---->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <!---- Bootstrap5.0.2 ---->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!---- Custom Style Sheets ---->
    <link href="../Styles/DetectionPage.css" rel="stylesheet" />
    <link href="../Styles/sidebar.css" rel="stylesheet" />
    <!---- jquery3.5.1 ---->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!---- fontawesome ---->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <!-- Magnific Popup plugin -->
    <link href="../Styles/magnific-popup.css" rel="stylesheet">
    <script src="../Scripts/jquery.magnific-popup.js"></script>
</head>
<body>
    <div class="wrapper d-flex align-items-stretch">
        <!-- Modal Anchor Tag -->
        <a style="display:none;color:white;font-weight: bold" id="popup-modal" href="#test-modal"></a>
        <div id="test-modal" class="white-popup-block mfp-hide">
            <h1>
                <% if(prediction==1) { %>
                    News Article is Fake
                <% } %>
                <% else if(prediction==2) { %> 
                    News Article is Real
                <% } %>
            </h1>
            <p><a class="btn btn-danger popup-modal-dismiss" href="#">Close</a></p>
        </div>
        <nav id="sidebar">
            <div class="p-4 pt-5">
            <h2 style="color:white;font-family:SelfDeceptionRegular;font-weight: bolder;text-align: center;">
                Fake News Detector
            </h2>
            <p style="text-align:center">
            Fake News is a growing problem in the modern world, it aims at swaying<br />
            the opinion of the vast majority of people who use internet everyday.<br />
            <br />
            Our application aims to solve the problem of fake news on internet.<br />
            It determines whether news Article is fake or credible using Artifical Intelligence.</p>
            </div>
            <button id="login_Page" class="btn btn-block btn-secondary">Login Page</button>
            <button id="signup_Page" class="btn btn-block btn-success">Sign-Up Page</button>
        </nav>
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5 pt-5">
            <form style="padding-top:10%" id="form1" runat="server">
                <asp:TextBox ID="article_tbox" runat="server" Placeholder="Enter Article Text Here" cssClass="form-control" TextMode="MultiLine" Height="218"></asp:TextBox><br/>
                <asp:Button ID="article_submit_btn" class="btn btn-block btn-primary" OnClick="Detect_click" Text="Authenticate News" runat="server" />
            </form>
        </div>
    </div>
</body>
<script>
    $(document).ready(function () {
        if ("<%=this.prediction%>" == 1) {
            $("#popup-modal").click();
        } else if("<%=this.prediction%>" == 2){
            $("#popup-modal").click();
        }
    });
    $("#login_Page").click(function () {
        window.location.href = "Login.aspx";
    });
    $("#signup_Page").click(function () {
        window.location.href = "SignUp.aspx";
    });
    $('#popup-modal').magnificPopup({
        type: 'inline',
        preloader: false,
        focus: '#username',
        modal: true
    });
    $(document).on('click', '.popup-modal-dismiss', function (e) {
        e.preventDefault();
        $.magnificPopup.close();
    });
</script>
</html>
