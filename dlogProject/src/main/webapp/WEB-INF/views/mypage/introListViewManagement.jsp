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
    .introSelectForm{ 
        height:400px;
        width:600px;
      }
    #content{
        margin-left:20px;
        border:0px;
        padding:20px;
     }
     #line{
        border:gray 1px dashed;
        width:832px;
        line-height: 30px;
     }
    
	.bug2{
		float:right;
	}
	.wrap{
	  position:relative;
	  animation:motion 0.5s ease-in Infinite Alternate;
	}

	@-webkit-keyframes motion {
	  0% {
	    top:0px;
	  }
	  
	  to {
	    top:6px;
	    
	  } 
	}
</style>

</head>
<body>

<jsp:include page="../common/myPageHeader.jsp" />

<script>
      $(function(){
         $(".metismenu a[href*='introListMn.my']").addClass("active");
         $(".metismenu a[href*='introListMn.my']").parent().addClass("active");
      });
   </script>

 <!--**********************************
     Content body start
 ***********************************-->
 <div class="content-body" style="float: left;">
     <div class="row page-titles mx-0">
         <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">소개글 관리</h3>
     </div>
     <!-- row -->

     <div class="container-fluid">
         <div class="row">
             <div class="col-12">
                 <div class="card" style="width:900px;">
                     <div class="card-body backgroundColor" >
                         <div class="table-responsive">
                             <!--시작-->
                                 <div class="introSelect">
                                     <div class="introSelectForm">
                                          <table>
      									  <c:if test="${loginUser.introductionTitle == null and loginUser.introductionContent == null }">
                                          	<tr>
                                          		<td >&nbsp;</td>
                                          	</tr>
                                          	<tr>
                                          		<td style="font-size:0.2em;">&nbsp; </td>	
                                          	</tr>
                                          	<tr>
                                          		<td style="font-size:1.5em; font-weight:bolder;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;환영합니다 ! </td>
                                          	</tr>
                                          	<tr>
                                          		<td class="bug2" style="font-size:1em;" ><img class="wrap" id="buga" src="resources/images/bug.png" style="width: 34px; height: 34px;">
                                          		</td>
                                          	</tr>
                                          	<tr>
                                          		<td style="font-size:1.5em;  font-weight:bolder;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나만의 :Dlog를 멋지게 꾸며보세요 ! </td>	
                                          		
                                          	</tr>
                                          	<tr>
                                          		<td style="font-size:1.5em;"> </td>	
                                          	</tr>
                                          </c:if>
                                          <c:if test="${loginUser.introductionTitle != null and loginUser.introductionContent != null }">
                                          <tr>
                                                 <td style="font-size:30px;">&nbsp;</td>
                                           </tr>      
                                             <tr>
                                                 <td style="font-size:23px; font-weight: bolder; ">&nbsp;&nbsp; ${ loginUser.introductionTitle } <img float=right; class="wrap" id="bugb" src="resources/images/bug.png" style="width: 30px; height: 30px;"> </td>
                                             </tr>
                                             
                                             <tr>
                                             	<td style="font-size:7px;">&nbsp;</td>
                                             </tr>
                                             <c:if test="${not empty loginUser.introductionTitle and not empty loginUser.introductionContent  }">
                                         	<tr>
                                                 <td><h3 id="line"></h3></td>
                                            </tr>
                                            </c:if>
                                            <tr>
                                                 <td id="content">${ loginUser.introductionContent } </td>
                                             </tr>
                                             </c:if>
                                         </table>
                                     </div>
                                     <div align="right">
                                     	<c:choose>
	                                     	<c:when test="${empty loginUser.introductionTitle and empty loginUser.introductionContent}">
	                                          	<button type="button" onclick="location.href='introEnrollForm.my'" class="btn btn-success btn-sm">작성하기</button>&nbsp;&nbsp; 
	                                         </c:when>
	                                         <c:otherwise> 
	                                         	<button type="button" onclick="location.href='introEnrollForm.my'" class="btn btn-success btn-sm">수정하기</button>
	                                     	</c:otherwise>
                                     	</c:choose>
                                     </div>
                             <br>
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
 
  <jsp:include page="../common/diaryWidget.jsp" />
  <jsp:include page="../common/diaryFooter.jsp" />
 
</body>
</html>