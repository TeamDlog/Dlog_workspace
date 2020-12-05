<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dlog</title>
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/images/webImage.png" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>

        body{
            background-color: #84c8b9;
            height: 100%;
        }

        .header img{
            width: 170px;
            margin: 50px;
            margin-bottom: 0px;
        }

        .body{
            background-color: white;
            width: 500px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            border-radius: 20px;
        }

        .content{
            padding: 30px;
        }

        .content form #enrollBtn{
            background-color: #84c8b9;
            color: white;
            width: 100%;
        }

        .content form #enrollBtn:hover{
            background-color:#79b6a9;
        }

        .content p{
            margin-top: 5px;
            margin-bottom: 0px;
            font-size: 13px;
        }

        .content p a{
            color: #84c8b9;
            font-weight: bold;
            font-size: 14px;
        }

        .footer{
            padding-top: 60px;
            padding-bottom: 5px;
            color: white;
        }

        /* 움직이는 벌레 */

        #bug1{
            width: 60px;
            transform: rotate(150deg);
        }

        #bug2{
            width: 60px;
            transform: rotate(-10deg);
        }

        #bug1 {
            position: relative;
            animation-name: bug1;
            animation-duration: 60s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }
 
        @keyframes bug1 {
        0%   {left: 100px; top:40px;}
        100%  {left: 700px; top: -15px;}
        }

        #bug2 {
            position: relative;
            animation-name: bug2;
            animation-duration: 80s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }
 
        @keyframes bug2 {
        0%   {left: 900px; top:-90px;}
        100%  {left: 0px; top:10px;}
        }


    </style>
