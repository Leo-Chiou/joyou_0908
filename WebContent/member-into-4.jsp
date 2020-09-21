<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/style2.css" type="text/css">
<!-- login Begin-->

<!-- login End-->
</head>

<body>
	<jsp:include page="header.jsp" />
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
								<h5>+65 11.188.888</h5>
								<span>support 24/7 time</span>
							</div>
						</div>
					</div>


					<!-- member-into End-->
					<div class="FOR_MAIN">
						<div class="SB_MemberContent_login">
							<span>Member Sign Up</span>&nbsp; 會員註冊
						</div>
						<!-- -->
						<div class="SB_MemberContent">
							<!-- 步驟 -->
							<div class="all_scart_top clearfix">
								<div class="cart_step_bg1 center_step">
									<ul class="cart_step clearfix">
										<li class="font_color_01">會員條款</li>
										<!---->
										<li class="font_color_01">填寫資料</li>
										<!---->
										<li class="font_color_01">帳號開通</li>
										<!---->
										<li class="font_color_01">註冊完成</li>
										<!---->
									</ul>
								</div>
							</div>

							<div class="SB_MemberFinal">
								<div class="SB_MemberFinal_in  SB_tablemarginB30">
									<p>
										<span id="StringOfNickName"></span> 您好，您的帳號已順利開通，
									</p>
									<p>
										即刻登入立即享有會員權益。
										<!--即刻登入立即享有會員權益。-->
									</p>
								</div>
								<div class="SB_MemberSignnow_btn jooshop_btn_color">
									<a href="login.jsp">立即登入</a>
								</div>
							</div>
						</div>
					</div>
					<!---->
					<!---->

				</div>
				<!---->
			</div>
		</div>
		<!-- Hero Section End -->


		<!-- Footer Section Begin -->
		<jsp:include page="footer.jsp" />
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
        <%String userNickNameStr = (String) session.getAttribute("memberNickName");%>
        
        
        var userNickName="<%=userNickNameStr%>
			";

			document.getElementById("StringOfNickName").innerHTML = userNickName;
		</script>
</body>

</html>