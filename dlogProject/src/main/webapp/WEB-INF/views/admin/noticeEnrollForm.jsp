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
table{
	width:60%;
	height:400px;
	margin:auto;
}
textarea{border-radius: 10px;}
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
	                               <form method="post" action="noticeInsert.no" enctype="multipart/form-data" >
							                <table>
							                    <tr>
							                        <th>제목</th>
							                        <td><input type="text"  name="noticeTitle" size=50  required></td>
							                    </tr>
							                    <tr>
							                        <th>파일첨부</th>
							                       	 <td><input type="file" id="upfile" name="upfile"></td>
							                    </tr>
							      
							                    <tr>
							                        <th>상세 내용</th>
							                    </tr>
							                    <tr>
							                        <th colspan="2"><textarea required name="noticeContent"  cols="70" rows="10" style="resize:none;"></textarea></th>
							                    </tr>
							                </table>
					                			<br>
					
							                <div align="center">
							                    <button type="submit" class="btn mb-1 btn-rounded btn-primary">등록하기</button>
							                    <button type="button" class="btn mb-1 btn-rounded btn-primary" onclick="javascript:history.go(-1);">취소하기</button>
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
    <script src="resources/plugins/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
	
	
	<jsp:include page="../common/diaryFooter.jsp" />
</body>

</html>