</head>
<body>
	
	<div class="outer">

        <div class="header" align="center">
            <a href="mainpage.me"><img src="resources/images/mainLogo.png"></a>
        </div>

        <img id="bug2" src="resources/images/bug.png">

        <div class="body">

            <div class="content">

                <form id="enrollForm" action="enroll.me" method="post">
                    <div class="form-group">
                        <label for="userId">아이디</label> <br>
                        <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력하세요" required >
                        <div id="checkResult" style="font-size:0.8em; padding-top: 5px"></div>
                    </div>
                    <div class="form-group">
                        <label for="userPwd" style="float:left">비밀번호 </label>
                        <input type="password" class="form-control" id="memberPwd" name="memberPwd" required placeholder="8~10이상 영문 대소문자, 숫자, 특수문자 포함">
                        <div id="checkPwdResult" style="font-size:0.8em; padding-top: 5px"></div>
                    </div>
                    <div class="form-group">
                        <label for="checkPwd">비밀번호 확인</label>
                        <input type="password" class="form-control" id="comparePwd" name="comparePwd" required disabled placeholder="동일한 비밀번호를 입력하세요">
                        <div id="comparePwdResult" style="font-size:0.8em; padding-top: 5px"></div>
                    </div>
                    <div class="form-group">
                        <label for="userName">이름</label>
                        <input type="text" class="form-control" id="memberName" name="memberName" required placeholder="이름를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="nickname">별명</label><br>
                        <input type="text" class="form-control" id="nickname" name="nickname" placeholder="별명을 입력하세요" style="width: 77%; float: left; margin-right: 10px;">
                        <button onclick="nicknameCheck();" class="btn btn-secondary">중복확인</button>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" class="form-control" id="email" name="email" required placeholder="이메일를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="phone">전화번호</label><br>
                        <input type="text" class="form-control" id="phoneNumber" name="phone" required placeholder="전화번호를 입력하세요" style="width: 77%; float: left; margin-right: 10px;">
                        <button id="sendPhoneNumber" class="btn btn-secondary">인증하기</button>
                    </div>
                    <div class="form-group">
                        <label for="phoneCheck">인증번호 입력</label><br>
                        <input type="text" class="form-control" id="inputCertifiedNumber" name="inputCertifiedNumber" required placeholder="인증번호를 입력하세요" style="width: 77%; float: left; margin-right: 10px;">
                        <button id="checkBtn" type="button" class="btn btn-secondary">인증확인</button>
                    </div>
                      <button id="enrollBtn" type="submit" class="btn" disabled>회원가입</button>
                </form>

                <p>계정이 있습니까? <a href="loginForm.me">로그인</a>하세요</p>

            </div>

        </div>
        <script>
        	$(function(){
        		var $idInput = $("#enrollForm input[name=memberId]");
        		
        		$idInput.keyup(function(){
        			
        			if($idInput.val().length >= 5){
        				
        				$.ajax({
        					url:"idCheck.me",
        					data:{memberId:$idInput.val()},
        					success:function(result){
        						
        						if(result == 'success'){
        							
        							$("#checkResult").show();
        							$("#checkResult").css("color", "green").text("사용가능한 아이디입니다.");
        							
        						}else{
        							
        							$("#checkResult").show();
        							$("#checkResult").css("color", "red").text("중복된 아이디가 존재합니다. 다시 입력해주세요");
        							$("#enrollBtn").attr("disabled", true);
        							
        						}
        						
        					},error:function(){
        						console.log("아이디 중복체크용 ajax통신 실패");
        					}
        				})
        				
        			}else{
        				
        				$("#checkResult").hide();
        				$("#enrollBtn").attr("disabled", true);
        				
        			}
        			
        		})//아이디 체크
        		
        		var $pwdCheck = $("#enrollForm input[name=memberPwd]");
        		
        		$pwdCheck.keyup(function(){
        			
        			if($pwdCheck.val().length >= 8){
        				
        				$.ajax({
        					url:"pwdCheck.me",
        					data:{memberPwd:$pwdCheck.val()},
        					success:function(result){
        						
        						if(result != 'true'){
                                    
                                	$("#checkPwdResult").show();
            						$("#checkPwdResult").css("color", "red").text("비밀번호가 유효하지 않습니다.다시 입력해 주세요.");
            						$("#enrollBtn").attr("disabled", true);
                                    
                                }else{
                                	
                                	$("#checkPwdResult").show();
            						$("#checkPwdResult").css("color", "green").text("유효한 비밀번호입니다.");
            						$("#enrollForm input[name=comparePwd]").removeAttr("disabled");
                                	
                                }
        						
        					},error:function(){
        						console.log("아이디 중복체크용 ajax통신 실패");
        					}
        				})

              		}else{
              			
              			$("#checkPwdResult").hide();
        				$("#enrollBtn").attr("disabled", true);
              			
              		}

        		})//비밀번호 체크
        		
        		var $pwdCompare = $("#enrollForm input[name=comparePwd]");
        		
        		$pwdCompare.keyup(function(){
        			
        			if($pwdCompare.val().length >= 8){
        			
	        			if($pwdCheck.val() != $pwdCompare.val()){
	        				
	        				$("#comparePwdResult").show();
							$("#comparePwdResult").css("color", "red").text("입력한 비밀번호가 일치하지 않습니다.다시 입력해 주세요.");
							$("#enrollBtn").attr("disabled", true);
	        				
	        			}else{
	        				
	        				$("#comparePwdResult").show();
							$("#comparePwdResult").css("color", "green").text("비밀번호가 일치합니다.");
	        				
	        			}
	        			
        			}else{
        				
        				$("#comparePwdResult").hide();
        				$("#enrollBtn").attr("disabled", true);
        				
        			}
        			
        		})//비밀번호 동일 체크

        	})
        	
        	function nicknameCheck(){
        		
        		var $nicknameCheck = $("#enrollForm input[name=nickname]");
        		
        		if($nicknameCheck.val() == ""){
        			alert("별명을 입력해 주세요");
        		}else{
        			
        			$.ajax({
    					url:"nicknameCheck.me",
    					data:{nickname:$nicknameCheck.val()},
    					success:function(result){
    						
    						if(result == 'success'){
                                
                            	alert($nicknameCheck.val() + " 는(은) 이미 사용하고 있는 별명입니다. 다시 입력해주세요.");
                            	$nicknameCheck.focus();
                                
                            }else{
                            	
                            	alert($nicknameCheck.val() + " 는(은) 사용가능합니다.");
                            	
                            }
    						
    					},error:function(){
    						console.log("아이디 중복체크용 ajax통신 실패");
    					}
    				})
        			
        		}//별명 중복체크
        		
        		$('#sendPhoneNumber').click(function(){
                    var phoneNumber = $('#phoneNumber').val();
                    
                    alert('인증번호 발송 완료!');


                    $.ajax({
                        type: "GET",
                        url: "sendSMS.me",
                        data: {"phoneNumber":phoneNumber},
                        success: function(result){
                            $('#checkBtn').click(function(){
                            	
                                if(result ==$('#inputCertifiedNumber').val()){
                                    alert(
                                        '휴대폰 인증이 정상적으로 완료되었습니다.'
                                    );
                                    $("#enrollBtn").removeAttr("disabled")

                                }else{
                                	
                                	alert(
                                            '인증번호가 올바르지 않습니다.'
                                    );
                                	$("#enrollBtn").attr("disabled", true);
                                	$('#phoneNumber').focus();
                                    
                                }
                            })


                        }
                    })
                });
        		
        	}
        </script>

        <img id="bug1" src="resources/images/bug.png">

        <div class="footer" align="center">

            <p>Copyright &copy; Designed & Developed by Dlog 2020</p>
            
        </div>

    </div>
	
</body>
</html>