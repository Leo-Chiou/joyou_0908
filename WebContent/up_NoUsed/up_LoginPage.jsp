<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>登入頁面</title>
        <link rel="stylesheet" type="text/css" href="邱奕豪加油喔^^" />
        <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
        <script></script>
    </head>

    <body>
        <form action="<c:url value='/up_LoginServlet' />" method="POST">
            <table>
                <caption>
                    登入頁面
                </caption>

                <tr>
                    <td></td>
                    <td>Account :</td>
                    <td>
                        <input type="text" name="userAcc" required />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Password :</td>
                    <td>
                        <input type="password" name="userPwd" required />
                    </td>
                    <td></td>
                </tr>
            </table>
            <input type="submit" value="Submit" />
        </form>
        <p>No Account? <a href="up_RegisterPage.jsp">Register!</a></p>
    </body>
</html>
