<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>會員資料頁面</title>
        <style>
            td:nth-child(1) {
                text-align: right;
                color: red;
            }

            td:nth-child(2) {
                text-align: left;
            }
        </style>
        <!-- <link rel="stylesheet" type="text/css" href="邱奕豪棒棒" /> -->
        <!-- <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script> -->
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
            }

            function UndoProfile() {
                document.getElementById("btnEdit").style.display = "";
                document.getElementById("btnUndo").style.display = "none";
                document.getElementById("submit").style.display = "none";

                document.getElementsByName("userNickName")[0].value= userNickName;
                document.getElementsByName("userTrueName")[0].value= userTrueName;
                document.getElementsByName("userPhone")[0].value= userPhone;
        

                document.getElementsByName("userNickName")[0].setAttribute("disabled", "");
                document.getElementsByName("userTrueName")[0].setAttribute("disabled", "");
                document.getElementsByName("userPhone")[0].setAttribute("disabled", "");
            }
        </script>
    </head>

    <body>
        <form action="<c:url value='/up_EditProfileServlet'/>" method="POST">
            <table>
                <caption>
                    會員資料頁面
                </caption>
                <tr>
                    <td colspan="4" style="text-align: center"><input type="button" value="修改會員資料" id="btnEdit" onclick="EditProfile()" /></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <input type="button" value="取消修改" id="btnUndo" onclick="UndoProfile()" style="display: none" />
                    </td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>Email :</td>
                    <td>
                        <input type="text" name="userMail" onChange="checkMail()" required disabled />
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td>*</td>
                    <td>Account :</td>
                    <td>
                        <input type="text" name="userAcc" onChange="checkAcc()" required disabled />
                    </td>
                    <td id="checkAccount"></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>Password :</td>
                    <td>
                        <input type="button" id="btnEditPwd" value="修改密碼" />
                    </td>
                    <td id="checkPassword"></td>
                </tr>

                <tr>
                    <td>*</td>
                    <td>NickName :</td>
                    <td>
                        <input type="text" name="userNickName" onChange="checkNickName()" />
                    </td>
                    <td id="checkNickName"></td>
                </tr>

                <tr>
                    <td>*</td>
                    <td>TrueName :</td>
                    <td><input type="text" name="userTrueName" onChange="checkTrueName()" /></td>
                    <td id="checkTrueName"></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>CellPhone :</td>
                    <td><input type="text" name="userPhone" onChange="checkPhone()" /></td>
                    <td id="checkPhone"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><input type="submit" id="submit" value="確定修改會員資料" style="display: none" /></td>
                </tr>
            </table>
        </form>
        <script>

            <%

            String userAccountStr =(String) session.getAttribute("memberAccount");
            String userMailStr =(String) session.getAttribute("memberMail");
            String userNickNameStr =(String) session.getAttribute("memberNickName");
            String userTrueNameStr =(String) session.getAttribute("memberTrueName");
            String userPhoneStr =(String) session.getAttribute("memberPhone");

            %>
            var userAccount="<%=userAccountStr%>";
            var userMail="<%=userMailStr%>";
            var userNickName="<%=userNickNameStr%>";
            var userTrueName="<%=userTrueNameStr%>";
            var userPhone="<%=userPhoneStr%>";


            document.getElementsByName("userAcc")[0].value= userAccount ;
            document.getElementsByName("userMail")[0].value= userMail ;
            document.getElementsByName("userNickName")[0].value= userNickName ;
            document.getElementsByName("userTrueName")[0].value= userTrueName ;
            document.getElementsByName("userPhone")[0].value= userPhone ;

             
            

            document.getElementsByName("userNickName")[0].setAttribute("disabled", "");
            document.getElementsByName("userTrueName")[0].setAttribute("disabled", "");
            document.getElementsByName("userPhone")[0].setAttribute("disabled", "");


        </script>
    </body>
</html>
