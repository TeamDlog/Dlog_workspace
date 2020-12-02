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
</head>
<body>

	<jsp:include page="../../common/diaryHeader.jsp" />
	
	<!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); margin: 0px;">프리노트</h3>
                </div>
                <!-- row -->

                <div class="container-fluid" style="padding-top: 0px;">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:900px;">
                                <div class="card-body backgroundColor" >
                                    <div class="table-responsive">

                                        <!-- 검색영역 -->
                                        <table>
                                            <tr>
                                                <td>
                                                    <form action="" class="form-inline">
                                                    <input type="hidden" name="vocaWriter" value="${ loginUser.memberNo }">
                                                        <input type="text" style="width: 200px; height: 28px; border: .1px solid lightgrey; border-radius: 4px;">
                                                        <button type="submit" class="btn btn-secondary btn-sm" style="background-color: #84c8b9; border-color: #84c8b9;"><i class="fa fa-search"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <tr>
                                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModalCenter" style="float: right;">+</button>
                                                <div class="modal fade" id="exampleModalCenter">
                                                    <div class="modal-dialog modal-dialog-centered" role="document" style="width: 300px;">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">단어추가</h5>
                                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                                                </button>
                                                            </div>
                                                            <form action="enroll.vo" method="post">
                                                            <input type="hidden" name="vocaWriter" value="${ loginUser.memberNo }">
	                                                            <div class="modal-body">
	                                                                <h6>단어</h6>
	                                                                <input type="text" class="form-control" id="vocaWord" name="vocaWord" required>
	
	                                                                <br>
	
	                                                                <h6>뜻</h6>
	                                                                <input type="text" class="form-control" id="vocaMean" name="vocaMean" required>
	                                                            </div> 
	                                                            <div class="modal-footer">
	                                                                <button type="submit" class="btn btn-primary" style="background-color: #84c8b9; border-color: #84c8b9;">등록하기</button>
	                                                            </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="button" class="btn btn-secondary btn-sm" style="float: right; margin-right: 10px;">삭제</button>
                                            </tr>
                                        </table>
                                        
                                        <br>
    
                                        <table style="text-align: center; width: 100%;">
                                            <tr style="background-color: rgb(241, 240, 240); color: rgb(95, 94, 94); height: 40px;">
                                                <th width="10%">No.</th>
                                                <th width="40%">단어</th>
                                                <th width="40%">뜻</th>
                                                <th>삭제</th>
                                            </tr>
                                            <c:forEach var="vo" items="${ list }" varStatus="status">
	                                            <tr style="height: 40px;">
	                                                <td>${ status.count }</td>
	                                                <td>${ vo.vocaWord }</td>
	                                                <td>${ vo.vocaMean }</td>
	                                                <td><input type="checkbox"></td>
	                                            </tr>
                                            </c:forEach>
                                        </table>
                                        
                                        <br>

                                        
                                        <table align="center">
                                            <tr>
                                                <td width="100" align="center"></td>
                                                <td width="600">
                                                    <ul class="pagination justify-content-center" style="margin-bottom: 0px;">
                                                    <c:choose>
                                                    	<c:when test="${ pi.currentPage eq 1 }">
	                                                        <li class="page-item disabled">
	                                                            <a class="page-link" href="#">Previous</a>
	                                                        </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        	<li class="page-item">
	                                                            <a class="page-link" href="list.vo?currentPage=${ pi.currentPage-1 }">Previous</a>
	                                                        </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    
                                                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                                    <c:choose>
                                                    	<c:when test="${ currentPage == p}">
	                                                        <li class="page-item active">
	                                                            <a class="page-link" href="list.vo?currentPage=${ p }">${ p }</a>
	                                                        </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        	<li class="page-item">
	                                                            <a class="page-link" href="list.vo?currentPage=${ p }">${ p }</a>
	                                                        </li>
                                                        </c:otherwise>
                                                    </c:choose>
													</c:forEach>
													
													<c:choose>
														<c:when test="${ pi.currentPage eq pi.maxPage }">
	                                                        <li class="page-item disabled">
	                                                            <a class="page-link" href="#">Next</a>
	                                                        </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        	 <li class="page-item">
	                                                            <a class="page-link" href="list.vo?currentPage=${ pi.currentPage+1 }">Next</a>
	                                                        </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    </ul>
                                                </td>
                            
                                            </tr>
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
	
	<jsp:include page="../../common/diaryWidget.jsp" />
	<jsp:include page="../../common/diaryFooter.jsp" />

</body>
</html>