<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>firstpage</title>
<script type="text/javascript">
	let x = localStorage.getItem('foot');
	x=x+".";
	localStorage.setItem('foot',x);
	console.log(localStorage.getItem('foot'));


	//將x存入資料庫 setUserFoot(int 1000, String x)
	
	localStorage.clear();
	let number = "1";
	
	localStorage.setItem('foot',number);
	

	console.log(localStorage.getItem('foot'));


	
	
</script>
</head>
<body>
<a href="ian_testfoot_2.jsp">2</a>
<a href="ian_testfoot_3.jsp">3</a>
</body>
</html>