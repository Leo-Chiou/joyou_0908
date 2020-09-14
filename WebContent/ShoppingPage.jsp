<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>揪遊商城</title>
<style>
.wrapper {
	width: 850px;
	margin: 0px auto;
}

.clear {
	clear: both;
}

.items {
	display: block;
	margin: 20px 0;
	font-weight: bold;
}

.item {
	text-align: center;
	background-color: #fff;
	float: left;
	margin: 0 20px 0 20px;
	width: 240px;
	padding: 10px;
	height: 360px;
}

.item img {
	display: block;
	margin: auto;
}

.add-to-cart {
	background-color: white;
	color: #000079;
	text-transform: uppercase;
	font-weight: bold;
	cursor: pointer;
}

.add-to-cart:hover {
	background-color: #FFD306;
	color: #000079;
	text-transform: uppercase;
	font-weight: bold;
	cursor: pointer;
}
</style>

<script>
	window.onload = function() {

		var selectElement = document.getElementById('price');
		var pageNo = 0;
		var totalPage = 0;
		var xhr = new XMLHttpRequest();
		var xhr2 = new XMLHttpRequest();
		var xhr3 = new XMLHttpRequest();
		xhr.open("GET",
				"<c:url value='/PageProductsJsonServlet.do?type=all'/>", true); //設定執行的servlet
		xhr.send();

		xhr3.open("GET", "<c:url value='/SaleProductsJsonServlet.do'/>", true);
		xhr3.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var responseData1 = xhr.responseText;
					displayPageProducts(responseData1);
				} else {
					alert(xhr.status);
				}
			}
		}

		xhr3.onreadystatechange = function() {
			if (xhr3.readyState == 4) {
				if (xhr3.status == 200) {
					var responseData2 = xhr3.responseText;
					displaySaleProducts(responseData2)
				} else {
					alert(xhr3.status);
				}
			}
		}

		selectElement.onchange = function() {
			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					displayPageProducts(xhr2.responseText);
				}
			}
			xhr2.open("GET", "<c:url value='/PageProductsJsonServlet.do' />"
					+ "?type=" + selectElement.value, true);
			xhr2.send();
			asynRequest(id);
		}

		function asynRequest(id) {
			var xhr = new XMLHttpRequest();
			var no = 0;
			var queryString = "";
			if (id == "first") {
				no = 1;
			} else if (id == "prev") {
				no = pageNo - 1;
			} else if (id == "next") {
				no = pageNo + 1;
			} else if (id == "last") {
				no = totalPage;
			}
			queryString = "?pageNo=" + no + "&totalPage=" + totalPage
					+ "&type=" + selectElement.value;

			xhr.open("GET", "<c:url value='/GetPageNumberServlet.do'/>"
					+ queryString, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var responseData1 = xhr.responseText;
					displayPageProducts(responseData1);
				}
			}
		}

		function displaySaleProducts(responseData2) {

			var content = "<div></div>";
			var data = responseData2.split("&&&");
			var products = JSON.parse(data[0]); // 陣列
			var mapData = JSON.parse(data[1]); // JavaScript物件

			for (var i = 0; i < products.length; i++) {

				content += "<div class='items'>";
				content += "<div class='item'>";
				content += "<a href='${pageContext.request.contextPath}/ShowSingalProductServlet.do?"
						+ "imgName="
						+ products[i].imgName
						+ "&productId="
						+ products[i].productId
						+ "&productName="
						+ products[i].productName
						+ "&productPrice="
						+ products[i].productPrice
						+ "&productIntro="
						+ products[i].productIntro
						+ "&gameType="
						+ products[i].gametypeId
						+ "&productAge="
						+ products[i].productAge
						+ "&suggestNum="
						+ products[i].suggestNum
						+ "&productLang="
						+ products[i].productLang
						+ "&productStock="
						+ products[i].productStock + "'>"
				content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
				content += "<p style='margin:0;color:black;font-weight:bold;'> 商品名稱："
						+ products[i].productName + "</p>";
				content += "<p style='margin:0 0 10px 0;color:red;font-weight:bold;'> 庫存"
						+ products[i].productStock
						+ " 　特價$"
						+ products[i].productPrice + "</p>";
				content += "<a class='add-to-cart' href='${pageContext.request.contextPath}/BuyProductsServlet.do?pageNo="
						+ pageNo
						+ "&productId="
						+ products[i].productId
						+ "&productName="
						+ products[i].productName
						+ "&productPrice="
						+ products[i].productPrice
						+ "&counts=1' class='primary-btn'>ADD TO CARD</a>";
				content += "</div></div>";

			}
			document.getElementById("saleProduct").innerHTML = content;
		}

		function displayPageProducts(responseData1) {
			var content = "<div class='wrapper'><div class='clear'></div>";
			var data = responseData1.split("&&&");
			var products = JSON.parse(data[0]); // 陣列
			var mapData = JSON.parse(data[1]); // JavaScript物件

			for (var i = 0; i < products.length; i++) {

				content += "<div class='items'>";
				content += "<div class='item'>";
				content += "<a href='${pageContext.request.contextPath}/ShowSingalProductServlet.do?"
						+ "imgName="
						+ products[i].imgName
						+ "&productId="
						+ products[i].productId
						+ "&productName="
						+ products[i].productName
						+ "&productPrice="
						+ products[i].productPrice
						+ "&productIntro="
						+ products[i].productIntro
						+ "&gameType="
						+ products[i].gametypeId
						+ "&productAge="
						+ products[i].productAge
						+ "&suggestNum="
						+ products[i].suggestNum
						+ "&productLang="
						+ products[i].productLang
						+ "&productStock="
						+ products[i].productStock + "'>"
				content += "<img src='img\\" + products[i].imgName +"' width='300' /></a>";
				content += "<p style='margin:0;color:black;font-weight:bold;'> 商品名稱："
						+ products[i].productName + "</p>";
				content += "<p style='margin:0 0 10px 0;color:black;font-weight:bold;'> 庫存"
						+ products[i].productStock
						+ " 　售價$"
						+ products[i].productPrice + "</p>";
				content += "<a class='add-to-cart' href='${pageContext.request.contextPath}/BuyProductsServlet.do?pageNo="
						+ pageNo
						+ "&productId="
						+ products[i].productId
						+ "&productName="
						+ products[i].productName
						+ "&productPrice="
						+ products[i].productPrice
						+ "&counts=1' class='primary-btn'>ADD TO CARD</a>";
				content += "</div>";

			}
			document.getElementById("pageProduct").innerHTML = content;
			pageNo = mapData.currPage;
			totalPage = mapData.totalPage;

			var navContent = "<table><tr height='36'>";
			if (pageNo != 1) {
				navContent += "<td width='40' align='center'><input id='first' type='button' value='|<' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
				navContent += "<td width='40' align='center'><input id='prev' type='button' value='<<' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
			} else {
				navContent += "<td width='40' align='center'>&nbsp;</td>";
				navContent += "<td width='40' align='center'>&nbsp;</td>";
			}
			navContent += "<td width='100' align='center'>" + pageNo + " / "
					+ totalPage + "頁</td>";
			if (pageNo != totalPage) {
				navContent += "<td width='40' align='center'><input id='next' type='button' value='>>' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
				navContent += "<td width='40' align='center'><input id='last' type='button' value='>|' style='font-weight:bold;width:30px;height:30px;border:none;background-color:#FFD306;'></td>";
			} else {
				navContent += "<td width='40' align='center'>&nbsp;</td>";
				navContent += "<td width='40' align='center'>&nbsp;</td>";
			}
			document.getElementById("navigation").innerHTML = navContent;
			var firstBtn = document.getElementById("first");
			var prevBtn = document.getElementById("prev");
			var nextBtn = document.getElementById("next");
			var lastBtn = document.getElementById("last");
			if (firstBtn != null) {
				firstBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (prevBtn != null) {
				prevBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (nextBtn != null) {
				nextBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (lastBtn != null) {
				lastBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

		}
	}
</script>


<!-- Google Font -->
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
							<li><a href="#">Fruit & Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Ocean Foods</a></li>
							<li><a href="#">Butter & Eggs</a></li>
							<li><a href="#">Fastfood</a></li>
							<li><a href="#">Fresh Onion</a></li>
							<li><a href="#">Papayaya & Crisps</a></li>
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
						<h2>揪遊商城</h2>
						<div class="breadcrumb__option">
							<span>WELCOME</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>桌遊類型</h4>
							<ul>
								<li><a href="javascript:void(0)">Party Games</a></li>
								<!-- 執行篩選 -->
								<li><a href="#">Strategy Games</a></li>
								<li><a href="#">Themetic Games</a></li>
								<li><a href="#">War Games </a></li>
								<li><a href="#">Abstract Games </a></li>
								<li><a href="#">Customizable Games </a></li>
								<li><a href="#">Children Games </a></li>
								<li><a href="#">Family Games</a></li>
							</ul>
						</div>
						<div class="sidebar__item">
							<h4>商品售價</h4>
							<div class="price-range-wrap">
								<div
									class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
									data-min="10" data-max="800">

									<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
								</div>
								<div class="range-slider">
									<div class="price-input">
										<input type="text" id="minamount"> <input type="text"
											id="maxamount">
									</div>
								</div>
							</div>
						</div>
						<div class="sidebar__item sidebar__item__color--option">
							<h4>顏色分類</h4>
							<div class="sidebar__item__color sidebar__item__color--white">
								<label for="white"> White <input type="radio" id="white">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--gray">
								<label for="gray"> Gray <input type="radio" id="gray">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--red">
								<label for="red"> Red <input type="radio" id="red">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--black">
								<label for="black"> Black <input type="radio" id="black">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--blue">
								<label for="blue"> Blue <input type="radio" id="blue">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--green">
								<label for="green"> Green <input type="radio" id="green">
								</label>
							</div>
						</div>
						<div class="sidebar__item">
							<h4>繪畫風格</h4>
							<div class="sidebar__item__size">
								<label for="large"> Large <input type="radio" id="large">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="medium"> Medium <input type="radio"
									id="medium">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="small"> Small <input type="radio" id="small">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="tiny"> Tiny <input type="radio" id="tiny">
								</label>
							</div>
						</div>
						<div class="sidebar__item">
							<!-- 
							<div class="latest-product__text">
								<h4>最新商品</h4>
								<div class="latest-product__slider owl-carousel">
									<div class="latest-prdouct__slider__item">
										<a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-1.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-2.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-3.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a>
									</div>
									<div class="latest-prdouct__slider__item">
										<a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-1.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-2.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-3.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a>
									</div>
								</div>
							</div>
							 -->
						</div>
					</div>
				</div>
				<div class="col-lg-A col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>SALE OFF!</h2>
						</div>

						<div id='saleProduct'></div>
						<!-- 特價區 -->

					</div>

					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>價格排序</span> <select id="price">
										<option value="all">預設</option>
										<option value="desc">由高到低</option>
										<option value="asc">由低到高</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<span>16</span> 搜尋結果
									</h6>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<!-- 商品區 -->
						<div id='pageProduct'></div>
					</div>
					<div style="margin-left: 250px; margin-top: 50px">
						<div id='navigation' style='height: 60px;'></div>
					</div>
				</div>
			</div>
		</div>
	</section>

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
							<li>Phone: 02-28825252</li>
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
					<div class="footer__copyright"></div>
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