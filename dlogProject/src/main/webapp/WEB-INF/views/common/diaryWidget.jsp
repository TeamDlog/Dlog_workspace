<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		</div>
		<!--**********************************
            Widget area start
        ***********************************-->
        <div class="widget-area" style="float:left; margin-top: 100px;">
            <div class="card" style="max-width:170px; height:275px;">
                <div class="card-body">
                    <div class="text-center">
                    	<c:if test="${loginUser.profile == null}">
                        <img alt="" class="rounded-circle mt-4" src="resources/images/default-profile-pic.jpg" width="90px">
                        </c:if>
                        <h4 class="card-widget__title text-dark mt-3" style="font-size:18px; font-weight:bolder;">${loginUser.nickname }</h4>
                        <p class="text-muted" style="font-size:0.8em;">${loginUser.email }</p>
                        <p class="text-muted" style="font-weight:bolder;">${loginUser.introductionTitle }</p>
                    </div>
                </div>
            </div>

            <div class="card">
	        	<div class="memo_widget">
	                <div class="memo_widget_title">메모장</div>
	                <textarea class="memo_widget_content" rows="5" cols="15" readOnly>${ memoWidget.memoContent }</textarea>
	            </div>
	        </div>
	        
	        
	        <!-- 시간표위젯 -->
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
		                        	<c:choose>
		                        		<c:when test="${ timetableToDay != '토요일' || timetableToDay != '일요일'}">
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
							                                	${ t.timetableStart }:00 ~ ${ t.timetableEnd }:00
							                                </td>
							                            </tr>
						                            </tbody>
						                        </c:if>
				                           </c:forEach>
			                           </c:when>
			                           <c:otherwise>
				                           <tbody>
					                        	<tr style="height: 30px;">
					                                <th>
					                                  	 편안한 휴식을 가져보세요!
					                                </th>
					                            </tr>
				                            </tbody>
			                            </c:otherwise>
		                            </c:choose>
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
        	<!-- 시간표위젯 -->
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
        <script>
           	$(function(){
           		$(".memo_widget").hover(function(){
           			$(this).children().eq(1).attr("style","overflow:auto;");
           		},function(){
           			$(this).children().eq(1).attr("style","overflow:hidden;");
           		})
           	})
        </script>
</body>
</html>