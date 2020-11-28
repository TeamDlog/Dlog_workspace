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
    
<style>
#a,#b{float:right; margin:5px;}
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
	                                 <table id="contentArea" align="center" class="table">
							          
							                <tr>
							                    <th width="100">글유형</th>
							                    <td colspan="3">${r.reportPostType }</td>
							  
							                </tr>
							                 <tr>
							                    <th>신고유형</th>
							                    <td>${r.reportType }</td>
							  
							                </tr>
							                 <tr>
							                    <th>신고자</th>
							                    <td>${r.memberId }</td>
							  
							                </tr>
							                 <tr>
							                    <th>신고사유</th>
							                    <td>${r.reportContent}</td>
							  
							                </tr>
							                 <tr>
							                    <th>날짜</th>
							                    <td>${r.reportDate }</td>
							  
							                </tr>
							                 <tr>
							                    <th>게시물링크</th>						                
							                    <td><a href="${r.reportLink }">${r.reportLink}</a></td>							  												  					
							                </tr>
							                <tr>
							                    <th>신고 내용</th>							              
							                    <td colspan="3"></td>
							                </tr>
							                <tr>
							                	<c:choose>
							                   	<c:when test="${r.reportPostType eq '댓글'}">
							                    <td colspan="4"><p style="height:200px text-align:center">${re.replyContent}</p></td>
							                  	</c:when>
							  					<c:otherwise>
							  					<td colspan="4"><p style="height:200px text-align:center">${fr.freenoteContent}</p></td>
							  					</c:otherwise>
							  					</c:choose>
							                </tr>
							             
							            </table>
							        <hr>
						           <br><br>
						        <form action="adminReportProcess.ro" method="post" id="b">
						         	<input type="hidden" name="reportNo" value="${r.reportNo }">
						         	<button class="btn mb-1 btn-rounded btn-primary" type="submit" >처리완료</button>
						         </form>
						      	<input class="btn mb-1 btn-rounded btn-primary" type="button" value="삭제" data-toggle="modal" data-target="#deleteForm" id="a">
						         
						         <form action="adminReportDelete.ro" method="post" >
						        	<c:choose>
						        	<c:when test="${r.reportPostType eq '댓글'}">
						        	<input type="hidden" name="reNo" value="${re.replyNo }">
						        	</c:when>
						        	<c:otherwise>
						        	<input type="hidden" name="frNo" value="${fr.freenoteNo }">
						        	</c:otherwise>
						        	</c:choose>
						        	<input type="hidden" name="bno" value="${r.reportNo }">
						        	
						             <div class="modal" id="deleteForm">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                
								                    <div class="modal-header" style="padding-left:100px;">
								                    	<div class="modal-title">삭제하시겠습니까?</div>
								                    </div>
								                    
								                    <div class="modal-body" align="center">
								                       
								            
								                    </div>
								                     <div class="modal-footer" align="center">
								                       
								                            <button type="submit"  class="btn btn-secondary" id="">확인</button>
								                            <a href="#"  class="btn btn-danger" role="button" onclick="location.href='adminReportDetail.ro?bno=' + ${r.reportNo }">취소</a>
								                    
								                    </div>
								                    
								                </div>
								            </div>
								        </div>
									</form>
						     			
				
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    
    
    <jsp:include page="../common/diaryFooter.jsp" />

</body>

</html>