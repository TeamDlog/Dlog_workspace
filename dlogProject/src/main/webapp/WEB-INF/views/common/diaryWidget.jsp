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
	        Main wrapper end
	    ***********************************-->
		<!--**********************************
            Widget area start
        ***********************************-->
        <div class="widget-area" style="float:left; margin-top: 100px;">
            <div class="card" style="max-width:220px; height:250px;">
                <div class="card-body">
                    <div class="text-center">
                    	<c:if test="${loginUser.profile == null}">
                        	<img alt="" class="rounded-circle mt-4" src="resources/images/default-profile-pic.jpg" width="90px">
                        </c:if>
                        <div class="text-center">
                            <img alt="" class="rounded-circle mt-4" src="${loginUser.profile }" width="90px">
                        </div>
                        <h4 class="card-widget__title text-dark mt-3" style="font-size:18px; font-weight:bolder;">${loginUser.nickname }</h4>
                         <p class="text-muted" style="font-weight:bolder;">${loginUser.introductionTitle }</p>
                    </div>
                </div>
            </div>

            <div class="card widgetMemo">
            	<div class="card-body" style="padding:0px;">
		        	<div class="memo_widget">
		                <div class="memo_widget_title">메모장</div>
		                <textarea class="memo_widget_content" rows="5" cols="15" readOnly>${ memoWidget.memoContent }</textarea>
		            </div>
	            </div>
	        </div>
	        
	        <div class="card widgetVoca">
                <div class="stat-widget-one" style="padding: 10px">
                    <div class="stat-content">
                    <c:choose>
                    	<c:when test="${ voca eq null }">
                    		<div class="stat-text" style="padding: 0px; margin: 0px; font-size: 13px">등록된 단어가 없습니다.</div>
                        </c:when>
                        <c:otherwise>
	                        <div class="stat-digit" style="color: #84c8b9; font-size: 30px">${ voca.vocaWord }</div>
	                        <div class="stat-text" style="padding: 0px; margin: 0px; font-size: 17px">${ voca.vocaMean }</div>
                        </c:otherwise>
                    </c:choose>
                    </div>
                </div>
            </div>
            
            <script>
            	window.onload=function(){
            		$.ajax({
            			url:"random.vo",
            			success:function(result){
            				
            			},error:function(){
            				console.log("ajax통신 실패");
            			}
            		})
            	};
            </script>
	        
	        
	        <!-- 시간표위젯 -->
        	<div class="card card-widget widgetTimetable">
                <div class="card-body gradient-3">
                    <div class="media">
                        <table id="timetableWidget"  style="width: 100%; text-align: center; font-size:13px">
                        	<c:choose>
                        	
                        		<c:when test="${ !empty timetableList }">
		                        	<thead>
			                        	<tr style="height: 30px;">
			                                <th>
			                                  	  [요일정보]
			                                </th>
			                            </tr>
		                        	</thead>
		                        	<c:choose>
		                        		<c:when test="${ timetableToDay != '토요일' || timetableToDay != '일요일'}">
				                        	<c:forEach var="timetable" items="${ timetableList }">
				                        		<c:if test="${ timetable.timetableDay == timetable.timetableToDay }">
						                        	<tbody>
							                        	<tr style="height: 30px;">
							                                <th>
							                                  	  ${ timetable.timetableTitle }
							                                </th>
							                            </tr>
							                            <tr>
							                                <td style="height: 20px;">
							                                	${ timetable.timetableStart }:00 ~ ${ timetable.timetableEnd }:00
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
            <div class="card card-widget widgetDday">
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
        
     // memo
       	$(function(){

       		$(".memo_widget").hover(function(){
       			$(this).children().eq(1).css({
       				"font-size":"13px",
           			"border":"0px",
           			"padding":"20px",
           			"resize":"none",
           			"overflow":"auto",
           			"color":"rgb(100,100,100)"
       			});
	       		},function(){
	       			$(this).children().eq(1).css({
	       				"font-size":"13px",
	           			"border":"0px",
	           			"resize":"none",
	           			"padding":"20px",
	           			"padding-right":"35px",
	           			"overflow":"hidden",
	           			"color":"rgb(100,100,100)"
	       			});
	       		});

	       		$(".memo_widget_title").css({
	       			"background":"rgb(132,200,185)",
	       			"color":"white",
	       			"text-align":"center",
	       			"font-size":"20px",
	       			"height":"40px",
	       			"padding-top":"5px",
	       			"border-radius":"10px 10px 0px 0px"
	       		});

	       		$(".memo_widget_content").css({
	       			"font-size":"13px",
	       			"border":"0px",
	       			"width":"100%",
	       			"resize":"none",
	       			"padding":"20px",
	       			"padding-right":"35px",
	       			"overflow":"hidden",
	       			"color":"rgb(100,100,100)"
	       		});

       		})
           		
        </script>
        
        <script>
        	$(function(){
        		
        		if(${ca.activeDday == "N"} ){
        			$(".widgetDday").css("display", "none");
        		}
        		
        		if(${ca.activeMemo == "N"} ){
        			$(".widgetMemo").css("display", "none");
        		}
        		
        		if(${ca.activeVoca == "N"} ){
        			$(".widgetVoca").css("display", "none");
        		}
        		
        		if(${ca.activeTimetable == "N"} ){
        			$(".widgetTimetable").css("display", "none");
        		}
        		
        	})
        </script>
        
</body>
</html>