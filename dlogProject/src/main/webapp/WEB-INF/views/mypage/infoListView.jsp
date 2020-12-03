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
      margin-left:12%;
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

<!--**********************************
         Content body start
     ***********************************-->
     <div class="content-body" style="float: left;">
         <div class="row page-titles mx-0">
             <h3 style="color:rgb(94, 94, 94); padding-left: 15px; font-size:17px; font-weight:bolder;">개인정보 조회</h3>
         </div>
         <!-- row -->

         <div class="container-fluid">
             <div class="row">
                 <div class="col-12">
                     <div class="card" style="width:710px;">
                         <div class="card-body" >
                             
                         <!-- 여기다가 작성 -->
                         <div class="infoSelectForm" align="center">
                         
                             <table class="infoSelectTable" >
                               
                                    <c:if test="${loginUser.profile == null}">
                                     <div class="card-body">
                                         <div class="text-center" Style=border1px solid black">
                                             <img alt="" class="rounded-circle mt-4" src="resources/images/default-profile-pic.jpg" width="90px">
                                         </div>
                                     </div>
                                     </c:if>
                                      <div class="card-body">
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
                             <input type="submit" onclick="return validate();"  type="submit" id="nextBtn" class="btn btn-success" value="수정"></input>
                             
                             </div>
                             <br><br>
                             
                             <!-- 수정 버튼 클릭시 보여질 Modal -->
	                    	<div class="modal" id="deleteForm">
	                        <div class="modal-dialog">
	                            <div class="modal-content">
	                            
	                                <!-- Modal Header -->
	                                <div class="modal-header">
	                                <h4 class="modal-title">개인정보수정</h4>
	                                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                                </div>
	                                
	                                <!-- Modal body -->
	                                <div class="modal-body" align="center">
	                                
	                                    <b>
	                                                    수정하시려면 비밀번호를 입력해주세요. 
	                                                  
	                                    </b>
	
	                                    <form action="infoUpdate.my" method="post">
	                                      	  비밀번호 : 
	                                    <input type="password" name="memberPwd" required>
	                                        
	                                    <button type="submit" class="btn btn-danger btn-sm" >확인</button>
	                               
                                    </form>
                                </div>
                                
                            </div>
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
     
 </div>
 <!--**********************************
     Main wrapper end
 ***********************************-->
   
   <jsp:include page="../common/myPageFooter.jsp" />
   
</body>
</html>