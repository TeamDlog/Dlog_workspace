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
							                    <th width="100">제목</th>
							                    <td colspan="3">${i.inquiryTitle}</td>
							                </tr>
							                <tr>
							                    <th>작성자</th>
							                    <td>${i.inquiryWriter }</td>
							  
							                </tr>
							                 <tr>
							                    <th>문의유형</th>
							                    <td>${i.inquiryType }</td>
							  
							                </tr>
							                  <tr>
							                    <th>작성일</th>
							                    <td>${i.inquiryDate }</td>
							  
							                </tr>
							                <tr>
							                    <th>내용</th>
							                    <td colspan="3"></td>
							                </tr>
							                <tr>
							                    <td colspan="4"><p style="height:200px">${i.inquiryContent }</p></td>
							                </tr>
							                <tr>
							                    <th>답변 내용</th>
							                    <td colspan="3"></td>
							                </tr>
							                <tr>
							                	 <td colspan="4"><p style="height:150px">${i.inquiryAnswer }</p></td>
							                </tr>
							            </table>
						           <br><br>
						        <form action="adminInquiryProcess.io" method="post" id="b">
						         	<input type="hidden" name="inquiryNo" value="${i.inquiryNo }">
						         	<button class="btn mb-1 btn-rounded btn-primary" type="submit" id="btnMail">처리완료</button>
						         </form>
						         <input class="btn mb-1 btn-rounded btn-primary" type="button" value="답변 " data-toggle="modal" data-target="#insertForm" id="a">
						         
						        
						         <form action="adminInquiryAnswer.io" method="post" >
						         	<input type="hidden" name="inquiryNo" value="${i.inquiryNo }">
						         	<input type="hidden" name="inquiryEmail" value="${i.inquiryEmail}">
						             <div class="modal" id="insertForm">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                
								                    <div class="modal-header" style="padding-left:100px;">
								                    	<div class="modal-title">답변 내용</div>
								                    </div>
								                    
								                    <div class="modal-body" align="center">
								                       
								                            <div class="modal-answer">
								                            	<textarea required name="inquiryAnswer"  cols="60" rows="10" style="resize:none;"></textarea>
								          
								                            </div>
								                    </div>
								                     <div class="modal-footer" align="center">
								                       
								                            <button type="submit"  class="btn btn-secondary" id="">확인</button>
								                            <a href="#"  class="btn btn-danger" role="button" onclick="location.href='adminInquiryDetail.io?bno=' + ${i.inquiryNo }">취소</a>
								                    
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