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
<style>
	.card-body{
	 width:94%;
	}
</style>
<body>

<jsp:include page="../../common/diaryHeader.jsp" />

 <!--**********************************
     Content body start
 ***********************************-->
 <div class="content-body" style="float: left;">
     <div class="row page-titles mx-0">
         <h3 style="color:rgb(94, 94, 94); padding-left: 15px; font-size:17px; font-weight:bolder;">다이어리 작성</h3>
     </div>
     <!-- row -->

     <div class="container-fluid">
         <div class="row">
             <div class="col-12">
                 <div class="card" style="width:900px;">
                     <div class="card-body" >
                         <form action="insert.di"method="post">
                         <input type="hidden" name="diaryWriter" value="${loginUser.memberNo }">
	                            
                        	 <div>
                                 <input type="text" name="diaryTitle" style="width:680px; height: 35px; border: .5px solid lightgrey; border-radius: 4px; margin-left:30px; " placeholder="&nbsp;제목을 입력해주세요" required>
                             </div>
                             <div class="card-body">
                                 <textarea class="summernote" name="diaryContent" required>
                                 </textarea>
                             </div>
                         <div align="right">
                             <button type="submit" class="btn btn-primary btn-sm"  onclick="insert(this.form)">등록</button>
                             <button onclick="history.back();" class="btn btn-dark btn-sm">취소</button>
                         </div>
                         </form>
                        
                     </div>
                     <script>
						function insert(form) {
							var title = form.diaryTitle.value;
							var content = form.diaryContent.value;
							
							if (title.trim() == ''){
								alert("제목을 입력해주세요");
								return false;
							}
							
							frm.submit();
						}
						</script>
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