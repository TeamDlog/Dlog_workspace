<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
	width:60%;
	height:500px;
	margin:auto;
}
textarea{border-radius: 10px;}
</style>
</head>
<body>
	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<!-- 이쪽에 메뉴바 포함 할꺼임 -->
    <jsp:include page="../common/mainHeader.jsp"/>
	<div id="wrap">
        <div id="content">
        	 	<div id="content_left">
                	<jsp:include page="sideMenu.jsp" />
	            </div>
	
	            <div id="content_right">
	                <div id="title">
	                    		1:1문의
	                </div>
	                <br><br>
	               	 <form method="post" action="insert.io" >
	             	 <input type="hidden" name="inquiryWriter" value="${loginUser.memberNo }">
		                <table>
		                    <tr>
		                        <th>질문</th>
		                        <td><input type="text"  name="inquiryTitle" size=50  required></td>
		                    </tr>
		                    <tr>
		                        <th>문의유형</th>
		                        <td>
		                        	<select name="inquiryType">
							            <option>선택</option>
							            <option value ="로그인">로그인</option>
							            <option value="회원가입/탈퇴">회원가입/탈퇴</option>
							            <option value="아이디/비밀번호">아이디/비밀번호</option>
							            <option value="메뉴">메뉴</option>
							            <option value="사이트 오류">사이트 오류</option>
							            <option value="기타">기타</option>         
							        </select>
		                     
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>이메일</th>
		                        <td><input type="email"  name="inquiryEmail" size=50  required></td>
		                    </tr>
		      
		                    <tr>
		                        <th>상세 내용</th>
		                    </tr>
		                    <tr>
		                        <th colspan="2"><textarea required name="inquiryContent"  cols="70" rows="10" style="resize:none;"></textarea></th>
		                    </tr>
		                </table>
                			<br>

		                <div align="center">
		                    <button type="submit" class="btn btn-primary">등록하기</button>
		                    <button type="reset" class="btn btn-danger">취소하기</button>
		                </div>
            	</form>
			</div>
	</div>
	
</div>
<jsp:include page="../common/mainFooter.jsp"/>	
</body>
</html>