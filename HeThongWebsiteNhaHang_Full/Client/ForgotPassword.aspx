<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Client_ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DDHT || Forgot password</title>
    <base href="../Assets/AssetsAdmin/">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="images/icon/favicon.ico">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/metisMenu.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="css/typography.css">
    <link rel="stylesheet" href="css/default-css.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr css -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>



    <link href="/Assets/css/StyleCustom.css" rel="stylesheet" />
</head>
<body>
    <div>
        <nav class="navbar navbar-expand-lg navbar-dark site_navbar bg-dark site-navbar-light login-page" id="site-navbar">
            <div class="container">
                <a class="navbar-brand" href="/TrangChu.aspx">EatWell</a>
            </div>
        </nav>
    </div>
    <div class="login-area">
        <div class="container">
            <div class="login-box ptb--100">
                <form runat="server" action="/Client/ForgotPassword.aspx">
                    <div class="login-form-head">
                        <h4>Forgot Password</h4>
                        <p>Hey! Forgot Password Your Password ? Reset Now</p>
                    </div>
                    <div class="login-form-body">
                        <div class="form-gp">
                            <asp:Label ID="msg" runat="server" />
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputEmail1">Email</label>
                            <asp:TextBox runat="server" ID="txtemail" />
                            <i class="ti-email"></i>
                        </div>
                        <div class="submit-btn-area mt-5">
                            <asp:Button CssClass="btn btn-primary" runat="server" ID="btnReset" Text="RESET" OnClick="btnReset_Click" />
                        </div>
                        <div class="row mb-4 rmber-area">
                            <div class="col-6">
                            </div>
                            <div class="col-6 text-right">
                                <a href="/Client/Login.aspx">Reset done? Let Login</a>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- jquery latest version -->
    <script src="js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/jquery.slimscroll.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>

    <!-- others plugins -->
    <script src="js/plugins.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
