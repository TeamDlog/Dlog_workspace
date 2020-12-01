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
                    <div class="card backgroundColor" style="width:900px;">
                        <div class="card-body" >
                        
                        <form action="" method="post" id="update_form">
                        	 <input type="hidden" name="memoNo" value="${ m.memoNo }">
	                         <div class="memo_enroll_title">
	                             <input type="text" name="memoTitle" value="${ m.memoTitle }">
	                         </div>
	                         <div class="memo_enroll_content">
	                             <textarea name="memoContent" id="" cols="30" rows="10">${ m.memoContent }</textarea>
	                         </div>
	                         <button type="submit" class="btn mb-1 btn-success" style="margin-left: 670px; margin-right:15px; font-size: 20px; letter-spacing:2px;" onclick="modifyMemo();">수정</button>
	                         <button type="button" class="btn mb-1 btn-success" style="font-size: 20px; letter-spacing:2px;" onclick="deleteMemo();">삭제</button>
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