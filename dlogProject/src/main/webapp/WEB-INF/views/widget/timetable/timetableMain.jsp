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
        #timetableTable tbody tr{height: 50px;}
      	#timetableTable{table-layout:fixed;word-break:break-all;}
      	#timetableTable .timetableHover:hover{cursor:pointer; opacity:0.5;}
      	#timetableTable tbody td{ position: relative;}
      	.deleteCheckBox{position:absolute; left:0px; top:0px; display:none;}
    </style>
</head>

<body>
	<c:if test="${ !empty alertMsg }">
       	<script>
       		alert("${ alertMsg }");
       	</script>
       	<c:remove var="alertMsg" scope="session"/>
    </c:if>
    <form action="deleteAndInsert.ti" method="post">
    	<input type="hidden" name="timetableWriter" value="${ t.timetableWriter }">
         <input type="hidden" name="timetableDay" value="${ t.timetableDay }" >
         <input type="hidden" name="timetableStart" value="${ t.timetableStart }">
         <input type="hidden" name="timetableEnd" value="${ t.timetableEnd }">
         <input type="hidden" name="timetableTime" value="${ t.timetableTime }">
         <input type="hidden" name="timetableTitle" value="${ t.timetableTitle }">
         <input type="hidden" name="timetableContent" value="${ t.timetableContent }">
         <input type="hidden" name="timetableBackground" value="${ t.timetableBackground }">
         <input type="hidden" name="timetableColor" value="${ t.timetableColor }">
         <button id="deleteAndInsertBtn" type="submit" style="display: none;"></button>
     </form>
     <form action="deleteAndUpdate.ti" method="post">
     	 <input type="hidden" name="timetableNo" value="${ t.timetableNo }">
    	 <input type="hidden" name="timetableWriter" value="${ t.timetableWriter }">
         <input type="hidden" name="timetableDay" value="${ t.timetableDay }" >
         <input type="hidden" name="timetableStart" value="${ t.timetableStart }">
         <input type="hidden" name="timetableEnd" value="${ t.timetableEnd }">
         <input type="hidden" name="timetableTime" value="${ t.timetableTime }">
         <input type="hidden" name="timetableTitle" value="${ t.timetableTitle }">
         <input type="hidden" name="timetableContent" value="${ t.timetableContent }">
         <input type="hidden" name="timetableBackground" value="${ t.timetableBackground }">
         <input type="hidden" name="timetableColor" value="${ t.timetableColor }">
         <button id="deleteAndUpdateBtn" type="submit" style="display: none;"></button>
     </form>
     
    <c:if test="${ timetableInsertCheck == 1 }">
    	<script>
    		if(confirm("선택한 시간에 중복되는 시간표가 있습니다. 기존 정보를 삭제하고 등록하시겠습니까?")){
    			
   				$("#deleteAndInsertBtn").click();
    			
    			<c:remove var="t" scope="session"/>
    			<c:remove var="timetableInsertCheck" scope="session"/>
    		}else{
    			alert("최소되었습니다.");
    			<c:remove var="t" scope="session"/>
   				<c:remove var="timetableInsertCheck" scope="session"/>
    		}
    	</script>
    </c:if>
    
    <c:if test="${ timetableUpdateCheck == 1 }">
    	<script>
    		if(confirm("선택한 시간에 중복되는 시간표가 있습니다. 기존 정보를 삭제하고 등록하시겠습니까?")){
    			
   				$("#deleteAndUpdateBtn").click();
    			
    			<c:remove var="t" scope="session"/>
    			<c:remove var="timetableUpdateCheck" scope="session"/>
    		}else{
    			alert("최소되었습니다.");
    			<c:remove var="t" scope="session"/>
   				<c:remove var="timetableUpdateCheck" scope="session"/>
    		}
    	</script>
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
                            <a href="selectList.mo" aria-expanded="false" >
                                <i class="icon-doc menu-icon"></i><span class="nav-text">메모장</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false" style="background:#F3F3F9">
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
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; "><b>수업시간표</b></h3>
                </div>
                <!-- row -->

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:900px;">
                                <div class="card-body" >
                                <form action="updateForm.ti" method="post">
                                	 <input type="hidden" name="timetableNo" id="timetableNof">
							    	 <input type="hidden" name="timetableWriter" id="timetableWriterf">
							         <input type="hidden" name="timetableDay" id="timetableDayf" >
							         <input type="hidden" name="timetableStart" id="timetableStartf">
							         <input type="hidden" name="timetableEnd" id="timetableEndf">
							         <input type="hidden" name="timetableTime" id="timetableTimef">
							         <input type="hidden" name="timetableTitle" id="timetableTitlef">
							         <input type="hidden" name="timetableContent" id="timetableContentf">
							         <input type="hidden" name="timetableBackground" id="timetableBackgroundf">
							         <input type="hidden" name="timetableColor" id="timetableColorf">
							         <button id="updateTimetableBtn" type="submit" style="display: none;"></button>
							     </form>
                                <!-- 여기다가 작성 -->
                                <form action="delete.ti" method="post">
                              	<c:if test="${ !empty list }">
                              		<c:forEach var="timetable" items="${ list }">
	                           			<script>
                       						$(function(){
                       							if("${timetable.timetableDay}" == '월요일'){
	                       							for(var i=8; i<22; i++){
	                       								if(${timetable.timetableStart} == i){
	                       									var timetableContent = "${timetable.timetableContent}"
	                       									$(".mon${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br> ")
	                       									<c:choose>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 0}">
	                       											.html($(".mon${timetable.timetableStart}").html() + timetableContent.substring(0,10))
	                       										</c:when>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 1}">
	                       											.html($(".mon${timetable.timetableStart}").html() + timetableContent.substring(0,28))
	                       										</c:when>
	                       										<c:otherwise>
	                       										.html($(".mon${timetable.timetableStart}").html() + timetableContent)
	                       										</c:otherwise>
	                       									</c:choose>
	                       									.addClass("timetableHover")
	                       									.click(function(){
	                       										$("#timetableNof").val("${timetable.timetableNo}");
	                       										$("#timetableWriterf").val("${timetable.timetableWriter}");
		                       									$("#timetableDayf").val("${timetable.timetableDay}");
		                       									$("#timetableStartf").val("${timetable.timetableStart}");
		                       									$("#timetableEndf").val("${timetable.timetableEnd}");
		                       									$("#timetableTimef").val("${timetable.timetableTime}");
		                       									$("#timetableTitlef").val("${timetable.timetableTitle}");
		                       									$("#timetableContentf").val("${timetable.timetableContent}");
		                       									$("#timetableBackgroundf").val("${timetable.timetableBackground}");
		                       									$("#timetableColorf").val("${timetable.timetableColor}");
		                       									if($(this).children(0).attr("checked") == "checked"){
		                       										$(this).children(0).removeAttr("checked");
		                       									}else{
		                       										$(this).children(0).attr("checked", "check");
		                       									}
		                       									$("#updateTimetableBtn").click();
	                       									});
	                       									for(var i=${timetable.timetableStart}+1; i<=${timetable.timetableEnd}; i++){
	                       										$(".mon"+i).remove();
	                       									}
	                       								}
	                       							}
                       								
                       							}else if("${timetable.timetableDay}" == '화요일'){
	                       							for(var i=8; i<22; i++){
	                       								if(${timetable.timetableStart} == i){
	                       									var timetableContent = "${timetable.timetableContent}"
	                       									$(".tue${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br> ")
	                       									<c:choose>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 0}">
	                       											.html($(".tue${timetable.timetableStart}").html() + timetableContent.substring(0,10))
	                       										</c:when>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 1}">
	                       											.html($(".tue${timetable.timetableStart}").html() + timetableContent.substring(0,28))
	                       										</c:when>
	                       										<c:otherwise>
	                       										.html($(".tue${timetable.timetableStart}").html() + timetableContent)
	                       										</c:otherwise>
	                       									</c:choose>
	                       									.addClass("timetableHover")
	                       									.click(function(){
	                       										$("#timetableNof").val("${timetable.timetableNo}");
	                       										$("#timetableWriterf").val("${timetable.timetableWriter}");
		                       									$("#timetableDayf").val("${timetable.timetableDay}");
		                       									$("#timetableStartf").val("${timetable.timetableStart}");
		                       									$("#timetableEndf").val("${timetable.timetableEnd}");
		                       									$("#timetableTimef").val("${timetable.timetableTime}");
		                       									$("#timetableTitlef").val("${timetable.timetableTitle}");
		                       									$("#timetableContentf").val("${timetable.timetableContent}");
		                       									$("#timetableBackgroundf").val("${timetable.timetableBackground}");
		                       									$("#timetableColorf").val("${timetable.timetableColor}");
		                       									if($(this).children(0).attr("checked") == "checked"){
		                       										$(this).children(0).removeAttr("checked");
		                       									}else{
		                       										$(this).children(0).attr("checked", "check");
		                       									}
		                       									$("#updateTimetableBtn").click();
	                       									});
	                       									for(var i=${timetable.timetableStart}+1; i<=${timetable.timetableEnd}; i++){
	                       										$(".tue"+i).remove();
	                       									}
	                       								}
	                       							}
                       								
                       							}else if("${timetable.timetableDay}" == '수요일'){
	                       							for(var i=8; i<22; i++){
	                       								if(${timetable.timetableStart} == i){
	                       									var timetableContent = "${timetable.timetableContent}"
	                       									$(".wed${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br>")
	                       									<c:choose>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 0}">
	                       											.html($(".wed${timetable.timetableStart}").html() + timetableContent.substring(0,10))
	                       										</c:when>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 1}">
	                       											.html($(".wed${timetable.timetableStart}").html() + timetableContent.substring(0,28))
	                       										</c:when>
	                       										<c:otherwise>
	                       										.html($(".wed${timetable.timetableStart}").html() + timetableContent)
	                       										</c:otherwise>
	                       									</c:choose>
	                       									.addClass("timetableHover")
	                       									.click(function(){
	                       										$("#timetableNof").val("${timetable.timetableNo}");
	                       										$("#timetableWriterf").val("${timetable.timetableWriter}");
		                       									$("#timetableDayf").val("${timetable.timetableDay}");
		                       									$("#timetableStartf").val("${timetable.timetableStart}");
		                       									$("#timetableEndf").val("${timetable.timetableEnd}");
		                       									$("#timetableTimef").val("${timetable.timetableTime}");
		                       									$("#timetableTitlef").val("${timetable.timetableTitle}");
		                       									$("#timetableContentf").val("${timetable.timetableContent}");
		                       									$("#timetableBackgroundf").val("${timetable.timetableBackground}");
		                       									$("#timetableColorf").val("${timetable.timetableColor}");
		                       									if($(this).children(0).attr("checked") == "checked"){
		                       										$(this).children(0).removeAttr("checked");
		                       									}else{
		                       										$(this).children(0).attr("checked", "check");
		                       									}
		                       									$("#updateTimetableBtn").click();
	                       									});
	                       									for(var i=${timetable.timetableStart}+1; i<=${timetable.timetableEnd}; i++){
	                       										$(".wed"+i).remove();
	                       									}
	                       								}
	                       							}
                       								
                       							}else if("${timetable.timetableDay}" == '목요일'){
	                       							for(var i=8; i<22; i++){
	                       								if(${timetable.timetableStart} == i){
	                       									var timetableContent = "${timetable.timetableContent}"
	                       									$(".thu${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br>")
	                       									<c:choose>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 0}">
	                       											.html($(".thu${timetable.timetableStart}").html() + timetableContent.substring(0,10))
	                       										</c:when>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 1}">
	                       											.html($(".thu${timetable.timetableStart}").html() + timetableContent.substring(0,28))
	                       										</c:when>
	                       										<c:otherwise>
	                       										.html($(".thu${timetable.timetableStart}").html() + timetableContent)
	                       										</c:otherwise>
	                       									</c:choose>
	                       									.addClass("timetableHover")
	                       									.click(function(){
	                       										$("#timetableNof").val("${timetable.timetableNo}");
	                       										$("#timetableWriterf").val("${timetable.timetableWriter}");
		                       									$("#timetableDayf").val("${timetable.timetableDay}");
		                       									$("#timetableStartf").val("${timetable.timetableStart}");
		                       									$("#timetableEndf").val("${timetable.timetableEnd}");
		                       									$("#timetableTimef").val("${timetable.timetableTime}");
		                       									$("#timetableTitlef").val("${timetable.timetableTitle}");
		                       									$("#timetableContentf").val("${timetable.timetableContent}");
		                       									$("#timetableBackgroundf").val("${timetable.timetableBackground}");
		                       									$("#timetableColorf").val("${timetable.timetableColor}");
		                       									if($(this).children(0).attr("checked") == "checked"){
		                       										$(this).children(0).removeAttr("checked");
		                       									}else{
		                       										$(this).children(0).attr("checked", "check");
		                       									}
		                       									$("#updateTimetableBtn").click();
	                       									});
	                       									for(var i=${timetable.timetableStart}+1; i<=${timetable.timetableEnd}; i++){
	                       										$(".thu"+i).remove();
	                       									}
	                       								}
	                       							}
                       								
                       							}else if("${timetable.timetableDay}" == '금요일'){
	                       							for(var i=8; i<22; i++){
	                       								if(${timetable.timetableStart} == i){
	                       									var timetableContent = "${timetable.timetableContent}"
	                       									$(".fri${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br>")
	                       									<c:choose>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 0}">
	                       											.html($(".fri${timetable.timetableStart}").html() + timetableContent.substring(0,10))
	                       										</c:when>
	                       										<c:when test="${timetable.timetableEnd - timetable.timetableStart == 1}">
	                       											.html($(".fri${timetable.timetableStart}").html() + timetableContent.substring(0,28))
	                       										</c:when>
	                       										<c:otherwise>
	                       										.html($(".fri${timetable.timetableStart}").html() + timetableContent)
	                       										</c:otherwise>
	                       									</c:choose>
	                       									.addClass("timetableHover")
	                       									.click(function(){
	                       										$("#timetableNof").val("${timetable.timetableNo}");
	                       										$("#timetableWriterf").val("${timetable.timetableWriter}");
		                       									$("#timetableDayf").val("${timetable.timetableDay}");
		                       									$("#timetableStartf").val("${timetable.timetableStart}");
		                       									$("#timetableEndf").val("${timetable.timetableEnd}");
		                       									$("#timetableTimef").val("${timetable.timetableTime}");
		                       									$("#timetableTitlef").val("${timetable.timetableTitle}");
		                       									$("#timetableContentf").val("${timetable.timetableContent}");
		                       									$("#timetableBackgroundf").val("${timetable.timetableBackground}");
		                       									$("#timetableColorf").val("${timetable.timetableColor}");
		                       									if($(this).children(0).attr("checked") == "checked"){
		                       										$(this).children(0).removeAttr("checked");
		                       									}else{
		                       										$(this).children(0).attr("checked", "check");
		                       									}
		                       									$("#updateTimetableBtn").click();
	                       									});
	                       									for(var i=${timetable.timetableStart}+1; i<=${timetable.timetableEnd}; i++){
	                       										$(".fri"+i).remove();
	                       									}
	                       								}
	                       							}
                       								
                       							}
                       						});
                       					</script>
                              		</c:forEach>
                              	</c:if>
                                <table id="timetableTable" border="1" style="width: 100%; text-align: center;">
                                    <thead>
                                        <tr>
                                            <th width="150px">시간</th>
                                            <th>월요일</th>
                                            <th>화요일</th>
                                            <th>수요일</th>
                                            <th>목요일</th>
                                            <th>금요일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>08:00 - 09:00</td>
                                            <td class="mon8"></td>
                                            <td class="tue8"></td>
                                            <td class="wed8"></td>
                                            <td class="thu8"></td>
                                            <td class="fri8"></td>
                                        </tr>
                                        <tr>
                                            <td>09:00 - 10:00</td>
                                            <td class="mon9"></td>
                                            <td class="tue9"></td>
                                            <td class="wed9"></td>
                                            <td class="thu9"></td>
                                            <td class="fri9"></td>
                                        </tr>
                                        <tr>
                                            <td>10:00 - 11:00</td>
                                            <td class="mon10"></td>
                                            <td class="tue10"></td>
                                            <td class="wed10"></td>
                                            <td class="thu10"></td>
                                            <td class="fri10"></td>
                                        </tr>
                                        <tr>
                                            <td>11:00 - 12:00</td>
                                            <td class="mon11"></td>
                                            <td class="tue11"></td>
                                            <td class="wed11"></td>
                                            <td class="thu11"></td>
                                            <td class="fri11"></td>
                                        </tr>
                                        <tr>
                                            <td>12:00 - 13:00</td>
                                            <td class="mon12"></td>
                                            <td class="tue12"></td>
                                            <td class="wed12"></td>
                                            <td class="thu12"></td>
                                            <td class="fri12"></td>
                                        </tr>
                                        <tr>
                                            <td>13:00 - 14:00</td>
                                            <td class="mon13"></td>
                                            <td class="tue13"></td>
                                            <td class="wed13"></td>
                                            <td class="thu13"></td>
                                            <td class="fri13"></td>
                                        </tr>
                                        <tr>
                                            <td>14:00 - 15:00</td>
                                            <td class="mon14"></td>
                                            <td class="tue14"></td>
                                            <td class="wed14"></td>
                                            <td class="thu14"></td>
                                            <td class="fri14"></td>
                                        </tr>
                                        <tr>
                                            <td>15:00 - 16:00</td>
                                            <td class="mon15"></td>
                                            <td class="tue15"></td>
                                            <td class="wed15"></td>
                                            <td class="thu15"></td>
                                            <td class="fri15"></td>
                                        </tr>
                                        <tr>
                                            <td>16:00 - 17:00</td>
                                            <td class="mon16"></td>
                                            <td class="tue16"></td>
                                            <td class="wed16"></td>
                                            <td class="thu16"></td>
                                            <td class="fri16"></td>
                                        </tr>
                                        <tr>
                                            <td>17:00 - 18:00</td>
                                            <td class="mon17"></td>
                                            <td class="tue17"></td>
                                            <td class="wed17"></td>
                                            <td class="thu17"></td>
                                            <td class="fri17"></td>
                                        </tr>
                                        <tr>
                                            <td>18:00 - 19:00</td>
                                            <td class="mon18"></td>
                                            <td class="tue18"></td>
                                            <td class="wed18"></td>
                                            <td class="thu18"></td>
                                            <td class="fri18"></td>
                                        </tr>
                                        <tr>
                                            <td>19:00 - 20:00</td>
                                            <td class="mon19"></td>
                                            <td class="tue19"></td>
                                            <td class="wed19"></td>
                                            <td class="thu19"></td>
                                            <td class="fri19"></td>
                                        </tr>
                                        <tr>
                                            <td>20:00 - 21:00</td>
                                            <td class="mon20"></td>
                                            <td class="tue20"></td>
                                            <td class="wed20"></td>
                                            <td class="thu20"></td>
                                            <td class="fri20"></td>
                                        </tr>
                                        <tr>
                                            <td>21:00 - 22:00</td>
                                            <td class="mon21"></td>
                                            <td class="tue21"></td>
                                            <td class="wed21"></td>
                                            <td class="thu21"></td>
                                            <td class="fri21"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <button id="deleteTimetableCheck" type="button" style="float: right;" class="btn btn-danger">삭제</button>
                                <button id="deleteTimetableCancel" type="button" style="float: right; display: none;" class="btn btn-success">취소</button>
                                <button id="deleteTimetable" type="button" style="float: right;  display: none; margin-right: 15px;" class="btn btn-danger">삭제</button>
                                <button id="deleteTimetableSubmit" type="submit" style="float: right; display: none;" class="btn btn-danger">삭제</button>
                                <button id="resetTimetable"type="button" style="float: right; margin-right: 15px" class="btn btn-danger">초기화</button>
                                <a id="insertTimetable" href="enrollForm.ti" style="float: right; margin-right: 15px;" class="btn btn-success">등록</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>
            </form>
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
        
        <div class="card card-widget">
                <div class="card-body gradient-3">
                    <div class="media">
                        <table id="timetableWidget"  style="width: 100%; text-align: center; font-size:13px">
                        	<c:choose>
                        		<c:when test="${ !empty list }">
		                        	<thead>
			                        	<tr style="height: 30px;">
			                                <th>
			                                  	  [요일정보]
			                                </th>
			                            </tr>
		                        	</thead>
		                        	<c:forEach var="t" items="${ list }">
		                        		<c:if test="${ t.timetableDay == t.timetableToDay }">
				                        	<tbody>
					                        	<tr style="height: 30px;">
					                                <th>
					                                  	  ${ t.timetableTitle }
					                                </th>
					                            </tr>
					                            <tr>
					                                <td style="height: 20px;">
					                                	${ t.timetableEnd }:00 ~ ${ t.timetableEnd }:00
					                                </td>
					                            </tr>
				                            </tbody>
				                        </c:if>
		                           </c:forEach>
		                           <tbody>
			                        	<tr style="height: 30px;">
			                                <th>
			                                  	 편안한 휴식을 가져보세요!
			                                </th>
			                            </tr>
		                            </tbody>
	                            </c:when>
	                            <c:otherwise>
	                            	<tr>
		                                <td style="height: 20px;">
		                                	등록된 시간표가 없습니다.
		                                </td>
		                            </tr>
	                            </c:otherwise>
                            </c:choose>
                        </table>
                    </div>
                </div>
            </div>
        	
        	<!-- 시간표 위젯 스크립트 -->
        	<script>
        		$(function(){
        			var today = new Date().getDay();
        			if(today == 1){
        				$("#timetableWidget thead tr th").text("[월요일]");
        			}else if(today == 2){
        				$("#timetableWidget thead tr th").text("[화요일]");
        			}else if(today == 3){
        				$("#timetableWidget thead tr th").text("[수요일]");
        			}else if(today == 4){
        				$("#timetableWidget thead tr th").text("[목요일]");
        			}else if(today == 5){
        				$("#timetableWidget thead tr th").text("[금요일]");
        			}else if(today == 6){
        				$("#timetableWidget thead tr th").text("[토요일]");
        			}else if(today == 0){
        				$("#timetableWidget thead tr th").text("[일요일]");
        			}
        		});
        	</script>
        	<!-- 시간표 위젯 스크립트 -->
        	
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
       	$(function(){
       		$("#deleteTimetableCheck").click(function(){
       			$(this).css("display", "none");
       			$("#deleteTimetableCancel").css("display", "block");
       			$("#deleteTimetable").css("display", "block");
       			$(".deleteCheckBox").css("display", "block");
       			$("#resetTimetable").css("display", "none");
       			$("#insertTimetable").css("display", "none");
       			$("#updateTimetableBtn").attr("disabled", true);
       		});
       		
       		$("#deleteTimetableCancel").click(function(){
       			$(this).css("display", "none");
       			$("#deleteTimetableCheck").css("display", "block");
       			$("#deleteTimetable").css("display", "none");
       			$(".deleteCheckBox").css("display", "none");
       			$("#resetTimetable").css("display", "block");
       			$("#insertTimetable").css("display", "block");
       			$("#updateTimetableBtn").attr("disabled", false);
       		});
       		
       		$("#deleteTimetable").click(function(){
       			if(confirm("정말 삭제하시겠습니까?") == true){
       				if($("input:checkbox[name=deleteTimetableCheck]:checked").length == 0){
       					alert("선택된 시간표가 없습니다.");
       				}else{
       					$("#deleteTimetableSubmit").click();	
       				}
       			}else{
       				alert("취소되었습니다.");
       			}
       		});
       		
       		$("#resetTimetable").click(function(){
       			if(confirm("정말로 초기화 하시겠습니까???") == true){
       				location.href="reset.ti?timetableWriter=${loginUser.memberNo}";
       			}else{
       				alert("취소되었습니다.");
       			}
       		});
       	})
      </script>
	
</body>

</html>