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
            width:400px;
          }
        #content{
            margin-left:20px;
            border:0px;
            padding:20px;
         }
        #line{
        border:gray 2px dashed;
        width:671px;
        line-height: 30px;
     }
        
    </style>
</head>
<body>

<jsp:include page="../common/diaryHeader.jsp" />


 <!--**********************************
     Content body start
 ***********************************-->
 <div class="content-body" style="float: left;">
     <div class="row page-titles mx-0">
         <h3 style="color:rgb(94, 94, 94); padding-left:15px; font-size:17px;  font-weight:bolder;"><b>소개글</b></h3>
     </div>
     <!-- row -->

     <div class="container-fluid">
         <div class="row">
             <div class="col-12">
                 <div class="card" style="width:730px;">
                     <div class="card-body" >
                         <div class="table-responsive">
                             <!--시작-->
                                 <div class="introSelect">
                                     <div class="introSelectForm">
                                          <table>
                                          <c:if test="${loginUser.introductionTitle == null and loginUser.introductionContent == null }">
                                          	
                                          		<td colspan="4" style="font-size:1.3em; font-weight:bolder;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;준비된 소개글이 없습니다.</td>
                                          	
                                          </c:if>	
                                          <tr>
                                                 <td style="font-size:30px;">&nbsp;</td>
                                           </tr>      
                                             <tr>
                                                 <td style="font-size:23px; font-weight: bolder;">&nbsp;&nbsp; ${ loginUser.introductionTitle } </td>
                                             </tr>
                                             <tr>
                                             	<td style="font-size:7px;">&nbsp;</td>
                                             </tr>
                                              <c:if test="${not empty loginUser.introductionTitle and not empty loginUser.introductionContent  }">
                                         	<tr>
                                                 <td><div id="line"></div></td>
                                            </tr>
                                            </c:if>
                                            <tr>
                                                 <td id="content">${ loginUser.introductionContent } </td>
                                             </tr>
                                             
                                         </table>
                                     </div>
                                     <br>
                                    
                                     
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