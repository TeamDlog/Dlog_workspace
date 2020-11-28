<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- 이쪽에 메뉴바 포함 할꺼임 -->
    <jsp:include page="../common/mainHeader.jsp"/>
	<div id="wrap">
        <div id="content">
        	 	<div id="content_left">
                	<jsp:include page="sideMenu.jsp" />
	            </div>
	
	            <div id="content_right">
	                <div id="title">
	                    		공지사항
	                </div>
	                
	               <table align="center" class="table">
		                <thead> 
		                	<tr>
			                    <th>${n.noticeTitle}</th>
			                    <th style="text-align:right">${n.noticeDate}</th>
			                </tr>
		                </thead>
		               
		                <tr>
		                    <td colspan="4"><p style="height:300px">${n.noticeContent }</p></td>
		                </tr>
		                <tr>
		                    <th>첨부파일</th>
		                    <td colspan="3">
		                    	<c:choose>
		                    	<c:when test="${empty n.noticeOriginName  }">
		                    	첨부파일이 없습니다.
		                    	</c:when>
		                    	<c:otherwise>
		                     	   <a href="${n.noticeChangeName }" download="${n.noticeOriginName }">${n.noticeOriginName }</a>
		                     	 </c:otherwise>
		                        </c:choose>
		                    </td>
		                </tr>             
		           </table>
		           <br><br>
		           <a class="btn btn-secondary" style="float:right" href="list.no">목록으로</a>
        		</div>
     	</div>
   	</div>
     <jsp:include page="../common/mainFooter.jsp"/>		
</body>
</html>