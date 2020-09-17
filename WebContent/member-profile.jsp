<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="JOYOU BOARD GAMES">
    <meta name="keywords" content="JOYOU, BOARD GAMES, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>揪遊 JOYOU | BOARD GAMES</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style2.css" type="text/css">
   <!-- login Begin--> 

    <!-- login End--> 


    <script>
            var clickCount = 0;
            var verifiedMailAddress = 0;
            var verifiedCode = 0;


            function EditProfile() {
                // document.getElementById("btnEdit").setAttribute("display", "none");
                // document.getElementById("btnUndo").removeAttribute("display");
                // document.getElementById("submit").removeAttribute("display");
                document.getElementById("btnEdit").style.display = "none";
                document.getElementById("btnUndo").style.display = "";
                document.getElementById("submit").style.display = "";

                document.getElementsByName("userNickName")[0].removeAttribute("disabled");
                document.getElementsByName("userTrueName")[0].removeAttribute("disabled");
                document.getElementsByName("userPhone")[0].removeAttribute("disabled");
                document.getElementsByName("userGender")[0].removeAttribute("disabled");
                document.getElementsByName("userGender")[1].removeAttribute("disabled");
            }

            function UndoProfile() {
                document.getElementById("btnEdit").style.display = "";
                document.getElementById("btnUndo").style.display = "none";
                document.getElementById("submit").style.display = "none";

                document.getElementsByName("userNickName")[0].value= userNickName;
                document.getElementsByName("userTrueName")[0].value= userTrueName;
                document.getElementsByName("userPhone")[0].value= userPhone;
                if(userGender=="F"){
                    document.getElementsByName("userGender")[1].removeAttribute("checked");
                    document.getElementsByName("userGender")[0].setAttribute("checked","");
                }else if(userGender=="M"){
                    document.getElementsByName("userGender")[0].removeAttribute("checked");
                    document.getElementsByName("userGender")[1].setAttribute("checked","");
                }

                document.getElementsByName("userNickName")[0].setAttribute("disabled", "");
                document.getElementsByName("userTrueName")[0].setAttribute("disabled", "");
                document.getElementsByName("userPhone")[0].setAttribute("disabled", "");
                document.getElementsByName("userPhone")[0].setAttribute("disabled", "");
                document.getElementsByName("userPhone")[1].setAttribute("disabled", "");
            }
    </script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" width="90%" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">關於我們</a></li>

                            <li><a href="./shop-grid.html">桌遊百科</a>
                            </li>
                            <li><a href="#">桌遊商城</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">新品上市</a></li>
                                    <li><a href="./shoping-cart.html">AAA</a></li>
                                    <li><a href="./checkout.html">BBB</a></li>
                                    <li><a href="./blog-details.html">CCC</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">揪遊團</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">討論區</a></li>
                                    <li><a href="./shoping-cart.html">AAA</a></li>
                                    <li><a href="./checkout.html">BBB</a></li>
                                    <li><a href="./blog-details.html">CCC</a></li>
                                </ul>
                            </li>
                            <li><a href="./contact.html">聯繫我們</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>


<!-- member-into End--> 
        <div class="FOR_MAIN">   
         <div class="SB_MemberContent_login">
              <span>Member Profile</span>&nbsp; 會員資料
            </div><!-- -->            
