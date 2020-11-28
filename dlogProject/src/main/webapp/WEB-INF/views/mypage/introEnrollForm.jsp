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
     .introEnrollForm{ 
         height:400px;
         width:100%;
     }
     
     #content{
         margin-left:20px;
         border:0px;
         padding:20px;
      }
      #line{
         border:gray 2px dashed;
      }
      #btn{
          margin-left:90%;
      }
 </style>
</head>
<body>
		<jsp:include page="../common/myPageHeader.jsp" />
	
<!--**********************************
      Content body start
  ***********************************-->
  <div class="content-body" style="float: left;">
      <div class="row page-titles mx-0">
          <h3 style="color:rgb(94, 94, 94); padding-left: 15px; font-size:17px; font-weight:bolder;">소개글 관리</h3>
      </div>
      <!-- row -->

      <div class="container-fluid">
          <div class="row">
              <div class="col-12">
                  <div class="card" style="width:730px;">
                      <div class="card-body" >
                          
                      <!-- 여기다가 작성 -->
                          <div class="introEnroll"> 
                              <div class="introEnrollForm">
                                  
                                  <form id="enrollForm" action="introInsert.my" method="post"> 
                                  <input type="hidden"  name="memberNo" value="${loginUser.memberNo} }">
								  <input type="hidden"  name="memberName" value="${loginUser.memberName} }">
								  <input type="hidden"  name="memberId" value="${loginUser.memberId} }">
								  <input type="hidden"  name="memberPwd" value="${loginUser.memberPwd} }">
								  <input type="hidden"  name="email" value="${loginUser.email} }">
								  <input type="hidden"  name="phone" value="${loginUser.phone} }">
								  <input type="hidden"  name="nickname" value="${loginUser.nickname} }">
								  
								  <table>
                                      <tr>
                                          <td style="font-size:30px;">&nbsp;</td>
                                      </tr>
                                      <tr>
                                          <th style="font-size:30px; font-weight: bolder;">&nbsp;&nbsp;<input type="text" name="title" style="border:0px; background-color:transparent;" value=" "></th>
                                      </tr>
                                      <tr>
                                          <td><hr id="line"></td>
                                      </tr>
                                      <tr>
                                          <td id="content">
                                              <textarea name="content" cols="88" rows="10" style="resize:none;  margin-bottom:10px; border:0px; background-color:transparent;" required></textarea>
                                          </td>
                                      </tr>
                                      
                                  </table>
                              </div>
                              <div id="btn">
                                  <button type="submit" class="btn btn-success btn-sm">확인</button>
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
    
</div>
<!--**********************************
    Main wrapper end
***********************************-->

 <jsp:include page="../common/myPageFooter.jsp" />
	
</body>
</html>