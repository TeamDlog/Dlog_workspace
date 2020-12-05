<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dlog</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/images/webImage.png" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resources/css/mainStyles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Toastr -->
    <link href="resources/plugins/toastr/css/toastr.min.css" rel="stylesheet">
    
    <style>
    	/* toast css */
		.toast-success{ background:rgb(136, 136, 136);}
    </style>
</head>
<body id="page-top">
	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="${ pageContext.servletContext.contextPath }">
                <img src="resources/images/mainLogo.png" class="logoImage" height="100px">
            </a>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                	<!-- 로그인 전 / 후 -->
                	<c:choose>
                    	<c:when test="${ empty loginUser }">
		                    <li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="loginForm.me">로그인</a></li>
	    	                <li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="list.co">커뮤니티</a></li>
	        	            <li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="serviceMain.fo">고객센터</a></li>
        	            </c:when>
        	            <c:otherwise>
		                    <li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="logout.me">로그아웃</a></li>
                    		<c:choose>
                    			<c:when test="${ loginUser.memberNo eq 1 }">
                    				<li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="adminMember.me">관리</a></li>
                    			</c:when>
                    			<c:otherwise>
		                    		<li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="goToMyDiary.fr">다이어리</a></li>
                    			</c:otherwise>
                    		</c:choose>
	    	                <li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="list.co">커뮤니티</a></li>
	        	            <li class="nav-item mx-0 mx-lg-1 nav-lcs"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="serviceMain.fo">고객센터</a></li>
        	            </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
    
	<input type="hidden" class="btn btn-success m-b-10 m-l-5 socketAlert" id="toastr-success-bottom-right">

</body>
</html>