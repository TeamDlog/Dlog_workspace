<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<style>
	#detailTop>p{ margin-left: 20px;}
	
	.detailTable{border-collapse: separate;border-spacing: 0 50px;}
	.detailTable img{margin-right: 50px;}
	.detailTable tr:last-child{
	    width: 60%;
	    height: 150px;
	    margin: 5%;
	    margin-left: 100px;
	    margin-top: 50px;
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
         <h3 style="color:rgb(94, 94, 94); padding-left: 15px; font-size:17px; font-weight:bolder; ">다이어리</h3>
     </div>
     <!-- row -->

     <div class="container-fluid">
         <div class="row">
             <div class="col-12">
                 <div class="card" style="width:900px;">
                     <div class="card-body" >
                         <div class="table-responsive">
                             <!-- 시작 -->
                             
                             <div class="content">
     
                                 <div id="detailTop">
                                     <hr>
                                     <div>
                                         <table style="width:100%;">
                                             <tr>
                                                 <td style="font-size: 16px; font-weight: bolder;">${dn.diaryTitle } </td>
                                                 <td  align="right" >작성일 &nbsp;&nbsp;|&nbsp;&nbsp;${dn.diaryDate}</td>
                                             </tr>    
                                             </table>
                                     </div>
                                    <hr>
                                 </div>
                 
                                 <br>
                                 <div class="detailArea" align="center">
                                     <table class="detailTable" align="center">
                                         <tr>
                                             <td width="800" style="word-break: break-all; ">
                                              	  ${dn.diaryContent }
                                             </td>
                                         </tr>
                                     </table>
                                 </div>
                                 
                                 
                                 <br>
                                 <hr>
                 
                                 <div align="right" >
                                     <a onclick="location.href='delete.di?dno=${dn.diaryNo}'" class="btn btn-danger btn-sm">삭제</a>
                                     <a onclick="location.href='updateForm.di?dno=${dn.diaryNo}'" class="btn btn-success btn-sm">수정</a>
                                     <a href="list.di" class="btn btn-secondary btn-sm">목록</a>
                                 </div>
                                 
                             </div>
							
                         </div>                                
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