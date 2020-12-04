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

        .content form #pwdChange{
            background-color: #84c8b9;
            color: white;
            width: 100%;
        }

        .content form #pwdChange:hover{
            background-color:#79b6a9;
        }

        .content p{
            margin-top: 5px;
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
            <a href=""><img src="resources/images/mainLogo.png"></a>
        </div>

        <img id="bug2" src="resources/images/bug.png">

        <div class="body">

            <div class="content">

                <form action="" id="pwdUpdate" method="post">
                <input type="hidden" name="memberNo" value="${ memberNo }">
                    <div class="form-group">
                        <label for="newPwd">새 비밀번호</label>
                        <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="새 비밀번호를 입력하세요" required>
                        <div id="checkPwdResult" style="font-size:0.8em; padding-top: 5px"></div>
                      </div>
                      <div class="form-group">
                        <label for="checkPwd">새 비밀번호 확인</label>
                        <input type="password" class="form-control" id="comparePwd" name="comparePwd" placeholder="새 비밀번호를 입력하세요" required>
                        <div id="comparePwdResult" style="font-size:0.8em; padding-top: 5px"></div>
                      </div>
                      
                      <button id="pwdChange" type="button" class="btn" disabled>변경</button>
                      <div class="modal fade" id="exampleModalCenter">
                        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 400px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">비밀번호 변경</h5>
                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" align="center">
                                    <br>
                                    <h6 id="updatePwdResult"></h6>
                                    <br>
                                </div>
                                <div class="modal-footer">
                                    <button id="loginFrom" onclick="location.href='loginForm.me' " type="button" class="btn btn-primary btn-sm" style="background-color: #84c8b9; border-color: #84c8b9;" disabled>로그인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>

        </div>
        
        <script>
	        var $pwdCheck = $("#pwdUpdate input[name=memberPwd]");
			
			$pwdCheck.keyup(function(){
				
				if($pwdCheck.val().length >= 8){
					
					$.ajax({
						url:"pwdCheck.me",
						data:{memberPwd:$pwdCheck.val()},
						success:function(result){
							
							if(result != 'true'){
	                            
	                        	$("#checkPwdResult").show();
	    						$("#checkPwdResult").css("color", "red").text("비밀번호가 유효하지 않습니다.다시 입력해 주세요.");
	    						$pwdCheck.val().reset();
	                            
	                        }else{
	                        	
	                        	$("#checkPwdResult").show();
	    						$("#checkPwdResult").css("color", "green").text("유효한 비밀번호입니다.");
	    						$("#pwdChange").removeAttr("disabled");
	                        	
	                        }
							
						},error:function(){
							console.log("ajax통신 실패");
						}
					})
	
	      		}else{
	      			
	      			$("#checkPwdResult").hide();
					$("#pwdChange").attr("disabled", true);
	      			
	      		}
	
			})//비밀번호 체크
			
			var $pwdCompare = $("#pwdUpdate input[name=comparePwd]");
			
			$pwdCompare.keyup(function(){
				
				if($pwdCompare.val().length >= 8){
				
	    			if($pwdCheck.val() != $pwdCompare.val()){
	    				
	    				$("#comparePwdResult").show();
						$("#comparePwdResult").css("color", "red").text("입력한 비밀번호가 일치하지 않습니다.다시 입력해 주세요.");
	    				
	    			}else{
	    				
	    				$("#comparePwdResult").show();
						$("#comparePwdResult").css("color", "green").text("비밀번호가 일치합니다.");
						$("#pwdChange").removeAttr("disabled");
	    				
	    			}
	    			
				}else{
					
					$("#comparePwdResult").hide();
					$("#pwdChange").attr("disabled", true);
					
				}
				
			})//비밀번호 동일 체크
			
			$("#pwdChange").click(function(){
        		
        		var $memberPwd = $("#pwdUpdate input[name=memberPwd]");
        		var $memberNo = $("#pwdUpdate input[name=memberNo]");

        		$.ajax({
        			url:"pwdUpdate.me",
        			data:{"memberPwd":$memberPwd.val(),"memberNo":$memberNo.val()},
        			success:function(result){
        				
        				if(result == 'fail'){
        					
        					$("#exampleModalCenter").html();
                            $('#exampleModalCenter').modal('toggle');
                            $("#loginFrom").attr("disabled", true);
                            $("#updatePwdResult").html("비밀번호 변경에 실패하였습니다.");
        					
        					
        				}else{

        					$("#exampleModalCenter").html();
                            $('#exampleModalCenter').modal('toggle');
                            $("#loginFrom").removeAttr("disabled");
                            $("#updatePwdResult").html("성공적으로 비밀번호가 변경되었습니다.");
        					
        				}
        				
        				
        			},error:function(){
        				console.log("ajax통신 실패");
        			}
        		})
        		
        	})
        </script>

        <img id="bug1" src="resources/images/bug.png">

        <div class="footer" align="center">

            <p>Copyright &copy; Designed & Developed by Dlog 2020</p>
            
        </div>

    </div>
    
</body>
</html>