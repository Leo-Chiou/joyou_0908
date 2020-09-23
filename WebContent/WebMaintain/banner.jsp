<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="left-custom-menu-adp-wrap comment-scrollbar">
				<nav class="sidebar-nav left-sidebar-menu-pro">
					<ul class="metismenu" id="menu1">
						<li><a href="${pageContext.request.contextPath}/WebMaintain/Index_Maintain.jsp"> <span
								class="mini-click-non">首頁</span></a></li>
						<li><a href="${pageContext.request.contextPath}/WebMaintain/Orders_Maintain.jsp"> <span
								class="mini-click-non">訂單管理</span></a></li>
						<li><a class="has-arrow" href="" aria-expanded="false"> <span
								class="mini-click-non">商品管理</span></a>
							<ul class="submenu-angle" aria-expanded="false">
								<li><a title="Product Edit" href="${pageContext.request.contextPath}/WebMaintain/Products_Add.jsp"><span
										class="mini-sub-pro">商品上架</span></a></li>
								<li><a title="Product List" href="${pageContext.request.contextPath}/WebMaintain/Products_Maintain.jsp"><span
										class="mini-sub-pro">商品清單</span></a></li>
							</ul></li>
						<li><a class="has-arrow" href="mailbox.html"
							aria-expanded="false"> <span class="mini-click-non">內容管理</span></a>
							<ul class="submenu-angle" aria-expanded="false">
								<li><a title="Product Edit" href="SlideEdit.html"><span
										class="mini-sub-pro">編輯輪播畫面</span></a></li>
							</ul></li>
						<li><a href="Members.html"> <span class="mini-click-non">會員管理</span></a>
						</li>

					</ul>
				</nav>
			</div>
</body>
</html>