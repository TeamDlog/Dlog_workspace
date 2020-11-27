<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>

<style>
#accountList{ border-collapse:collapse; text-align:center; }
#accountList td, #accountList th {border:1px solid black;}
</style>
</head>
<body>

<jsp:include page="../common/diaryHeader.jsp" />

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
                  <div class="card" style="width:985px;">
                      <div class="card-body" >
                          <div class="table-responsive">
                              <!-- 검색영역 -->
                              	
                              	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                           
                             	<input type="hidden" name="accountWriter" value="${loginUser.userId }">
                             	<table id="accountList" class="table" >
                             		
						                	<thead>
							                  <tr>
							                  	<th>날짜</th>
							                    <th>항목</th>
							                    <th>세부항목</th>	               
							                    <th>구분</th>							                 
							                    <th>수입/지출</th>
							                    <th>금액</th>
							                    <th>내역</th>
							           							                   
							                  </tr>
							                </thead>
							                <tbody>
							                
							                    <tr>
							    					<td><input type="text" id="Date" name="accountDate"></td>
							    					<td>
							    						<select id="accountItem" name="accountItem">
							    								<option value=""></option>
														        <option value="주수입">주수입</option>
														        <option value="부수입">부수입</option>
														        <option value="교통">교통</option>
														        <option value="식비">식비</option>
														        <option value="공과금">공과금</option>
														     
														 </select>	
							    					</td>
							    					<td>
							    						
							    						<select id="a" name="accountDetailItem" style="display:none;">
							    								<option value=""></option>
														        <option value="외식">외식</option>
														        <option value="간식">간식</option>   
														 </select>
														 <select id="b" name="accountDetailItem" style="display:none;">
														 		<option value=""></option>
														        <option value="유투브">유투브</option>
														        <option value="이벤트">이벤트</option> 
														        <option value="블로그">블로그</option>  
														 </select>	
														 <select id="c" name="accountDetailItem" >
														 		<option value=""></option>
														        <option value="월급">월급</option>
														        <option value="보너스">보너스</option>   
														 </select>	
														 <select id="d" name="accountDetailItem" style="display:none;">
														 		<option value=""></option>
														        <option value="자동차세">자동차세</option>
														        <option value="소득세">소득세</option>
														        <option value="아파트 관리비">아파트 관리비</option>   
														 </select>	
														 <select id="e" name="accountDetailItem" style="display:none;">
														 		<option value=""></option>
														        <option value="버스">버스</option>
														        <option value="지하철">지하철</option>
														        <option value="택시">택시</option>
														        <option value="주차료">주차료</option>   
														 </select>		
							    					</td>
							    					<td>
							    						<select id="accountDivision" name="accountDivision">
							    								<option value=""></option>
														        <option value="현금">현금</option>
														        <option value="카드">카드</option>
														     
														 </select>	
							    					</td>
							    					<td>
							    						<select id="accountStatus" name="accountStatus">
							    								<option value=""></option>
														        <option value="INCOME">수입</option>
														        <option value="SPEND">지출</option>
														      
														 </select>	
							    					</td>
							    					<td><input type="text" id="accountMoney"  name="accountMoney"></td>
							    					<td><input type="text" id="accountDataIls" name="accountDataIls"></td>
							                     
								               </tr>
								                <tr>
									               <td colspan="7" align="center"><button type="submit" onclick="addAccount();">입력하기</button></td>
									           </tr>
							          
							                </tbody>
							               
						           
					                </table>
					        
					           

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
	
	
	<script>
	$(function() {
	    $( "#Date" ).datepicker({
	    	  dateFormat: 'yy-mm-dd',
	    	  minDate: new Date('2020-01-01'),
	    	  maxDate: new Date('2020-12-31')
	    });
	   
	    $("#accountItem").change(function(){
	    	if($(this).val()=='주수입'){
	    		$("#a").hide();
                $("#b").hide();
                $("#c").show();
                $("#d").hide();
                $("#e").hide();

	    	}else if($(this).val()=='부수입'){
	    		$("#b").show();
                $("#a").hide();
                $("#c").hide();
                $("#d").hide();
                $("#e").hide();
	    	}else if($(this).val()=='교통'){
	    		$("#c").hide();
                $("#b").hide();
                $("#a").hide();
                $("#d").hide();
                $("#e").show();
	    	}else if($(this).val()=='식비'){
	    		$("#d").hide();
                $("#b").hide();
                $("#c").hide();
                $("#a").show();
                $("#e").hide();
	    	}else{
	    		$("#e").hide();
                $("#b").hide();
                $("#c").hide();
                $("#d").show();
                $("#a").hide();
	    	}
	    	
	    });
	  
	    
	});
	
	
	function addAccount(){
		var result="";
		if($('#a').val()!=""){
			result = $('#a').val();
		}else if($('#b').val()!=""){
			result = $('#b').val();
		}else if($('#c').val()!=""){
			result = $('#c').val();
		}else if($('#d').val()!=""){
			result = $('#d').val();
		}else{
			result = $('#e').val();
		}
		
		$.ajax({
			url : "accountInsert.ac",
			dataType: "json",
			data:{
				accountDate:$("#Date").val(),
				accountItem:$("#accountItem").val(),
				accountWriter:"${loginUser.userId}",
				accountDetailItem:result,
				accountDivision:$("#accountDivision").val(),
				accountStatus:$("#accountStatus").val(),
				accountMoney:$("#accountMoney").val(),
				accountDataIls:$("#accountDataIls").val()
			},
			
			success:function(a){
				
				console.log(a);
		
				
				var value="";
			
				
					value += '<tr>' +
									'<td>' + a.accountDate + '</td>' +
									'<td>' + a.accountItem + '</td>' +
									'<td>' + a.accountDetailItem + '</td>' +
									'<td>' + a.accountDivision + '</td>' +
									'<td>' + a.accountStatus + '</td>' +
									'<td>' + a.accountMoney + '</td>' +
									'<td>' + a.accountDataIls+ '</td>' +
						'</tr>';
				
					$("#accountList tbody:last").append(value);
			
			},error:function(){
				
			}
		})
	}	
		


	
</script>    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>



</body>
</html>