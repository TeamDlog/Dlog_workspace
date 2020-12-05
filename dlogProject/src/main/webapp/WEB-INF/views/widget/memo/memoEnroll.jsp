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
                        <div class="card-body" style="background-image:url('resources/images/grid_bg2.png'); background-position: 200px 70px ;background-size:500px 500px; background-repeat: no-repeat; position:relative;">

	                        <form action="insert.mo" method="post">
	                        	<input type="hidden" name="memoWriter" value="${ loginUser.diaryMemberNo }">
		                        <div align="center" style="width:450px; margin:auto; margin-top:100px; background:transparent;">
		                            <input type="text" name="memoTitle" placeholder="제목을 입력해주세요" style="width:450px; height:40px; padding:10px;" required><br><br>
		                            <textarea name="memoContent" placeholder="내용을 입력해주세요" style="height:270px; width:450px; padding:10px; resize:none" required></textarea>
			                        <div align="right"  style="margin-top:20px; background:transparent;">
				                        <button type="submit" class="btn btn-success">저장</button>
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
    <!--**********************************
        Content body end
    ***********************************-->  
    <jsp:include page="../../common/diaryWidget.jsp" />
    <jsp:include page="../../common/diaryFooter.jsp" />

</body>
</html>