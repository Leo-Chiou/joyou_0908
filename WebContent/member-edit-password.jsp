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
        var randInt=Math.floor(Math.random()*9000)+1; 

        function sendMail() {
                console.log("count begin");
                let wait = 60;
                function time(o) {
                    if (wait == 0) {
                        o.removeAttribute("disabled");
                        o.value = "重新發送驗證碼";
                        wait = 60;
                    } else {
                        o.setAttribute("disabled", "");
                        o.value = wait + "秒後可以重新發送";
                        wait--;
                        setTimeout(function () {
                            time(o);
                        }, 1000);
                    }
                }

                time(document.getElementById("btnSendMail"));

                console.log("count end");

                let Obj = document.getElementsByName("userMail")[0];
                let VerifyObj = document.getElementById("checkMail");

               
                let xhr = new XMLHttpRequest();
                xhr.open("POST", "c:url value='/SendVerifiedMailServlet'", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("mail=" + Obj.value);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        let result = JSON.parse(xhr.responseText);
                        verifiedCode = result.verifiedCode;
                        let message = "驗證信已寄出";
                        VerifyObj.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
                    }
                };
            }

            function checkConsistency() {
                let Obj = document.getElementsByName("verified")[0];
                let VerifyObj = document.getElementById("checkMailCode");
                let message = "";
                if (Obj.value == verifiedCode) {
                    message = "驗證碼正確";
                } else {
                    message = "驗證碼錯誤";
                }
                VerifyObj.innerHTML = message;
            }


        function checkPassword() {
            let Obj = document.getElementsByName("userPassword")[0];
            let ObjVal = Obj.value;
            let ObjValLen = ObjVal.length;
            let VerifyObj = document.getElementById("checkPassword");

            if (ObjVal.search(/\s/g) != -1) {
                VerifyObj.innerHTML = "&nbsp; &nbsp; 不能有空白";
            } else if (ObjValLen < 2 || ObjValLen > 15) {
                VerifyObj.innerHTML = "&nbsp; &nbsp; 限制長度為6-15字";
            } else {
                if (/^[a-zA-z0-9]{2,15}$/.test(ObjVal)) {
                    VerifyObj.innerHTML = "&nbsp; &nbsp; 格式正確";
                } else {
                    VerifyObj.innerHTML = "&nbsp; &nbsp; 必須全為字母數字";
                }
            }
            checkPassword2();
        }

        function checkPassword2() {
            let Obj = document.getElementsByName("userPassword")[0];
            let ObjVal = Obj.value;
            let Obj2 = document.getElementsByName("userPassword2")[0];
            let ObjVal2 = Obj2.value;
            let VerifyObj = document.getElementById("checkPassword");
            let VerifyObj2 = document.getElementById("checkPassword2");
            if (ObjVal2.search(/\s/g) != -1) {
                VerifyObj2.innerHTML = "&nbsp; &nbsp; 不能有空白";
            } else if (VerifyObj.innerHTML == "&nbsp; &nbsp; 格式正確" && ObjVal == ObjVal2) {
                VerifyObj2.innerHTML = "&nbsp; &nbsp; 密碼相符";
            } else {
                VerifyObj2.innerHTML = "&nbsp; &nbsp; 密碼不符";
            }
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
              <span>Edit Password</span>&nbsp; 修改密碼
            </div><!-- -->            
<div class="SB_MemberContent">
    <!-- 步驟 -->

    <form action="<c:url value='/up_MemberEditPasswordServlet'/>" method="POST">
        <div class="SB_MemberData">
            <table width="660" border="0" cellpadding="0" cellspacing="0" class="SB_MemberData_write SB_tablemarginB30">

                <!---->
                <tbody>
            
                
                <!---->

                <!---->
                <tr>
                    <td align="right">
                        <label for="meow"><span class="SB_tableWstyle03">*</span>帳號</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userAccount" id="meow" type="text" class="SB_tableInput01" value="" >
                    </td>
                    <td class="SB_tableWstyle05" id="checkAccount">
                        &nbsp; &nbsp;
                    </td>
                </tr>

               
                <tr id="block_mem_email" style="">
                    <td align="right">
                        <label for="mem_email"><span class="SB_tableWstyle03" id="mem_email_necessary_abbr">*</span>會員 E-mail</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userMail" id="mem_email" type="text" class="SB_tableInput01" value=""  >
                    </td>
                    <td class="SB_tableWstyle05" >
                        &nbsp; &nbsp;<!---->
                    </td>
                </tr>
                <tr  style="">
                    <td align="right">
                        <label for=""><span class="SB_tableWstyle03" id="mem_email_necessary_abbr">*</span>驗證碼</label><!---->
                        <input type="button" id="btnSendMail" onclick="sendMail()" value="發送驗證信" >
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="verified" id="" type="text" class="SB_tableInput01" value="" onChange="checkConsistency()"  >
                    </td>
                    <td class="SB_tableWstyle05" id="checkMailCode">
                        
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label for="mem_password"><span class="SB_tableWstyle03">*</span>密碼設定</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userPassword" id="mem_password" type="password" class="SB_tableInput01" value=""  onChange="checkPassword()" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkPassword">
                        &nbsp; &nbsp;請輸入 6 碼以上英數字
                    </td>
                </tr>
                
                <!---->

                <!---->
                <tr>
                    <td align="right">
                        <label for="mem_password_check"><span class="SB_tableWstyle03">*</span>密碼確認</label><!---->
                    </td>
                    <td class="SB_tableW220 SB_tablepaddingL10">
                        <input name="userPassword2" id="mem_password_check" type="password" class="SB_tableInput01" value="" onChange="checkPassword2()" required>
                    </td>
                    <td class="SB_tableWstyle05" id="checkPassword2">
                        &nbsp; &nbsp;請再輸入一次您的密碼做確認<!---->
                    </td>
                </tr>

                
                <!---->

                <!---->
       
                <!---->

            </tbody></table>
           
            
            <div class="SB_MemberClause_btn jooshop_btn_color">
                <input name="btn_submit" id="submit" value="確定修改" type="submit"><!---->
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

        %>
        
        var userAccount="<%=userAccountStr%>";
        var userMail="<%=userMailStr%>";


        document.getElementsByName("userAccount")[0].value= userAccount ;
        document.getElementsByName("userMail")[0].value= userMail ;

        document.getElementsByName("userAccount")[0].setAttribute("readonly","readonly");
        document.getElementsByName("userMail")[0].setAttribute("readonly","readonly");
    </script>

</body>

</html>