<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<style>
    .updatePwdForm{
        margin-top: 70px;
        margin-left:20%;
        border: solid 1px rgb(207, 202, 202);
        padding: 31px;
        width: 500px;
        height: 450px;
        border-radius: 50px;
    }

    .updatePwdForm p{
        font-size: 14px;
        font-weight: 500;   
    }
</style>
</head>
<body>

<jsp:include page="../common/myPageHeader.jsp" />

<script>
      $(function(){
         $(".metismenu a[href*='updatePwdForm.my']").addClass("active");
         $(".metismenu a[href*='updatePwdForm.my']").parent().addClass("active");
      });
   </script>

<!--**********************************
    Content body start
***********************************-->
<div class="content-body" style="float: left;">
    <div class="row page-titles mx-0">
        <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">비밀번호 변경</h3>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card" style="width:900px;">
                    <div class="card-body" >
                        
                    <!-- 여기다가 작성 -->
                    <div class="updatePwdForm" align="center">
                        
                        <br>
                        <p align="center"><b>비밀번호는 대문자, 소문자, 숫자, 특수문자를 조합하여<br>
                             8자리부터 최소 10자리 이상만 사용하실 수 있습니다.</b></p>
                        <!-- 2_1. 입력을 받는 input요소들이 위치할 영역 -->
                             
                            <form action="updatePwd.my" id="updatePwd" method="post">
                                    <!-- 3_1. ID/PWD input요소가 들어갈 div -->
                                   
                                    <table align="center"  id="updatePwdForm">
                                     <input type="hidden" name="memberNo" class="form-control" value="${loginUser.memberNo}">
                                        <tr>
                                            <td style="font-size:12px;"><br>기존 비밀번호 : &nbsp;&nbsp;&nbsp; </td>
                                            <td><br><input id="original" type="password" name="original" maxlength="18" class="form-control" style="height:10px;" placeholder="password"required></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="3"><div id="memberPwd1"></div></td>
                                        </tr>
                                        <tr>
                                            <td style="font-size:12px;"><br>새 비밀번호 : &nbsp;&nbsp;&nbsp; </td>
                                            <td><br><input type="password" name="memberPwd" maxlength="18" class="form-control" style="height:10px;" placeholder="password" required></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="3" id="checkPwd1" ><div id="checkPwd1" style="font-size:0.6em;"></div></td>
                                        </tr>
                                        <tr>
                                            <td style="font-size:12px;"><br>비밀번호 확인 : &nbsp;&nbsp;&nbsp; </td>
                                            <td><br><input type="password" name="checkPwd" maxlength="18" class="form-control" style="height:10px;" placeholder="password" required></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="3" id="checkPwd2"><div id="checkPwd2" style="font-size:0.6em;"></div></td>
                                        </tr>
                                        <tr align="center">
                                            <td colspan="3">
                                               <br><br>
                                              <button align="center" type="submit"class="btn btn-success" id="updatePwdBtn" disabled>변경</button>
                                              </td>
                                          </tr>
                                      </table>
                             </form>
                
                      </div>   
                     
                      <br><br><br><br><br>
                        
                       <script>
                       <!--
                       $(document).ready(function(){
                    		$('#pw1').keyup(function(){
                    			$('#pwCheckFF').text('');
                    		}); 
                    		
                    		$('#repw1').keyup(function(){
                    			if($('#pw1').val()!=$('#repw1').val()){
                    				$('#pwCheckFF').text('');
                    		  		$('#pwCheckFF').html("패스워드 확인이 불일치 합니다");
                    		 	}else{
                    			  	$('#pwCheckFF').text('');
                    			  	$('#pwCheckFF').html("<font color='#70AD47'>패스워드 확인이 일치 합니다.</font>");
                    		 	}
                    		});
                    	 }); 
                    	 
                    	 //비밀번호 실시간 유효성 체크
                    	function pwCheck(memberPwd){
                    		$.ajax({
                    			type:"POST",
                    			url: "pwdCheck2.my",
                    			data : { memberPwd: memberPwd },
                    			success:function(result){	
                    				if(result == true){				
                    					checkPwd1.css("color", "green").text("유효한 비밀번호입니다.");	
                    					$("#updatePwdBtn").removeAttr("disabled");
                    					
                    				}else{				
                    					checkPwd1.css("color", "red").text("비밀번호가 유효하지 않습니다.다시 입력해 주세요.");
                    				}
                    			},error:function(){
									console.log("ajax통신 실패");
								}
                    		})
                    		
                    	}
                   
                    -->
                       
                       </script>
    
	                	
	                	
	                	
	                	
	                	
	                	
					
					<script>
					   //새 비밀번호 유효한지 확인
				        var $pwdCheck = $("#updatePwd input[name=memberPwd]");
						
						$pwdCheck.keyup(function(){
							
							if($pwdCheck.val().length >= 8){
								
								$.ajax({
									url:"pwdCheck2.my",
									data:{memberPwd:$pwdCheck.val()},
									success:function(result){
										
										if(result != 'true'){
				                            
				                        	$("#checkPwd1").show();
				    						$("#checkPwd1").css("color", "red").text("비밀번호가 유효하지 않습니다.다시 입력해 주세요.");
				                            
				                        }else{
				                        	
				                        	$("#checkPwd1").show();
				    						$("#checkPwd1").css("color", "green").text("유효한 비밀번호입니다.");
				    						$("#updatePwdBtn").removeAttr("disabled");
				                        	
				                        }
										
									},error:function(){
										console.log("ajax통신 실패");
									}
								})
				
				      		}else{
				      			
				      			$("#checkPwd1").hide();
								$("#updatePwdBtn").attr("disabled", true);
				      			
				      		}
				
						});//비밀번호 체크
						
						var $pwdCheck2 = $("#updatePwd input[name=checkPwd]");
						
						$pwdCheck2.keyup(function(){
							
							if($pwdCheck2.val().length >= 8){
							
				    			if($pwdCheck.val() != $pwdCheck2.val()){
				    				
				    				$("#checkPwd2").show();
									$("#checkPwd2").css("color", "red").text("입력한 비밀번호가 일치하지 않습니다.");
				    				
				    			}else{
				    				
				    				$("#checkPwd2").show();
									$("#checkPwd2").css("color", "green").text("비밀번호가 일치합니다.");
									$("#updatePwdBtn").removeAttr("disabled");
				    				
				    			}
				    			
							}else{
								
								$("#checkPwd2").hide();
								$("#updatePwdBtn").attr("disabled", true);
								
							}
							
						});
						
						
					
			        </script>
                    
                     <!--  <script>
                      
                      function validate(){
                    	   // 유효성 검사 :  비밀번호일치
                    	   var memberPwd = document.getElementById("memberPwd");
                    	   var memberPwd2 = document.getElementById("checkPwd");
                    	   var memberPwd3 = document.getElementById("checkPassPwd");
                    	   
                    	  
                    	   var pwd1 = /^[a-z\d!@#$%^&*]{8,15}$/i;  //특수문자(!@#$%^&*)
           
                    	 

                    	   if(!pwd1.test(userPwd.value)){
                    	       alert("유효한 비밀번호를 입력하세요.");

                    	       memberPwd.value ="";
                    	       memberPwd.focus(); 
                    	       
                    	       return false; 
                    	   }
                    	   
                    	   
                    	   if(userPwd.value != userPwd2.value){
                    	       alert("동일한 비밀번호를 입력하세요!");
                    	       memberPwd2.value = "";
                    	       memberPwd2.focus(); 

                    	       return false; 
                    	   }
                    	   
                    	   if(userPwd.value != userPwd3.value){
                    	       alert("비밀번호를 다시 확인해주시기 바랍니다.");
                    	       memberPwd3.value = "";
                    	       memberPwd3.focus(); 

                    	       return false; 
                    	   }
                    	   
                    	   
                    	 }



                      </script> -->
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