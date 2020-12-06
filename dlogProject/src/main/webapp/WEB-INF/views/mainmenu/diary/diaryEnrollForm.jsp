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
	                <li class="breadcrumb-item active">글쓰기</li>
	            </ol>
	        </div>
	    </div>
     <!-- row -->

     <div class="container-fluid">
         <div class="row">
             <div class="col-12">
                 <div class="card backgroundColor" style="width:900px;">
                     <div class="card-body backgroundColor" >
                         <form action="insert.di"method="post">
                         <input type="hidden" name="diaryWriter" value="${loginUser.memberNo }">
	                            
                        	 <div>
                                 <input type="text" name="diaryTitle" style="width:680px; height: 35px; border: .5px solid lightgrey; border-radius: 4px; margin-left:30px; " placeholder="&nbsp;제목을 입력해주세요" required >
                             </div>
                             <div class="card-body" style="width:88%">
                                 <textarea class="summernote" name="diaryContent" required>
                                 </textarea>
                             </div>
                         <div align="right">
                             <button class="btn btn-success btn-sm"  onclick="insert(this.form)">등록</button>
                             <a href="list.di" class="btn btn-secondary btn-sm">취소</a>
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