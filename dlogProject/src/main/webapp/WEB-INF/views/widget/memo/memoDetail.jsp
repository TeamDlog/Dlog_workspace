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
			$(".metismenu a[href*='selectList.mo']").addClass("active");
			$(".metismenu a[href*='selectList.mo']").parent().addClass("active");
		});
	</script>
	
    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body" style="float: left;">
        <div class="row page-titles mx-0">
            <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">메모장</h3>
        </div>
        <!-- row -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px; height:700px;">
                        <div class="card-body backgroundColor" style="background-image:url('resources/images/memoEnroll.png'); background-position: 30px 20px ;background-size:850px 650px; background-repeat: no-repeat; position:relative;">
                        
                        <form action="" method="post" id="update_form">
                        	<div style="width:70%; height:40%; position:absolute; top:200px; left:120px;">
	                        	<input type="hidden" name="memoNo" value="${ m.memoNo }">
		                        <div class="memo_enroll_title">
		                            <input type="text" name="memoTitle" value="${ m.memoTitle }">
		                        </div>
		                        <div class="memo_enroll_content">
		                            <textarea name="memoContent" id="" cols="30" rows="10">${ m.memoContent }</textarea>
		                        </div>
		                        <div align="right">
			                        <button type="submit" class="btn mb-1 btn-success btn-sm" style="margin-right:10px; font-size: 15px;" onclick="modifyMemo();">수정</button>
			                        <button type="button" class="btn mb-1 btn-success btn-sm" style="font-size: 15px;" onclick="deleteMemo();">삭제</button>
		                        </div>
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
		// 수정
		modifyMemo = function(){
			$("#update_form").attr("action","update.mo");
	        $("#update_form").submit();
		}
		// 삭제
		deleteMemo = function(){
			$("#update_form").attr("action","updateDelete.mo");
			var test = confirm("정말 삭제하시겠습니까?");
			if(test == true){
	        	$("#update_form").submit();
			}
		}
	</script>
    <!--**********************************
        Content body end
    ***********************************-->  
    <jsp:include page="../../common/diaryWidget.jsp" />
    <jsp:include page="../../common/diaryFooter.jsp" />
    <jsp:include page="../../common/friendjQuery.jsp" />

</body>
</html>