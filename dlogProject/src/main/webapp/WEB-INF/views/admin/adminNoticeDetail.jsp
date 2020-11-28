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
	                                <table align="center" class="table">
						                <thead> 
						                	<tr>
							                    <th>${n.noticeTitle}</th>
							                    <th style="text-align:right">${n.noticeDate}</th>
							                </tr>
						                </thead>
						               
						                <tr>
						                    <td colspan="4"><p style="height:300px">${n.noticeContent }</p></td>
						                </tr>
						                <tr>
						                    <th>첨부파일</th>
						                    <td colspan="3">
						                    	<c:choose>
						                    	<c:when test="${empty n.noticeOriginName  }">
						                    	첨부파일이 없습니다.
						                    	</c:when>
						                    	<c:otherwise>
						                     	   <a href="${n.noticeChangeName }" download="${n.noticeOriginName }">${n.noticeOriginName }</a>
						                     	 </c:otherwise>
						                        </c:choose>
						                    </td>
						                </tr>             
						           </table>
						           <br><br>
						           <a class="btn mb-1 btn-rounded btn-primary" style="float:right" href="adminNoticeList.no">목록으로</a>
				
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
    <script src="resources/plugins/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>

	<jsp:include page="../common/diaryFooter.jsp" />
</body>

</html>