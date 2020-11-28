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
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
    <!-- Custom Stylesheet -->
    <link href="resources/css/osageuStyle.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .toggleBG{
            background: #CCCCCC; 
            width: 60px; 
            height: 20px; 
            border: 1px solid #CCCCCC; 
            border-radius: 30px;
            float: right;
            }
        .toggleFG{
            background: #FFFFFF; 
            width: 15px;
             height: 15px; 
             border: none; 
             border-radius: 15px; 
             position: relative; 
             left: 0px;}
        #myColor input[type=color]{
            border: none;
            width: 100px;
            height: 30px;
        }       
    
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
        Main wrapper start
    ***********************************-->
    <div class="outer" style="margin: auto; width: 1390px;">
        <div id="main-wrapper" style="float: left;">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <div class="brand-logo">
                    <a href="#">
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
                                    <span class="badge badge-pill gradient-2 badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">2 New Notifications</span>  
                                        
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events near you</h6>
                                                        <span class="notification-text">Within next 5 days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Started</h6>
                                                        <span class="notification-text">One hour ago</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Ended Successfully</h6>
                                                        <span class="notification-text">One hour ago</span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events to Join</h6>
                                                        <span class="notification-text">After two days</span> 
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
            <div class="nk-sidebar">           
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
                            <a href="url" aria-expanded="false">
                                <i class="icon-calender menu-icon"></i><span class="nav-text">캘린더</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-notebook menu-icon"></i><span class="nav-text">다이어리</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-note menu-icon"></i><span class="nav-text">프리노트</span>
                            </a>
                        </li>
                        <li>
                            <a href="selectList.ph" aria-expanded="false">
                                <i class="icon-picture menu-icon"></i><span class="nav-text">사진게시판</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-wallet menu-icon"></i><span class="nav-text">가계부</span>
                            </a>
                        </li>
                        <!-- 위젯메뉴 -->
                        <li class="nav-label">위젯메뉴</li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-clock menu-icon"></i><span class="nav-text">디데이</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-speech menu-icon"></i><span class="nav-text">단어장</span>
                            </a>
                        </li>
                        <li>
                            <a href="selectList.mo" aria-expanded="false" style="background:#F3F3F9">
                                <i class="icon-doc menu-icon"></i><span class="nav-text">메모장</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-grid menu-icon"></i><span class="nav-text">시간표<span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->

           <!--**********************************
                Content body start
            ***********************************-->
            <div id="mainContents" class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; "><b>통합 관리</b></h3>
                </div>
                <!-- row -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:290px; float: left; margin-right: 15px; height: 400px;">
                                <div class="card-body" >
                                
                                <!-- 여기다가 작성 -->
                                <div style="float:right"><h4>위젯 관리</h4></div>
                                <select name="privacy" id="privacy" style="height: 30px; margin-bottom: 30px;">
                                    <option value="1">다이어리 표시</option>
                                    <option value="2">친구 공개</option>
                                </select>
                                <h4>
                                    <i class="icon-clock menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;디데이 </span>
                                    <div class='toggleBG widgetController ddayCheck'>
                                        <button class='toggleFG widgetController ddayCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-speech menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;단어장</span>
                                    <div class='toggleBG widgetController vocaCheck'>
                                        <button id="" class='toggleFG widgetController vocaCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-doc menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;메모장</span>
                                    <div class='toggleBG widgetController memoCheck'>
                                        <button id="" class='toggleFG widgetController memoCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-grid menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;시간표</span>
                                    <div class='toggleBG widgetController timetableCheck'>
                                        <button id="" class='toggleFG widgetController timetableCheck'></button>
                                    </div>
                                </h4>

                                </div>
                            </div>

                            <div class="card" style="width:290px; float: left;  margin-right: 15px; height: 400px;">
                                <div class="card-body" >
                               	<div style="float:right"><h4>메뉴 관리</h4></div>
                                <!-- 여기다가 작성 -->
                                <br><br><br>
                                <h4>
                                    <i class="icon-calender menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;캘린더</span>
                                    <div class='toggleBG calenderCheck'>
                                        <button class='toggleFG calenderCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-notebook menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;다이어리</span>
                                    <div class='toggleBG diaryCheck'>
                                        <button class='toggleFG diaryCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-note menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;프리노트</span>
                                    <div class='toggleBG freenoteCheck'>
                                        <button class='toggleFG freenoteCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-picture menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;사진게시판</span>
                                    <div class='toggleBG photoCheck'>
                                        <button class='toggleFG photoCheck'></button>
                                    </div>
                                </h4>

                                </div>
                            </div>

                            <div class="card" style="width:290px; float: left; height: 400px;">
                                <div class="card-body" >
                                <!-- 여기다가 작성 -->
                                <div style="float:right"><h4>테마 관리</h4></div>
                                <br><br><br>
                                    <table id="myColor">
                                        <tr>
                                            <th>
                                                <h4>로고 색상 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="color" name="logoColor" id="logoColor"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <h4>배경 색상 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="color" name="backgroundColor" id="backgroundColor"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <h4>메뉴바 색상 :&nbsp;&nbsp;&nbsp;&nbsp; <input type="color" name="menubarColor" id="menubarColor"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <h4>글자 색상 :&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="color" name="fontColor" id="fontColor"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                    </table>
                                    <div style="float: right;">
                                        <button onclick="changeMyColor();" type="button" class="btn btn-success" >테마적용</button>
                                        <button type="button" class="btn btn-danger" >초기화</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>
            <!--**********************************
                Content body end
            ***********************************-->     
            
        </div>
        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Widget area start
        ***********************************-->
        <div class="widget-area" style="float:left; margin-top: 100px;">

            <div class="card">
	            <div class="memo_widget">
	                <div class="memo_widget_title">메모장</div>
	                <textarea class="memo_widget_content" rows="5" cols="15" readOnly>${ memoWidget.memoContent }</textarea>
	            </div>
            </div>
            
            <!-- 시간표 위젯 -->
            
            <div class="card card-widget">
                <div class="card-body gradient-3">
                    <div class="media">
                        <table id="timetableWidget"  style="width: 100%; text-align: center;">
                            <tr style="height: 30px;">
                                <th>
                                    과목명
                                </th>
                            </tr>
                            <tr>
                                <td style="height: 20px;">
                                    과목 시간 ~ 과목시간
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 20px;">
                                    과목 시간 ~ 과목시간
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <!-- 디데이 -->
            <div class="card card-widget">
                <div class="card-body gradient-4">
                    <div class="media">
                        <table id="ddayWidget"  style="width: 100%; text-align: center;">
                            <tr style="height: 30px;">
                                <th>
                                    남은날짜
                                </th>
                            </tr>
                            <tr>
                                <td style="height: 20px;">
                                    디데이 제목
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <script>
            	$(function(){
            		$(".memo_widget").hover(function(){
            			$(this).children().eq(1).attr("style","overflow:auto;");
            		},function(){
            			$(this).children().eq(1).attr("style","overflow:hidden;");
            		})
            	})
            </script>
            
        </div>
    </div>
    <!--**********************************
        Widget area end
    ***********************************-->
    <br clear="both">
    <!--**********************************
    Footer start
    ***********************************-->
    <div align="center">
        <div class="">
            <p>Copyright &copy; Designed & Developed by <a href="">Dlog</a> 2020</p>
        </div>
    </div>
    <!--**********************************
        Footer end
    ***********************************-->  

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    <script>
        $(document).on('click', '.toggleBG', function () {
            var toggleBG = $(this);
            var toggleFG = $(this).find('.toggleFG');
            var left = toggleFG.css('left');
            if(left == '40px') { // 선택안함
                toggleBG.css('background', '#CCCCCC');
                toggleActionStart(toggleFG, 'TO_LEFT');
                
                if($(this).hasClass("widgetController")){
                	if($("#privacy").val() == 1){
                   		
       					var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "active_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "active_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "active_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "active_timetable";
       					}
       					
    					$.ajax({
                    		url:"activeWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"N", "memberNo":"3"},
                    		success:function(widget){
                    			
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
    					
                    }else if($("#privacy").val() == 2){
                    	
                    	var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "privacy_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "privacy_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "privacy_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "privacy_timetable";
       					}
       					
                    	$.ajax({
                    		url:"privacyWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"N", "memberNo":"3"},
                    		success:function(widget){
                    			
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
                    	
                    }
                }else{
                	var widget = "";
   					if($(this).hasClass("calenderCheck")){
   						widget = "privacy_calendar";
   					}else if($(this).hasClass("diaryCheck")){
   						widget = "privacy_diary";
   					}else if($(this).hasClass("freenoteCheck")){
   						widget = "privacy_freenote";
   					}else if($(this).hasClass("photoCheck")){
   						widget = "privacy_photo";
   					}
               		
               		$.ajax({
                		url:"privacyWidget.ca",
                		type:"post",
                		data:{"widget":widget,"status":"N", "memberNo":"3"},
                		success:function(widget){
                				
                		},error:function(){
                			console.log("다이어리 공개 ajax실패");
                		}
                	});
                }
                

            }else if(left == '0px') { // 선택함
                toggleBG.css('background', '#53FF4C');
                toggleActionStart(toggleFG, 'TO_RIGHT');
                
                if($(this).hasClass("widgetController")){
                	
                	if($("#privacy").val() == 1){
       					
                   		var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "active_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "active_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "active_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "active_timetable";
       					}
                   		
                   		$.ajax({
                    		url:"activeWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"Y", "memberNo":"3"},
                    		success:function(widget){
                    				
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
    				
                    }else if($("#privacy").val() == 2){
                    	
                    	var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "privacy_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "privacy_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "privacy_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "privacy_timetable";
       					}
                    	
                    	$.ajax({
                    		url:"privacyWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"Y", "memberNo":"3"},
                    		success:function(ca){
                    			console.log(ca);
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
                    	
                    }
                	
                }else{
                	var widget = "";
   					if($(this).hasClass("calenderCheck")){
   						widget = "privacy_calendar";
   					}else if($(this).hasClass("diaryCheck")){
   						widget = "privacy_diary";
   					}else if($(this).hasClass("freenoteCheck")){
   						widget = "privacy_freenote";
   					}else if($(this).hasClass("photoCheck")){
   						widget = "privacy_photo";
   					}
               		
               		$.ajax({
                		url:"privacyWidget.ca",
                		type:"post",
                		data:{"widget":widget,"status":"Y", "memberNo":"3"},
                		success:function(widget){
                				
                		},error:function(){
                			console.log("다이어리 공개 ajax실패");
                		}
                	});
                }
               	
                
            }
        });
     
        // 토글 버튼 이동 모션 함수
        function toggleActionStart(toggleBtn, LR) {
            // 0.01초 단위로 실행
            var intervalID = setInterval(
                function() {
                    // 버튼 이동
                    var left = parseInt(toggleBtn.css('left'));
                    left += (LR == 'TO_RIGHT') ? 5 : -5;
                    if(left >= 0 && left <= 40) {
                        left += 'px';
                        toggleBtn.css('left', left);
                    }
                }, 10);
            setTimeout(function(){
                clearInterval(intervalID);
            }, 201);
        }
    </script>
    
    <script>
    	$(function(){
    		
    		$("#logoColor").val("${ca.myColorLogo}");
    		$("#backgroundColor").val("${ca.myColorBackground}");
    		$("#menubarColor").val("${ca.myColorMenubar}");
    		$("fontColor").val("${ca.myColorFont}")
    		
    		/* 메뉴관리 */
    		if('${ca.privacyCalendar}' == 'Y'){

	            $("div.calenderCheck").css('background', '#53FF4C');
				$("button.calenderCheck").css("left","40px");    
				
			}else if('${ca.privacyCalendar}' == 'N'){
				
				$("div.calenderCheck").css('background', '#CCCCCC');
				$("button.calenderCheck").css("left","0px");      				
				
			}
		
		    if('${ca.privacyDiary}' == 'Y'){

	            $("div.diaryCheck").css('background', '#53FF4C');
				$("button.diaryCheck").css("left","40px");    
				
			}else if('${ca.privacyDiary}' == 'N'){
				
				$("div.privacyCheck").css('background', '#CCCCCC');
				$("button.privacyCheck").css("left","0px");  
				
			}
		    
			if('${ca.privacyFreenote}' == 'Y'){

	            $("div.freenoteCheck").css('background', '#53FF4C');
				$("button.freenoteCheck").css("left","40px");    
				
			}else if('${ca.privacyFreenote}' == 'N'){
				
				$("div.freenoteCheck").css('background', '#CCCCCC');
				$("button.freenoteCheck").css("left","0px");  
				
			}
			if('${ca.privacyPhoto}' == 'Y'){

	            $("div.photoCheck").css('background', '#53FF4C');
				$("button.photoCheck").css("left","40px");    
				
			}else if('${ca.privacyPhoto}' == 'N'){
				
				$("div.photoCheck").css('background', '#CCCCCC');
				$("button.photoCheck").css("left","0px");  
				
			}
			/* 메뉴관리 */
			
			/* 위젯관리 */
			if($("#privacy").val() == 1){ // 다이어리 공개
    			
    			if('${ca.activeDday}' == 'Y'){

   	            	$("div.ddayCheck").css('background', '#53FF4C');
					$("button.ddayCheck").css("left","40px");    
					
    			}else if('${ca.activeDday}' == 'N'){
    				
    				$("div.ddayCheck").css('background', '#CCCCCC');
					$("button.ddayCheck").css("left","0px");      				
    				
    			}
    		
    		    if('${ca.activeVoca}' == 'Y'){

   	            	$("div.vocaCheck").css('background', '#53FF4C');
					$("button.vocaCheck").css("left","40px");    
					
    			}else if('${ca.activeVoca}' == 'N'){
    				
    				$("div.vocaCheck").css('background', '#CCCCCC');
					$("button.vocaCheck").css("left","0px");  
    				
    			}
    		    
    			if('${ca.activeMemo}' == 'Y'){

   	            	$("div.memoCheck").css('background', '#53FF4C');
					$("button.memoCheck").css("left","40px");    
					
    			}else if('${ca.activeMemo}' == 'N'){
    				
    				$("div.memoCheck").css('background', '#CCCCCC');
					$("button.memoCheck").css("left","0px");  
    				
    			}
    			if('${ca.activeTimetable}' == 'Y'){

   	            	$("div.timetableCheck").css('background', '#53FF4C');
					$("button.timetableCheck").css("left","40px");    
					
    			}else if('${ca.activeTimetable}' == 'N'){
    				
    				$("div.timetableCheck").css('background', '#CCCCCC');
					$("button.timetableCheck").css("left","0px");  
    				
    			}
    		}else if($("#privacy").val() == 2){ // 친구 공개
    			
    			if('${ca.privacyDday}' == 'Y'){

   	            	$("div.ddayCheck").css('background', '#53FF4C');
					$("button.ddayCheck").css("left","40px");    
					
    			}else if('${ca.privacyDday}' == 'N'){
    				
    				$("div.ddayCheck").css('background', '#CCCCCC');
					$("button.ddayCheck").css("left","0px");      				
    				
    			}
    		
    		    if('${ca.privacyVoca}' == 'Y'){

   	            	$("div.vocaCheck").css('background', '#53FF4C');
					$("button.vocaCheck").css("left","40px");    
					
    			}else if('${ca.privacyVoca}' == 'N'){
    				
    				$("div.vocaCheck").css('background', '#CCCCCC');
					$("button.vocaCheck").css("left","0px");  
    				
    			}
    		    
    			if('${ca.privacyMemo}' == 'Y'){

   	            	$("div.memoCheck").css('background', '#53FF4C');
					$("button.memoCheck").css("left","40px");    
					
    			}else if('${ca.privacyMemo}' == 'N'){
    				
    				$("div.memoCheck").css('background', '#CCCCCC');
					$("button.memoCheck").css("left","0px");  
    				
    			}
    			if('${ca.privacyTimetable}' == 'Y'){

   	            	$("div.timetableCheck").css('background', '#53FF4C');
					$("button.timetableCheck").css("left","40px");    
					
    			}else if('${ca.privacyTimetable}' == 'N'){
    				
    				$("div.timetableCheck").css('background', '#CCCCCC');
					$("button.timetableCheck").css("left","0px");  
    				
    			}
    		}
			/* 위젯관리 */
    		
			/* 위젯관리 */
			$("#privacy").change(function(){
				
				$.ajax({
					url:"widgetChecked.ca",
            		type:"post",
            		data:{"memberNo":"3"},
            		success:function(ca){
            			if($("#privacy").val() == 1){ // 다이어리 공개
            				
                			if(ca.activeDday == 'Y'){

               	            	$("div.ddayCheck").css('background', '#53FF4C');
            					$("button.ddayCheck").css("left","40px");    
            					
                			}else if(ca.activeDday == 'N'){
                				
                				$("div.ddayCheck").css('background', '#CCCCCC');
            					$("button.ddayCheck").css("left","0px");      				
                				
                			}
                		
                		    if(ca.activeVoca == 'Y'){

               	            	$("div.vocaCheck").css('background', '#53FF4C');
            					$("button.vocaCheck").css("left","40px");    
            					
                			}else if(ca.activeVoca == 'N'){
                				
                				$("div.vocaCheck").css('background', '#CCCCCC');
            					$("button.vocaCheck").css("left","0px");  
                				
                			}
                		    
                			if(ca.activeMemo == 'Y'){

               	            	$("div.memoCheck").css('background', '#53FF4C');
            					$("button.memoCheck").css("left","40px");    
            					
                			}else if(ca.activeMemo == 'N'){
                				
                				$("div.memoCheck").css('background', '#CCCCCC');
            					$("button.memoCheck").css("left","0px");  
                				
                			}
                			if(ca.activeTimetable == 'Y'){

               	            	$("div.timetableCheck").css('background', '#53FF4C');
            					$("button.timetableCheck").css("left","40px");    
            					
                			}else if(ca.activeTimetable == 'N'){
                				
                				$("div.timetableCheck").css('background', '#CCCCCC');
            					$("button.timetableCheck").css("left","0px");  
                				
                			}
                		}else if($("#privacy").val() == 2){ // 친구 공개
                			
                			if(ca.privacyDday == 'Y'){

               	            	$("div.ddayCheck").css('background', '#53FF4C');
            					$("button.ddayCheck").css("left","40px");    
            					
                			}else if(ca.privacyDday == 'N'){
                				
                				$("div.ddayCheck").css('background', '#CCCCCC');
            					$("button.ddayCheck").css("left","0px");      				
                				
                			}
                		
                		    if(ca.privacyVoca == 'Y'){

               	            	$("div.vocaCheck").css('background', '#53FF4C');
            					$("button.vocaCheck").css("left","40px");    
            					
                			}else if(ca.privacyVoca == 'N'){
                				
                				$("div.vocaCheck").css('background', '#CCCCCC');
            					$("button.vocaCheck").css("left","0px");  
                				
                			}
                		    
                			if(ca.privacyMemo == 'Y'){

               	            	$("div.memoCheck").css('background', '#53FF4C');
            					$("button.memoCheck").css("left","40px");    
            					
                			}else if(ca.privacyMemo == 'N'){
                				
                				$("div.memoCheck").css('background', '#CCCCCC');
            					$("button.memoCheck").css("left","0px");  
                				
                			}
                			if(ca.privacyTimetable == 'Y'){

               	            	$("div.timetableCheck").css('background', '#53FF4C');
            					$("button.timetableCheck").css("left","40px");    
            					
                			}else if(ca.privacyTimetable == 'N'){
                				
                				$("div.timetableCheck").css('background', '#CCCCCC');
            					$("button.timetableCheck").css("left","0px");  
                				
                			}
                		}
            		},error:function(ca){
            			console.log("change 공개 ajax실패");
            		}
				});
				
    		});
			/* 위젯관리 */
				
    	});
    </script>
    
</body>

</html>