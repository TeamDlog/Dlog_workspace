<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
	                 <form id="searchForm" action="searchlist.fo" method="get" align="center">
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
		            <br><br><br><br><br><br><br><br>
		           <p style="float:left; font-weight:bold; font-size:large;" >자주하는 질문</p>
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
			                    <th>질문</th>	               
			                  </tr>
			                </thead>
			                <tbody>
			                	<c:forEach var="f" items="${list}">
			                    <tr>
			                        <td class="bno">${f.faqNo}</td>
			                        <td>
			                        	<div class="titleDiv">${f.faqTitle }</div>
		                            	<div class="hideDiv">
		                            		<div>
		                            			►
		                            		</div>
		                            		<div class="contentDiv">
				                            	${f.faqContent }
		                            		</div>
		                            	</div>
			                        
			                        </td>
				                 </tr>
			                    </c:forEach>
			                </tbody>
		                </c:otherwise>
		                </c:choose>
	                </table>
	                <script>
						$(function(){
							 $(".hideDiv").hide();
							  $("td>div").click(function(){
					                var p = $(this).next();					   
					                if(p.css("display") == "none"){
					                    $(".hideDiv").not($(this)).slideUp();
					                    p.slideDown();
					                }else{
					                    p.slideUp();
					                }
					            });
						});
					</script>
					<br><br>
    			
 
		            		
		          
			</div>
	</div>
	
</div>
<jsp:include page="../common/mainFooter.jsp"/>		
</body>
</html>