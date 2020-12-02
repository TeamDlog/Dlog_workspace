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
      	.mon, .tue, .wed, .thu, .fri{height:50px;overflow:hidden;white-space: nowrap;text-overflow: ellipsis;}
      	
    </style>
</head>

<body>
	<jsp:include page="../../common/diaryHeader.jsp"/>
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
                            <div  class="card backgroundColor" style="width:900px;">
                                <div class="card-body backgroundColor" >
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
	                       									$(".mon${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br> ${timetable.timetableContent} ")
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
	                       									$(".tue${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br> ${timetable.timetableContent} ")
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
	                       									$(".wed${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br> ${timetable.timetableContent} ")
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
	                       									$(".thu${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br> ${timetable.timetableContent} ")
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
	                       									$(".fri${timetable.timetableStart}")
	                       									.attr("rowspan", ${timetable.timetableEnd - timetable.timetableStart + 1})
	                       									.css("background", "${timetable.timetableBackground}")
	                       									.css("color", "${timetable.timetableColor}")
	                       									.html("<input type='checkBox' name='deleteTimetableCheck' value='${timetable.timetableNo}' class='deleteCheckBox'><b>[${timetable.timetableTitle}]</b> <br> ${timetable.timetableContent} ")
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
                                            <td class="mon8 mon"></td>
                                            <td class="tue8 tue"></td>
                                            <td class="wed8 wed"></td>
                                            <td class="thu8 thu"></td>
                                            <td class="fri8 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>09:00 - 10:00</td>
                                            <td class="mon9 mon"></td>
                                            <td class="tue9 tue"></td>
                                            <td class="wed9 wed"></td>
                                            <td class="thu9 thu"></td>
                                         <td class="fri9 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>10:00 - 11:00</td>
                                            <td class="mon10 mon"></td>
                                            <td class="tue10 tue"></td>
                                            <td class="wed10 wed"></td>
                                            <td class="thu10 thu"></td>
                                            <td class="fri10 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>11:00 - 12:00</td>
                                            <td class="mon11 mon"></td>
                                            <td class="tue11 tue"></td>
                                            <td class="wed11 wed"></td>
                                            <td class="thu11 thu"></td>
                                            <td class="fri11 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>12:00 - 13:00</td>
                                            <td class="mon12 mon"></td>
                                            <td class="tue12 tue"></td>
                                            <td class="wed12 wed"></td>
                                            <td class="thu12 thu"></td>
                                            <td class="fri12 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>13:00 - 14:00</td>
                                            <td class="mon13 mon"></td>
                                            <td class="tue13 tue"></td>
                                            <td class="wed13 wed"></td>
                                            <td class="thu13 thu"></td>
                                            <td class="fri13 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>14:00 - 15:00</td>
                                            <td class="mon14 mon"></td>
                                            <td class="tue14 tue"></td>
                                            <td class="wed14 wed"></td>
                                            <td class="thu14 thu"></td>
                                            <td class="fri14 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>15:00 - 16:00</td>
                                            <td class="mon15 mon"></td>
                                            <td class="tue15 tue"></td>
                                            <td class="wed15 wed"></td>
                                            <td class="thu15 thu"></td>
                                            <td class="fri15 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>16:00 - 17:00</td>
                                            <td class="mon16 mon"></td>
                                            <td class="tue16 tue"></td>
                                            <td class="wed16 wed"></td>
                                            <td class="thu16 thu"></td>
                                            <td class="fri16 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>17:00 - 18:00</td>
                                            <td class="mon17 mon"></td>
                                            <td class="tue17 tue"></td>
                                            <td class="wed17 wed"></td>
                                            <td class="thu17 thu"></td>
                                            <td class="fri17 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>18:00 - 19:00</td>
                                            <td class="mon18 mon"></td>
                                            <td class="tue18 tue"></td>
                                            <td class="wed18 wed"></td>
                                            <td class="thu18 thu"></td>
                                            <td class="fri18 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>19:00 - 20:00</td>
                                            <td class="mon19 mon"></td>
                                            <td class="tue19 tue"></td>
                                            <td class="wed19 wed"></td>
                                            <td class="thu19 thu"></td>
                                            <td class="fri19 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>20:00 - 21:00</td>
                                            <td class="mon20 mon"></td>
                                            <td class="tue20 tue"></td>
                                            <td class="wed20 wed"></td>
                                            <td class="thu20 thu"></td>
                                            <td class="fri20 fri"></td>
                                        </tr>
                                        <tr>
                                            <td>21:00 - 22:00</td>
                                            <td class="mon21 mon"></td>
                                            <td class="tue21 tue"></td>
                                            <td class="wed21 wed"></td>
                                            <td class="thu21 thu"></td>
                                            <td class="fri21 fri"></td>
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
        <jsp:include page="../../common/diaryWidget.jsp"/>
        
    <!--**********************************
        Widget area end
    ***********************************-->
    <jsp:include page="../../common/diaryFooter.jsp"/>
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