<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Dlog</title>
    <!-- Favicon icon -->
    <link rel="icon" type="resources/image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
    <!-- Custom Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- summernote -->
	<link href="resources/plugins/summernote/dist/summernote.css" rel="stylesheet">

	<!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>

	<style>
		/* 메뉴바색상 */
    	.menubarColor, #menubarColor,.menubarColor li{background:${ ca.myColorMenubar };}
    	/* 배경색상 */
    	.backgroundColor{background:${ca.myColorBackground};}
    	.backgroundColor div{background:${ca.myColorBackground};}
    	/* 글자색상 */
    	.backgroundColor div{color:${ ca.myColorFont };}
    	.menubarColor li *{color:${ ca.myColorFont };}
    	/* 로고색상 */
    	#logoColor{background:${ca.myColorLogo};}
	</style>

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
        outer start
    ***********************************-->
    <div class="outer" style="margin: auto; width: 1400px;">
	    <!--**********************************
	        Main wrapper start
	    ***********************************-->
        <div id="main-wrapper" style="float: left;">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <div class="brand-logo" id="logoColor">
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
            <div class="header" id="menubarColor">    
                <div class="header-content clearfix">
                    
                    <div class="nav-control">
                        <div class="hamburger">
                            <span class="toggle-icon"><i class="icon-menu"></i></span>
                        </div>
                    </div>
                    <div class="header-left">
                        <div class="input-group icons">
                            <div class="input-group-prepend">
                                <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                            </div>
                            <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                            <div class="drop-down   d-md-none">
                                <form action="#">
                                    <input type="text" class="form-control" placeholder="Search">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span class="badge gradient-7 badge-pill badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">3 New Messages</span>  
                                        
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/1.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Saiful Islam</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/2.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Adam Smith</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Can you do me a favour?</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/3.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Barak Obama</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/4.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Hilari Clinton</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hello</div>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                        
                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-bell-outline"></i>
                                    <span class="badge badge-pill gradient-2 badge-primary">7</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication" style="max-height: 500px; overflow: auto;">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">7개의 새로운 알림</span>  
                                        
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon" style="background: rgb(245, 195, 204);"><i class="icon-heart"></i></span>
                                                    <div class="notification-content" style="margin-right:0;">
                                                        <table>
                                                            <tr>
                                                                <td width="200">
                                                                    <h6 class="notification-heading">user11님이 게시글 "게시글제목1"에 좋아요를 표시했습니다.</h6>
                                                                    <!-- <span class="notification-text">Within next 5 days</span>  -->
                                                                </td>
                                                                <td>
                                                                    <a class="alertDeleteBtn" style="font-size: 20px; font-weight: bold; margin-left: 10px;"><i class="mdi mdi-check"></i><a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon" style="background: rgb(186, 219, 231);"><i class="icon-bubble"></i></span>
                                                    <div class="notification-content" style="margin-right:0;">
                                                        <table>
                                                            <tr>
                                                                <td width="200">
                                                                    <h6 class="notification-heading">user11님이 게시글 "게시글제목1"에 댓글을 달았습니다.</h6>
                                                                    <!-- <span class="notification-text">One hour ago</span>  -->
                                                                </td>
                                                                <td>
                                                                    <a class="alertDeleteBtn" style="font-size: 20px; font-weight: bold; margin-left: 10px;"><i class="mdi mdi-check"></i><a>
                                                                </td>
                                                            </tr>
                                                        </table>    
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon" style="background: rgb(122, 163, 211);"><i class="icon-note"></i></span>
                                                    <div class="notification-content" style="margin-right:0;">
                                                        <table>
                                                            <tr>
                                                                <td width="200">
                                                                    <h6 class="notification-heading">친구 user11님이 새글을 등록했습니다.</h6>
                                                                    <!-- <span class="notification-text">Within next 5 days</span>  -->
                                                                </td>
                                                                <td>
                                                                    <a class="alertDeleteBtn" style="font-size: 20px; font-weight: bold; margin-left: 10px;"><i class="mdi mdi-check"></i><a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon" style="background: rgb(183, 154, 238);"><i class="icon-user"></i></span>
                                                    <div class="notification-content" style="margin-right:0;">
                                                        <table>
                                                            <tr>
                                                                <td width="200">
                                                                    <h6 class="notification-heading">user02님이 친구 요청하셨습니다.</h6>
                                                                    <!-- <span class="notification-text">One hour ago</span> -->
                                                                </td>
                                                                <td>
                                                                    <a class="alertDeleteBtn" style="font-size: 20px; font-weight: bold; margin-left: 10px;"><i class="mdi mdi-check"></i><a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon" style="background: rgb(193, 224, 156);"><i class="icon-user-following"></i></span>
                                                    <div class="notification-content" style="margin-right:0;">
                                                        <table>
                                                            <tr>
                                                                <td width="200">
                                                                    <h6 class="notification-heading">user02님이 친구 수락하셨습니다.</h6>
                                                                    <!-- <span class="notification-text">Within next 5 days</span>  -->
                                                                </td>
                                                                <td>
                                                                    <a class="alertDeleteBtn" style="font-size: 20px; font-weight: bold;  margin-left: 10px;"><i class="mdi mdi-check"></i><a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon" style="background: rgb(174, 182, 190);"><i class="icon-envelope"></i></span>
                                                    <div class="notification-content" style="margin-right:0;">
                                                        <table>
                                                            <tr>
                                                                <td width="200">
                                                                    <h6 class="notification-heading">1:1문의 답변이 이메일로 전송되었습니다.</h6>
                                                                    <!-- <span class="notification-text">After two days</span>  -->
                                                                </td>
                                                                <td>
                                                                    <a class="alertDeleteBtn" style="font-size: 20px; font-weight: bold;  margin-left: 10px;"><i class="mdi mdi-check"></i><a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon" style="background: rgb(117, 131, 146);"><i class="icon-earphones-alt"></i></span>
                                                    <div class="notification-content" style="margin-right:0;">
                                                        <table>
                                                            <tr>
                                                                <td width="200">
                                                                    <h6 class="notification-heading">신고하신 내역이 처리되었습니다.</h6>
                                                                    <!-- <span class="notification-text">Within next 5 days</span>  -->
                                                                </td>
                                                                <td>
                                                                    <a class="alertDeleteBtn" style="font-size: 20px; font-weight: bold; margin-left: 10px;"><i class="mdi mdi-check"></i><a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                        
                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown">
                                <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                    <img src="resources/images/default-profile-pic.jpg" height="40" width="40" alt="">
                                </div>
                                <div class="drop-down dropdown-profile   dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="app-profile.html"><i class="icon-home"></i> <span>내 다이어리로</span></a>
                                            </li>
                                            <li>
                                                <a href="email-inbox.html"><i class="icon-settings"></i> <span>설정</span></a>
                                            </li>
                                            
                                            <hr class="my-2">
                                            <li>
                                                <a href="page-lock.html"><i class="icon-lock"></i> <span>스크린 잠금</span></a>
                                            </li>
                                            <li><a href="logout.me"><i class="icon-key"></i> <span>로그아웃</span></a></li>
                                        </ul>
                                    </div>
                                </div>
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
            <div class="nk-sidebar menubarColor">           
                <div class="nk-nav-scroll">
                    <ul class="metismenu" id="menu">
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-home menu-icon"></i><span class="nav-text">소개글</span>
                            </a>
                        </li>
                        <!-- 메인메뉴 -->
                        <li class="nav-label">메인메뉴</li>
                        <li>
                            <a href="selectList.ca" aria-expanded="false">
                                <i class="icon-calender menu-icon"></i><span class="nav-text">캘린더</span>
                            </a>
                        </li>
                        <li>
                            <a href="list.di" aria-expanded="false">
                                <i class="icon-notebook menu-icon"></i><span class="nav-text">다이어리</span>
                            </a>
                        </li>
                        <li>
                            <a href="list.fn" aria-expanded="false">
                                <i class="icon-note menu-icon"></i><span class="nav-text">프리노트</span>
                            </a>
                        </li>
                        <li>
                            <a href="selectList.ph" aria-expanded="false">
                                <i class="icon-picture menu-icon"></i><span class="nav-text">사진게시판</span>
                            </a>
                        </li>
                        <li>
                            <a href="accountList.ac" aria-expanded="false">
                                <i class="icon-wallet menu-icon"></i><span class="nav-text">가계부</span>
                            </a>
                        </li>
                        <!-- 위젯메뉴 -->
                        <li class="nav-label">위젯메뉴</li>
                        <li>
                            <a href="main.dd" aria-expanded="false">
                                <i class="icon-clock menu-icon"></i><span class="nav-text">디데이</span>
                            </a>
                        </li>
                        <li>
                            <a href="list.vo" aria-expanded="false">
                                <i class="icon-speech menu-icon"></i><span class="nav-text">단어장</span>
                            </a>
                        </li>
                        <li>
                            <a href="selectList.mo" aria-expanded="false">
                                <i class="icon-doc menu-icon"></i><span class="nav-text">메모장</span>
                            </a>
                        </li>
                        <li>
                            <a href="main.ti" aria-expanded="false">
                                <i class="icon-grid menu-icon"></i><span class="nav-text">시간표<span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->

</body>
</html>
            