<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Dlog</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
    <!-- Custom Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div class="outer" style="margin: auto; width: fit-content;">
        <div id="main-wrapper" style="float: left;">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <div class="brand-logo" style="background: #7571f9;">
                    <a href="${ pageContext.servletContext.contextPath }">
                        <b class="logo-abbr"><img src="resources/images/DlogLogo-text-short.png" alt="" width="19px"></b>
                        <span class="logo-compact"><img src="resources/images/DlogLogo-text.png" alt="" width="87"></span>
                        <span class="brand-title">
                            <img src="resources/images/DlogLogo-text.png" alt="" width="87px">
                        </span>
                    </a>
                </div>
            </div>
            <!--**********************************
                Nav header end
            ***********************************-->

            <!--**********************************
                Header start
            ***********************************-->
            <div class="header">    
                <div class="header-content clearfix">
                    
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                               <a style="font-size: 14px; margin-right: 10px;"><b>관리자</b>님 환영합니다.</a>
                               <button class="btn btn-primary btn-sm" onclick="location.href='logout.me';">로그아웃</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            <div class="nk-sidebar">           
                <div class="nk-nav-scroll">
                    <ul class="metismenu" id="menu">
            
                        <!-- 메인메뉴 -->
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <span class="nav-text">회원 관리</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="adminMember.me">회원조회</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <span class="nav-text">커뮤니티 관리</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="adminList.co">게시글 관리</a></li>
                            </ul>
                        </li>
                        
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <span class="nav-text">고객센터 관리</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="adminInquiryList.io">문의글 관리</a></li>
                                <li><a href="adminReportList.ro">신고관리</a></li>
                                <li><a href="adminNoticeList.no">공지사항</a></li>
                                <li><a href="adminFaqList.fo">FAQ</a></li>
                            </ul>
                        </li>                        
                        
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->



</body>
</html>