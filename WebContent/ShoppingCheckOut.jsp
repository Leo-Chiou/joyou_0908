<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="today" class="java.util.Date" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結帳</title>

<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">


<script>
	function checkCode() {
		
		let code = document.getElementsByName("code")[0];
		let Vobj1 = document.getElementById("checkCodeMsg");
		let Vobj2 = document.getElementById("amount");
		let Vobj3 = document.getElementById("newTotal");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/DiscountServlet.do?' />", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("code=" + code.value);
		let msg = "";
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let result = JSON.parse(xhr.responseText);
				Vobj1.innerHTML = "<span>" + result.codeMsg + "</span>";
				Vobj2.innerHTML = "<span>" + "NT." + result.amount + "</span>";
				Vobj3.innerHTML = "<span>" + "NT." + result.newTotal + "</span>";
			}
		}
	}
</script>
</head>
<body>
	<c:set var="funcName" value="CHE" scope="session" />

	<c:choose>
		<c:when test="${ShoppingCart.subtotal > 0}">
			<c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元" />
			<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
		</c:when>
		<c:otherwise>
			<c:set var="subtotalMessage" value="金額小計:  0 元" />
			<c:set var="subtotal" value="0" />
		</c:otherwise>
	</c:choose>

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
				<li><a
					href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"><i
						class="fa fa-shopping-bag"></i> <span>${ShoppingCart.itemNumber}</span></a></li>
			</ul>
			<div class="header__cart__price">
				<FONT color='Black' size='-1'> <c:out
						value="購物金額:NT.${ShoppingCart.subtotal}" default="0" /></FONT>
			</div>
		</div>
		<div class="humberger__menu__widget">

			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li><a href="./shop-grid.html">Shop</a></li>
				<li><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.html">Blog</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
				<li>買千送百活動開跑中</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
								<li>買千送百活動開跑中</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-linkedin"></i></a> <a href="#"><i
									class="fa fa-pinterest-p"></i></a>
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
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./index.jsp">關於我們</a></li>

							<li><a href="./shop-grid.html">桌遊百科</a></li>
							<!--  <li><a href="ProductsGetServlet.do">揪遊商城</a> -->
							<li><a href="ProductsGetServlet.do">揪遊商城</a></li>
							<li><a href="./blog.html">揪遊團</a>
								<ul class="header__menu__dropdown">
									<li><a href="./shop-details.html">討論區</a></li>
								</ul></li>
							<li><a href="./contact.html">聯繫我們</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a
								href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"><i
									class="fa fa-shopping-bag"></i><span>${ShoppingCart.itemNumber}</span></a></li>
						</ul>
						<div class="header__cart__price">

							<span>購物金額 $<c:out value="${ShoppingCart.subtotal}"
									default="0" /></span>
						</div>
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
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">

						<ul>
							<li><a href="#">Fresh Meat</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Ocean Foods</a></li>
							<li><a href="#">Butter Eggs</a></li>
							<li><a href="#">Fastfood</a></li>
							<li><a href="#">Fresh Onion</a></li>
							<li><a href="#">Papayaya Crisps</a></li>
							<li><a href="#">Oatmeal</a></li>
							<li><a href="#">Fresh Bananas</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
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
								<h5>02-28825252</h5>
								<span>24Hr客服專線</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>結帳頁面</h2>
						<div class="breadcrumb__option"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row"></div>
			<div class="checkout__form">
				<h4>訂單資料</h4>
				<form action="NcccPaymentPage.jsp" method="POST">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											訂購人姓名<span>*</span>
										</p>
										<input type="text" name="ordername" placeholder="Name">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											訂購人電話<span>*</span>
										</p>
										<input type="text" name="orderphone" placeholder="Phone">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									收件人姓名<span>*</span>
								</p>
								<input type="text" name="recievename" placeholder="Recipient">
							</div>
							<div class="checkout__input">
								<p>
									收件人電話<span>*</span>
								</p>
								<input type="text" name="recievephone"
									placeholder="Recipient Phone">
							</div>
							<div class="checkout__input">
								<p>
									收件地址<span>*</span>
								</p>
								<input type="text" name="address" placeholder="Street Address"
									class="checkout__input__add">
							</div>
							<div class="checkout__input">
								<p>
									電子郵件<span>*</span>
								</p>
								<input type="text" name="mail" placeholder="E-MAIL"
									class="checkout__input__add">
							</div>
							<div class="checkout__input">
								<p>
									訂單備註<span>*</span>
								</p>
								<input type="text" name="remarks" placeholder="Remarks">
							</div>

							<div class="checkout__input">
								<p>
									折扣碼<span>*</span>
								</p>
								<input type="text" name="code" onChange="checkCode()"
									placeholder="Enter your coupon code">
								<p id="checkCodeMsg"
									style="color: red; font-weight: blod; font-size: 14px"></p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>購物清單</h4>
								<div class="checkout__order__products">
									商品名稱及數量<span>金額</span>
								</div>
								<c:forEach varStatus="vs" var="orderItemBean"
									items="${ShoppingCart.content}">
									<ul>
										<li>${orderItemBean.value.productName}X
											${orderItemBean.value.orderitemQty} <span>NT.${orderItemBean.value.totalPrice}</span>
										</li>

									</ul>
								</c:forEach>
								<div class="checkout__order__subtotal">
									折扣前<span>NT.${subtotal}</span>
								</div>

								<div class="checkout__order__total">
									折扣金額<span id="amount">NT.0</span> <br /> <br /> <br /> 
									總金額<span id="newTotal">NT.${subtotal}</span>
								</div>
								訂單日期：
								<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
								<div class="checkout__input__checkbox">
									<br /> <br /> <br /> <br />
									<h4>付款方式</h4>
									<label for="acc-or"> 郵局或銀行匯款 <input type="checkbox"
										id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>

								<div class="checkout__input__checkbox">
									<label for="payment"> 貨到付款 <input type="checkbox"
										id="payment"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> 信用卡付款 <input name="card"
										type="checkbox" id="paypal"> <span class="checkmark"></span>
									</label>
								</div>
								<input type="hidden" name="amountTotal" value="${subtotal}">
								<button type="submit" class="site-btn" onclick="">送出訂單</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
s
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
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
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
</body>
</html>