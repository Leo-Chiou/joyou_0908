<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");

String amount = request.getParameter("amountTotal");
int amount_final = 0;
if(amount.indexOf(".")> -1){
	amount = amount.substring(0, amount.indexOf("."));
	amount_final = Integer.parseInt(amount);
}
amount_final = Integer.parseInt(amount);


request.getSession().setAttribute("recievename", request.getParameter("recievename"));
request.getSession().setAttribute("recievephone", request.getParameter("recievephone"));
request.getSession().setAttribute("address", request.getParameter("address"));
request.getSession().setAttribute("remarks", request.getParameter("remarks"));



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NCCC</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/slideshow.css" type="text/css">


<SCRIPT language=JavaScript src="js/sha256.js"></SCRIPT>
<script language="javascript">

function setConf(){

	var SignatureData="";
	var SignatureTemp="";


	SignatureData = "MerchantID="+document.getElementById("MerchantID").value+
					"&TerminalID="+document.getElementById("TerminalID").value+
					"&OrderID="+document.getElementById("OrderID").value+
					"&TransAmt="+document.getElementById("TransAmt").value
	                +"&TransMode="+document.getElementById("TransMode").value+
	                "&Install="+document.getElementById("Install").value+
	                "&NotifyURL="+document.getElementById("NotifyURL").value
	                +"&CSS_URL="+document.getElementById("CSS_URL").value+
	                "&BankNo="+document.getElementById("BankNo").value+
	                "&TEMPLATE="+document.getElementById("BankNo").value
	                +"&BankNo="+document.getElementById("BankNo").value+
	                "&TravelStartDate="+document.getElementById("TravelStartDate").value+
	                "&TravelEndDate="+document.getElementById("TravelEndDate").value+
	                "&"+SHA256("8888888");

	SignatureTemp = SHA256(SignatureData);

	document.getElementById("Signature").value= SignatureData;

	alert(document.getElementById("Signature").value);

	return true;
}
</script>


</head>
<body onload="document.HPP.submit();">


	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">			
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
						<a href="./index.html"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">關於我們</a></li>

                            <li><a href="./shop-grid.html">桌遊百科</a>
                            </li>
                            <!--  <li><a href="ProductsGetServlet.do">揪遊商城</a> -->
                            <li><a href="ProductsGetServlet.do">揪遊商城</a>
                            </li>
                            <li><a href="./blog.html">揪遊團</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">討論區</a></li>
                                </ul>
                            </li>
                            <li><a href="./contact.html">聯繫我們</a></li>
                        </ul>
                    </nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
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







<div style="margin-top: 100px ; margin-left:150px">
<form name="HPP" method="post" target="HPPFrame" ACTION="https://nccnet-ectest.nccc.com.tw/merchant/HPPRequest">
<input type="hidden" name="MerchantID" id="MerchantID" value="6600800020">
<input type="hidden" name="TerminalID" id="TerminalID" value="70502744">
<input type="hidden" name="Install"    id="Install" value="0">
<input type="hidden" name="OrderID"    id="OrderID" value="<%=System.currentTimeMillis() %>">
<input type="hidden" name="TransMode"  id="TransMode" value="0">
<input type="hidden" name="CSS_URL"    id="CSS_URL" value="">
<input type="hidden" name="BankNo"     id="BankNo" value="">
<input type="hidden" name="TEMPLATE"   id="TEMPLATE" value="BOTH">
<input type="hidden" name="TravelStartDate"   id="TravelStartDate" value="">
<input type="hidden" name="TravelEndDate"     id="TravelEndDate" value="">
<input type="hidden" name="TransAmt"   id="TransAmt" value="<%=amount_final %>">
<input type="hidden" name="NotifyURL"  id="NotifyURL" value="http://localhost:8080/JoYouProject/NcccResponsePage.jsp">
<input type="hidden" name="Signature"  id="Signature" value="">
<iframe name="HPPFrame" id="mainFrame" height="600" width="800" Frameborder="0"/>
</div>
</body>
</html>