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
        .dday{
            border: 1px solid;
            padding-left: 10px;
            height: 50px;
            display: block;
            width: 95%;
            margin-bottom: 15px;
            margin-left: 5%;
            line-height: 50px;
            }
        .ddayContent:hover{
            cursor: pointer;
        }
        .ddayContentWidgetCheck:hover{
            cursor: pointer;
        }
        .ddayContentDeleteCheck:hover{
            cursor: pointer;
        }
        input[type="checkbox"]:after {
            border: 1px solid black;
            width: 20px;
            height: 20px;
        }
        .ddayCheck input:hover{cursor: pointer;}
        .ddayContent,.ddayContentWidgetCheck,.ddayContentDeleteCheck{
            width: 80%;
            height: 100%;
            margin-right: 20px;
            margin-left: 10px;
            box-sizing: border-box;
            background-color: white;
            float: left;
        }
        .ddayCount{
            width: 10%;
            height: 100%;
            float: right;
            font-size: 20px;
            font-weight: bold;
            }
        .ddayDateWrap{
            width: 100%;
            height: 100%;
            float: right;
            font-size: 20px;
            font-weight: bold;
            }
        .ddayCheck{
            margin-right: 20px;
            box-sizing: border-box;
            float: left;
        }
        .ddayCheck input{
            display: none;
            margin-top: 100%;
        }
        .ddayRadio{
            display: none;
            border: 1px solid blue;
            width: 20px;
            height: 20px;
            margin-top: 1%;
            border-radius: 100%;
            box-sizing: border-box;
            float: left;
        }
        .ddayRadioClick{
            width: 10px;
            height: 10px;
            margin-top: 4px;
            margin-left: 4px;
            border-radius: 100%;
            box-sizing: border-box;
            float: left;
        }
	
        .rclick{background: blue;}
        
        .widgetStatus{background:gray; font-size:5px; border-radius:10px}
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
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; "><b>디데이</b></h3>
                </div>
                <!-- row -->
                <form action="delete.dd" method="post">
	                <div class="container-fluid">
	                    <div class="row">
	                        <div class="col-12">
	                            <div class="card" style="width:900px;">
	                                <div class="card-body" >
	                                    <!-- 여기다가 작성 -->
	                                    <div style="height: 50px;">
		                                    <c:if test="${ !empty dlist }">
		                                        <button type="button" id="deleteDdayBtn" style="float: right; width: 30px; background:white;" class="ion-minus"></button>
		                                    </c:if>
	                                        <button id="insertDdayBtn" type="button" style="float: right; width: 30px; background:white; margin-right: 15px;" class="ion-plus"  data-toggle="modal" data-target="#insertModal"></button>
	                                    </div>
	                                    <c:if test="${ !empty dlist }">
	                                   	 <c:forEach var="dday" items="${ dlist }">
			                                   <div class="ddayWrap">
			                                        <div class="dday">
			                                            <div class="ddayCheck"><input type="checkbox" name="deleteDday" value="${ dday.ddayNo }"></div>
			                                            <div class="ddayRadio">
			                                                <div class="ddayRadioClick <c:if test="${ dday.ddayWidget == 'Y' }">rclick</c:if>"></div>
			                                            </div>
			                                            <div class="ddayContent" data-toggle="modal" data-target="#updateModal">
			                                            	<div class="ddayDateWrap">
			                                            		<span class="ddayDate">${ dday.ddayDate }</span>
			                                            		<span class="ddayTitle">&nbsp;${ dday.ddayTitle }</span>
			                                            		<span class="widgetStatus">
			                                            			<c:if test="${ dday.ddayWidget == 'Y' }">위젯 사용중</c:if>
			                                            		</span>
			                                            		<input type="hidden" name="ddayNo" value="${ dday.ddayNo }">
		                                            		</div>
				                                     	</div>
		                                            	<div class="ddayCount" align="center">
		                                            		 <c:choose>
		                                            		 	<c:when test="${ dday.ddayCount == 0}">D-Day</c:when>
		                                            		 	<c:otherwise>D - ${ dday.ddayCount }</c:otherwise>
		                                            		 </c:choose> 
		                                            	</div>
	                                        		</div>
	                                       		</div>
	                                      </c:forEach>
	                                        
		                                        <button type="button" id="checkDdayBtn" style="float: right;" class="btn btn-success">편집</button>
		
		                                        <button type="button" id="commitCancelBtn" style="float: right; display:none;" class="btn btn-success" >취소</button>
		                                        <button type="button" id="commitDdayBtn" style="float: right; margin-right: 15px; display:none;" class="btn btn-success" >저장</button>
		                                        <button type="button" id="commitDeleteDdayBtn" style="float: right; margin-right: 15px; display:none;" class="btn btn-success" >삭제</button>
	                                        </c:if>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                
                	<button style="display:none;" type="submit" id="deleteDdayListBtn"></button>
                </form>
                
                <form action="widgetCheck.dd" method="post">
                	<c:forEach var="d" items="${ dlist }">
	                	<input type="hidden" name="dlist" value="${ d.ddayNo }">
                	</c:forEach>
                	<input type="hidden" name="widgetCheck1" id="widgetCheck1" />
                	<input type="hidden" name="widgetCheck2" id="widgetCheck2" />
                	<input type="hidden" name="widgetCheck3" id="widgetCheck3" />
                	<input type="hidden" name="widgetCount" id="widgetCount" />
                	<button style="display:none;" type="submit" id="widgetCheckListBtn"></button>
                </form>
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
                            <tr>
                                <td style="height: 20px;">
                                   	 	등록된 디데이가 없습니다.
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <script>
            	$(function(){
            		var ddayWidgetContent = "";
            		<c:forEach var="d" items="${dlist}">
            			if(${d.ddayWidget == "Y"}){
            				ddayWidgetContent += '<tr style="height: 30px;"><th>D - ${d.ddayCount}</th></tr>' + '<tr><td style="height: 20px;">${d.ddayTitle}</td></tr>'
            			}
            		</c:forEach>
            		if(ddayWidgetContent != ""){
            			$("#ddayWidget").html(ddayWidgetContent);
            		}
            		
            	});
            </script>
             <!-- 디데이 -->
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
		var widgetCount = 0;
        $(function(){
            
            $('.ddayRadio').click(function(){
                if($(this).children('.ddayRadioClick').hasClass('rclick')){
                    $(this).children('.ddayRadioClick').removeClass('rclick')
                    $("#widgetCheck"+ (widgetCount+1)).val("")
                    widgetCount = widgetCount-1;
                }else{
                    if(widgetCount >= 3){
                        alert("최대 3개까지 선택 가능합니다.")
                    }else{
                        $(this).children('.ddayRadioClick').addClass('rclick')
                        $("#widgetCheck"+(widgetCount+1)).val($(this).next().children().children().eq(3).val())
                       widgetCount = widgetCount+1;
                    }
                }
            });
            
            $(".ddayContent").click(function(){
            	$("#updateDdayTitle").val($(this).children(0).children().eq(1).text());
            	$("#updateDdayDate").val($(this).children(0).children().eq(0).text());
            	$("#updateDdayNo").val($(this).children(0).children().eq(3).val());
            });
     
            $("#insertDdayBtn").click(function(){
            	$("#checkDdayBtn").css('display', 'block');
            	$("#commitDeleteDdayBtn").css('display', 'none');
            	$("#commitDdayBtn").css('display', 'none');
            	$("#commitCancelBtn").css('display', 'none');
                $('.ddayRadio').css('display', 'none');
                $(".dday input").css('display', 'none');
                $(".ddayContentDeleteCheck").attr("data-toggle","modal");
                $(".ddayContentWidgetCheck").attr("data-toggle","modal");
                $(".ddayContentDeleteCheck").attr("data-toggle","modal").addClass('ddayContent').removeClass('ddayContentDeleteCheck');
                $(".ddayContentWidgetCheck").attr("data-toggle","modal").addClass('ddayContent').removeClass('ddayContentWidgetCheck');
            });
            
            $("#commitCancelBtn").click(function(){
            	$("#checkDdayBtn").css('display', 'block');
            	$("#commitDeleteDdayBtn").css('display', 'none');
            	$("#commitDdayBtn").css('display', 'none');
            	$("#commitCancelBtn").css('display', 'none');
                $('.ddayRadio').css('display', 'none');
                $(".dday input").css('display', 'none');
                $(".ddayContentDeleteCheck").attr("data-toggle","modal");
                $(".ddayContentWidgetCheck").attr("data-toggle","modal");
                $(".ddayContentDeleteCheck").attr("data-toggle","modal").addClass('ddayContent').removeClass('ddayContentDeleteCheck');
                $(".ddayContentWidgetCheck").attr("data-toggle","modal").addClass('ddayContent').removeClass('ddayContentWidgetCheck');
            })
              
            $("#commitDeleteDdayBtn").click(function(){
            	$("#deleteDdayListBtn").click();
            });
            
            $("#commitDdayBtn").click(function(){
            	$("#widgetCount").val(widgetCount);
            	$("#widgetCheckListBtn").click();
            });
            
            $("#deleteDdayBtn").click(function(){
            	$("#checkDdayBtn").css('display', 'none');
            	$("#commitDdayBtn").css('display', 'none');
            	$("#commitDeleteDdayBtn").css('display', 'block');
            	$("#commitCancelBtn").css('display', 'block');
            	$(".dday input").css('display', 'block');
                $('.ddayRadio').css('display', 'none');
                $(".ddayContent").attr("data-toggle","");
                $(".ddayContent").addClass('ddayContentDeleteCheck').removeClass('ddayContentWidgetCheck').removeClass('ddayContent');
                $(".ddayContentDeleteCheck").click(function(){
                	if($(this).siblings('.ddayCheck').children().eq(0).attr("checked") == "checked"){
                		$(this).siblings('.ddayCheck').children().eq(0).attr("checked", false);
                	}else{
                		$(this).siblings('.ddayCheck').children().eq(0).attr("checked","checked");
                	}
                });
            })
            
            $("#checkDdayBtn").click(function(){
            	$("#checkDdayBtn").css('display', 'none');
            	$("#commitDeleteDdayBtn").css('display', 'none');
            	$("#commitDdayBtn").css('display', 'block');
            	$("#commitCancelBtn").css('display', 'block');
                $('.ddayRadio').css('display', 'block');
                $(".dday input").css('display', 'none');
                $(".ddayContent").attr("data-toggle","");
                $(".ddayContent").addClass('ddayContentWidgetCheck').removeClass('ddayContentDeleteCheck').removeClass('ddayContent');
                $(".ddayContentWidgetCheck").click(function(){
                	$(this).siblings('.ddayRadio').click();
                });
            });
            
            
            
        });    
        
    </script>
    
    <c:if test="${ !empty dlist }">
    	<c:forEach var="d" items="${dlist}">
    		<c:if test="${ d.ddayWidget == 'Y' }">
    			<script>
    				$("#widgetCheck"+(widgetCount+1)).val(${d.ddayNo});
    				widgetCount = widgetCount + 1;
    			</script>
    		</c:if>
    	</c:forEach>
    </c:if>
    
    <script>
    	$(function(){
    		$(".memo_widget").hover(function(){
    			$(this).children().eq(1).attr("style","overflow:auto;");
    		},function(){
    			$(this).children().eq(1).attr("style","overflow:hidden;");
    		})
    	})
    </script>

    <!-- Button to Open the Modal -->
    
  <!-- The Modal -->
    <form action="insert.dd" method="post">
        <div class="modal " id="insertModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">디데이 추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    디데이 제목
                    <input type="text" name="ddayTitle" style="width: 100%; height: 40px;"> <br><br>
                    날짜 설정 
                    <input type="date" name="ddayDate" style="width: 100%; height: 40px;">
                    <input type="hidden" name="memberNo" id="${ loginUser.memberNo }">
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">등록</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
        
            </div>
            </div>
        </div>
    </form>
    <!-- The Modal -->
    <form action="update.dd" method="post">
        <div class="modal" id="updateModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">디데이 추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    디데이 제목
                    <input type="text" name="ddayTitle" id="updateDdayTitle" style="width: 100%; height: 40px;"> <br><br>
                    날짜 설정 
                    <input type="date" name="ddayDate" id="updateDdayDate" style="width: 100%; height: 40px;">
                    <input type="hidden" name="ddayNo" id="updateDdayNo">
                    <input type="hidden" name="memberNo" id="${ loginUser.memberNo }">
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">저장</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
        
            </div>
            </div>
        </div>
    </form>
</body>

</html>