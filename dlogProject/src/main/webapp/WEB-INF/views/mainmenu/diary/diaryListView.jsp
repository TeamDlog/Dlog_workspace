<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<style>
a {
	cursor:pointer;
}
</style>
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
          <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">다이어리</h3>
      </div>

      <!-- row -->

      <div class="container-fluid">
          <div class="row">
              <div class="col-12">
                  <div class="card" style="width:900px; min-height:500px;">
                      <div class="card-body backgroundColor" >
                          <div class="table-responsive">
                              
                              <br><br>
								
                              <!-- 목록 -->
                              
                              <table class="table table-hover" id="list"> 
                                  <thead align="center">
                                      <tr>
                                          <th>글번호</th>
                                          <th width="500px">글제목</th>
                                          <th>작성일</th>
                                          <th>&nbsp;&nbsp;</th>
                                      </tr>
                                  </thead>
                                  <tbody align="center">
                                  	  <c:forEach var="d" items="${ list }">
	                                      <tr>
	                                          <td >${ d.diaryNo }</td>
	                                          <td>${ d.diaryTitle }</td>
	                                          <td>${ d.diaryDate }</td>
	                                          <c:if test="${ loginUser.memberNo eq loginUser.diaryMemberNo }">
	                                          <td><a onclick="diaryUpdate(this); event.stopImmediatePropagation();">수정</a>&nbsp;&nbsp;
												  <a onclick="diaryDelete(this); event.stopImmediatePropagation();">삭제</a></td>
											</c:if>  
	                                      </tr>
                                      </c:forEach>
                                      <c:if test="${ empty list }">
                                      	<td colspan="4">조회된 글이 없습니다.</td>
                                      </c:if>
                                  </tbody>
                              </table>
                                      
                            	<script>
	                           	$("#list>tbody>tr").click(function(){
	           				    	var dno = $(this).children().eq(0).text();
	           					 	location.href="detail.di?dno="+ $(this).children().eq(0).text();    	
	           				     });
	           					</script>
                              <br>
                              <!-- 페이징 -->
                              <table align="center">
                             <c:if test = "${ !empty list }">
                            	  <tr>
                                      <td width="100" align="center"></td>
                                      <td width="600">
                                          <ul class="pagination justify-content-center">
                                          
                                          <c:choose>
						               		<c:when test="${ pi.currentPage eq 1 }">
							                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						               		</c:when>
						               		<c:otherwise>
							                    <li class="page-item"><a class="page-link" href="selectList.ph?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						               		</c:otherwise>
						                   </c:choose>
	
						                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						                   	<li class="page-item"><a class="page-link page-number" href="selectList.ph?currentPage=${ p }">${ p }</a></li>
						                   </c:forEach>
	
						                   <c:choose>
						               		<c:when test="${ pi.currentPage eq pi.maxPage }">
							                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
						               		</c:when>
						               		<c:otherwise>
						                   		<li class="page-item"><a class="page-link" href="selectList.ph?currentPage=${ pi.currentPage+1 }">Next</a></li>
						               		</c:otherwise>
						                   </c:choose>
                                          </ul>
                                      </td>
                                      <td>
                                      <c:if test="${ loginUser.memberNo eq loginUser.diaryMemberNo }">
                                      <div width="300" align="right" style="margin-left:75%;">
                                          <button class="btn btn-success" onclick="location.href='enrollForm.di';">글쓰기</button>
                                      </div>
                                      </c:if>
                                      <c:if test="${ loginUser.memberNo eq loginUser.diaryMemberNo }">
                                      <div width="300" align="right" style="margin-left:75%;">
                                          <button class="btn btn-success" onclick="location.href='enrollForm.di';">글쓰기</button>
                                      </div>
                                      </c:if>
                                      </td>
                                      </c:if>
                                      
	                                      <c:if  test = "${ empty list }">
	                                      
	                                      <div width="300" align="right" style="margin-left:75%;">
	                                          <button class="btn btn-success" onclick="location.href='enrollForm.di';">글쓰기</button>
	                                      </div>
	                                       
	                                      </c:if>
                                      
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
	
	<script>
    	
			const diaryUpdate = function(e){
			   var answer = confirm("수정하시겠습니까 ?");
			   if(answer){
			    console.log(e.parentNode)
			   var dno = e.parentNode.parentNode.childNodes[1].textContent;
			   location.href="updateForm.di?dno="+dno;
			    }else{
			      return;
			    }
			    	};
			    		
			const diaryDelete =  function(e){
			    var answer = confirm("삭제하시겠습니까 ?");
			    if(answer){
			       var dno = e.parentNode.parentNode.childNodes[1].textContent;
			           // 삭제 진행
			       location.href="delete.di?dno="+dno;
			     }else{
				return;
			     }
			    };
			    
			$(".table table-hover>tbody>tr").click(function(){
		    	var dno = $(this).children(".dno"); // 아래
			 	location.href="detail.di?dno="+ dno;    	
		     });
			
		</script>

</body>
</html>