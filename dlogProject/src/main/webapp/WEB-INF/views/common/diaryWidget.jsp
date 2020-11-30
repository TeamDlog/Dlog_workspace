<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

            <div class="card card-widget">
                <div class="card-body gradient-4">
                    <div class="media">
                        <span class="card-widget__icon"><i class="icon-emotsmile"></i></span>
                        <div class="media-body">
                            <h2 class="card-widget__title">1002</h2>
                            <h5 class="card-widget__subtitle">Task Completed</h5>
                        </div>
                    </div>
                </div>
            </div>
			

            <div class="card">
	        	<div class="memo_widget">
	                <div class="memo_widget_title">메모장</div>
	                <textarea class="memo_widget_content" rows="5" cols="15" readOnly>${ memoWidget.memoContent }</textarea>
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