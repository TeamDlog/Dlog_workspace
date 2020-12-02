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
    <link href="resources/css/osageuStyle.css" rel="stylesheet">
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
							        <i class="fas fa-user-friends" id="friend_icon"></i>
							        <span class="badge gradient-7 badge-pill badge-primary">3</span>
							    </a>
							    <div class="drop-down fadeIn dropdown-menu" id="friend_list" style="padding: 0px;">
							        <div id="friend_list_buttons">
							            <div class="friend_list_button">친구 목록</div>  
							            <div class="friend_request_button">친구 요청</div>  
							        </div>
							        <div class="dropdown-content-body" id="friend_list_outer">
							            <div id="friend_list_search_outer">
							                <div class="friend_list_search">
							                    <input type="text" id="friend_ajax_search" placeholder="내 친구를 찾아보세요!">
							                    <span id="friend_ajax_count"></span>
							                </div>
							            </div>
							            <div class="friend_list_height">
							             <ul class="friend_list_ul">
							                 <c:forEach var="f" items="${ friendList }" varStatus="status">
							                  <li class="friend_list">
							                      <div class="friend_list_images">
							                          <img src="resources/images/avatar/1.jpg">
							                      </div>
							                      <div class="friend_list_nickname">
							                          <div class="notification-heading friend_list_nick">${ f.friendNickname }</div>
							                      </div>
							                      <div class="friend_list_delete" align="right">
							                          <button class="friend_delete_DB" onclick="deleteFriend(${f.friendAccepted});" value="${ f.friendAccepted }">삭제</button>
							                      </div>
							                  </li>
							                 </c:forEach>
							             </ul>
							            </div>
							            <div class="bootstrap-pagination" align="center">
							            	<input type="hidden" value="" id="this_page_friend_currentPage">
							            	<c:if test="${ friendList ne null }">
							             	<input type="hidden" value="${ friendList[0].friendOwner }" id="friend_owner">
							            	</c:if>
							                <nav>
							                    <ul class="pagination justify-content-center friend_pagination">
													<li class="page-item pre-page-moving-li">
														<a class="page-link page-moving pre-page-moving hovered">&lt;</a>
													</li>
													
													<c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
														<li class="page-item page-num"><a class="page-link" onclick="pageMove(${p});">${ p }</a></li>
													</c:forEach>
													
													<li class="page-item next-page-moving-li">
														<a class="page-link page-moving next-page-moving hovered">&gt;</a>
													</li>
							                    </ul>
							                </nav>
							            </div>
							        </div>
							        
							        <div class="dropdown-content-body" id="friend_request_outer">
							            <div class="friend_request_search">
							            	<div id="frs_left">
							            		<input type="text" id="find_friend_keyword" placeholder="추가할 친구를 검색해보세요!">
							            	</div>
							            	<div id="frs_right" onclick="findFriend();">
							                	<i class="fa fa-search"></i>
							            	</div>
							            </div>
							            <div class="friend_request_height">
							             <ul class="friend_request_ul">
							             	<c:forEach var="rf" items="${ requestFriend }">
							                  <li class="friend_request will_disapper${ rf.friendNo }">
							                      <div class="friend_request_images">
							                          <img src="resources/images/avatar/2.jpg">
							                      </div>
							                      <div class="friend_request_nickname">
							                          <div class="notification-heading">${ rf.friendNickname }</div>
							                      </div>
							                      <div class="friend_request_yesorno" align="right">
							                          <img src="resources/images/checked.png" onclick="acceptFriend(${rf.friendNo})" width="25" height="25" class="accept_friend_icon">
							                          <img src="resources/images/close.png" onclick="rejectFriend(${rf.friendNo})" width="20" height="20">
							                      </div>
							                  </li>
							                 </c:forEach>
							             </ul>
							            </div>
							            
							        </div>
							    </div>
							</li>
							<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
							        <i class="fas fa-user-friends"></i>
							        <span class="badge gradient-7 badge-pill badge-primary">3</span>
							    </a>
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
                                            <li><a href="page-login.html"><i class="icon-key"></i> <span>로그아웃</span></a></li>
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
                        <li class="menuCalendar">
                            <a href="selectList.ca" aria-expanded="false">
                                <i class="icon-calender menu-icon"></i><span class="nav-text">캘린더</span>
                            </a>
                        </li>
                        <li class="menuDiary">
                            <a href="list.di" aria-expanded="false">
                                <i class="icon-notebook menu-icon"></i><span class="nav-text">다이어리</span>
                            </a>
                        </li>
                        <li class="menuFreenite">
                            <a href="list.fn?mno=1" aria-expanded="false">
                                <i class="icon-note menu-icon"></i><span class="nav-text">프리노트</span>
                            </a>
                        </li>
                        <li class="menuPhoto">
                            <a href="selectList.ph" aria-expanded="false">
                                <i class="icon-picture menu-icon"></i><span class="nav-text">사진게시판</span>
                            </a>
                        </li>
                        <li class="menuAccount">
                            <a href="accountList.ac" aria-expanded="false">
                                <i class="icon-wallet menu-icon"></i><span class="nav-text">가계부</span>
                            </a>
                        </li>
                        <!-- 위젯메뉴 -->
                        <li class="nav-label">위젯메뉴</li>
                        <li class="menuDday">
                            <a href="main.dd" aria-expanded="false">
                                <i class="icon-clock menu-icon"></i><span class="nav-text">디데이</span>
                            </a>
                        </li>
                        <li class="menuVoca">
                            <a href="list.vo" aria-expanded="false">
                                <i class="icon-speech menu-icon"></i><span class="nav-text">단어장</span>
                            </a>
                        </li>
                        <li class="menuMemo">
                            <a href="selectList.mo" aria-expanded="false">
                                <i class="icon-doc menu-icon"></i><span class="nav-text">메모장</span>
                            </a>
                        </li>
                        <li class="meniTimetable">
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
            