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
</head>

<body>

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
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; "><b>수업시간표</b></h3>
                </div>
                <!-- row -->

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:800px;">
                                <div class="card-body" >
                                
                                <!-- 여기다가 작성 -->
                                <c:if test="${ !empty t }">
                                	<script>
                                		$(function(){
                                			$("#timetableTitle").val("${t.timetableTitle}");
                                			$("#timetableDay").val("${t.timetableDay}");
                                			$("#timetableStart").val("${t.timetableStart}");
                                			$("#timetableEnd").val("${t.timetableEnd}");
                                			$("#timetableBackground").val("${t.timetableBackground}");
                                			$("#timetableColor").val("${t.timetableColor}");
                                			$("#timetableContent").text("${t.timetableContent}");
                                			$("#timetableNo").val("${t.timetableNo}");
                                		});
                                	</script>
                                	<c:remove var="t" scope="session"/>
                                </c:if>
                                <form action="update.ti" method="post">
                                	<input id="timetableNo" type="hidden" name="timetableNo" >
                                	<input type="hidden" name="timetableWriter" value="${ loginUser.memberNo }">
                                    <table id="timetableTable">
                                        <tr>
                                            <th>
                                              	  과목명 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;<input id="timetableTitle" type="text" name="timetableTitle" required maxlength="10" placeholder="최대10글자" style="width: 93%;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                              	  요일 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp; 
                                                <select name="timetableDay" id="timetableDay" style="width: 90%;height: 25px;">
                                                    <option value="월요일">월요일</option>
                                                    <option value="화요일">화요일</option>
                                                    <option value="수요일">수요일</option>
                                                    <option value="목요일">목요일</option>
                                                    <option value="금요일">금요일</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                              	  시작시간 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <select name="timetableStart" id="timetableStart" style="width: 90%; height: 25px;">
                                                    <option value="8">08:00 ~ 09:00</option>
                                                    <option value="9">09:00 ~ 10:00</option>
                                                    <option value="10">10:00 ~ 11:00</option>
                                                    <option value="11">11:00 ~ 12:00</option>
                                                    <option value="12">12:00 ~ 13:00</option>
                                                    <option value="13">13:00 ~ 14:00</option>
                                                    <option value="14">14:00 ~ 15:00</option>
                                                    <option value="15">15:00 ~ 16:00</option>
                                                    <option value="16">16:00 ~ 17:00</option>
                                                    <option value="17">17:00 ~ 18:00</option>
                                                    <option value="18">18:00 ~ 19:00</option>
                                                    <option value="19">19:00 ~ 20:00</option>
                                                    <option value="20">20:00 ~ 21:00</option>
                                                    <option value="21">21:00 ~ 22:00</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                               	 종료시간 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <select name="timetableEnd" id="timetableEnd" style="width: 90%; height: 25px;">
                                                    <option value="8">08:00 ~ 09:00</option>
                                                    <option value="9">09:00 ~ 10:00</option>
                                                    <option value="10">10:00 ~ 11:00</option>
                                                    <option value="11">11:00 ~ 12:00</option>
                                                    <option value="12">12:00 ~ 13:00</option>
                                                    <option value="13">13:00 ~ 14:00</option>
                                                    <option value="14">14:00 ~ 15:00</option>
                                                    <option value="15">15:00 ~ 16:00</option>
                                                    <option value="16">16:00 ~ 17:00</option>
                                                    <option value="17">17:00 ~ 18:00</option>
                                                    <option value="18">18:00 ~ 19:00</option>
                                                    <option value="19">19:00 ~ 20:00</option>
                                                    <option value="20">20:00 ~ 21:00</option>
                                                    <option value="21">21:00 ~ 22:00</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                               	 배경색상 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <input id="timetableBackground" type="color" name="timetableBackground" style="width: 90%; height: 25px;" value="#000000">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                	글자색상 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <input id="timetableColor" type="color" name="timetableColor" style="width: 90%; height: 25px;" value="#ffffff">
                                            </td>
                                        </tr>
                                    </table>
                                    <br><br>
                                    <span>메모</span>
                                    <textarea name="timetableContent" id="timetableContent" cols="100" rows="10" style="resize: none;" maxlength="50" placeholder="최대 50자"></textarea>
                                    <br><br>
                                    <a href="main.ti" style="float: right;" class="btn btn-danger">취소</a>
                                    <button type="submit" style="float: right; margin-right: 15px;" class="btn btn-success">등록</button>
                                </form>
                                
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
            <script>
            $(function(){
        		
        		$("#timetableStart").change(function(){
        			var start = $(this).val()
        			var end = $("#timetableEnd").val()
        			if(start > end){
        				console.log("change!!!")
        				$("#timetableEnd").val($(this).val());
        			}
        			$("#timetableEnd option").attr("disabled", false);
       				for(var i=8; i<$("#timetableStart").val(); i++){
       					$("#timetableEnd option[value="+i+"]").attr("disabled", true);
       				}
        		});
        		
        	});
            </script>
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

</body>

</html>