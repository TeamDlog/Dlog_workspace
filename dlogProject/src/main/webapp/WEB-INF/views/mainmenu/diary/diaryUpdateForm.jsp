<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>

</head>
<body>

<jsp:include page="../../common/diaryHeader.jsp" />

 <script>
      $(function(){
         $(".metismenu a[href*='list.di']").addClass("active");
         $(".metismenu a[href*='list.di']").parent().addClass("active");
      });
   </script>

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
                 <div class="card backgroundColor" style="width:900px;">
                     <div class="card-body backgroundColor" >
                         <form action="update.di"method="post">
                         <input type="hidden" name="diaryNo" value="${ dn.diaryNo }">
                             <div >
                                 <input type="text" id="title" name="diaryTitle" style="width:680px; height: 35px; border: .5px solid lightgrey; border-radius: 4px; margin-left:30px; " placeholder="&nbsp;제목을 입력해주세요" value="${dn.diaryTitle}" required>
                             </div>
                             <div class="card-body" style="width:88%" >
                                 <textarea class="summernote" name="diaryContent" required>
                                 	${dn.diaryContent }
                                 </textarea>
                             </div>
                         <div align="right">
                             <button type="submit" class="btn btn-success btn-sm">등록</button>
                              <a href="list.di" class="btn btn-secondary btn-sm">취소</a>
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