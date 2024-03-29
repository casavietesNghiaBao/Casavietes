﻿﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Trangchu.aspx.cs" Inherits="Tranchu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="../../Assets/images/logonh1.png" type="image/png">
    <title><% var web = new DataUtil().qlweb(); Response.Write(web.ten_nh); %>  </title>
    <base href="Assets/" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="css/fonts.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css" />
    <link rel="stylesheet" href="css/animate.css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/owl.theme.default.min.css" />
    <link rel="stylesheet" href="css/magnific-popup.css" />
    <link rel="stylesheet" href="css/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="css/jquery.timepicker.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <link href="fontawesome/css/fontawesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />

    <link href="css/StyleCustom.css" rel="stylesheet" />
    <style>
        #listFoodCart tr th, td {
            font-size: 14px;
            color: black;
        }

        #listFoodCart tr th {
            font-weight: bold;
        }
        
        element.style {
        }
        select.form-control:not([size]):not([multiple]) {
            height: calc(2.25rem + 2px);
        }
        .form-group label, .form-group .form-control, .form-group span, .table-user-information {
             font-size: 1rem; 
        }

        .form-control {
            background: white !important;
            border: 1px solid #ccc;
            border-radius: 5px;
            height: 30px !important;
            padding: 5px !important
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            margin-bottom: 2px !important
        }
        .img.mfp-img{
            height: 300px;
            width: 350px;
            max-width: 0;
        }
        img.mfp-img{
            width: 300px;
            height: auto !important;
            height: 300px;
        }

    </style>
