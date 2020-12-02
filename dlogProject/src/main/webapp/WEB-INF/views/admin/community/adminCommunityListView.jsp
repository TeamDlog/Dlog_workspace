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
	
	<jsp:include page="../../common/adminHeader.jsp" />
	
	
    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body" style="float: left;">
        <div class="row page-titles mx-0">
            <h3 style="color:rgb(94, 94, 94); padding-left: 15px;">커뮤니티 관리</h3>
        </div>
        <!-- row -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card" style="width:900px;">
                        <div class="card-body">
                            <h4 class="card-title">게시글 목록</h4>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover zero-configuration" id="listTable" style="table-layout:fixed;">
                                    <thead>
                                        <tr>
                                        	<th width="15"><input type="checkbox" name="chkAll"></th>
                                            <th width="30">번호</th>
                                            <th width="135">글 제목</th>
                                            <th>작성자</th>
                                            <th width="43">조회수</th>
                                            <th width="43">추천수</th>
                                            <th width="43">댓글수</th>
                                            <th width="55">작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="fn" items="${ list }">
                                    		<tr>
                                    			<td><input type="checkbox" name="chk"></td>
                                                <td>${ fn.freenoteNo }</td>
                                                <td style="overflow:hidden; white-space: nowrap;text-overflow: ellipsis;">${ fn.freenoteTitle }</td>
                                                <td>${ fn.memberId }</td>
                                                <td>${ fn.freenoteCount }</td>
                                                <td>${ fn.freenoteLike }</td>
                                                <td>${ fn.replyCount }</td>
                                                <td>${ fn.createDate }</td>
                                            </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                               	<div align="right" style="margin-top: 5px; padding-right:16px;">
	                                <input class="btn btn-primary" type="button" value="삭제" onclick="confirmDelete();">
                               	</div>
                               	<br>
                            </div>
                            <script>
                            	
                            	$(function(){
                            		$("#listTable>tbody>tr").find("td:eq(2)").each(function(){
                            			$(this).css("cursor", "pointer");
                            			$(this).click(function(){
                            				location.href="adminDetail.co?fno=" + $(this).prev().text();
                            			});
                            		});
                            	});
                            	
                            	function confirmDelete(){
                            		var chkArr = [];
                            		$("input[name=chk]:checked").each(function(){
                            			chkArr.push($(this).parent().next().text());
                            		});
                            		
                            		if(chkArr.length > 0){
	                            		if(confirm("정말로 삭제하시겠습니까?")){
	                            			location.href="adminDelete.co?arr=" +chkArr;
	                            		}
                            		}else{
                            			alert('선택된 항목이 없습니다.');
                            		}
                            	}
                            	
                            	$("input[name=chkAll]").change(function(){
                            		$("input[name=chk]").prop("checked", this.checked);
                            	})
                            </script>
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
    
    
	<jsp:include page="../../common/diaryFooter.jsp" />

</body>
</html>