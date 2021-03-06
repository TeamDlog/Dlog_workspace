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
                            
                            <form action="insert.ca" method="post">
	                            <input type="hidden" name="calendarWriter" value="${ loginUser.memberNo }">
	                            <div id="calendar_enroll_outer">
	                                <div id="calendar_enroll_date">
	                                    <div>시작 : <input type="date" id="calendarBeginDate" name="calendarBeginDate" required></div>
	                                    <div>종료 : <input type="date" id="calendarEndDate" name="calendarEndDate" onchange="confirmDate2();" disabled required></div>
	                                    <div>배경색 : <input type="color" name="calendarBgColor" required></div>
	                                    <div>글자색 : <input type="color" name="calendarFontColor" required></div>
	                                </div>
	                            	<div id="calendar_enroll_event">
	                                	<div>시작 시간 : <input class="cal_time cal_time_begin" type="time" name="calendarBeginTime" required></div>
	                                	<div>종료 시간 : <input class="cal_time cal_time_end" type="time" name="calendarEndTime" onchange="confirmDate3();" disabled required></div>
	                                	<div>하루 종일 : <input id="allDay" type="checkbox"></div>
	                                	<div>제목 : <input type="text" name="calendarTitle" placeholder="제목을 입력해주세요" maxlength="8" required></div>
	                                	<br>
	                            	</div>
	                            </div>
	                            <textarea name="calendarContent" id="" cols="30" rows="10" placeholder="내용을 입력해주세요" required></textarea>
	                            <br><br>
	                            <div align="right">
		                            <button type="button" class="btn mb-1 btn-success btn-sm" style="margin-right:10px; font-size: 15px;">초기화</button>
		                            <button type="submit" onclick="return confirmDate();" class="btn mb-1 btn-success btn-sm" style="font-size: 15px;">작성</button>
	                            </div>
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
            $("#calendar_enroll_date input[type=date]").change(function(){
                $(this).css("color","rgb(70,70,70)");
            })
            $("#calendar_enroll_event input[type=time]").change(function(){
                $(this).css("color","rgb(70,70,70)");
            })
            
            $("#allDay").click(function(){
            	if($(this).prop("checked")==true){
            		$(".cal_time_begin").val("00:00");
            		$(".cal_time_end").val("00:00");
            		$(".cal_time").attr("disabled",false);
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
            
            $("#calendarBeginDate").change(function(){
            	$("#calendarEndDate").attr("disabled",false);
            })
            
            $(".cal_time_begin").change(function(){
            	$(".cal_time_end").attr("disabled",false);
            })
            
            // 날짜, 시간 조건
            confirmDate = function(){
            	
            	var bt = $(".cal_time_begin").val();
            	var et = $(".cal_time_end").val();
            	
            	var date1 = new Date(1970, 1, 1, bt.substring(0,2), bt.substring(3,5), 0);
            	var date2 = new Date(1970, 1, 1, et.substring(0,2), et.substring(3,5), 0);
            	
            	if((date2-date1) < 0 ){
            		alert("종료 시간은 시작 시간보다 커야합니다.");
            		return false;
            	}
            	
            	if(parse($("#calendarEndDate").val()).getMonth() != parse($("#calendarBeginDate").val()).getMonth()){
	            	alert("시작과 끝은 같은 달이어야 합니다.");
	            	return false;
            	}
            	if(parse($("#calendarEndDate").val()).getDate() - parse($("#calendarBeginDate").val()).getDate() < 0){
	            	alert("시작일이 종료일보다 먼저 오거나 같아야 합니다.");
	            	return false;
            	}
            	if(parse($("#calendarEndDate").val()).getDate() - parse($("#calendarBeginDate").val()).getDate() > 9){
	            	alert("일정은 최대 10일까지 등록 가능합니다.");
	            	return false;
            	}
            }
            
            // 시작, 종료일 조건
            confirmDate2 = function(){
            	if(parse($("#calendarEndDate").val()).getMonth() != parse($("#calendarBeginDate").val()).getMonth()){
	            	alert("시작과 끝은 같은 달이어야 합니다.");
	            	$("#calendarEndDate").val("");
            	}else if(parse($("#calendarEndDate").val()).getDate() - parse($("#calendarBeginDate").val()).getDate() < 0){
	            	alert("시작일이 종료일보다 먼저 오거나 같아야 합니다.");
	            	$("#calendarEndDate").val("");
            	}else if(parse($("#calendarEndDate").val()).getDate() - parse($("#calendarBeginDate").val()).getDate() > 9){
	            	alert("일정은 최대 10일까지 등록 가능합니다.");
	            	$("#calendarEndDate").val("");
            	}
            }
            
            // 시작, 종료일 조건
            confirmDate3 = function(){
            	var bt = $(".cal_time_begin").val();
            	var et = $(".cal_time_end").val();
            	
            	var date1 = new Date(1970, 1, 1, bt.substring(0,2), bt.substring(3,5), 0);
            	var date2 = new Date(1970, 1, 1, et.substring(0,2), et.substring(3,5), 0);
            	
            	if((date2-date1) < 0 ){
            		alert("종료 시간은 시작 시간보다 커야합니다.");
            		$(".cal_time_end").val("");
            	}
            }
            
        })
    </script>
    <!--**********************************
        Content body end
    ***********************************-->  
    <jsp:include page="../../common/diaryWidget.jsp" />
    <jsp:include page="../../common/diaryFooter.jsp" />
    
</body>
</html>