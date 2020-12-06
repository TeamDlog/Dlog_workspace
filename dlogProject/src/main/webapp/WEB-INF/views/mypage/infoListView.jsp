<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<style>
  .infoSelectForm{
      margin-top: 50px;
      margin-left:20%;
      border: solid 1px rgb(207, 202, 202);
      padding: 31px;
      width: 500px;
      height: 500px;
      border-radius: 50px;
  }

  .infoSelectForm p{
      font-size: 14px;
     
  }
  .btn-success{
    
      border-radius: 10px;
      font-size: 12px;
  }
  #infoSelectTable{
      margin: auto;
      padding: 15px;
  }
  
  </style>
</head>
<body>

	<jsp:include page="../common/myPageHeader.jsp" />
	
	<script>
      $(function(){
         $(".metismenu a[href*='infoList.my']").addClass("active");
         $(".metismenu a[href*='infoList.my']").parent().addClass("active");
      });
   </script>

<!--**********************************
         Content body start
     ***********************************-->
     <div class="content-body" style="float: left;">
         <div class="row page-titles mx-0">
             <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">개인정보 조회</h3>
         </div>
         <!-- row -->

         <div class="container-fluid">
             <div class="row">
                 <div class="col-12">
                     <div class="card" style="width:900px;">
                         <div class="card-body  backgroundColor" >
                             
                         <!-- 여기다가 작성 -->
                         <div class="infoSelectForm" align="center">
                         
                             <table class="infoSelectTable" >
                               
                                     <div class="card-body">
                                    <c:if test="${loginUser.profile == null}">
                                         <div class="text-center" Style=border1px solid black">
                                             <img alt="" class="rounded-circle mt-4" src="resources/images/default-profile-pic.jpg" width="90px">
                                         </div>
                                     
                                     </c:if>
                                     
                                         <div class="text-center" Style=border1px solid black">
                                             <img alt="" class="rounded-circle mt-4" src="${loginUser.profile }" width="90px">
                                         </div>
                                     </div>
                                     
                                 <tr>
                                    <td> 이름 &nbsp; : </td>
                                    <td>${loginUser.memberName }</td>
                                 </tr>
                                  <tr>
                                      <td></td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                     <td> 아이디 &nbsp; : </td>
                                     <td >${ loginUser.memberId }</td>
                                   
                                 </tr>
                                 <tr>
                                     <td></td>
                                     <td>&nbsp;</td>
                                 </tr>
                                  <tr>
                                    <td> 별명 &nbsp;: </td>
                                    <td >${loginUser.nickname }</td>
                                  </tr>
                                  <tr>
                                    <td></td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td> 이메일 &nbsp; : </td>
                                      <td >${loginUser.email }</td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td style="font-size: 12px;"class="form-text text-muted">&nbsp;</td>
                                      
                                  </tr>
                                  <tr>
                                    <td>전화번호 &nbsp; :</td>
                                    <td>&nbsp;${loginUser.phone }</td>
                                 </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                 </tr>
                                 
                              </table>
                              <br>
                             <button id="nextBtn" onclick="location.href='infoUpdateForm.my'"class="btn btn-success style="width:"15px;">수정</button>
                             
                             </div>
                             <br><br>
                             
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
     
   <jsp:include page="../common/diaryWidget.jsp" />
   <jsp:include page="../common/diaryFooter.jsp" />
   
</body>
</html>