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
    <!-- Toastr -->
    <link href="resources/plugins/toastr/css/toastr.min.css" rel="stylesheet">

	<style>
		/* toast css */
		.toast-success{ background:rgb(136, 136, 136);}
	
		/* 메뉴바색상 */
    	.menubarColor, #menubarColor,.menubarColor li{background:${ ca.myColorMenubar };}
    	/* 배경색상 */
    	.backgroundColor{background:${ca.myColorBackground};}
    	.backgroundColor div{background:${ca.myColorBackground};}
    	/* 글자색상 */
    	.backgroundColor div{color:${ ca.myColorFont };}
    	.menubarColor li *{color:${ ca.myColorFont };}
    	.menubarColor span *{color:${ ca.myColorFont };}
    	/* 로고색상 */
    	#logoColor{background:${ca.myColorLogo};}
    	
    	.container-fluid .card-body{border-radius:10px;}
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
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
							        <i class="fas fa-user-friends" id="friend_icon" style="color:grey"></i>
							        <span class="badge gradient-7 badge-pill badge-primary"></span>
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
							            	<form id="goToFriend" action="visitFriend.fr" method="post" onSubmit="return false;">
							            		<input type="hidden" name="diaryMemberNo" id="diaryMemberNo" value="">
									            <ul class="friend_list_ul">
									                 <c:forEach var="f" items="${ friendList }" varStatus="status">
										                 <li class="friend_list list_will_disapper${ f.friendNo }">
										                      <div class="friend_list_images">
										                          <img src="${ f.friendProfile }" class="cursor_to_pointer" onclick="visitFriend(${f.friendOwner},${f.friendAccepted });">
										                      </div>
										                      <div class="friend_list_nickname">
										                          <div class="notification-heading friend_list_nick cursor_to_pointer" onclick="visitFriend(${f.friendOwner},${f.friendAccepted });">${ f.friendNickname }</div>
										                      </div>
										                      <div class="friend_list_delete">
										                          <button class="friend_delete_DB osageu_ml-23" style="outline:0;" onclick="deleteFriend(${f.friendNo});">삭제</button>
										                      </div>
										                 </li>
									                 </c:forEach>
									            </ul>
								            </form>
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
                                    <i class="mdi mdi-bell-outline" style="color:grey"></i>
                                    <span class="badge badge-pill gradient-2 badge-primary" id="notificationCount"></span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication" id="notification_list"  style="max-height: 500px; overflow: auto;">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span><font id="notificationCount2">0</font>개의 새로운 알림</span>  
                                        
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul id="notificationArea"></ul>
                                    </div>
                                </div>
                            </li>
                            <input type="hidden" class="btn btn-success m-b-10 m-l-5" id="toastr-success-top-right">
                            <script>
	                         	// dropdown inside 클릭 시 안 사라지게
	                			$("#notification_list").click(function(){
	                				event.stopPropagation();
	                			});
	                			
                            	$(function(){
                            		loadNotification(${loginUser.memberNo});
                            		setInterval(loadNotification, 2000, ${loginUser.memberNo});
                            	});
                            	
                            	function loadNotification(loginUserNo){
                            		$.ajax({
                            			url:"list.nf",
                            			data:{loginUserNo:loginUserNo},
                            			success:function(result){
	                            			
                            				if(result.list.length > 0){
	                            				$("#notificationCount").text(result.list.length);
	                            				$("#notificationCount2").text(result.list.length);
                            					
	                            				var list = "";
	                            				for(var i in result.list){
	                            					list += "<li>" +
				                                                "<a href='javascript:void()'>";
				                                    switch(result.list[i].notificationCategory){
				                                    	case 1:list += "<span class='mr-3 avatar-icon' style='background: rgb(245, 195, 204);'><i class='icon-heart'></i></span>"; break;
				                                    	case 2:list += "<span class='mr-3 avatar-icon' style='background: rgb(186, 219, 231);'><i class='icon-bubble'></i></span>"; break;
				                                    	case 3:list += "<span class='mr-3 avatar-icon' style='background: rgb(183, 154, 238);'><i class='icon-user'></i></span>"; break;
				                                    	case 4:list += "<span class='mr-3 avatar-icon' style='background: rgb(193, 224, 156);'><i class='icon-user-following'></i></span>"; break;
				                                    	case 5:list += "<span class='mr-3 avatar-icon' style='background: rgb(122, 163, 211);'><i class='icon-note'></i></span>"; break;
				                                    	case 6:list += "<span class='mr-3 avatar-icon' style='background: rgb(174, 182, 190);'><i class='icon-envelope'></i></span>"; break;
				                                    	case 7:list += "<span class='mr-3 avatar-icon' style='background: rgb(117, 131, 146);'><i class='icon-earphones-alt'></i></span>"; break;
				                                    }
				                                    list +=         "<div class='notification-content' style='margin-right:0;'>" +
				                                                        "<table style='min-height:40px;'>" +
				                                                            "<tr>" +
				                                                                "<td width='200'>" +
				                                                                    "<h6 class='notification-heading'>" + result.list[i].notificationContent + "</h6>" +
				                                                                "</td>" +
				                                                                "<td>" +
				                                                                   "<a class='alertDeleteBtn' onclick='deleteNotification(" + result.list[i].notificationNo + ");' style='font-size: 20px; font-weight: bold; margin-left: 10px;'><i class='mdi mdi-close'></i><a>" +
				                                                                "</td>" +
				                                                            "</tr>" +
				                                                        "</table>" +
				                                                    "</div>" +
				                                                "</a>" +
				                                            "</li>";
	                            				}
	                            				$("#notificationArea").html(list);
                            				}else{
                            					$("#notificationArea").html("새로운 알림 내역이 없습니다.");
                            				}
                            			}, error:function(){
                            				console.log("알림창 ajax 통신 실패");
                            			}
                            		});
                            	}
                            	
                            	function deleteNotification(notificationNo){
                            		$.ajax({
                            			url:"delete.nf",
                            			data:{notificationNo:notificationNo},
                            			success:function(result){
                            				if(result > 0){
	                            				loadNotification(${loginUser.memberNo});
	                            				
	                            				var notificationCount = parseInt($("#notificationCount").text()) - 1;
	                            				if(notificationCount > 0){
	                            					$("#notificationCount").text(notificationCount);
		                            				$("#notificationCount2").text(notificationCount);
	                            				}else{
	                            					$("#notificationCount").text("");
		                            				$("#notificationCount2").text("0");
	                            				}
                            				}
                            			}, error:function(){
                            				console.log("알림삭제 ajax 통신 실패");
                            			}
                            		});
                            	}
                            </script>
                            <li class="icons dropdown">
                                <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                    <c:choose>
	                                    <c:when test="${ loginUser.profile ne null }">
	                                    	<img src="${ loginUser.profile }" height="40" width="40" alt="">
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<img src="resources/images/default-profile-pic.jpg" height="40" width="40" alt="">
	                                    </c:otherwise>
	                            	</c:choose>
                                </div>
                                <div class="drop-down dropdown-profile   dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="goToMyDiary.fr"><i class="icon-home"></i> <span>내 다이어리로</span></a>
                                            </li>
                                            <li>
                                                <a href="infoList.my"><i class="icon-settings"></i> <span>설정</span></a>
                                            </li>
                                            
                                            <hr class="my-2">
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
                            <a href="introList.my" aria-expanded="false">
                                <i class="icon-home menu-icon"></i><span class="nav-text">소개글</span>
                            </a>
                        </li>
                        <!-- 메인메뉴 -->
                        <li class="nav-label"><span>메인메뉴</span></li>
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
                        <li class="menuFreenote">
                            <a href="list.fn" aria-expanded="false">
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
                        <li class="nav-label"><span>위젯메뉴</span></li>
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
                        <li class="menuTimetable">
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
            