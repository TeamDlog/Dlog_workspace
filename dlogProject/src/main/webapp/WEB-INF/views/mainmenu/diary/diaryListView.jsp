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
                             <!--  검색  -->
                             
                             <br><br>
                             
								
                              <!-- 목록 -->
                              
                              <table class="table table-hover" id="list"> 
                                  <thead align="center">
                                      <tr>
                                          <th>&nbsp;&nbsp;</th>
                                          <th>글번호</th>
                                          <th width="500px">글제목</th>
                                          <th>조회수</th>
                                          <th>작성일</th>
                                        </tr>
                                  </thead>
                                  <tbody align="center">
                                  	 <c:if test="${ empty list }">
                                      	<td colspan="4">조회된 글이 없습니다.</td>
                                      </c:if>
                                  	  <c:forEach var="d" items="${ list }">
	                                      <tr>
	                                    	  <c:choose>
                                              <c:when test="${ loginUser.memberNo == loginUser.diaryMemberNo }">
	                                         <td><input type="checkbox" id="diaryNo" name="diaryNo" value="${ d.diaryNo }" onclick="event.stopPropagation();" value="${ d.diaryNo }"  style="width: 15px; height: 15px;" ></td>
	                                          </c:when>
                                              	<c:otherwise>
                                            	</c:otherwise>
                                              </c:choose>  
                                              <td class="dno">${ d.diaryNo }</td>
	                                          <td>${ d.diaryTitle }</td>
	                                          <td>${ d.diaryCount }</td>
	                                          <td>${ d.diaryDate }</td>
	                                      </tr>
                                      </c:forEach>
                                      
                                  </tbody>
                              </table>
                                      
                            	<script>
	                           	$("#list>tbody>tr").click(function(){
	                           		location.href="detail.di?dno="+ $(this).children(".dno").text(); 		
	           				     });
	           					</script>
                              <br>
                              <!-- 페이징 -->
                              <table align="center">
                             <c:if test = "${ !empty list }">
                            	  <tr>
                                      <td width="1100" align="center"></td>
                                      <td width="600">
                                          <ul class="pagination justify-content-center">
                                           <c:choose>
						               		<c:when test="${ pi.currentPage eq 1 }">
							                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						               		</c:when>
						               		<c:otherwise>
							                    <li class="page-item"><a class="page-link" href="list.di?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						               		</c:otherwise>
						                   </c:choose>
	
						                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						                   	<li class="page-item"><a class="page-link page-number" href="list.di?currentPage=${ p }">${ p }</a></li>
						                   </c:forEach>
	
						                   <c:choose>
						               		<c:when test="${ pi.currentPage eq pi.maxPage }">
							                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
						               		</c:when>
						               		<c:otherwise>
						                   		<li class="page-item"><a class="page-link" href="list.di?currentPage=${ pi.currentPage+1 }">Next</a></li>
						               		</c:otherwise>
						                   </c:choose>
                                          </ul>
                                      </td>
                                      <td>
                                      <div align="right" style="width:300px;">
                             				<button class="btn btn-success btn-sm" onclick="location.href='enrollForm.di';">글쓰기</button>
                            				 <a id="checkDelete" type="button"  class="btn btn-secondary btn-sm">삭제</a>
                         				</div>
                                      </c:if>
                                       <c:if  test = "${ empty list and loginUser.memberNo eq loginUser.diaryMemberNo  }">
	                                      <div align="right" style="width:300px;">
                             				<button class="btn btn-success btn-sm" onclick="location.href='enrollForm.di';">글쓰기</button>
                            				 <a id="checkDelete" type="button" class="btn btn-secondary btn-sm">삭제</a>
                         				 </div>
	                                   </c:if>
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
	
	<script>
			$("#checkDelete").click(function(){
        		var dno = [];
        		$("input[name=diaryNo]:checked").each(function(){
        			dno.push($(this).val());
        			console.log(dno);
        		});
        	
        		if(dno.length != 0){
        			if(confirm("정말로 삭제하시겠습니까?")){
        				location.href="delete.di?dno=" + dno;
        			}
        		}else{
        			alert("선택된 게시글이 없습니다.");
        		}
        	});
			    
			$(".table table-hover>tbody>tr").click(function(){
		    	var dno = $(this).children(".dno"); // 아래
			 	location.href="detail.di?dno="+ dno;    	
		     });
			
			$(function(){
				$(".page-link").each(function(){
					if($(this).text()==${ pi.currentPage }){
						$(this).css({"background":"rgb(132,200,185)", "color":"white"});
					};
				});
			});
			
			<!--
			//체크박스 선택시
         	const Delete = function(){
         		var check_length = document.getElementsByName("diaryNo").length;
                var check_cnt = 0;
                var dno = "";
                for(var i=0; i<check_length; i++){
                   if(document.getElementsByName("diaryNo")[i].checked==true){
                      check_cnt++;
                      if(check_cnt==1){
                    	  dno = document.getElementsByName("diaryNo")[i].parentNode.nextSibling.nextSibling.textContent;
                      }else{
                     	  dno += ","+document.getElementsByName("diaryNo")[i].parentNode.nextSibling.nextSibling.textContent;
                      }
                   }
                }
                console.log(dno);
                if(check_cnt == 0){
                   alert("삭제할 게시글을 선택해 주세요 !");
                }else{
                   location.href= "delete.di?dno="+dno;
                }
         		
         	};
			-->
			
  </script>

</body>
</html>