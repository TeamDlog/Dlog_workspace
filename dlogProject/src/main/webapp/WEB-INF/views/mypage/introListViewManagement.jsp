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
<style>
    .introSelectForm{ 
        height:400px;
        width:100%;
      }
    #content{
        margin-left:20px;
        border:0px;
        padding:20px;
     }
     #line{
        border:gray 2px dashed;
        width:605px;
        
     }
    
</style>

</head>
<body>

<jsp:include page="../common/myPageHeader.jsp" />


 <!--**********************************
     Content body start
 ***********************************-->
 <div class="content-body" style="float: left;">
     <div class="row page-titles mx-0">
         <h3 style="color:rgb(94, 94, 94); padding-left:15px; font-size:17px; font-weight:bolder;">소개글 관리</h3>
     </div>
     <!-- row -->

     <div class="container-fluid">
         <div class="row">
             <div class="col-12">
                 <div class="card" style="width:730px;">
                     <div class="card-body" >
                         <div class="table-responsive">
                             <!--시작-->
                                 <div class="introSelect">
                                     <div class="introSelectForm">
                                          <table>
                                          <c:if test="${loginUser.introductionTitle == null and loginUser.introductionContent == null }">
                                          	
                                          		<td colspan="4" style="font-size:1.3em; font-weight:bolder;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;준비된 소개글이 없습니다.</td>
                                          	
                                          </c:if>	
                                          	<tr>
                                                 <th style="font-size:30px;">&nbsp;</th>
                                             
                                                 <th style="font-size:30px; font-weight: bolder;">&nbsp;&nbsp; ${ loginUser.introductionTitle } </th>
                                             
                                                 <td><hr id="line"></td>
                                            
                                                 <td id="content">${ loginUser.introductionContent } </td>
                                             </tr>
                                         </table>
                                     </div>
                                     <div align="right">
                                         <button type="button" onclick="location.href='introEnrollForm.my'" class="btn btn-success btn-sm">작성하기</button>&nbsp;&nbsp; 
                                         <button type="button" onclick="location.href='introUpdate.my'" class="btn btn-success btn-sm">수정하기</button>
                                     
                                     </div>
                             <br>
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
 
  <jsp:include page="../common/myPageFooter.jsp" />
 
</body>
</html>