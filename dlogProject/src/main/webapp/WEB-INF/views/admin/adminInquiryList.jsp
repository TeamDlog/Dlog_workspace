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
    <script src="resources/plugins/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    
<style>
#inuquiryProcess{float:right;}
.bootstrap-pagination{width:fit-content;margin:auto;}
#listTable>tbody>tr:hover{cursor:pointer;}
.pagination .active>a{background: #7571f9 !important;}
</style>
</head>

<body>
	<jsp:include page="../common/adminHeader.jsp" />
    
            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px;">문의글</h3>
                </div>
                <!-- row -->

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:900px;">
                                <div class="card-body" >
                                    
                                <!-- 여기다가 작성 -->
                                	<select id="inuquiryProcess" name="process">
								        <option value="">처리상태</option>
								        <option value="미처리">미처리</option>
								        <option value="처리완료">처리완료</option>
								    </select>
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
							                    <th>번호</th>
							                    <th>문의유형</th>	               
							                    <th>제목</th>
							                    <th>작성자</th>
							                    <th>작성일</th>
							                    <th>처리상태</th>
							                  </tr>
							                </thead>
							                <tbody>
							                	<c:forEach var="i" items="${list}">
							                    <tr>
							                    	<c:choose>
							                    	<c:when test="${i.inquiryProcess eq 'N'}">
							                        <td class="bno">${i.inquiryNo}</td>
							                        <td>${i.inquiryType }</td>
							                        <td>${i.inquiryTitle }</td>
							                        <td>${i.memberId }</td>
							                        <td>${i.inquiryDate}</td>
							  						<td>미처리</td>
							  						</c:when>
							  						<c:otherwise>
							                        <td class="bno">${i.inquiryNo}</td>
							                        <td>${i.inquiryType }</td>
							                        <td>${i.inquiryTitle }</td>
							                        <td>${i.memberId }</td>
							                        <td>${i.inquiryDate}</td>
							  						<td>처리완료</td>
							  						</c:otherwise>
							  						</c:choose>
								               </tr>
							                    </c:forEach>
							                </tbody>
						                </c:otherwise>
						                </c:choose>
					                </table>
					         		</div>
								     
					              
									<br><br>
				    				
				           			<!-- 삭제 버튼 클릭 시 보여질 Modal -->
								        <div class="modal" id="deleteForm">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                
								                    <div class="modal-header" style="padding-left:100px;">
								                    	<div class="modal-title">Are you sure to delete?</div>
								                    </div>
								                    
								                    <div class="modal-body" align="center">
								                       
								                            <a href="#"  class="btn btn-secondary" role="button" id="btnAgree">확인</a>
								                            <a href="#"  class="btn btn-danger" role="button" onclick="location.href='admininquiryList.no';">취소</a>
								                    
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
				
	    	
		    		$('#listTable td:not(:nth-child(1))').click(function(){
						
		    			
		    				location.href="adminInquiryDetail.io?bno=" + $(this).closest("td").siblings(".bno").text();
		    		
		    		});
		    		
		    	 
		    		  
		               $("#inuquiryProcess").change(function(){
		            	   searchTable($(this).val());
		                });
		              
	    	   
	       });
	       
	       function searchTable(inputVal) {
	    	     $('#listTable tr').each(function() {
	    	       var found = false;
	    	       if (inputVal == '') {
	    	         found = true;
	    	       }else if($(this).find("td:nth-child(6)").text()== inputVal){
	                   found=true;
	                }
	    	       if(found==true){
	    	    	   
	                    $(this).show();
	                }else{
	                    $(this).hide();
	                }
	    	     });
	    	}
	       
	     
		    		 
	</script>
	
	<jsp:include page="../common/diaryFooter.jsp" />
    
</body>

</html>