<div class="SB_MemberContent">
    <!-- 步驟 -->
   
    <form action="<c:url value='/up_MemberEditProfileServlet'/>" method="POST">
        <div class="SB_MemberData">
            <div class="SB_MemberClause_btn jooshop_btn_color">
                <input name="btn_submit" id="btnEdit" value="修改會員資料" type="button" onclick="EditProfile()"><!---->
                <input name="btn_submit" id="btnUndo" value="取消修改" type="button" onclick="UndoProfile()" style="display: none">
            </div>

            <table width="660" border="0" cellpadding="0" cellspacing="0" class="SB_MemberData_write SB_tablemarginB30">

                <!---->
                <tbody>
            
                <tr id="block_mem_email" style="">
                    <td align="right">
                        <label for="mem_email"><span class="SB_tableWstyle03" id="mem_email_necessary_abbr">*</span>會員 E-mail</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userMail" id="mem_email" type="text" class="SB_tableInput01" value="" readonly required >
                    </td>
                    <td class="SB_tableWstyle05" >
                    </td>
                </tr>
                <!---->

                <!---->
                <tr>
                    <td align="right">
                        <label for="meow"><span class="SB_tableWstyle03">*</span>帳號</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userAccount" id="meow" type="text" class="SB_tableInput01" value="" readonly  required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkAccount">
                        &nbsp; &nbsp;請輸入 6 碼以上英數字
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label for="mem_password"><span class="SB_tableWstyle03">*</span>密碼</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <a href="member-edit-password.jsp">
                            <input type="button" id="btnEditPwd" value="修改密碼" >
                        </a>
                    </td>
                    <td >
                        
                    </td>
                </tr>
                <!---->

                <!---->

                <tr>
                    <td align="right">
                        <label for="mem_name"><span class="SB_tableWstyle03">*</span>中文全名</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input class="SB_tableInput01" name="userTrueName" id="mem_name" type="text" value="" onChange="checkTrueName()" >
                    </td>
                    <td>
                        <label><input name="userGender" type="radio" value="F" checked="">小姐</label><!---->
                        <label><input name="userGender" type="radio" value="M">先生</label><!---->
                        <span id="checkTrueName"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label for="meow2"><span class="SB_tableWstyle03">*</span>暱稱</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userNickName" id="meow2" type="text" class="SB_tableInput01" value="" onChange="checkNickName()" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkNickName">
                        
                    </td>
                </tr>

                <tr>
                    <td align="right">
                        <label for="meow3"><span class="SB_tableWstyle03">*</span>手機</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userPhone" id="meow3" type="text" class="SB_tableInput01" value="" onChange="checkPhone()" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkPhone">
                        
                    </td>
                </tr>
                
                <!---->

                <!---->

                <!---->

                <!---->
       
                <!---->

            </tbody></table>
           
                
            
           
            <div class="SB_MemberClause_btn jooshop_btn_color">
                <input name="btn_submit" id="submit" value="確定修改" type="submit" style="display: none"><!---->
            </div>
        </div>
    </form>
</div>      
</div>
<!---->
<!---->

</div>            <!---->
        </div>
        </div>
            <!-- member-into End--> 


                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->


    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by <a href="./index.html" target="_blank">JOYOU BOARD GAMES</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>


    <script>

        <%

        String userAccountStr =(String) session.getAttribute("memberAccount");
        String userMailStr =(String) session.getAttribute("memberMail");
        String userNickNameStr =(String) session.getAttribute("memberNickName");
        String userTrueNameStr =(String) session.getAttribute("memberTrueName");
        String userPhoneStr =(String) session.getAttribute("memberPhone");
        String userGenderStr =(String) session.getAttribute("memberGender");

        %>

        var userAccount="<%=userAccountStr%>";
        var userMail="<%=userMailStr%>";
        var userNickName="<%=userNickNameStr%>";
        var userTrueName="<%=userTrueNameStr%>";
        var userPhone="<%=userPhoneStr%>";
        var userGender="<%=userGenderStr%>";

        document.getElementsByName("userAccount")[0].value= userAccount ;
        document.getElementsByName("userMail")[0].value= userMail ;
        document.getElementsByName("userNickName")[0].value= userNickName ;
        document.getElementsByName("userTrueName")[0].value= userTrueName ;
        document.getElementsByName("userPhone")[0].value= userPhone ;
        if(userGender=="F"){
            document.getElementsByName("userGender")[1].removeAttribute("checked");
            document.getElementsByName("userGender")[0].setAttribute("checked","");
        }else if(userGender=="M"){
            document.getElementsByName("userGender")[0].removeAttribute("checked");
            document.getElementsByName("userGender")[1].setAttribute("checked","");
        }
     
        document.getElementsByName("userNickName")[0].setAttribute("disabled", "");
        document.getElementsByName("userTrueName")[0].setAttribute("disabled", "");
        document.getElementsByName("userPhone")[0].setAttribute("disabled", "");
        document.getElementsByName("userGender")[0].setAttribute("disabled", "");
        document.getElementsByName("userGender")[1].setAttribute("disabled", "");


    </script>

</body>

</html>