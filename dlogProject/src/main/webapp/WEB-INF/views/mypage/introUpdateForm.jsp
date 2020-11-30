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
     .introUpdateForm{ 
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
	        <div class="col p-md-0">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="introListMn.my">소개글 관리</a></li>
	                <li class="breadcrumb-item active">소개글 수정</li>
	            </ol>
	        </div>
	    </div>
      <!-- row -->

      <div class="container-fluid">
          <div class="row">
              <div class="col-12">
                  <div class="card" style="width:730px;">
                      <div class="card-body" >
                          
                      <!-- 여기다가 작성 -->
                          <div class="introUpdate"> 
                              <div class="introUpdateForm">
                                  
                                  <form id="updateForm" action="introUpdate.my" method="post"> 
                                  <table>
                                      <tr>
                                          <td style="font-size:30px;">&nbsp;</td>
                                      </tr>
                                      <tr>
                                          <th style="font-size:30px; font-weight: bolder;">&nbsp;&nbsp;<input type="text" name="title" style="border:0px; background-color:transparent;" value="${loginUser.introductionTitle} "></th>
                                      </tr>
                                      <tr>
                                          <td><hr id="line"></td>
                                      </tr>
                                      <tr>
                                          <td id="content">
                                              <textarea name="content" cols="88" rows="10" style="resize:none;  margin-bottom:10px; border:0px; background-color:transparent;" required>${loginUser.introductionContent }</textarea>
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