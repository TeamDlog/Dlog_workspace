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
	                    		FAQ
	                </div>
	                
	               <table align="center" class="table">
		                <thead> 
		                	<tr>
			                    <th>${f.faqTitle}</th>
			                    <th style="text-align:right">${f.faqDate} 조회 ${f.faqCount}</th>     
			                </tr>
		                </thead>
		               
		                <tr>
		                    <td colspan="4"><p style="height:350px">${f.faqContent }</p></td>
		                </tr>
		             
		           </table>
		           <hr>
		           <br><br>
		           <a class="btn btn-secondary" style="float:right" href="list.fo">목록으로</a>
        		</div>
     	</div>
   	</div>
     <jsp:include page="../common/mainFooter.jsp"/>	
</body>
</html>