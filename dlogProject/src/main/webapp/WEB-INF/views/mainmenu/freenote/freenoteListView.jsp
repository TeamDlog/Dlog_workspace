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
	.freenoteTitle:hover{
		cursor:pointer;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/diaryHeader.jsp" />
	
	<script>
		$(function(){
			$(".metismenu a[href*='list.fn']").addClass("active");
			$(".metismenu a[href*='list.fn']").parent().addClass("active");
		});
	</script>
	
	<!--**********************************
	             Content body start
	***********************************-->
	<div class="content-body" style="float: left;">
	    <div class="row page-titles mx-0">
	        <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">프리노트</h3>
	    </div>
	    <!-- row -->
	
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-12">
	                <div class="card backgroundColor" style="width:900px; min-height:500px;">
	                    <div class="card-body backgroundColor" >
	                        <div class="table-responsive">
	                            <!-- 검색영역 -->
	                            <table>
	                                <tr>
	                                    <td width="700">
                                            <input type="text" name="keyword" style="width: 200px; height: 30px; border: .1px solid lightgrey; border-radius: 4px; padding-left:5px;">
                                            <button type="button" class="btn btn-secondary btn-sm" id="searchBtn"><i class="fa fa-search"></i></button>
	                                    </td>
	                                    <td width="100" align="right">
	                                        <select name="category" style="height: 30px; border: .1px solid lightgrey; border-radius: 4px;">
	                                        </select>
	                                    </td>
	                                     <td width="60" align="right">
	                                        <select name="boardLimit" style="height: 30px; border: .1px solid lightgrey; border-radius: 4px;" id="boardLimitArea">
	                                        </select> 
	                                    </td>
	                                </tr>
	                            </table>
	                           
	                            
	                            <br>
	
	                            <!-- 목록 -->
	                            <table class="table table-hover" id="listArea">
	                                <thead align="center">
	                                    <tr>
	                                        <th>번호</th>
	                                        <th width="500px">제목</th>
	                                        <th>카테고리</th>
	                                        <th>댓글수</th>
	                                        <th>작성일</th>
	                                    </tr>
	                                </thead>
	                                <tbody align="center">
	                                </tbody>
	                            </table>
	                            <br>
	                            <!-- 페이징 -->
	                            <table align="center">
	                                <tr>
	                                    <td width="100" align="center"></td>
	                                    <td width="650">
	                                        <ul class="pagination justify-content-center">
	                                        </ul>
	                                    </td>
	                                    <td width="100" align="right">
	                                    	<c:if test="${ loginUser.memberNo eq loginUser.diaryMemberNo }">
	                                       		<button class="btn btn-success" onclick="location.href='enrollForm.fn';">글쓰기</button>
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
	
	<script>
		// 글 상세보기
		$(function(){
	 		$("#listArea>tbody").on("click", "tr", function(){
					if($(this).find("td:eq(1)").next().val() == 'Y' || $(this).find("td:eq(1)").prev().val() == '${loginUser.memberNo}'){
	 				location.href="detail.fn?fno=" + $(this).find("td:eq(0)").text();
					}else{
						alert("비공개 글 입니다.");
					}
	 		});
	 	});
		 
	 	// 검색
    	$("#searchBtn").click(function(){
    		var $keyword = $("input[name=keyword]").val();
    		var $boardLimit = $("select[name=boardLimit]").val();
    		var $category = $("select[name=category]").val();
   			freenoteList(1, $category, $boardLimit, $keyword);
    	});
    
	 	// 분류
    	$(function(){
    		$(".content-body select").change(function(){
    			var $keyword = $("input[name=keyword]").val();
    			var $boardLimit = $("select[name=boardLimit]").val();
    			var $category = $("select[name=category]").val();
    			freenoteList(1, $category, $boardLimit, $keyword);
    		});
    	});

	 	// 페이징
    	function pageNo(cp){
    		var $keyword = $("input[name=keyword]").val();
    		var $boardLimit = $("select[name=boardLimit]").val();
    		var $category = $("select[name=category]").val();
    		freenoteList(cp, $category, $boardLimit, $keyword);
    	}

    	// 리스트 및 각 요소 불러오는 ajax
    	$(function(){
			freenoteList(1, '', 10, '');
		});
		
		function freenoteList(cPage, category, boardLimit, keyword){
			$.ajax({
				url:"flist.fn",
				data:{
					mno:${loginUser.diaryMemberNo},
					currentPage:cPage,
					category:category,
					boardLimit:boardLimit,
					keyword:keyword
				}, success:function(result){
					
					$("input[name=keyword]").val(result.sc.keyword);
					
					var category = "<option value=''>전체</option>";
					for(var i in result.cateList){
						if(result.cateList[i] == result.sc.category){
							category += "<option value='" + result.cateList[i] + "' selected='selected'>" + result.cateList[i] + "</option>";
						}else{
							category += "<option value='" + result.cateList[i] + "'>" + result.cateList[i] + "</option>";
						}
					}
					$("select[name=category]").html(category);
					
					var boardLimit = "";
					var blist = [5, 10, 15, 20];
					for(var i in blist){
						if(blist[i] == result.sc.boardLimit){
							boardLimit += "<option value='" + blist[i] + "' selected='selected'>" + blist[i] + "줄</option>";
						}else{
							boardLimit += "<option value='" + blist[i] + "'>" + blist[i] + "줄</option>";
						}
					}
					$("#boardLimitArea").html(boardLimit);
					
					if(result.list.length>0){
						var list = "";
						for(i in result.list){
		                	list += "<tr>" +
				                        "<td>" + result.list[i].freenoteNo + "</td>" +
				                        "<input type='hidden' value='" + result.list[i].memberNo + "'>" +
				                        "<td class='freenoteTitle'>" + result.list[i].freenoteTitle + "&nbsp;";
				            if(result.list[i].freenotePrivacy == 'N'){
                        		list += "<span class='badge badge-pill badge-light'>&nbsp;비공개&nbsp;</span>";
				            }
				            list +=     "</td>" +
				                		"<input type='hidden' value='" + result.list[i].freenotePrivacy + "'>" +
				                        "<td>" + result.list[i].freenoteCategory + "</td>" +
				                        "<td>" + result.list[i].replyCount + "</td>" +
				                        "<td>" + result.list[i].createDate + "</td>" +
				                    "</tr>";
						}
						$("#listArea>tbody").html(list);
						
						var $listCount = result.pi.listCount;     	       					
 	       				var $currentPage = result.pi.currentPage;
                        var $startPage = result.pi.startPage;
                        var $endPage = result.pi.endPage;
                        var $maxPage = result.pi.maxPage;
						
                        var paging ="";
    					if($currentPage != "1"){
    						paging += "<li class='page-item'><a class='page-link' onclick='pageNo(" + ($currentPage - 1) + ");'>Previous</a></li>";
    					}
    					for(var $p = $startPage; $p <= $endPage; $p++){
    						if($p == $currentPage){
    							paging += "<li class='page-item active'><a class='page-link'>" + $p + "</a></li>";
    						}else{
    							paging += "<li class='page-item'><a class='page-link' onclick='pageNo(" + $p + ");'>" + $p + "</a></li>";
    						}
    					}
    					if($currentPage != $maxPage){
    						paging += "<li class='page-item'><a class='page-link' onclick='pageNo(" + ($currentPage + 1) + ");'>Next</a></li>";
    					}
    					$(".container-fluid .pagination").html(paging);
    					
					}else{
						$("#listArea>tbody").html("<td colspan='5'>조회된 글이 없습니다.</td>");
						$(".container-fluid .pagination").html("");
					}
					
				}, error:function(){
					console.log("프리노트 목록 ajax 통신 실패");
				}
			});
		}
	</script>
	
	     
	<!--**********************************
	    Content body end
	***********************************-->
	<jsp:include page="../../common/diaryWidget.jsp" />
	<jsp:include page="../../common/diaryFooter.jsp" />
	
</body>
</html>