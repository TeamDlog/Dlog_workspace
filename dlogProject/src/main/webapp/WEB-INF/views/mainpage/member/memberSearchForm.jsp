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

        .content form #idB{
            background-color: #84c8b9;
            color: white;
            width: 100%;
        }

        .content form #idB:hover{
            background-color:#79b6a9;
        }

        .content form #pwdB{
            background-color: #84c8b9;
            color: white;
            width: 100%;
        }

        .content form #pwdB:hover{
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

	<c:if test="${ !empty searchAlert }">
		<script>
			alert("${searchAlert}");
		</script>
		<c:remove var="searchAlert" scope="session"/>
	</c:if>
	
	<div class="outer">

        <div class="header" align="center">
            <a href="mainpage.me"><img src="resources/images/mainLogo.png"></a>
        </div>

        <img id="bug2" src="resources/images/bug.png">

        <div class="body">

            <div class="content">

                <form id="idSearchFrom" method="post">
                    <div class="form-group">
                        <label for="userName">이름</label>
                        <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">전화번호</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" required>
                    </div>
                    <button id="idB" type="button" class="btn">아이디 조회</button>
                    <div class="modal fade" id="exampleModalCenter">
                        <div class="modal-dialog modal-dialog-centered" role="document" style="width: 400px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">아이디 조회</h5>
                                    <button type="button" id="closeIdCheck" class="close" data-dismiss="modal"><span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" align="center">
                                    <br>
                                   		<h6 id="idSearchResultArea">회원님의 아이디를 찾을 수 없습니다.</h6>
                                    <br>
                                </div>
                                <div class="modal-footer">
                                    <button id="loginFrom" onclick="location.href='loginForm.me' " type="button" class="btn btn-primary btn-sm" style="background-color: #84c8b9; border-color: #84c8b9;" disabled>로그인</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>

                <br><br>

                <form action="pwdSearch.me" id="pwdSearchForm" method="post">
                    <div class="form-group">
                        <label for="userId">아이디</label>
                        <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="userName">이름</label>
                        <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">전화번호</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" required>
                    </div>
                    <button id="pwdB" type="submit" class="btn">비밀번호 변경</button>
                </form>

            </div>

        </div>
        
        <script>	
        
		var $name = $("#idSearchFrom input[name=memberName]");
		var $phone = $("#idSearchFrom input[name=phone]");
		
                	$("#idB").click(function(){
                		
                		$.ajax({
                			url:"idSearch.me",
                			data:{"memberName":$name.val(),"phone":$phone.val()},
                			success:function(result){
                				
                				if(result == 'fail'){
                					$("#idSearchResultArea").text("회원님의 아이디를 찾을 수 없습니다.")
                					$("#exampleModalCenter").html();
                                    $('#exampleModalCenter').modal('toggle');
                                    $("#loginFrom").attr("disabled", true);
	
                				}else{
                					$("#idSearchResultArea").text(result);
                					$("#exampleModalCenter").html();
                                    $('#exampleModalCenter').modal('toggle');
                                    $("#loginFrom").removeAttr("disabled");
                				}
                				
                			},error:function(){
                				console.log("ajax통신 실패");
                			}
                		})
                		
                	})
                	
                	/*
                	$("#pwdB").click(function(){
                		
                		var $id = $("#pwdSearchForm input[name=memberId]");
                		var $name = $("#pwdSearchForm input[name=memberName]");
                		var $phone = $("#pwdSearchForm input[name=phone]");
                		
                		$.ajax({
                			url:"pwdSearch.me",
                			data:{"memberId":$id.val(), "memberName":$name.val(),"phone":$phone.val()},
                			success:function(result){
                				
                				alert("비밀번호를 변경할 수 없습니다.");
                				
                			},error:function(){
                				console.log("ajax통신 실패");
                			}
                		})
                		
                	})
                	*/
                	
                	$("#closeIdCheck").click(function(){
                		$("#idSearchFrom")[0].reset();
                	})
        </script>

        <img id="bug1" src="resources/images/bug.png">

        <div class="footer" align="center">

            <p>Copyright &copy; Designed & Developed by Dlog 2020</p>
            
        </div>

    </div>
	
</body>
</html>