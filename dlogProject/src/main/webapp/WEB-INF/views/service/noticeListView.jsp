<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
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
	                <table id="boardList" class="table">
		                <c:choose>
		                <c:when test="${ empty list }">
		                	<tr>
			            		<td colspan="3">조회된 리스트가 없습니다.</td>
			            	</tr>
		                </c:when>
		                <c:otherwise>
		                	<thead>
			                  <tr>
			                    <th>번호</th>
			                    <th>제목</th>	               
			                    <th>등록일</th>
			                  </tr>
			                </thead>
			                <tbody>
			                	<c:forEach var="n" items="${list}">
			                    <tr>
			                        <td class="bno">${n.noticeNo}</td>
			                        <td>${n.noticeTitle }</td>
			                        <td>${n.noticeDate }</td>
				                    </tr>
			                    </c:forEach>
			                </tbody>
		                </c:otherwise>
		                </c:choose>
	                </table>
	                <script>
						$(function(){
							$("#boardList tbody tr").click(function(){
								location.href="detail.no?bno=" + $(this).children(".bno").text();
							})
						});
					</script>
					<br><br>
    				<div class="bootstrap-pagination" >
		                <ul class="pagination">
		                    
		                    <c:choose>
		                    <c:when test="${pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage-1}">Previous</a></li>
		                    </c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
		                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${p}">${p}</a></li>
		                  	</c:forEach>
		                    
		                    <c:choose>
		                    <c:when test="${pi.currentPage eq pi.maxPage }" >
		                    	<li class="page-item disabled"><a class="page-link" href="#">next</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage+1 }">Next</a></li>
		                    </c:otherwise>
		                    </c:choose>
		                </ul>
            		</div>
           
		            <br clear="both"><br>
		            		
		            <form id="searchForm" action="searchlist.no" method="get" align="center">
		                <div class="select">
		                    <select class="custom-select" name="condition">  
		                        <option value="title">제목</option>
		                        <option value="content">내용</option>
		                    </select>
		                </div>
		                <div class="text">
		                    <input type="text" class="form-control" name="keyword">
		                </div>
		                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
		            </form>
			</div>
	</div>
	
</div>
<jsp:include page="../common/mainFooter.jsp"/>		
</body>
</html>