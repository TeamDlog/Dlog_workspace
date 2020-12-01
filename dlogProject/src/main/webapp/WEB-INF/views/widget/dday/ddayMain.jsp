<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
	<jsp:include page="../../common/diaryHeader.jsp"/>
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
	                            <div class="card backgroundColor" style="width:900px;">
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
		                                            		<c:set var="ddayCount" value="${dday.ddayCount}"></c:set>
	                                            		 	<c:set var="length" value="${fn:length(ddayCount)}"></c:set>
		                                            		 <c:choose>
		                                            		 	<c:when test="${ dday.ddayCount == 0}">D - Day</c:when>
		                                            		 	<c:when test="${ dday.ddayCount < 0 }">D + ${fn:substring(ddayCount, 1, length+1)}</c:when>
		                                            		 	<c:otherwise>D - ${fn:substring(ddayCount, 0, length+1)}</c:otherwise>
		                                            		 </c:choose> 
		                                            	</div>
	                                        		</div>
	                                       		</div>
	                                      </c:forEach>
	                                        
		                                        <button type="button" id="checkDdayBtn" style="float: right;" class="btn btn-success">위젯 설정</button>
		
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
           			<input type="hidden" name="widgetCheck1" id="widgetCheck1"/>
           			<input type="hidden" name="widgetCheck2" id="widgetCheck2"/>
           			<input type="hidden" name="widgetCheck3" id="widgetCheck3"/>
                	<input type="hidden" name="widgetCount" id="widgetCount"/>
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
                    <input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
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
                    <input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
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

        <!--**********************************
            Widget area start
        ***********************************-->
        <jsp:include page="../../common/diaryWidget.jsp"/>
    <!--**********************************
        Widget area end
    ***********************************-->
    	<jsp:include page="../../common/diaryFooter.jsp"/>
    	<script>
    	var widgetCount = 0;
    	var wcc = 1;
	        $(function(){
	        	
	        	widgetCount = $(".rclick").length;
	        	<c:forEach var="d" items="${dlist}">
	        		if(${d.ddayWidget == "Y"}){
	        			$("#widgetCheck"+wcc).val(${d.ddayNo})
	        			wcc += 1;
	        		}
	        	</c:forEach>
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
	            
            	$("#widgetCount").val(widgetCount);
            	
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
	
</body>

</html>