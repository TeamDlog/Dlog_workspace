<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Dlog</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
    <!-- Custom Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
<style>
#noticeUpdate{float:right;}
.bootstrap-pagination{width:fit-content;margin:auto;}
#listTable>tbody>tr:hover{cursor:pointer;}
</style>
</head>

<body>

   	<jsp:include page="../common/adminHeader.jsp" />

            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px;">공지사항</h3>
                </div>
                <!-- row -->

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:900px;">
                                <div class="card-body" >
                                    
                                <!-- 여기다가 작성 -->
                                	<div id="noticeUpdate">
					                    <input class="btn btn-primary btn-sm" type="button" value="삭제" data-toggle="modal" data-target="#deleteForm">
				                		<input class="btn btn-primary btn-sm" type="button" value="작성" onclick="location.href='enrollForm.no';">
					                </div>
					               <div class="table-responsive">
									<table id="listTable" class="table table-striped table-bordered table-hover zero-configuration">
						                <c:choose>
						                <c:when test="${ empty list }">
						                	<tr>
							            		<td colspan="3">조회된 리스트가 없습니다.</td>
							            	</tr>
						                </c:when>
						                <c:otherwise>
						                	<thead>
							                  <tr>
							                  	<th><input type="checkbox" name="chkAll" ></th>
							                    <th>번호</th>
							                    <th>제목</th>	               
							                    <th>작성일</th>
							                  </tr>
							                </thead>
							                <tbody>
							                	<c:forEach var="n" items="${list}">
							                    <tr>
							                    	<td onclick="event.cancelBubble=true"><input type="checkbox" name="chkRow" ></td>
							                        <td class="bno">${n.noticeNo}</td>
							                        <td>${n.noticeTitle }</td>
							                        <td>${n.noticeDate }</td>
								               </tr>
							                    </c:forEach>
							                </tbody>
						                </c:otherwise>
						                </c:choose>
					                </table>
					         		</div>
								     
					              
									<br><br>
				    		
				           		     <div class="modal" id="deleteForm">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                
								                    <div class="modal-header" style="padding-left:100px;">
								                    	<div class="modal-title">삭제 하시겠습니까?</div>
								                    </div>
								                    
								                    <div class="modal-body" align="center">
								                       
								                            <a href="#"  class="btn btn-secondary" role="button" id="btnAgree">확인</a>
								                            <a href="#"  class="btn btn-danger" role="button" onclick="location.href='adminNoticeList.no';">취소</a>
								                    
								                    </div>
								                    
								                </div>
								            </div>
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
     

    <!--**********************************
        Scripts
    ***********************************-->
       <script>
	       $(document).ready(function() {
				
	    	
		    		$('#listTable tbody tr').click(function(){
						
		    			
		    				location.href="adminNoticeDetail.no?bno=" +  $(this).children(".bno").text();
		    		
		    		});
		    		
		    		
			    

	    	   
	       });
	       
	     	// delete
		   
			  	var arr=[];
			  	 $("#btnAgree").click(function(event) {
                        
			  		 $("input[name='chkRow']:checked").each(function() {
			    	    	arr.push($(this).closest("td").siblings(".bno").html());
			    	    });
			  		var array = arr.join();
			  		location.href="adminNoticeDelete.no?array="+array;
                        
                 });
			  	 
			  	$("input[name='chkAll']").on('change', function(){
				  	  $("input[name='chkRow']").prop('checked', this.checked);
				  	});
			    	
		    		 
			    	
		    
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    
    <jsp:include page="../common/diaryFooter.jsp" />
    
</body>

</html>