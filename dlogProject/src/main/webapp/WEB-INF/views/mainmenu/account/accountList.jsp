<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
#accountList{ text-align:center;}
#enroll{float:right; margin-right:20px;}
#dateInput{width:45px; height:20px;}
</style>
</head>

<body>

<jsp:include page="../../common/diaryHeader.jsp" />
 <script>
      $(function(){
         $(".metismenu a[href*='accountList.ac']").addClass("active");
         $(".metismenu a[href*='accountList.ac']").parent().addClass("active");
      });
   </script>

  <!--**********************************
      Content body start
  ***********************************-->
  <div class="content-body" style="float: left;">
      <div class="row page-titles mx-0">
          <h3 style="color:rgb(94, 94, 94); padding-left: 15px; font-size:17px; font-weight:bolder">가계부</h3>
      </div>

      <!-- row -->

      <div class="container-fluid">
          <div class="row">
              <div class="col-12">
                  <div class="card backgroundColor" style="width:870px;" >
                      <div class="card-body" >
                          <div class="table-responsive">
                              <!-- 검색영역 -->
                              	<input type="text" id="dateInput" placeholder="연도" >
                              	<select id="accountDate" name="monthly">
								        <option value="">월별</option>
								        <option value="01">1월</option>
								        <option value="02">2월</option>
								        <option value="03">3월</option>
								        <option value="04">4월</option>
								        <option value="05">5월</option>
								        <option value="06">6월</option>
								        <option value="07">7월</option>
								        <option value="08">8월</option>
								        <option value="09">9월</option>
								        <option value="10">10월</option>
								        <option value="11">11월</option>
								        <option value="12">12월</option> 
								 </select>
								<input id="enroll" type="button" class="btn btn-success" value="등록" onclick="location.href='accountEnrollForm.ac';">
                              	<br><br>
                             	<table id="accountList" class="table">
                             			<c:set var="resultIncome" value="0" />
                             			<c:set var="resultSpend" value="0" />
						                <c:choose>
						                <c:when test="${ empty list }">
						                	<tr>
							            		<td colspan="3">조회된 리스트가 없습니다.</td>
							            	</tr>
						                </c:when>
						                <c:otherwise>
						                	<thead>
							                  <tr>
							                  	<th>날짜</th>
							                    <th>항목</th>
							                    <th>세부항목</th>	               
							                    <th>구분</th>							                 
							                    <th>수입/지출</th>
							                    <th>금액</th>
							                    <th>내역</th>
							                    <th>삭제</th>
							                   
							                  </tr>
							                </thead>
							                <tbody>
							                	<c:forEach var="a" items="${list}">
							                    <tr>
							    					<c:choose>
							    					<c:when test="${a.accountStatus =='SPEND' }">
							                        <td>${a.accountDate }</td>
							                        <td>${a.accountItem }</td>
							                        <td>${a.accountDetailItem }</td>
							                        <td>${a.accountDivision }</td>
							                        <td>지출</td>
							                        <td>${a.accountMoney }</td>
							                        <td>${a.accountDataIls }</td> 
							                        <td><a href="#"  role="button" class="btn mb-1 btn-light" onclick="location.href='accountDelete.ac?bno=' +${a.accountNo }" >X</a></td>
							                       
							                        <c:set var="resultSpend" value="${a.accountMoney+ resultSpend}" />
							                           
							                        </c:when>
							                        <c:otherwise>
							                        <td>${a.accountDate }</td>
							                        <td>${a.accountItem }</td>
							                        <td>${a.accountDetailItem }</td>
							                        <td>${a.accountDivision }</td>
							                        <td>수입</td>
							                        <td>${a.accountMoney }</td>
							                        <td>${a.accountDataIls }</td> 
							                        <td><a href="#"  role="button" class="btn mb-1 btn-light" onclick="location.href='accountDelete.ac?bno=' +${a.accountNo }" >X</a></td>
							                        <c:set var="resultIncome" value="${a.accountMoney + resultIncome}" />
							                        </c:otherwise>
							                        </c:choose>
							                        
								               </tr>
							                    </c:forEach>
							                </tbody>
						                </c:otherwise>
						                </c:choose>
					                </table>
					               	<div id ="allMoney"  >
					                	총 수입 : <c:out value="${resultIncome}" /> &nbsp;&nbsp;
					                	총 지출 : <c:out value="${resultSpend}" />					                	
					                </div>
					                <div id="abc"></div>
					                
					                <div id="allChart" style="overflow:hidden; width:400px; height:400px;  margin:auto;"></div>
					                <div id="monthChart" style="overflow:hidden; width:400px; height:400px; margin:auto;"></div>

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
  
	<jsp:include page="../../common/diaryWidget.jsp" />
	<jsp:include page="../../common/diaryFooter.jsp" />
	
	<script>
	       $(document).ready(function() {
	    	  
		    	a =${resultIncome};
		    	b= ${resultSpend};
		    	$("#allMoney").hide();
            	 
            	 
		    	$("#allChart").hide();
            	$("#monthChart").hide();
            	 
            	 
            	 
            	google.charts.load('current', {'packages':['corechart']});
		    	
		    	 
	    	       $("#accountDate").change(function(){
	    	    	    
	    	    	   searchTable($(this).val());
	            	
	    	    	   
	    	    	   google.charts.setOnLoadCallback(drawChart($(this).val()));
		    	       
	                });
	    	       
	    	       $("#dateInput").change(function() {
						searchTable($(this).val());
	            	    google.charts.setOnLoadCallback(drawChart($(this).val()));
	               });
	    	  
	    	 		
		              
	    	   
	       });
	       
	       function searchTable(inputVal) {
	    	   
	    	   	var spend=0;
				var income=0;
				
	    	     $('#accountList tr').each(function() {
	    	       var found = false;
	    	       var date = $(this).find("td:nth-child(1)").text();
	    	       var month = date.split('-');
	    	       var division = $(this).find("td:nth-child(5)").text();
	    	       if( division=='SPEND'){   	
	                    $(this).show().eq(5).text('지출');
	    	    	   }else{
	    	    		   $(this).show().eq(5).text('수입');
	    	    	   }
	    	       if (inputVal == '') {
	    	    	   
	    	    	   found = true;
	    	    	  	    	        	    	        	    	         
	    	       }else if(month[1]== inputVal || month[0]==inputVal){
	                   found=true;
	                   if( division=='지출'){
	                   	spend = spend + parseInt($(this).find("td:nth-child(6)").text());
	                   }else {
	                	income = income + parseInt($(this).find("td:nth-child(6)").text());
	                   }	                   
	                }
	    	       if(found==true){
	    	    	   	    	    	   	
	                    $(this).show();
	                    $('#allMoney').hide();
	                    $("#abc").show();	                   	                             	                  
	                }else {
	                	
	                    $(this).hide();
	                    $('#allMoney').hide();
	                    $("#abc").show();	         				                   
	                }
	    	       
	    	       $("#abc").html("총 수입" + " : " + income + "&nbsp &nbsp" +  "총 지출" + " : " + spend) ;
	    	     
	    	     });
	    	     
	    	     if(inputVal ==''){
	    	    	 
	    	    	 $("#abc").hide();
	    	    	 $('#allMoney').show();
	    	     }	    	     		    	     		    	   
	    	}
	       
	      
	       
	       function drawChart(inputVal) {
	    	 	var spend=0;
				var income=0;
				 $("#allChart").hide();
	    		 $("#monthChart").hide();
	    	   $('#accountList tr').each(function() {
	    		  
	    	       var date = $(this).find("td:nth-child(1)").text();
	    	       var month = date.split('-');
	    	       var division = $(this).find("td:nth-child(5)").text();
					 if(inputVal == ''){
						$("#allChart").show();
						 var data = google.visualization.arrayToDataTable([
						    ['Task', '수입/지출'],
			    	           ['수입', a],
			    	           ['지출', b]
			    	         ]);
		                   var options = {
						    	    title: '수입/지출 통계'
						    };
						   var chart = new google.visualization.PieChart(document.getElementById('allChart'));

						 		
						   chart.draw(data, options);
						  
	               
		    	      
	                }else if(month[1]== inputVal || month[0]==inputVal){
	                
	                	$("#monthChart").show();
	                	
	                	
	                	
	                	
		                 
	                	   if(division=='수입'){
		                	   income = parseInt(income) + parseInt($(this).find("td:nth-child(6)").text());
		                   }else if(division=='지출') {
		                	   spend = spend + parseInt($(this).find("td:nth-child(6)").text());
		                   }
	                
	                	   
	                	 
	                	   var data = google.visualization.arrayToDataTable([
			    	           ['Task', '수입/지출'],
			    	           ['수입', income],
			    	           ['지출', spend]
			    	         ]);
		                   var options = {
						    	    title: '수입/지출 통계'
						    };
						   var chart = new google.visualization.PieChart(document.getElementById('monthChart'));

						   chart.draw(data, options);
						   
						   
						   
					  	  
					
	                }
					 
					 
					 
					
					
					 
					
	    	   });
	    	     
	    	    
		    	   
	         
	    	
	    	  
	    	}
	 			
	 		  
	 					    
	</script>
	
	
	
	





</body>
</html>