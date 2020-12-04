<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
</head>
<body>

	<jsp:include page="../../common/diaryHeader.jsp" />
	
	<script>
		$(function(){
			$(".metismenu a[href*='selectList.ca']").addClass("active");
			$(".metismenu a[href*='selectList.ca']").parent().addClass("active");
		});
	</script>

	<!--**********************************
             Content body start
    ***********************************-->
    <div class="content-body" style="float: left;">
        <div class="row page-titles mx-0">
            <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">캘린더</h3>
        </div>
        <!-- row -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px;">
                        <div class="card-body" >
                            
                            <form id="calendar_detail_form" action="" method="post">
                            	<input type="hidden" name="calendarWriter" value="${ loginUser.memberNo }">
                            	<input type="hidden" name="calendarNo" value="${ list.calendarNo }">
                            	<div id="calendar_detail_outer">
		                            <div id="calendar_enroll_date">
		                                <div>시작 : <input type="date" id="calendarBeginDate" name="calendarBeginDate" value="${ list.calendarBeginDate }"></div>
		                                <div>종료 : <input type="date" id="calendarEndDate" name="calendarEndDate" value="${ list.calendarEndDate }"></div>
		                                <div>배경색 : <input type="color" name="calendarBgColor" value="${ list.calendarBgColor }"></div>
		                                <div>글자색 : <input type="color" name="calendarFontColor" value="${ list.calendarFontColor }"></div>
		                            </div>
		                            <div id="calendar_enroll_event">
		                                <div>시작 시간 : <input type="time" class="cal_time cal_time_begin" name="calendarBeginTime" value="${ list.calendarBeginTime }"></div>
		                                <div>종료 시간 : <input type="time" class="cal_time cal_time_end" name="calendarEndTime" value="${ list.calendarEndTime }"></div>
		                                <div>하루 종일 : <input id="allDay" type="checkbox"></div>
		                                <div>제목 : <input type="text" name="calendarTitle" maxlength="8" value="${ list.calendarTitle }"placeholder="제목을 입력해주세요"></div>
		                                <br>
		                            </div>
	                            </div>
                                <textarea name="calendarContent" id="" cols="30" rows="10" placeholder="내용을 입력해주세요">${ list.calendarContent }</textarea>
	                            <br><br>
	                            <button id="calendar_detail_delete" type="button" class="btn mb-1 btn-success" style="margin-left: 668px; margin-right:15px; font-size: 18px;">삭제</button>
	                            <button id="calendar_detail_update" type="button" class="btn mb-1 btn-success" style="font-size: 18px;">수정</button>
							</form>
							
							
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #/ container -->
    </div>
    <script>
        $(function(){
            $("#calendar_enroll_date input[type=date]").css("color","rgb(70,70,70)");
            $("#calendar_enroll_event input[type=time]").css("color","rgb(70,70,70)");
            
            
            if($(".cal_time").val() == "00:00"){
            	$("#allDay").attr("checked",true);
            }
            
            // 하루 종일
            $("#allDay").click(function(){
            	if($(this).prop("checked")==true){
            		$(".cal_time_begin").val("00:00");
            		$(".cal_time_end").val("00:00");
            	}else{
            		$(".cal_time").attr("disabled",false);
            		$(".cal_time_begin").val("");
            		$(".cal_time_end").val("");
            	}
            })
            
         	// str to date
			function parse(str) {
			    var y = str.substring(0, 4);
			    var m = str.substring(5, 7);
			    var d = str.substring(8, 10);
			    return new Date(y,m-1,d);
			}
            
            // 삭제
            $("#calendar_detail_delete").click(function(){
            	var yn = confirm("정말 삭제하시겠습니까?");
            	if(yn == true){
	            	$("#calendar_detail_form").attr("action","delete.ca");
	            	$("#calendar_detail_form").submit();
            	}
            	
            })
            
            // 수정
            $("#calendar_detail_update").click(function(){
            	if(parse($("#calendarEndDate").val()).getDate() - parse($("#calendarBeginDate").val()).getDate() > 9){
	            	alert("일정은 최대 10일까지 등록 가능합니다.");
	            	return false;
            	}else{
	            	$("#calendar_detail_form").attr("action","update.ca");
	            	$("#calendar_detail_form").submit();
            	}
            	
            })
            
        })
    </script>
    <!--**********************************
        Content body end
    ***********************************-->  
    <jsp:include page="../../common/diaryWidget.jsp" />
    <jsp:include page="../../common/diaryFooter.jsp" />
    <jsp:include page="../../common/friendjQuery.jsp" />
    
</body>
</html>