<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .infoUpdateForm{
    margin-top: 50px;
    margin-left:12%;
    border: solid 1px rgb(207, 202, 202);
    padding: 31px;
    width: 500px;
    height: 600px;
    border-radius: 50px;
	}

	.infoUpdateForm p{
    font-size: 14px;
    font-weight: 500;   
	}
	.btn-success{
  
    border-radius: 10px;
    font-size: 12px;
	}

	#infoUpdateFormTable{
    margin: auto;
    box-sizing: border-box;
    padding: 15px;
	}
	input::placeholder { 
    color: #ccc; 
    font-size:10px;

	}
</style>
</head>
<body>

	<jsp:include page="../common/myPageHeader.jsp" />


<!--**********************************
         Content body start
     ***********************************-->
     <div class="content-body" style="float: left;">
         <div class="col p-md-0">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="infoList.my">개인정보 조회</a></li>
	                <li class="breadcrumb-item active">개인정보 수정</li>
	            </ol>
	        </div>
         <!-- row -->

         <div class="container-fluid">
             <div class="row">
                 <div class="col-12">
                     <div class="card" style="width:710px;">
                         <div class="card-body" >
                             
                         <!-- 여기다가 작성 -->
                         <div class="infoUpdateForm" align="center">
                               <form action="infoUpdate.my" id="infoUpdateForm" method="post" enctype="multipart/form-data">
                                   <input type="hidden" name="memberNo" value="${loginUser.memberNo }">
                                     <table id="infoUpdateFormTable">
                                         <div class="card-body">
                                             <div class="text-center">
                                                 <img alt="" class="rounded-circle mt-4" src="${log.profile }" width="90px">
                                             </div>
                                         </div>
                                         <td> 이름 : </td>
                                         <td colspan="2"> <input type="text" style="width:200px;" id="writer" class="form-control" value="${loginUser.memberName }" name="memberName" readonly></td>
                                      </tr>
                                      <tr>
                                         <td>&nbsp;</td>
                                         <td>&nbsp;</td>
                                     </tr>
                                       <tr>
                                         <td> 아이디 : </td>
                                         <td colspan="2"> <input type="text" style="width:200px;" id="memberId" class="form-control" value="${loginUser.memberId }" name="memberId" readonly></td>
                                       </tr>
                                     
                                       <tr>
                                           <td>&nbsp;</td>
                                           <td>&nbsp;</td>
                                       </tr>
                                       <tr>
                                         <td> 별명 : </td>
                                         <td colspan="2"><input style="width:200px;" type="text"  name="nickname" id="nickName" maxlength="12" placeholder="&nbsp;&nbsp;3~10자 (한글, 영문자, 숫자)" required value="${loginUser.nickname }"></td>
                                         </tr>
                                       <tr>
                                         <td>&nbsp;</td>
                                         <td>&nbsp;</td>
                                      </tr>
                                     
                                        <tr>
                                           <td> 이메일 : </td>
                                           <td colspan="2"><input style="width:200px;" type="email" name="email" placeholder="&nbsp;&nbsp;이메일을 입력해주세요." required value="${loginUser.email }"></td>
                                       </tr>
                                       <tr>
                                         <td>&nbsp;</td>
                                         <td>&nbsp;</td>
                                       </tr>
                                       <tr>
                                         <td>전화번호 :</td> 
                                 		 <td><input id="phoneNumber" name="phone" style="width:200px;" type="text" maxlength="13" placeholder="&nbsp;&nbsp;전화번호를 입력해주세요." value="${loginUser.phone }" required></td>
                                         <td>&nbsp;&nbsp;<button id="sendPhoneNumber" class="btn btn-secondary btn-sm">인증</button></td>
                                       </tr>
                                       <tr>
                                         <td colspan="3">&nbsp;</td> 
                                       </tr>
                                       <tr>
                                         <td>인증번호 입력 : </td>
                                         <td><input type="text" id="inputCertifiedNumber" name="inputCertifiedNumber" placeholder="인증번호를 입력하세요" style="width: 200px;" required></td>
                                      	 <td><button id="checkBtn" type="button" class="btn btn-secondary btn-sm">인증확인</button></td>
                                      </tr>
                                      <tr>
                                         <td colspan="3">&nbsp;</td> 
                                       </tr>
                                      <tr>
                                         <td class="profileimg"> 프로필 이미지 :  &nbsp;&nbsp;</td>
                                         
                                         <td colspan="2">&nbsp;&nbsp;<input type="file" name="upfile" class="form-control-e" id="upfile" value=""></td>
                                         
                                         <c:if test="${!empty loginUser.profile }">
                                         <input type="hidden" name="profile" value="${loginUser.profile }">
                                     	</c:if>
                                     
                                     </tr>
                                    </table>
                                   <br><br>
                                 <button type="submit" id="infoUpdateBtn" class="btn btn-success">확인</button>
                                  
                                </form>
                               </div>
                               <br><br><br>
                           		<script>
                           		$('#sendPhoneNumber').click(function(){
                                    var phoneNumber = $('#phoneNumber').val();
                                    
                                    alert('인증번호 발송 완료!');


                                    $.ajax({
                                        type: "GET",
                                        url: "sendSMS2.my",
                                        data: {"phoneNumber":phoneNumber},
                                        success: function(result){
                                            $('#checkBtn').click(function(){
                                            	
                                                if(result ==$('#inputCertifiedNumber').val()){
                                                    alert(
                                                        '휴대폰 인증이 정상적으로 완료되었습니다.'
                                                    );
                                                    $("#infoUpdateBtn").removeAttr("disabled")

                                                }else{
                                                	
                                                	alert(
                                                            '인증번호가 올바르지 않습니다.'
                                                    );
                                                	$("#infoUpdateBtn").attr("disabled", true);
                                                	$('#phoneNumber').focus();
                                                    
                                                }
                                            })


                                        }
                                    })
                                    
                                    
                           		</script>
                           		
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
 
<script>
<!--
function validate(){
	
	function nameCheck(){
  		var $userName = $("#updateFormTable input[name=userName]");
  		
  		$.ajax({
  			url:"nameCheck.me",
  			type:"get",
  			data:{checkName:$userName.val()},
  			success:function(count){
  				if(count == "fail"){
  					alert("이미 존재 하는 닉네임입니다.")
  					$userName.focus().setCursorPosition(last);
  				
  				}else{
  				
  				}
  			}, error:function(){
  				console.log("ajax 통신 실패 !");
  			}
  			
  		});
  		
  	}
	
	
	
   // 유효성 검사 :  이메일, 비밀번호일치, 닉네임
   var userName = document.getElementById("userName");
   var email = document.getElementById("email");
   
  
   var name = /^[가-힣a-z\d]{2,9}$/;
   var email = /^[0-9a-z]([-_.]?[0-9a-z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/i;

   if(!name.test(userName.value)){
       alert("닉네임을 정확하게 기입해주세요.");
       userName.value ="";
       userName.focus(); 

       return false; 
   }

   
   if(!email.test(email.value)){
  	 alert("이메일을 다시 입력해주세요");
 	     email.value = "";
 	     email.focus ="";
 		  return false; 
   }
   
 }

-->
</script>
</body>
</html>