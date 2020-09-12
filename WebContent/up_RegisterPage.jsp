<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Register Form</title>
        <style>
            td:nth-child(1) {
                text-align: right;
                color: red;
            }

            td:nth-child(2) {
                text-align: left;
            }
        </style>
       <!--   <link rel="stylesheet" type="text/css" href="邱奕豪好棒" /> -->
       <!-- <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script> -->
        <script>
            var clickCount = 0;
            var verifiedMailAddress = 0;
            var verifiedCode = 0;
            var randInt=Math.floor(Math.random()*9000)+1; 

            function checkMail() {
                let Obj = document.getElementsByName("userMail")[0];
                let VerifyObj = document.getElementById("checkMail");
                let btnObj = document.getElementById("btnSendMail");

                btnObj.setAttribute("disabled", "");
                VerifyObj.innerHTML = "正在檢查信箱是否重複";

                let xhr = new XMLHttpRequest();
                xhr.open("POST", "<c:url value='/CheckDuplicateMailServlet' />", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("mail=" + Obj.value);
                let message = "";
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        let result = JSON.parse(xhr.responseText);

                        if (result.memberMailisDuplicate == "false") {
                            btnObj.removeAttribute("disabled");
                            message = "信箱可用";
                        } else {
                            message = "信箱重複，請重新輸入信箱";
                        }

                        VerifyObj.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
                    }
                };
            }

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

                Obj.setAttribute("disabled", "");
                let xhr = new XMLHttpRequest();
                xhr.open("POST", "<c:url value='/SendVerifiedMailServlet' />", true);
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

            function queryAcc() {
                let Obj = document.getElementsByName("userAcc")[0];
                let VerifyObj = document.getElementById("checkAccount");

                let xhr = new XMLHttpRequest();
                xhr.open("POST", "<c:url value='/CheckDuplicateAccountServlet' />", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("account=" + Obj.value);
                let message = "";
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        let result = JSON.parse(xhr.responseText);

                        if (result.memberAccountisDuplicate == "false") {
                            message = "帳號可用";
                        } else {
                            message = "帳號重複，請重新輸入帳號";
                        }

                        VerifyObj.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
                    }
                };
            }

            function checkAcc() {
                let Obj = document.getElementsByName("userAcc")[0];
                let ObjVal = Obj.value;
                let ObjValLen = ObjVal.length;
                let VerifyObj = document.getElementById("checkAccount");

                if (ObjVal.search(/\s/g) != -1) {
                    VerifyObj.innerHTML = "不能有空白";
                } else if (ObjValLen < 2 || ObjValLen > 15) {
                    VerifyObj.innerHTML = "限制長度為6-15字";
                } else {
                    if (/^[a-zA-z0-9]{2,15}$/.test(ObjVal)) {
                        VerifyObj.innerHTML = "格式正確";
                    } else {
                        VerifyObj.innerHTML = "必須全為字母數字";
                    }
                }

                if (VerifyObj.innerHTML == "格式正確") {
                    VerifyObj.innerHTML += "正在檢查信箱是否重複";
                    queryAcc();
                }
            }

            function checkPwd() {
                let Obj = document.getElementsByName("userPwd")[0];
                let ObjVal = Obj.value;
                let ObjValLen = ObjVal.length;
                let VerifyObj = document.getElementById("checkPassword");

                if (ObjVal.search(/\s/g) != -1) {
                    VerifyObj.innerHTML = "不能有空白";
                } else if (ObjValLen < 2 || ObjValLen > 15) {
                    VerifyObj.innerHTML = "限制長度為6-15字";
                } else {
                    if (/^[a-zA-z0-9]{2,15}$/.test(ObjVal)) {
                        VerifyObj.innerHTML = "格式正確";
                    } else {
                        VerifyObj.innerHTML = "必須全為字母數字";
                    }
                }
                checkPwd2();
            }

            function checkPwd2() {
                let Obj = document.getElementsByName("userPwd")[0];
                let ObjVal = Obj.value;
                let Obj2 = document.getElementsByName("userPwd2")[0];
                let ObjVal2 = Obj2.value;
                let VerifyObj = document.getElementById("checkPassword");
                let VerifyObj2 = document.getElementById("checkPassword2");
                if (ObjVal2.search(/\s/g) != -1) {
                    VerifyObj2.innerHTML = "不能有空白";
                } else if (VerifyObj.innerHTML == "格式正確" && ObjVal == ObjVal2) {
                    VerifyObj2.innerHTML = "密碼相符";
                } else {
                    VerifyObj2.innerHTML = "密碼不符";
                }
            }

            function checkNickName() {
                let Obj = document.getElementsByName("userNickName")[0];
                let ObjVal = Obj.value;
                let ObjValLen = ObjVal.length;
                let VerifyObj = document.getElementById("checkNickName");

                if (ObjVal.search(/\s/g) != -1) {
                    VerifyObj.innerHTML = "不能有空白";
                } else if (ObjValLen < 2 || ObjValLen > 15) {
                    VerifyObj.innerHTML = "限制長度為2-15字";
                } else {
                    if (/^[a-zA-z0-9\u4E00-\u9FFF_.]{2,15}$/.test(ObjVal)) {
                        VerifyObj.innerHTML = "格式正確";
                    } else {
                        VerifyObj.innerHTML = "必須全為字母數字中文_.";
                    }
                }
            }

            function checkTrueName() {
                let Obj = document.getElementsByName("userTrueName")[0];
                let ObjVal = Obj.value;
                let ObjValLen = ObjVal.length;
                let VerifyObj = document.getElementById("checkTrueName");

                if (ObjVal.search(/\s/g) != -1) {
                    VerifyObj.innerHTML = "不能有空白";
                } else if (ObjValLen < 2 || ObjValLen > 15) {
                    VerifyObj.innerHTML = "限制長度為2-15字";
                } else {
                    if (/^[a-zA-z0-9\u4E00-\u9FFF]{2,15}$/.test(ObjVal)) {
                        VerifyObj.innerHTML = "格式正確";
                    } else {
                        VerifyObj.innerHTML = "必須全為字母中文";
                    }
                }
            }

            function checkPhone() {
                let Obj = document.getElementsByName("userPhone")[0];
                let ObjVal = Obj.value;
                let ObjValLen = ObjVal.length;
                let VerifyObj = document.getElementById("checkPhone");

                if (ObjVal.search(/\s/g) != -1) {
                    VerifyObj.innerHTML = "不能有空白";
                } else if (ObjValLen != 10) {
                    VerifyObj.innerHTML = "限制長度為10字";
                } else {
                    if (/^0[0-9]{9}$/.test(ObjVal)) {
                        VerifyObj.innerHTML = "格式正確";
                    } else {
                        VerifyObj.innerHTML = "格式錯誤";
                    }
                }
            }

            function inputData(){
            	
            	document.getElementsByName("userMail")[0].value="acc"+randInt+"@gmail.com";
            	document.getElementsByName("userAcc")[0].value="acc"+randInt;
            	document.getElementsByName("userPwd")[0].value="pwd";
            	document.getElementsByName("userPwd2")[0].value="pwd";
            	document.getElementsByName("userNickName")[0].value="邱"+randInt+"豪";
            	document.getElementsByName("userTrueName")[0].value="邱"+randInt+"豪";
            	document.getElementsByName("userPhone")[0].value="0912345678";
            }
        </script>
    </head>

    <body>
        <form action="<c:url value='/MemberRegister'/>" method="POST">
            <table>
                <caption>
                    註冊頁面 *為必填項目
                </caption>
                <tr>
                    <td>*</td>
                    <td>Email :</td>
                    <td>
                        <input type="text" name="userMail" onChange="checkMail()" required />
                    </td>
                    <td id="checkMail"></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td></td>
                    <td>
                        <input type="button" value="寄出驗證信" id="btnSendMail" onclick="sendMail()" disabled />
                        <input type="text" name="verified" onChange="checkConsistency()"  />
                    </td>
                    <td id="checkMailCode"></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>Account :</td>
                    <td>
                        <input type="text" name="userAcc" onChange="checkAcc()" required />
                    </td>
                    <td id="checkAccount"></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>Password :</td>
                    <td>
                        <input type="password" name="userPwd" style="width: 148px" onChange="checkPwd()" required />
                    </td>
                    <td id="checkPassword"></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>ConfirmPwd :</td>
                    <td>
                        <input type="password" name="userPwd2" style="width: 148px" onChange="checkPwd2()" required />
                    </td>
                    <td id="checkPassword2"></td>
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

                <!-- <tr>
                    <td></td>
                    <td>Birthday :</td>
                    <td><input type="text" name="userBirth" /></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td>Gender :</td>
                    <td style="text-align: left">
                        <input type="radio" name="userGender" value="m" />Male <input type="radio" name="userGender" value="f" />Female
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td>Prefer :</td>
                    <td>
                        <select class="select" name="gameType" style="width: 175px">
                            <option value="PartyGames">PartyGames</option>
                            <option value="StrategyGames">StrategyGames</option>
                            <option value="ThemeticGames">ThemeticGames</option>
                            <option value="WarGames">WarGames</option>
                            <option value="AbstractGames">AbstractGames</option>
                            <option value="CustomizableGames">CustomizableGames</option>
                        </select>
                    </td>
                    <td></td>
                </tr> -->
            </table>
            <input type="button" value="一件輸入" onClick="inputData()" />
            <input type="submit" value="Submit" />
            <p>Already registered? <a href="up_LoginPage.jsp">Sign In!</a></p>
            <a href='<c:url value="up_LoginPage.jsp"/>'><input type="button" value="測試跳轉" /></a>
        </form>
    </body>
</html>
