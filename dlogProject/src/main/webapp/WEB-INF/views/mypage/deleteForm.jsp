<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<style>
	.deleteForm{
		margin-top: 70px;
        margin-left:23%;
        border: solid 1px rgb(207, 202, 202);
        padding: 31px;
        width: 450px;
        height: 270px;
        border-radius: 50px;
    }

    .deleteForm p{
        font-size: 14px;
        font-weight: 500;   
     }
</style>
</head>
<body>

<jsp:include page="../common/myPageHeader.jsp" />

<script>
      $(function(){
         $(".metismenu a[href*='deleteForm.me']").addClass("active");
         $(".metismenu a[href*='deleteForm.me']").parent().addClass("active");
      });
   </script>

<!--**********************************
    Content body start
***********************************-->
<div class="content-body" style="float: left;">
    <div class="row page-titles mx-0">
        <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">회원탈퇴</h3>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card" style="width:900px;">
                    <div class="card-body" >
                        
                    <!-- 여기다가 작성 -->
                    <div class="deleteForm" align="center">
                        <br><br>
                         		<p style="font-size:16px;">	탈퇴를 하시겠습니까?   </p>
                        <p style=" font-size:11px; font-weight:bolder;" >*탈퇴를 하게 될 시 30일동안 재가입이 불가능합니다.*</p>
                         			<table align="center" id="deleteMemForm">
                                      <tr>
                                            <td colspan="3">
                                               <br><input type="button"class="btn btn-success" id="deleteMemBtn" data-toggle="modal" data-target="#deleteForm" value="탈퇴하기">
                                              </td>
                                          </tr>
                                      </table>
                             
                             
                
                      </div>   
                     
                     <br><br><br><br><br><br>
                    <!-- 회원탈퇴 버튼 클릭시 보여질 Modal -->
                    <div class="modal" id="deleteForm">
                        <div class="modal-dialog">
                            <div class="modal-content">
                            
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title">회원탈퇴</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <!-- Modal body -->
                                <div class="modal-body" align="center">
                                
                                    <b>
                                                    탈퇴 후 복구가 불가능합니다. <br>   
                                                    정말로 탈퇴 하시겠습니까?
                                    </b>

                                    <form action="deleteMember.my" method="post">
                                      	  비밀번호 : 
                                        <input type="password" name="memberPwd" required>
                                        
                                        <button type="submit" class="btn btn-danger btn-sm" >탈퇴</button>
                                        <button type="button" id="cancle" class="btn btn-dark btn-sm" >취소</button>
			                      <script>
			                      $('#cancle').click(function(){
				                      $( '#deleteForm' ).modal("hide");
			                    	  
			                      });
			                    	  
			                      </script>
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
    <!-- #/ container -->
</div>        
<!--**********************************
    Content body end
***********************************-->  
       
	<jsp:include page="../common/diaryWidget.jsp" />
	<jsp:include page="../common/diaryFooter.jsp" />
   
   
</body>
</html>