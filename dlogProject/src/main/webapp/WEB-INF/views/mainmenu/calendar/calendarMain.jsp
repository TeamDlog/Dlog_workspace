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

	<jsp:include page="../../common/osageuDiaryHeader.jsp" />
	
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
        <div class="container-fluid" style="margin-top:15px;">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px;">
                        <div class="card-body" >
	                        <div id="calendar_main_head">
	                            <div id="calendar_main_head_left">
	                                <button>＜</button>
	                                <button>＞</button>
	                                <button>Today</button>
	                            </div>
	                            <div id="calendar_main_head_center">NOVEMBER 2020</div>
	                            <div id="calendar_main_head_right" align="right">
			                        <a class="btn mb-1 btn-primary btn-sm" href="enroll.ca">일정 등록</a>
	                            </div>
	                        </div>
	                        <div id="calendar_main_body">
	                            <table id="calendar_main_table" border="1">
	                                <tr>
	                                    <td>SUN</td>
	                                    <td>MON</td>
	                                    <td>TUE</td>
	                                    <td>WED</td>
	                                    <td>THU</td>
	                                    <td>FRI</td>
	                                    <td>SAT</td>
	                                </tr>
	                                <c:forEach var="tr" begin="1" end="7">
		                                <tr>
		                                 	<c:forEach var="c" begin="1" end="7">
		                                 		<td class="calendar_td">
		                                 			<input type="hidden" value="">
		                                 			<div>5</div>
		                                 			<div></div>
		                                 			<div></div>
		                                 			<div></div>
		                                 		</td>
		                                 	</c:forEach>
		                                </tr>
	                                </c:forEach>
	                            </table>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #/ container -->
    </div>   
    <script>
        $(function(){
            $("#calendar_main_head_right button").click(function(){
                $(this).addClass("button_click_effect");
            });
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