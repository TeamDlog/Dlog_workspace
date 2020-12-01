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

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px;">
                        <div class="card-body" >
                            
                            <div id="calendar_enroll_date">
                                <label>일정</label>
                                <br>
                                <div>시작 : <input type="date"></div>
                                <div>종료 : <input type="date"></div>
                                <div>배경색 : <input type="color"></div>
                                <div>글자색 : <input type="color"></div>
                            </div>
                            <br>
                            <div id="calendar_enroll_event">
                                <label>이벤트</label>
                                <div>시작 시간 : <input type="time"></div>
                                <div>종료 시간 : <input type="time"></div>
                                <div>제목 : <input type="text" placeholder="제목을 입력해주세요"></div>
                                <br>
                                <textarea name="" id="" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                            </div>
                            <br>
                            <button type="button" class="btn mb-1 btn-success" style="margin-left: 668px; margin-right:15px; font-size: 18px;">초기화</button>
                            <button type="button" class="btn mb-1 btn-success" style="font-size: 18px;">작성</button>

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
                $(this).css("color","black");
            })
            $("#calendar_enroll_event input[type=time]").change(function(){
                $(this).css("color","black");
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