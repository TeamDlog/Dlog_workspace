<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<style>
	.card-body{
	 width:94%;
	}
</style>
</head>
<body>

<jsp:include page="../../common/diaryHeader.jsp" />

 <!--**********************************
     Content body start
 ***********************************-->
 <div class="content-body" style="float: left;">
     <div class="row page-titles mx-0">
	        <div class="col p-md-0">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="list.di?dno=1">다이어리</a></li>
	                <li class="breadcrumb-item active">글수정</li>
	            </ol>
	        </div>
	    </div>
     <!-- row -->

     <div class="container-fluid">
         <div class="row">
             <div class="col-12">
                 <div class="card" style="width:900px;">
                     <div class="card-body" >
                         <form action="update.di"method="post">
                         <input type="hidden" name="diaryNo" value="${ dn.diaryNo }">
                             <div >
                                 <input type="text" id="title" name="diaryTitle" style="width:680px; height: 35px; border: .5px solid lightgrey; border-radius: 4px; margin-left:30px; " placeholder="&nbsp;제목을 입력해주세요" value="${dn.diaryTitle}" required>
                             </div>
                             <div class="card-body">
                                 <textarea class="summernote" name="diaryContent" required>
                                 	${dn.diaryContent }
                                 </textarea>
                             </div>
                         <div align="right">
                             <button type="submit" class="btn btn-primary btn-sm">등록</button>
                             <button onclick="history.back();" class="btn btn-dark btn-sm">취소</button>
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