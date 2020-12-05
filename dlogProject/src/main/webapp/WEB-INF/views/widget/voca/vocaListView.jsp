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
<link href="resources/css/styles.css" rel="stylesheet" />

<style>
input[type="checkbox"]:after {
  line-height: 1.5em;
  content: '';
  display: block;
  width: 20px;
  height: 20px;
  margin-top: -3px;
  margin-left: -3px;
  border: 1px solid #EAEAEA;
  background: #fff;
  line-height: 1.3; }

input[type="checkbox"]:checked:after {
  width: 20px;
  height: 20px;
  display: block;
  content: "\f00c";
  font-family: 'FontAwesome';
  color: #7571f9;
  font-weight: 100;
  text-align: center; }

modal-backdrop {
    background-color: rgba(0,0,0,.0001) !important;
}
</style>
</head>
<body>

	<jsp:include page="../../common/diaryHeader.jsp" />
	
	<!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
			        <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">단어장</h3>
			    </div>
                <!-- row -->

                <div class="container-fluid" style="padding-top: 0px;">
                    <div class="row">
                        <div class="col-12">
                            <div class="card backgroundColor" style="width:900px; min-height:500px">
                                <div class="card-body" >
                                    <div class="table-responsive">

                                        <!-- 검색영역 -->
                                        <table>
                                            <tr>
                                                <td>
                                                    <form action="search.vo" method="post" class="form-inline">
                                                    <input type="hidden" name="vocaWriter" value="${ loginUser.memberNo }">
                                                        <input type="text" id="keyword" name="keyword" style="width: 200px; height: 28px; border: .1px solid lightgrey; border-radius: 4px;">
                                                        <button type="submit" class="btn btn-secondary btn-sm" style="background-color: #84c8b9; border-color: #84c8b9;"><i class="fa fa-search"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                             <c:choose>
	                                            <c:when test="${ loginUser.memberNo == loginUser.diaryMemberNo }">
		                                            <tr>
		                                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModalCenter" style="float: right;">+</button>
		                                                
		
		                                                <button id="checkDelete" type="button" class="btn btn-secondary btn-sm" style="float: right; margin-right: 10px;">삭제</button>
		                                            </tr>
	                                            </c:when>
                                            </c:choose>
                                        </table>
                                        
                                        <br>
    
                                        <table style="text-align: center; width: 100%;">
                                            <tr style="background-color: rgb(241, 240, 240); color: rgb(95, 94, 94); height: 40px;">
                                                <c:choose>
                                                	<c:when test="${ loginUser.memberNo == loginUser.diaryMemberNo }">
                                                		<th width="10%">No.</th>
                                                		<th width="40%">단어</th>
                                                		<th width="40%">뜻</th>
                                                		<th>삭제</th>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<th width="10%">No.</th>
                                                		<th width="40%">단어</th>
                                                		<th width="40%">뜻</th>
                                                	</c:otherwise>
                                                </c:choose>
                                            </tr>
                                            <c:choose>
	                                            <c:when test="${ empty list }">
	                                            	<tr style="height: 40px;">
			                                        	<td colspan="4"><h6>등록된 단어가 없습니다.</h6></td>
			                                        </tr>
	                                            </c:when>
	                                            <c:otherwise>
		                                            <c:forEach var="vo" items="${ list }" varStatus="status">
			                                            <tr style="height: 40px;">
			                                                <td>${ (pi.listCount - status.index)-((pi.currentPage-1)*10) }</td>
			                                                <td>${ vo.vocaWord }</td>
			                                                <td>${ vo.vocaMean }</td>
			                                                <c:choose>
			                                                	<c:when test="${ loginUser.memberNo == loginUser.diaryMemberNo }">
			                                                		<td><input type="checkbox" id="vocaNo" name="vocaNo" value="${ vo.vocaNo }"></td>
			                                                	</c:when>
			                                                	<c:otherwise>
			                                              		</c:otherwise>
			                                                </c:choose>
			                                            </tr>
		                                            </c:forEach>
		                                        </c:otherwise>
                                            </c:choose>
                                        </table>
                                        
                                        <br>

                                        <c:choose>
                                        	<c:when test="${ empty list }">
                                        		
                                        	</c:when>
                                        	<c:otherwise>
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
		                                                    	<c:when test="${ pi.currentPage == p}">
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
	                                        </c:otherwise>
                                        </c:choose>

                                    </div>  
                                    
                                </div>
                            </div>
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
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>        
            <!--**********************************
                Content body end
            ***********************************-->
             
            <script>
				
            /*
            	function checkDelete(){
            		var vocaArr = new Array();
            		var list = $("input[name=vocaNo]");
            		for(var i = 0; i<list.length; i++){
            			if(list[i].checked){
            				vocaArr.push(list[i].value);
            				console.log(list[i].value);
            			}
            		}
            		
            		if(vocaArr.length == 0){
            			alert("선택된 글이 없습니다.");
            		}else{
            			
            			var chk = confirm("정말 삭제하시겠습니까?");
            			$.ajax({
            				url:"delete.vo",
            				data:{vocaArr:vocaArr},
            				success:function(result){
            					if(result = 1){
            						location.replace("list.vo");
            					}else{
            						alert("실패");
            					}
            				},error:function(){
            					console.log("ajax통신 실패");
            				}
            			})
            		}
            	}
            	*/
            	
            	$("#checkDelete").click(function(){
            		var chkArr = [];
            		$("input[name=vocaNo]:checked").each(function(){
            			chkArr.push($(this).val());
            			console.log(chkArr);
            		});
            	
            		if(chkArr.lenght != 0){
            			if(confirm("정말로 삭제하시겠습니까?")){
            				location.href="delete.vo?arr=" + chkArr;
            			}
            		}else{
            			alert("선택된 단어가 없습니다.");
            		}
            	})
            </script>
	
	<jsp:include page="../../common/diaryWidget.jsp" />
	<jsp:include page="../../common/diaryFooter.jsp" />

</body>
</html>