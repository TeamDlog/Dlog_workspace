<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
<style>
    .pagination .active>a{
        background: #7571f9 !important; 
    }
</style>
</head>
<body>
	
	<jsp:include page="../common/adminHeader.jsp" />
	
	
    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body" style="float: left;">
        <div class="row page-titles mx-0">
            <h3 style="color:rgb(94, 94, 94); padding-left: 15px;">회원 관리</h3>
        </div>
        <!-- row -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card" style="width:900px;">
                        <div class="card-body">
                            <h4 class="card-title">회원조회</h4>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover zero-configuration" id="listTable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>아이디</th>
                                            <th>별명</th>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                            <th>가입일</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="me" items="${ list }" varStatus="status">
                                    		<tr>
                                                <td>${ status.index }</td>
                                                <td>${ me.memberId }</td>
                                                <td>${ me.nickname }</td>
                                                <td>${ me.memberName }</td>
                                                <td>${ me.email }</td>
                                                <td>${ me.phone }</td>
                                                <td>${ me.enrollDate }</td>
                                                <c:choose>
                                                	<c:when test="${ me.status eq 'Y'}">
                                               	 		<td>회원</td>
                                               	 	</c:when>
                                               	 	<c:otherwise>
                                               	 		<td>탈퇴</td>
                                               	 	</c:otherwise>
                                                </c:choose>
                                            </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
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
    
    
	<jsp:include page="../common/diaryFooter.jsp" />

</body>
</html>