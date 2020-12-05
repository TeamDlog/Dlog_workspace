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
    margin-left:20%;
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
         <div class="col p-md-0">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="infoList.my">개인정보 조회</a></li>
	                <li class="breadcrumb-item active">개인정보 수정</li>
	            </ol>
	        </div>
	       </div> 
         <!-- row -->

		
         <div class="container-fluid">
             <div class="row">
                 <div class="col-12">
                     <div class="card" style="width:900px;">
                         <div class="card-body" >
                             
                         <!-- 여기다가 작성 -->
                         <div class="infoUpdateForm" align="center">
                               <form action="infoUpdate.my" id="infoUpdateForm" method="post" enctype="multipart/form-data">
                                   <input type="hidden" name="memberNo" value="${loginUser.memberNo }">
                                     <table id="infoUpdateFormTable">
	                                     <div class="card-body">
                                       		<div class="text-center">
                                                 <img alt="" class="rounded-circle mt-4" src="${loginUser.profile }" width="90px">
                                             </div>
	                                     </div>
	                                     <tr>
	                                     	<td colspan="3" style="width:170px;" align="center"><input type="button" class="btn btn-secondary btn-sm" onclick="loction.href='pfUpdateForm.my'" value="프로필 삭제"></td>
	                                     </tr>
                                        
                                       <tr>
                                         <td> 이름  </td>
                                         <td colspan="2"> ${loginUser.memberName }</td>
                                      </tr>
                                      <tr>
                                         <td>&nbsp;</td>
                                         <td colspan="2">&nbsp;</td>
                                     </tr>
                                       <tr>
                                         <td> 아이디  </td>
                                         <td colspan="2"> ${loginUser.memberId }</td>
                                       </tr>
                                     
                                       <tr>
                                           <td>&nbsp;</td>
                                           <td>&nbsp;</td>
                                       </tr>
                                       <tr>
                                         <td> 별명  </td>
                                         <td><input style="width:180px;" type="text"  name="nickname" id="nickname" maxlength="12" placeholder="&nbsp;&nbsp;3~10자 (한글, 영문자, 숫자)" value="${loginUser.nickname }"></td>
                                         <td>&nbsp;<button type="button" onclick="nicknameCheck2();" class="btn btn-secondary btn-sm">중복확인</button></td>
                                         </tr>
                                       <tr>
                                         <td colspan="3">&nbsp;</td>
                                       </tr>
                                     	 <tr>
                                           <td> 이메일  </td>
                                           <td colspan="2"><input style="width:180px;" type="email" name="email" placeholder="&nbsp;&nbsp;이메일을 입력해주세요." required value="${loginUser.email }"></td>
                                       </tr>
                                       <tr>
                                         <td colspan="3">&nbsp;</td>
                                       </tr>
                                       <tr>
                                         <td>전화번호 </td> 
                                 		 <td><input id="phoneNumber" name="phone" style="width:180px;" type="text" maxlength="13" placeholder="&nbsp;&nbsp;전화번호를 입력해주세요." value="${loginUser.phone }"></td>
                                         <td>&nbsp;<button type="button" id="sendPhoneNumber" class="btn btn-secondary btn-sm">인증요청</button></td>
                                       </tr>
                                       <tr>
                                         <td colspan="3">&nbsp;</td> 
                                       </tr>
                                       <tr>
                                         <td>인증번호 입력 &nbsp;&nbsp;</td>
                                         <td><input type="text" id="inputCertifiedNumber" name="inputCertifiedNumber" placeholder="인증번호를 입력하세요" style="width: 180px;" ></td>
                                      	 <td>&nbsp;<button id="checkBtn" type="button" class="btn btn-secondary btn-sm">인증확인</button></td>
                                      </tr>
                                      <tr>
                                         <td colspan="3">&nbsp;</td> 
                                       </tr>
                                      <tr>
                                         <td class="profileimg"> 프로필 이미지   </td>
                                         
                                         <td colspan="2">&nbsp;&nbsp;<input type="file" name="upfile" class="form-control-e" id="upfile" value=""></td>
                                         
                                         <c:if test="${!empty loginUser.profile }">
                                         <input type="hidden" name="profile" value="${loginUser.profile }">
                                     	</c:if>
                                     
                                     </tr>
                                    </table>
                                   <br>
                                 <button type="submit" id="infoUpdateBtn" class="btn btn-success" data-toggle="modal" data-target="#updateForm" >확인</button>
                                  <!-- 회원탈퇴 버튼 클릭시 보여질 Modal -->
	                               <div class="modal" id="updateForm">
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
	                                                               수정하시려면 비밀번호를 입력해주세요. <br>   
	                                                               
	                                               </b>
	
	                                               <form action="infoUpdate.my" method="post">
	                                               
	                                                 	  비밀번호 : 
	                                                   <input type="password" name="memberPwd" required>
	                                                   
	                                                   <button type="submit" class="btn btn-success btn-sm" >수정</button>
	                                                   <button type="button" id="cancle" class="btn btn-secondary btn-sm" >취소</button>
	           			                      <script>
	           			                      $('#cancle').click(function(){
	           				                      $( '#updateForm' ).modal("hide");
	           			                    	  
	           			                      });
	           			                    	  
	           			                      </script>
	                                               </form>
	                                           </div>
	                                           
	                                       </div>
	                                   </div>
	                               </div>
	                          
                                </form>
                               </div>
                               <br><br><br>
                                
                               
                               
                               
                               <script>
                           		function nicknameCheck2(){
                            		
                            		var $nicknameCheck2 = $("#infoUpdateForm input[name=nickname]");
                            		
                            		if($nicknameCheck2.val() == ""){
                            			alert("별명을 입력해 주세요");
                            		}else{
                            			
                            			$.ajax({
                        					url:"nameCheck2.my",
                        					data:{nickname:$nicknameCheck2.val()},
                        					success:function(result){
                        						
                        						if(result == 'success'){
                                                    
                                                	alert($nicknameCheck2.val() + " 는(은) 이미 사용하고 있는 별명입니다. 다시 입력해주세요.");
                                                	$nicknameCheck2.focus();
                                                	$("#infoUpdateBtn").attr("disabled", true);
                                                    
                                                }else{
                                                	
                                                	alert($nicknameCheck2.val() + " 는(은) 사용가능합니다.");
                                                	$("#infoUpdateBtn").removeAttr("disabled")
                                                }
                        						
                        					},error:function(){
                        						console.log("아이디 중복체크용 ajax통신 실패");
                        					}
                        				})
                            		}	
                            	}
                            		//
                            	
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
                                    });
                           		});
                           		 
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
     
 
 <jsp:include page="../common/diaryWidget.jsp" />
 <jsp:include page="../common/diaryFooter.jsp" />
 
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