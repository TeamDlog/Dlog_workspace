<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dlog</title>
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/images/webImage.png" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>

        body{
            background-color: #84c8b9;
            height: 100%;
        }

        .header img{
            width: 170px;
            margin: 50px;
            margin-bottom: 0px;
        }

        .body{
            background-color: white;
            width: 500px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            border-radius: 20px;
        }

        .content{
            padding: 30px;
        }

        .content form #loginB{
            background-color: #84c8b9;
            color: white;
            width: 100%;
        }

        .content form #loginB:hover{
            background-color:#79b6a9;
        }

        .content p{
            margin-top: 5px;
            font-size: 13px;
        }

        .content p a{
            color: #84c8b9;
            font-weight: bold;
            font-size: 14px;
        }

        .content .buttons a{
            margin-top: 30px;
            width: 49%;
        }

        .content .buttons #btn2{
            float: right;
            background-color: #84c8b9; 
            color: white;
        }

        .content .buttons #btn2:hover{
            background-color:#79b6a9;
        }

        .footer{
            padding-top: 60px;
            padding-bottom: 5px;
            color: white;
        }

        /* 움직이는 벌레 */

        #bug1{
            width: 60px;
            transform: rotate(150deg);
        }

        #bug2{
            width: 60px;
            transform: rotate(-10deg);
        }

        #bug1 {
            position: relative;
            animation-name: bug1;
            animation-duration: 60s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }
 
        @keyframes bug1 {
        0%   {left: 100px; top:40px;}
        100%  {left: 700px; top: -15px;}
        }

        #bug2 {
            position: relative;
            animation-name: bug2;
            animation-duration: 80s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }
 
        @keyframes bug2 {
        0%   {left: 900px; top:-90px;}
        100%  {left: 0px; top:10px;}
        }

    </style>
</head>
<body>

	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

	<div class="outer">

        <div class="header" align="center">
            <a href="${ pageContext.servletContext.contextPath }"><img src="resources/images/mainLogo.png"></a>
        </div>

        <img id="bug2" src="resources/images/bug.png">

        <div class="body">

            <div class="content">

                <form action="login.me" method="post">
                    <div class="form-group">
                        <label for="userId">아이디</label>
                        <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력하세요" required>
                      </div>
                      <div class="form-group">
                        <label for="userPwd">비밀번호</label>
                        <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력하세요" required>
                      </div>
                      <button id="loginB" type="submit" class="btn">로그인</button>
                </form>

                <p>계정이 없습니까? <a href="enrollForm.me">회원가입</a>하세요</p>

                <div class="buttons">
                    <a id="btn1" type="button" class="btn btn-secondary" href="searchForm.me">아이디/비밀번호 찾기</a>
                    <a id="btn2" type="button" class="btn" href="enrollForm.me">회원가입</a>
                </div>

            </div>

        </div>

        <img id="bug1" src="resources/images/bug.png">

        <div class="footer" align="center">

            <p>Copyright &copy; Designed & Developed by Dlog 2020</p>
            
        </div>

    </div>

</body>
</html>