</head>
<body data-spy="scroll" data-target="#site-navbar" data-offset="200" style="font-family: cambria,Sans-serif">
    
    <form id="form1" runat="server" action="/Trangchu.aspx">
        <span id="on_top" style="width: 50px; height: 50px; bottom: 30px; right: 20px; position: fixed; display: none; background: #ccc; border-radius: 50%; cursor: pointer" title="Đầu trang">
            <img style="width: 100%;" src="images/btop.jpg" /></span>
        <span id="btnCart" onclick="ViewCart()" style="width: 70px; height: 70px; z-index: 9; top: 70px; right: 20px; position: fixed; border-radius: 50%; cursor: pointer" title="Xem giỏ hàng">
            <img style="width: 100%" src="images/giohang.png" /></span>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark site_navbar bg-dark site-navbar-light" id="site-navbar">
                <div class="container">
                    <a class="navbar-brand" href="/TrangChu.aspx"><% var web = new DataUtil().qlweb();%><img style="width:150px" src="../../Assets/images/logonh.png" /></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#site-nav" aria-controls="site-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span>Menu
                    </button>

                    <div class="collapse navbar-collapse" id="site-nav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active"><a href="#section-home" class="nav-link" style="color: lightyellow">HOME</a></li>
                            <li class="nav-item"><a href="#section-about" class="nav-link" style="color: lightyellow">Information</a></li>
                            <li class="nav-item"><a href="#section-offer" class="nav-link" style="color: lightyellow">Promotion</a></li>
                            <li class="nav-item"><a href="#section-menu" class="nav-link" style="color: lightyellow">Dish</a></li>
                            <li class="nav-item"><a href="#section-news" class="nav-link" style="color: lightyellow">New</a></li>
                            <li class="nav-item"><a href="#section-gallery" class="nav-link" style="color: lightyellow">Library</a></li>
                            <li class="nav-item"><a href="#section-contact" class="nav-link" style="color: lightyellow">Contact</a></li>
                            <li class="nav-item" id="login" runat="server"><a href="/Client/Login.aspx" class="nav-link" style="color: lightyellow">Login</a></li>
                            <li id="avatar" runat="server" style="display: none">
                                <div class="user-profile pull-right">
                                    <asp:Image runat="server" CssClass="avatar user-thumb" ID="avatarImage" />
                                    <%--<img class="avatar user-thumb" src="/Assets/AssetsAdmin/images/author/avatar.png" alt="avatar" />--%>
                                    <h4 class="user-name dropdown-toggle nav-link" data-toggle="dropdown">
                                        <asp:Label runat="server" ID="nameuser"></asp:Label>
                                    </h4>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/Client/Profile.aspx">Personal</a>
                                        <a class="dropdown-item" href="/Client/ChangePassword.aspx">Change Password</a>
                                        <asp:LinkButton ID="Logout" runat="server" CausesValidation="false" OnClick="LogOut_Click" Text="Log out" CssClass="dropdown-item" />
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->

            <section class="site-cover" style="background-image: url(../../Assets/images/bg_5.jpg);" id="section-home">
                <div class="container">
                    <div class="row align-items-center justify-content-center text-center site-vh-100">
                        <div class="col-md-12">
                            <h1 class="site-heading site-animate mb-3" style="color: lightyellow">Welcome to</h1>
                            <h1 class="site-heading site-animate mb-3" style="color: lightyellow"><% Response.Write(web.ten_nh); %></h1>
                            <h2 class="h5 site-subheading mb-5 site-animate" style="color: lightyellow; font-family: cambria,Sans-serif">Quickly order delicious and quality dishes from our restaurant!</h2>
                            <p><a href="https://colorlib.com/" id="otb" target="_blank" class="btn btn-outline-white btn-lg site-animate" style="font-family: cambria,Sans-serif; font-weight: bold" data-toggle="modal" data-target="#reservationModal" >Booking Table</a></p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END section -->

            <section class="site-section" id="section-about">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 site-animate mb-5">
                            <h4 class="site-sub-title">Introduce</h4>
                            <h2 class="site-primary-title display-4">Hello</h2>
                            

                            <p class="mb-4"><% Response.Write(web.gt_nh); %></p>
                            
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6 site-animate img" data-animate-effect="fadeInRight">
                            <img src='../../Assets/images/<% Response.Write(web.anh_nh); %>' alt="Free Template by colorlib.com" class="img-fluid" />
                        </div>
                    </div>
                </div>
            </section>
            <!-- END section -->


            <section class="site-section bg-light" id="section-offer">
                <div class="container">

                    <div class="row">
                        <div class="col-md-12 text-center mb-5 site-animate">
                            <h4 class="site-sub-title">Special promotions</h4>
                            <h2 class="display-4">Food prices are on sale</h2>
                            <div class="row justify-content-center">
                                <div class="col-md-7">
                                    <p class="lead">Quickly order food to receive special offers from the restaurant!!!</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="owl-carousel site-owl">

                                <%
                                    var listFoods = new DataUtil().getListFoodSale();
                                    foreach (var f in listFoods)
                                    {

                                        Response.Write("<div class='item'>");
                                        Response.Write("<div class='media d-block mb-4 text-center site-media site-animate border-0'>");
                                        Response.Write("<img style='height:250px;cursor: pointer;' onclick='funcOrderNow(" + f.food_id + ")' src='../../Assets/images/" + f.food_avatar + "' class='img-fluid' />");

                                        Response.Write("<div class='media-body p-md-5 p-4'>");
                                        Response.Write("<h5 class='text-primary' style='font-family: cambria,Sans-serif'>" + f.food_price + " €" + "</h5>");
                                        Response.Write("<h5 class='mt-0 h4'>" + f.food_name + "</h5>");
                                        Response.Write("<p class='mb-4'>" + f.food_description + "</p>");
                                        Response.Write("<p class='mb-0'><a href='javascript:void(0)' class='btn btn-primary btn-sm' style='font-family: cambria,Sans-serif; font-weight: bold;' onclick='funcOrderNow(" + f.food_id + ")'>Order Now!</a></p>");
                                        Response.Write("</div>");
                                        Response.Write("</div>");
                                        Response.Write("</div>");


                                    }
                                %>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!-- END section -->

            <section class="site-section" id="section-menu">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center mb-5 site-animate">
                            <h2 class="display-4">Types of dishes</h2>
                            <div class="row justify-content-center">
                                <div class="col-md-7">
                                    <p class="lead">We will continuously update the dishes...</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 text-center">
                            <ul class="nav site-tab-nav nav-pills mb-5" id="theloai" role="tablist" <%--id="pills-tab"--%>>

                                <%
                                    var liFoType = new DataUtil().getListFoodType();
                                    foreach (var f in liFoType)
                                    {
                                        Response.Write("<li class='nav-item site-animate' id='" + f.foodtype_id + "' onclick='funcShowLF(" + f.foodtype_id + ")' >");
                                        Response.Write("<a class='nav-link' id='pills-lunch-tab' data-toggle='pill' href='#pills-lunch' role='tab' aria-controls='pills-lunch' aria-selected='false'>" + f.foodtype_name + "</a>");
                                        Response.Write("</li>");
                                    }
                                %>
                            </ul>

                        </div>
                    </div>
                </div>
                <div style="background: #f8f9fa; padding: 15px 0px">
                    <div class="container">
                        <div class="row " id="cud" style="max-height: 550px; width: 100%; overflow: auto;">
                        </div>
                    </div>
                </div>
            </section>

            <!-- END section -->

            <section class="site-section bg-light" id="section-news">
                <div class="container">

                    <div class="row">
                        <div class="col-md-12 text-center mb-5 site-animate">
                            <h2 class="display-4">New dish</h2>
                            <div class="row justify-content-center">
                                <div class="col-md-7">
                                    <p class="lead">Quickly order our restaurant's new dishes!</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="owl-carousel site-owl">

                                <%
                                    var liNewFood = new DataUtil().getNewListFood();
                                    foreach (var n in liNewFood)
                                    {

                                        Response.Write("<div class='item'>");
                                        Response.Write("<div class='media d-block mb-4 text-center site-media site-animate border-0'>");
                                        Response.Write("<img style='height:250px;cursor: pointer;' onclick='funcOrderNow(" + n.food_id + ")' src='../../Assets/images/" + n.food_avatar + "' class='img-fluid' />");

                                        Response.Write("<div class='media-body p-md-5 p-4'>");
                                        Response.Write("<h5 class='text-primary' style='font-family: cambria,Sans-serif;'>" + n.food_price + " €</h5>");
                                        Response.Write("<h5 class='mt-0 h4'>" + n.food_name + "</h5>");
                                        Response.Write("<p class='mb-4'>" + n.food_description + "</p>");
                                        Response.Write("<p class='mb-0'><a href='javascript:void(0)' class='btn btn-primary btn-sm' style='font-family: cambria,Sans-serif; font-weight: bold;' onclick='funcOrderNow(" + n.food_id + ")'>Order Now!</a></p>");
                                        Response.Write("</div>");
                                        Response.Write("</div>");
                                        Response.Write("</div>");

                                    }
                                %>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!-- END section -->

            <section class="site-section" id="section-gallery">
                <div class="container">
                    <div class="row site-custom-gutters">

                        <div class="col-md-12 text-center mb-5 site-animate">
                            <h2 class="display-4">Photo library</h2>
                            <div class="row justify-content-center">
                                <div class="col-md-7">
                                    <p class="lead">Collection of the most beautiful photos of dishes.</p>
                                </div>
                            </div>
                        </div>

                        <%
                            var LF = new DataUtil().getList_FoodLimit6();
                            foreach (var f in LF)
                            {
                                Response.Write("<div class='col-md-4 site-animate'>");
                                Response.Write("<a href='../../Assets/images/" + f.food_avatar + "' class='site-thumbnail image-popup'><img src='../../Assets/images/" + f.food_avatar + "' style='height:250px;width:350px;' alt='" + f.food_name + "' class='img-fluid'></a>");
                                Response.Write("</div>");
                            }
                        %>                       
                    </div>
                </div>
            </section>
            <!-- END section -->

            <section class="site-section bg-light" id="section-contact">
                <div class="container">
                    <div class="row">

                        <div class="col-md-12 text-center mb-5 site-animate">
                            <h2 class="display-4">Contact Us</h2>
                            <div class="row justify-content-center">
                                <div class="col-md-7">
                                    <p class="lead">Your opinion will contribute to our better service</p>
                                </div>
                            </div>
                        </div>

                       <%-- <div class="col-md-7 mb-5 site-animate">
                            <div id="SendContactSubmit">
                                <div class="form-group">
                                    <label for="name" class="sr-only">Name</label>
                                    <input type="text" class="form-control" id="name" placeholder="Tên của bạn..."/>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="sr-only">Email</label>
                                    <input type="text" class="form-control" id="email" placeholder="Email của bạn..." />
                                </div>
                                <div class="form-group">
                                    <label for="message" class="sr-only">Message</label>
                                    <textarea name="Message" id="message" cols="30" rows="10" class="form-control" placeholder="Nội dung..."></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="button" class="btn btn-primary btn-lg" onclick="funcContact()" value="Gửi tin nhắn"/>
                                </div>
                            </div>
                        </div>--%>
                        <div class="col-md-1"></div>
                        <div class="col-md-6 site-animate">
                            <p>
                                <img src='../../Assets/images/<% Response.Write(web.anh_nh); %>' alt="" class="img-fluid">
                            </p>
                        </div>
                        <div class="col-md-5 site-animate">
                            <p class="text-black">
                                <b>Address: </b><%  Response.Write(web.diachi_nh); %>
                                <br />
                                <br />
                                <b>Phone Number: </b><%  Response.Write(web.sdt_nh); %> / 666324656
                                <br />
                                <br />
                                <b>Email: </b><a href="mailto:<%  Response.Write(web.ten_nh); %>"><%  Response.Write(web.email_nh); %></a>
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <%--<div id="map"></div>--%>
            <!-- END section -->


            <footer class="site-footer site-bg-dark site-section">
                <div class="container">
