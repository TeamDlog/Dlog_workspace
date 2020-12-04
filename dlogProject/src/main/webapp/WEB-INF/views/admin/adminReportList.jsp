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
#reportProcess{float:right;}
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
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px;">신고관리</h3>
                </div>
                <!-- row -->

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:900px;">
                                <div class="card-body" >
                                    
                                <!-- 여기다가 작성 -->
                                	<select id="reportProcess" name="process">
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
							                    <th>글유형</th>	               
							                    <th>신고자</th>
							                    <th>신고유형</th>
							                    <th>신고사유</th>
							                    <th>작성일</th>
							                    <th>처리상태</th>
							                  </tr>
							                </thead>
							                <tbody>
							                	<c:forEach var="r" items="${list}">
							                    <tr>
							                    	<c:choose>
							                    	<c:when test="${r.reportProcess eq 'N'}">
							                        <td class="bno">${r.reportNo}</td>
							                        <td>${r.reportPostType }</td>
							                        <td>${r.memberId }</td>
							                        <td>${r.reportType }</td>
							                        <td>${r.reportContent }</td>
							                        <td>${r.reportDate}</td>
							  						<td>미처리</td>
							  						</c:when>
							  						<c:otherwise>
							                        <td class="bno">${r.reportNo}</td>
							                        <td>${r.reportPostType }</td>
							                        <td>${r.memberId }</td>
							                        <td>${r.reportType }</td>
							                        <td>${r.reportContent }</td>
							                        <td>${r.reportDate}</td>
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
						
		    				
		    				location.href="adminReportDetail.ro?bno=" + $(this).closest("td").siblings(".bno").text();
		    		
		    		});
		    		
		    	 
		    		  
		               $("#reportProcess").change(function(){
		            	   searchTable($(this).val());
		                });
		              
	    	   
	       });
	       
	       function searchTable(inputVal) {
	    	     $('#listTable tr').each(function() {
	    	       var found = false;
	    	       if (inputVal == '') {
	    	         found = true;
	    	       }else if($(this).find("td:nth-child(7)").text()== inputVal){
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