<%--                    <div class="row mb-5">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-4 site-animate">
                                    <h2 class="site-heading-2">About Us</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, similique, delectus blanditiis odit expedita amet. Sed labore ipsum vel dolore, quis, culpa et magni autem sequi facere eos tenetur, ex?</p>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3 site-animate">
                                    <div class="site-footer-widget mb-4">
                                        <h2 class="site-heading-2">The Restaurant</h2>
                                        <ul class="list-unstyled">
                                            <li><a href="#" class="py-2 d-block">About Us</a></li>
                                            <li><a href="#" class="py-2 d-block">Chefs</a></li>
                                            <li><a href="#" class="py-2 d-block">Events</a></li>
                                            <li><a href="#" class="py-2 d-block">Contact</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-2 site-animate">
                                    <div class="site-footer-widget mb-4">
                                        <h2 class="site-heading-2">Useful links</h2>
                                        <ul class="list-unstyled">
                                            <li><a href="#" class="py-2 d-block">Foods</a></li>
                                            <li><a href="#" class="py-2 d-block">Drinks</a></li>
                                            <li><a href="#" class="py-2 d-block">Breakfast</a></li>
                                            <li><a href="#" class="py-2 d-block">Brunch</a></li>
                                            <li><a href="#" class="py-2 d-block">Dinner</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-2 site-animate">
                                    <div class="site-footer-widget mb-4">
                                        <h2 class="site-heading-2">Useful links</h2>
                                        <ul class="list-unstyled">
                                            <li><a href="#" class="py-2 d-block">Foods</a></li>
                                            <li><a href="#" class="py-2 d-block">Drinks</a></li>
                                            <li><a href="#" class="py-2 d-block">Breakfast</a></li>
                                            <li><a href="#" class="py-2 d-block">Brunch</a></li>
                                            <li><a href="#" class="py-2 d-block">Dinner</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>--%>
                    <div class="row site-animate">
                        <div class="col-md-12 text-center">
                            <div class="site-footer-widget mb-4">
                                <ul class="site-footer-social list-unstyled ">
                                    <li class="site-animate"><a href="https://www.casaviet.es/TrangChu.aspx"><span class="icon-twitter"></span></a></li>
                                    <li class="site-animate"><a href="https://www.casaviet.es/TrangChu.aspx"><span class="icon-facebook"></span></a></li>
                                    <li class="site-animate"><a href="https://www.casaviet.es/TrangChu.aspx"><span class="icon-instagram"></span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12 text-center">
                            <p>
                                &copy;
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                Casa Viet (Restaurante & Café) All rights reserved | Design & developed by Wind Lập Trình.
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                </div>
            </footer>

            <!-- Modal -->
            <div class="modal fade" id="reservationModal" style="overflow:auto" tabindex="-1" role="dialog" aria-labelledby="reservationModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-body" style="font-family: cambria, Sans-serif">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div style="background-image: url(images/avt_bookTable.jpg); background-size: cover;">
                                        <%--<div class="h-75"></div>
                                        <div class="h-25">
                                            <div class="h-50"></div>
                                            <div class="bg-white h-50" style=" border-top-left-radius: 20px; border-top-right-radius: 20px"></div>
                                        </div>--%>

                                        <div class="col-lg-12 p-5">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <small class="text-danger">CLOSE </small><span class="text-danger" aria-hidden="true">&times;</span>
                                            </button>
                                            <h1 class="mb-4" style="color: white;-webkit-text-stroke: 0.2px grey; ">Booking Table</h1>
                                            <form action="#" method="post">
                                                <div class="row">
                                                    <div class="col-md-12 form-group">
                                                        <label for="m_fname" class="text-white ">Booking date</label>
                                                        <input type="date" class="form-control" id="ds" />
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 form-group">
                                                        <label for="m_lname" class="text-white">Table reservation time</label>
                                                        <input type="time" class="form-control" id="ts" />
                                                    </div>
                                                    <div class="col-md-6 form-group">
                                                        <label for="m_email" class="text-white">Table return time</label>
                                                        <input type="time" class="form-control" id="tr" />

                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 form-group">
                                                        <label for="m_people" class="text-white">Table type (Number of people sitting)</label>
                                                        <select name="" id="lb" class="form-control" >

                                                            <%
                                                                var listTable = new DataUtil().dslb();
                                                                foreach (var tb in listTable)
                                                                {
                                                                    Response.Write("<option style='padding:5px'>" + tb.table_description + "</option>");

                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6 form-group">
                                                        <label for="m_phone" class="text-white">Select table</label>
                                                        <div id="Divtb">
                                                            <select id="idTable" class="form-control">
                                                            </select>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 form-group">
                                                        <label id="omsg" style="color: red; font-weight: bold"></label>
                                                    </div>
                                                    <div class="col-md-12 form-group d-flex justify-content-center">
                                                        <div class="col-md-9 form-group">
                                                            <input id="ordertb" type="button" class="btn btn-primary btn-lg btn-block" style="border: solid ; border-radius: 15px; font-weight: bold; background-color: #E7D8A1; color: #4A3929" value="BOOKING" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- END Modal -->

            <!-- loader -->
            <div id="site-loader" class="show fullscreen">
                <svg class="circular" width="48px" height="48px">
                    <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
                    <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
                </svg>
            </div>

        </div>
    </form>
    <div class="modal fade" id="ModalOrderNow">
        <div class="modal-dialog" role="dialog" style="max-width: 800px!important;">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background: #ffc107; padding: 10px">
                    <h4 class=" modal-title">Add food to cart</h4>
                    <button type="button" class="close" onclick="closeModalOrderNow()">&times;</button>
                </div>
                <div class="modal-body" style="padding: 0px">
                </div>
                <div class="modal-footer" style="padding: 10px; justify-content: center!important">
                    <button type="button" class="btn btn-primary btn-sm" style="font-weight: bold; font-size: 14px; padding: 5px 10px; border-radius: 5px; border: 1px solid dodgerblue; color: black; float: left; background-color: dodgerblue" onclick="AddToCart()">Add to cart</button>
                    <button type="button" class="btn btn-default btn-sm" style="font-weight: bold; font-size: 14px; padding: 5px 10px; float: right" onclick="closeModalOrderNow()">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalViewCart">
        <div class="modal-dialog" role="dialog" style="max-width: 1300px!important;">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background: #ffc107; padding: 10px">
                    <h4 class=" modal-title" style="font-size: 22px;">Shopping cart information</h4>
                    <button type="button" class="close" onclick="closeModalViewCart()">&times;</button>
                </div>
                <div class="modal-body" style="padding: 0px">
                    <div class="modal-body1"></div>
                    <div style="padding: 10px">
                        <span style="color: black; font-size: 16px;">Choose form:</span>
                        <br />
                        <label style="color: black; font-size: 16px; cursor: pointer; margin-left: 50px">
                            Shopping online
                            <input type="radio" name="hinhthuc" value="0" checked="checked" /></label>
                        <label style="color: black; font-size: 16px; cursor: pointer; margin-left: 50px">
                            Book a table at the restaurant
                            <input type="radio" name="hinhthuc" value="1" />
                        </label>
                        <%
                            Cart cart = (Cart)HttpContext.Current.Session["Cart"];
                            string tenBan = (cart != null && cart.idtable > 0) ? cart.tenBan : ""; // Lấy giá trị của cart.tenBan
                            if (cart.idtable > 0)
                            {
                                Response.Write("<span id='ChooseTable' style='display:none'>");
                                Response.Write("<span>You have selected the table:</span><span style='color:green;font-weight:bold'>" + cart.tenBan + "</span>");
                                Response.Write("<input id='selectTableid' type='hidden' value="+cart.idtable+"/>");
                                Response.Write("</span>");
                            }
                            else
                            {
                                Response.Write("<span id='ChooseTable' style='display:none'>");
                                Response.Write("<span>You have not selected any table yet:</span><button type='button' onclick='openChonBan()'>Booking Table</button>");
                                Response.Write("</span>");
                            }
                       %>
                    </div>
                </div>
                <div class="modal-footer" style="padding: 10px; justify-content: center!important">
                    <button type="button" class="btn btn-sm" style="font-weight: bold; font-size: 14px; padding: 5px 10px; border-radius: 5px; border: 1px solid green; color: black; float: left; background-color: dodgerblue" onclick="XacNhanMuaHang()">Order</button>
                    <button type="button" class="btn btn-sm" style="font-weight: bold; font-size: 14px; padding: 5px 10px; float: right" onclick="closeModalViewCart()">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>

    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.timepicker.min.js"></script>

    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="fontawesome/js/fontawesome.min.js"></script>
    <script src="js/notify.js"></script>
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>--%>
    <script src="js/main.js"></script>
    <script>
        // Huy
        $("input[name='hinhthuc']").click(function () {
            if (parseInt($("input[name='hinhthuc']:checked").val()) == 1) {                
                $("#ChooseTable").show();
            }
            else {
                $("#ChooseTable").hide();
                changeTableCart(-1);
            }
        })
        $("#selectTableid").change(function () {
            changeTableCart(parseInt($("#selectTableid").val()));
        })
        function changeTableCart(idtbl) {
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/changeTableCart",
                data: "{idtbl:" + idtbl + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    CART = rs.d
                }
            });
        }
        function closeModalOrderNow() {
            $("#ModalOrderNow").modal("hide");
        }
        function closeModalViewCart() {
            $("#ModalViewCart").modal("hide");
        }
        var USER = JSON.parse('<%= new System.Web.Script.Serialization.JavaScriptSerializer().Serialize((Member)Session["User"]) %>');
        var CART = JSON.parse('<%= new System.Web.Script.Serialization.JavaScriptSerializer().Serialize((Cart)Session["Cart"]) %>');
        function ViewCart() {
            if (CART.ListFood.length <= 0) {
                $.notify("The cart does not contain any dishes", "error")
            }
            else {
                LoadViewCart();
                $("#ModalViewCart").modal("show");
            }
        }
        function LoadViewCart() {
            var html = `     
                    <div style="padding:5px;">
                        <div class="row">
                            <div class="col-md-9 col-sm-11 overflow-auto">
                                <h5 style="font-size:16px;text-align:center;color:blue">List of dishes</h3>
                                <table class="table" id="listFoodCart">
                                    <tr>
                                        <th></th>
                                        <th style="width:200px">Food's name</th>
                                        <th>Cost (€)</th>
                                        <th>Discount (%)</th>
                                        <th>Quantity</th>
                                        <th>Into money (€)</th>
                                        <th></th>
                                    </tr>
                                    <tbody>
                    `;
            let list = CART.ListFood;
            $.each(list, function (index, item) {
                html += `
                                    <tr id="tridfood_${item.foodid}">
                                        <td><img src="../../Assets/images/${item.food_avatar}" width="80px"></td>
                                        <td>${item.food_name}</td>
                                        <td>${item.food_price}</td>
                                        <td>${item.food_sale}</td>
                                        <td class="tdFoodPrice">
                                            <button class="btn btn-default btn-sm" type="button" onclick="descrease_sl_cart(${item.foodid})" style="margin-top: -3px;display:inline-block;padding:5px 10px;"> - </button>
                                            <input type="number" class="food_quantity_cart" onchange="changefood_quantity_cart(${item.foodid})" min="1" value="${item.quantity}" style="width:80px; display:inline-block;padding:0px 10px"/>
                                            <button class="btn btn-default btn-sm"type="button"onclick="increase_sl_cart(${item.foodid})" style="margin-top: -3px;display:inline-block;padding:5px 10px;"> + </button>
                                        </td>
                                        <td class="tdThanhtien">${item.thanhtien}</td>
                                        <td><button type="button" class="btn btn-default btn-sm" onclick="XoaKkhoiCart(${item.foodid})" style="padding:5px 10px;font-weight:bold">Delete</button></td>
                                    </tr>                    
                    `
            });
            html += `            </tbody> 
                                </table>                                 
                            </div>
                            <div class="col-md-3">
                                <h5 style="font-size:16px;text-align:center;color:blue">Customer information</h3>`;
            if (CART.tenKH != "") {
                html += `                        
                        <span style="color: black;font-size:14px;">Customer:     <strong style="color:green;font-size:20px;">${CART.tenKH}</strong></span><br/>
                        <span style="color: black;font-size:14px;">Email:     <strong>${CART.emailKH}</strong></span><br/>
                        <span style="color: black;font-size:14px;">Phone:     <strong>${CART.dienthoaiKH}</strong></span><br/>                                                
                        <p style="color: black;font-size:14px;margin-top:15px; ">Total amount (€):     <strong style="color:red;font-size:16px;" id="totalCart">${getTotalCart()}</strong></p>
                    `
                if (USER == null) {
                    html += `<p style="text-align:center"><a style="font-size:14px;padding:5px 10px;background: #1E90FF; color: #fff;font-weight:bold"  href="/Client/Login.aspx" class="btn btn-sm">Login</a></p>`
                }
            } else {
                html += `<span style = "color: red;font-size:14px;"> No customer information yet </span> <br />
                            <form id="infoKH">
                                <div class="form-group">
                                    <label style="color: black;font-size:14px;" for="tenKH">Customer name <span style="color:red;font-weight:bold;font-size:14px">*</span></label>
                                    <input type="text" id="tenKH" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label style="color: black;font-size:14px;" for="emailKH">Email <span style="color:red;font-weight:bold;font-size:14px">*</span></label>
                                    <input type="email" id="emailKH" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label style="color: black;font-size:14px;" for="dienthoaiKH">Phone <span style="color:red;font-weight:bold;font-size:14px">*</span></label>
                                    <input type="text" id="dienthoaiKH" class="form-control">
                                </div>
                            </form>
                            <p style="margin-top:10px;color:black">or <a style="font-size:14px;padding:5px 10px;background:blue;color:black;font-weight:bold"  href="/Client/Login.aspx" class="btn btn-sm">Login</a></p>
                         <p style="color: black;font-size:14px;margin-top:15px; ">Total amount (€):     <strong style="color:red;font-size:16px;" id="totalCart">${getTotalCart()}</strong></p>
                    `;
            }
            html += `       <div>
                        </div>                         
                
                    </div>                    
                    </div>                    
                </div>
                `;
            $("#ModalViewCart .modal-body1").html(html);
            if (CART.idtable == -1) {
                $("input[name='hinhthuc'][value='0']").prop("checked", true);
                $("#selectTableid").val("");
                $("#selectTableid").hide();
            }
            else {
                $("#selectTableid").show();
                $("#selectTableid").val(CART.idtable);
            }
        }
        function CheckFormKH() {
            if ($("#tenKH").val().trim() == "" || $("#emailKH").val().trim() == "" || $("#dienthoaiKH").val().trim() == "")
                return 0;
            else {
                let regEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                if (!regEmail.test($("#emailKH").val().trim()))
                    return -1;
                else {
                    let regDienthoai = /^(0)[1-9]{1}[0-9]{8,9}$/
                    if (!regDienthoai.test($("#dienthoaiKH").val().trim()))
                        return -2;
                }
            }
            return 1;
        }
        function XacNhanMuaHang() {
            if (USER == null) {
                if (CheckFormKH() == 1) {
                    if ((parseInt($("input[name='hinhthuc']:checked").val()) == 1) && $("#selectTableid").val() == "") {
                        $.notify("You have not selected a table yet", "error")
                    } else {
                        $.ajax({
                            type: "post",
                            url: "/Trangchu.aspx/XacNhanMuaHang",
                            data: "{tenKH:'" + $("#tenKH").val().trim() + "',emailKH:'" + $("#emailKH").val().trim() + "',dienthoaiKH:'" + $("#dienthoaiKH").val().trim() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (rs) {
                                CART = rs.d
                                $.notify("Success", "success")
                                $("#ModalViewCart").modal("hide");
                            }
                        });
                        sendEmail();
                    }
                } else {
                    if (CheckFormKH() == 0)
                        $.notify("Lack of customer information", "error")
                    else if (CheckFormKH() == -1) {
                        $.notify("Email format error", "error")
                    }
                    else {
                        $.notify("Phone number format error", "error")
                    }
                }
            }
            else {
                if ((parseInt($("input[name='hinhthuc']:checked").val()) == 1) && $("#selectTableid").val() == "") {
                    $.notify("You have not selected a table yet", "error")
                } else {
                    $.ajax({
                        type: "post",
                        url: "/Trangchu.aspx/XacNhanMuaHang",
                        data: "{tenKH:'" + CART.tenKH + "',emailKH:'" + CART.emailKH + "',dienthoaiKH:'" + CART.dienthoaiKH + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (rs) {
                            CART = rs.d
                            $.notify("Confirm successful purchase", "success")
                            $("#ModalViewCart").modal("hide");
                        }
                    });
                }
            }
        }
        var tenBanJS = '<%= tenBan %>'; // Gán giá trị của tenBan vào biến JavaScript
        function sendEmail() {
            (function () {
                emailjs.init("CLr7upfQIcDw3REBH");
            })();

            var params = {
                tenKhachHang: document.querySelector("#tenKH").value,
                email: document.querySelector("#emailKH").value,
                soDienThoai: document.querySelector("#dienthoaiKH").value,
                tenMon: [],
                soLuong: [],
                tongTien: 0,
                datBan: tenBanJS || "Haven't booked a table yet"
            };

            let totalQuantity = 0;
            let totalThanhTien = 0;

            let listFoodMail = CART.ListFood;
            $.each(listFoodMail, function (index, item) {
                let ten = item.quantity + " " + item.food_name;
                params.tenMon.push(ten);
                totalQuantity += parseInt(item.quantity);
                totalThanhTien += parseInt(item.thanhtien);
            });

            params.tenMon = params.tenMon.join(' | ');
            params.soLuong = totalQuantity;
            params.tongTien = totalThanhTien.toLocaleString('vi-VN');

            var serviceID = "service_e7hg1cy";
            var templateID = "template_3mwwhux";

            emailjs.send(serviceID, templateID, params)
                .then(res => {
                    alert("Order information sent successfully")
                })
                .catch();
        }
        function ModalDetailTable(idtable) {
            $.ajax({
                type: "post",
                url: "/Admin/QLHoaDon/OrderDetailPage.aspx/DetailOrderTable",
                data: "{idtable:" + idtable + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    var HD = rs.d;
                    console.log(HD);
                    // Lấy giá trị từ HD.table_name và truyền vào sendEmail()
                    sendEmail(HD.table_name);
                }
            });
        }
        function funcOrderNow(idfood) {
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/getFoodOrderNow",
                data: "{idfood:" + idfood + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    var f = rs.d;
                    var html = `
                        <div style="padding:10px; background:#F8F9FA;">                            
                            <div class="row">                                
                                <div class="col-md-4">                                        
                                    <img style="border-radius:15px;" width="100%" src="../../Assets/images/${f.food_avatar}"/>
                                </div>
                                <div class="col-md-8" style="position:relative; font-family: cambria,Sans-serif;">
                                    <span style="font-size:13px;position:absolute;width:70px;height:40px;color:white;line-height:40px;background:red;right:10px;text-align:center;border-radius:50%">Sale ${f.food_sale} %</span>
                                    <h3 style="font-weight:bold;font-size:20px;">${f.food_name}</h3>
                                    <input type="hidden" id="foodid" name="foodid" value="${f.food_id}">
                                    <span style="color:black;font-size:14px;">${f.food_description}</span>
                                    <br />
                                    <p style="margin:5px 0px;">
                                        <span style="color:black;font-size:14px;">Price (€):     <span style="color:green;font-weight:bold;font-size:14px;">${f.food_price * (100 - f.food_sale) / 100}</span></span>
                                        <strike style="color:black;font-size:14px;margin-left:50px">Old price (€):     <span style="color:red;font-weight:bold;font-size:14px;">${f.food_price}</span></strike>
                                    </p>
                                    <div>
                                        <span style="color:black;font-size:14px;">Quantity:</span> 
                                        <button class="btn btn-default btn-sm" type="button" onclick="descrease_sl()" id="descrease_sl" style="margin-top: -3px;display:inline-block;padding:5px 10px; background-color: #FF6533; color: white;"> <i class="bi bi-dash-lg"></i> </button>
                                        <input type="number" id="food_quantity" min="1" value="1" style="display:inline-block;"/>
                                        <button class="btn btn-default btn-sm" type="button" onclick="increase_sl()" id="increase_sl" style="margin-top: -3px; display:inline-block; padding:5px 10px; background-color: #FF6533; color: white;"> <i class="bi bi-plus-lg"></i> </button>
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    `;
                    $("#ModalOrderNow .modal-body").html(html);
                    $("#ModalOrderNow").modal("show");
                }
            });
        }
        function descrease_sl_cart(idfood) {
            var sl = $("#tridfood_" + idfood + " .food_quantity_cart").val();
            if (sl == "")
                $("#tridfood_" + idfood + " .food_quantity_cart").val("1");
            if (parseInt(sl) > 1) {
                $("#tridfood_" + idfood + " .food_quantity_cart").val(parseInt(sl) - 1);
            }
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/ChangeQuantityFood",
                data: "{idfood:" + idfood + ",soluong:" + parseInt($("#tridfood_" + idfood + " .food_quantity_cart").val()) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    CART = rs.d
                    let thisF = CART.ListFood.find(function (item) {
                        return item.foodid == idfood;
                    });
                    $("#tridfood_" + idfood + " .tdThanhtien").text(parseInt(thisF.thanhtien));
                    $("#totalCart").text(getTotalCart);
                }
            });
        }
        function increase_sl_cart(idfood) {
            var sl = $("#tridfood_" + idfood + " .food_quantity_cart").val();
            if (sl == "")
                $("#tridfood_" + idfood + " .food_quantity_cart").val("1");
            else $("#tridfood_" + idfood + " .food_quantity_cart").val(parseInt(sl) + 1);
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/ChangeQuantityFood",
                data: "{idfood:" + idfood + ",soluong:" + parseInt($("#tridfood_" + idfood + " .food_quantity_cart").val()) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    CART = rs.d
                    let thisF = CART.ListFood.find(function (item) {
                        return item.foodid == idfood;
                    });
                    $("#tridfood_" + idfood + " .tdThanhtien").text(parseInt(thisF.thanhtien));
                    $("#totalCart").text(getTotalCart);
                }
            });
        }
        function getTotalCart() {
            let total = 0;
            $.each(CART.ListFood, function (index, item) {
                total += item.thanhtien;
            })
            return total;
        }
        function changefood_quantity_cart(idfood) {
            if ($("#tridfood_" + idfood + " .food_quantity_cart").val() <= 0) {
                $("#tridfood_" + idfood + " .food_quantity_cart").val("1");
            }
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/ChangeQuantityFood",
                data: "{idfood:" + idfood + ",soluong:" + parseInt($("#tridfood_" + idfood + " .food_quantity_cart").val()) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    CART = rs.d
                    let thisF = CART.ListFood.find(function (item) {
                        return item.foodid == idfood;
                    });
                    $("#tridfood_" + idfood + " .tdThanhtien").text(parseInt(thisF.thanhtien));
                    $("#totalCart").text(getTotalCart);
                }
            });
        }
        function XoaKkhoiCart(idfood) {
            $("#tridfood_" + idfood).remove();
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/XoaKkhoiCart",
                data: "{idfood:" + idfood + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    CART = rs.d
                    $.notify("Deleted successfully", "success")
                    if (CART.ListFood.length <= 0) {
                        $.notify("The cart does not contain any dishes", "error");
                        $("#ModalViewCart").modal("hide");
                    }
                }
            });
        }
        function descrease_sl() {
            var sl = $("#food_quantity").val();
            if (sl == "")
                $("#food_quantity").val("1");
            if (parseInt(sl) > 1) {
                $("#food_quantity").val(parseInt(sl) - 1);
            }
        }
        function increase_sl() {
            var sl = $("#food_quantity").val();
            if (sl == "")
                $("#food_quantity").val("1");
            else $("#food_quantity").val(parseInt(sl) + 1);
        }
        function AddToCart() {
            if ($("#food_quantity").val() <= 0) {
                $("#food_quantity").val("1");
            }
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/AddToCart",
                data: "{idfood:" + parseInt($('#foodid').val()) + ",soluong:" + parseInt($("#food_quantity").val()) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    $.notify("Add to cart successfully", "success");
                    $("#ModalOrderNow").modal("hide");
                    CART = rs.d
                }
            });
        }
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $('#on_top').fadeIn();
                } else {
                    $('#on_top').fadeOut();
                }
            });
            $('#on_top').click(function () {
                $("html, body").animate({ scrollTop: 0 }, 600);
                return false;
            });
        });
        // endHuy
        // trong

        $("#lb").change(function () {
            var ds = $("#ds").val();
            var ts = $("#ts").val();
            var tr = $("#tr").val();
            var lb = $("#lb").val();
            $("#omsg").css("color", "red");
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/sltb",
                data: "{'ds':'" + ds + "','ts':'" + ts + "','tr':'" + tr + "','lb':'" + lb + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    $("#Divtb").html(dt.d);

                },
                error: function () {
                    //alert ("Phải nhập đầy đủ thông tin order");
                }
            });
        })
        $("#ts").change(function () {
            $("#tr").val("");
            $("#lb").val("");
            var ts = $("#ts").val();
            var ds = $("#ds").val();
            $("#omsg").css("color", "red");
            //alert(ds);
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/ckeds",
                data: "{'ds':'" + ds + "','ts':'" + ts + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    //alert("hihi");
                    $("#omsg").html(dt.d);

                },
                error: function () {
                    alert("loi");
                }
            });
        })
        $("#ds").change(function () {
            var ds = $("#ds").val();
            var ts = $("#ts").val();
            var tr = $("#tr").val();
            $("#omsg").css("color", "red");
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/ckd",
                data: "{'ds':'" + ds + "','ts':'" + ts + "','tr':'" + tr + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    $("#omsg").html(dt.d);

                },
                error: function () {
                    //alert ("Phải nhập đầy đủ thông tin order");
                }
            });
        })
        $("#tr").change(function () {
            var ds = $("#ds").val();
            var ts = $("#ts").val();
            var tr = $("#tr").val();

            $("#lb").val("");
            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/ckedsts",
                data: "{'ds':'" + ds + "','ts':'" + ts + "','tr':'" + tr + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    //alert("hihi");
                    $("#omsg").html(dt.d);

                },
                error: function () {
                    //alert ("Phải nhập đầy đủ thông tin order");
                }
            });
        })
        $("#lb").change(function () {
            var ds = $("#ds").val();
            var ts = $("#ts").val();
            var tr = $("#tr").val();

            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/ckedststr",
                data: "{'ds':'" + ds + "','ts':'" + ts + "','tr':'" + tr + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    $("#omsg").html(dt.d);

                },
                error: function () {
                    $.notify("Must enter complete order information", "error");
                }
            });
        })
        $("#ordertb").click(function () {

            var ds = $("#ds").val();
            var ts = $("#ts").val();
            var tr = $("#tr").val();
            var lb = $("#lb").val();
            var tb = $("#tb").val();
            var tenban = $("#tb option[value='" + tb + "']").attr("tenban");
            $("#omsg").css("color", "red");

            $.ajax({
                type: "post",
                url: "/Trangchu.aspx/cko",
                data: "{'ds':'" + ds + "','ts':'" + ts + "','tr':'" + tr + "','lb':'" + lb + "','tb':'" + tb + "','tenban':'" + tenban + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    if (dt.d == "0") {
                        $.notify("Not filled in enough information to book a table", "error");
                    }
                    else {
                        if (dt.d == "1") {
                            $.notify("Input data is invalid", "error");
                        }
                        else {
                            $.notify("Added table selection, You haven't placed an order yet", "success");
                            $("#reservationModal").modal("hide");
                            setTimeout(function () {
                                location.reload();
                            }, 1500);
                        }
                    }

                },
                error: function () {
                    $.notify("Must enter complete order information", "error");
                }
            });

        })
        function openChonBan() {
            $("#ModalViewCart").modal("hide");
            $("#reservationModal").modal("show");
        }


        // ------- DUC --------
        function funcShowLF(id) {
            $.ajax({
                type: "POST",
                url: "/Trangchu.aspx/ShowListFoodType",
                data: "{IdFoodType:" + id + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                    var f = result.d;

                    //console.log(f);

                    //let liFoType = new DataUtil().getListFood_FoodType(id);
                    var html = '';
                    $.each(f, function (index, item) {
                        html += `
                                    <div class ="col-md-4" style='border: 1px solid #BABABA; padding: 10px; position: relative;'>
                                        <img style="height:250px;cursor: pointer;" src='../../Assets/images/${item.food_avatar}' onclick='funcOrderNow(${item.food_id})' class ="img-fluid" />
                                        <div class ="media-body text-center p-md-2 p-4">
			                                <h5 class ="text-primary" style="font-family: cambria,Sans-serif">${item.food_price} €</h5>
			                                <h5 class ="mt-0 h4">${item.food_name}</h5>
			                                <p class ="mb-4 pb-3">${item.food_description}</p>
			                                <p class ="mb-0" style='position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%);'><a href="javascript:void(0)" onclick='funcOrderNow(${item.food_id})' class ="btn btn-primary btn-sm" style="font-family: cambria,Sans-serif">Order Now!</a></p>
		                                </div>
                                    </div>
                            `

                    });
                    //console.log(html);
                    $("#cud").html(html);
                }
            });
        }

        function CheckFormContact() {
            if ($("#SendContactSubmit #name").val().trim() == "") {
                return 0;
            } else if ($("#SendContactSubmit #email").val().trim() == "") {
                return -1;
            } else if ($("#SendContactSubmit #message").val().trim() == "") {
                return -2;
            } else {
                let regEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                if (!regEmail.test($("#SendContactSubmit #email").val().trim()))
                    return -3;
            }
            return 1;
        }

        function funcContact() {
            if (USER == null) {
                if (CheckFormContact() == 1) {
                    $.ajax({
                        type: "POST",
                        url: "/Trangchu.aspx/Contact",
                        data: "{Name:'" + $("#SendContactSubmit #name").val() + "', Email:'" + $("#SendContactSubmit #email").val() + "', Message:'" + $("#SendContactSubmit #message").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            alert(result.d);
                            $("#SendContactSubmit #name").val("");
                            $("#SendContactSubmit #email").val("");
                            $("#SendContactSubmit #message").val("");
                        }
                    });
                } else {
                    if (CheckFormContact() == 0) {
                        $.notify("You want to contact us. Please enter your name!", "error")
                    } else if (CheckFormContact() == -1) {
                        $.notify("You have not entered your email yet !", "error")
                    } else if (CheckFormContact() == -3) {
                        $.notify("Email format error !", "error")
                    } else {
                        $.notify("Enter content !", "error")
                    }
                }
            } else {
                $.ajax({
                    type: "POST",
                    //data: "{Name:'" + $("#SendContactSubmit #name").val() + "', Email:'" + $("#SendContactSubmit #email").val() + "', Message:'" + $("#SendContactSubmit #message").val() + "'}",
                    data: "{Name:'" + CART.tenKH + "', Email:'" + CART.emailKH + "', Message:'" + $("#SendContactSubmit #message").val() + "'}",
                    url: "/Trangchu.aspx/Contact",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $.notify("Contact sent successfully", "success");
                        //alert(data.d);
                        $("#SendContactSubmit #name").val("");
                        $("#SendContactSubmit #email").val("");
                        $("#SendContactSubmit #message").val("");
                    }
                });
            }

        }
        // END - DUC
    </script>
</body>
</html>
