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
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    
   	// 달력
    var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
    var date = new Date();//today의 Date를 세어주는 역할
    function prevCalendar() {//이전 달
	    // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
	    // today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
	    // getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
    	today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    	buildCalendar(); //달력 cell 만들어 출력 
    }

    function nextCalendar() {//다음 달
        // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
        //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
         today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
         buildCalendar();//달력 cell 만들어 출력
    }
    
    function buildCalendar(){//현재 달 달력 만들기
        var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
        //이번 달의 첫째 날,
        //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
        //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
        //왜냐면 getMonth()는 0~11을 반환하기 때문
        var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
        //이번 달의 마지막 날
        //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
        //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
        //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
        var tbCalendar = document.getElementById("calendar");
        //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
        var tbCalendarYM = document.getElementById("calendar_main_head_center");
        //테이블에 정확한 날짜 찍는 변수
        //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
        //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
        tbCalendarYM.innerHTML = (today.toLocaleString('en-us', { month: 'long' }).toUpperCase()) + " &nbsp; " + today.getFullYear(); 
		
        // while은 이번달이 끝나면 다음달로 넘겨주는 역할
        while (tbCalendar.rows.length > 2) {
        //열을 지워줌
        //기본 열 크기는 body 부분에서 2로 고정되어 있다.
        tbCalendar.deleteRow(tbCalendar.rows.length-1);
            //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
            //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
        }
         
        var row = null;
        row = tbCalendar.insertRow();
        //테이블에 새로운 열 삽입//즉, 초기화
        var cnt = 0;// count, 셀의 갯수를 세어주는 역할
        // 1일이 시작되는 칸을 맞추어 줌
        
       	var cell = null;//열 한칸한칸 계속 만들어주는 역할
       	
       	var beginEmptyCount = 0;
        for (i=0; i<doMonth.getDay(); i++) {
        	// 이번달의 day만큼 돌림
        	cell = row.insertCell();
        	cell.innerHTML = "<div></div>" + 
							 "<div></div>" +
							 "<div></div>" +
							 "<div></div>" ;
            cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
            beginEmptyCount++;
        }
        
        // 달력 출력
        for (i=1; i<=lastDate.getDate(); i++) { 
        	//1일부터 마지막 일까지 돌림
            cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
           	//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
            cell.innerHTML = "<div>" + i + "</div>" + 
            				 "<div></div>" +
            				 "<div></div>" +
            				 "<div></div>" ;
            cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
            
        	if (cnt % 7 == 1) {// 일요일 계산
        		
        	}    
        	
            if (cnt%7 == 0){// 1주일이 7일 이므로 토요일 구하기 
            	//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                row = calendar.insertRow();
                //토요일 다음에 올 셀을 추가
            }
            
            /* //오늘의 날짜에 노란색 칠하기
            if (today.getFullYear() == date.getFullYear()
            	&& today.getMonth() == date.getMonth()
            	&& i == date.getDate()) {
            	//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
            	cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
            } */
		}
        
        // 뒷자리 채우기
        var endEmptyCount = 0;
       	while (cnt%7 != 0) {
        	cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
        	cell.innerHTML = "<div></div>" + 
							 "<div></div>" +
							 "<div></div>" +
							 "<div></div>" ;
            cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
            endEmptyCount++;
       	}
        
		var cal = $("#calendar tr").not($("#calendar_main_head")).not($("#calendar_day"));
		// 날짜 css
		cal.children().children().css("height","25%");
		cal.children().css("height","120px");
		$("#calendar_day td").css("border","1px solid lightgray");
		cal.each(function(){
			$(this).css({"border-bottom":"1px solid lightgray"})
		})
		cal.children().each(function(index){
			$(this).children().eq(0).css({"text-align":"right"});
			for(var i = 0 ; i < 4 ; i++){
				$(this).children().eq(i).css({"border-right":"1px solid lightgray"});
			}
			if(index%7 == 0){
				for(var i = 0 ; i < 4 ; i++){
					$(this).children().eq(i).css({"border-left":"1px solid lightgray"});
				}
			}
			$(this).children().css({"padding":"5px"});
		})
		
		var mm = today.getMonth()+1;
		var date = new Date(today.getFullYear(), mm, 0)
		console.log(date.getDate());
		// td에 실제 날짜 넣기
		cal.children().each(function(index){
			if (index >= beginEmptyCount && index < date.getDate()+beginEmptyCount){
				if(mm < 10){
					if(index+1-beginEmptyCount < 10 ){
						$(this).attr("class",today.getFullYear() + "-0" + mm + "-0" + (index+1-beginEmptyCount));
					}else{
						$(this).attr("class",today.getFullYear() + "-0" + mm + "-" + (index+1-beginEmptyCount));
					}
				}else{
					if(index+1-beginEmptyCount < 10 ){
						$(this).attr("class",today.getFullYear() + "-" + mm + "-0" + (index+1-beginEmptyCount));
					}else{
						$(this).attr("class",today.getFullYear() + "-" + mm + "-" + (index+1-beginEmptyCount));
					}
				}
			}
		})
		
		// str to date
		function parse(str) {
		    var y = str.substr(0, 4);
		    var m = str.substr(5, 2);
		    var d = str.substr(8, 2);
		    return new Date(y,m-1,d);
		}
		
		// 날짜 하루 늘리기
		/* var addDate = parse("${list[6].calendarEndDate}");
		console.log(addDate);
		addDate.setDate(addDate.getDate()+1);
		console.log(addDate); */
		
		// 일정 표시하기 (최대 10일)
		for(var i = 9 ; i >= 0 ; i--){
			<c:forEach var="cal" items="${list}">
				
				if( i > 0 ){
					
					// 2일 이상
					if(parse("${cal.calendarEndDate}").getDate() - parse("${cal.calendarBeginDate}").getDate() == i){
						
						// 배치하기 전에 먼저 만들어진 일정이 있는지 스캔하기
						var scanBegin = 0;
						var scanEnd = 0;
						var cal_index = 1;
						cal.children().each(function(index){
							if ($(this).attr("class") == "${cal.calendarBeginDate}"){
								scanBegin = index; 
							}
							if ($(this).attr("class") == "${cal.calendarEndDate}"){
								scanEnd = index;
							}
						})
						
						for(var b = 1 ; b < 4 ; b++){
							var exist = 0;
							for(var s = scanBegin ; s <= scanEnd ; s++){
								if(cal.children().eq(s).children().eq(b).html() == ""){
									exist++;
								}
							}
							if(exist == (scanEnd-scanBegin+1)){
								cal_index = b;
								break;
							}
						}
						
						cal.children().each(function(index){
							// 맨 앞
							if ($(this).attr("class") == "${cal.calendarBeginDate}"){
								for(var k = 1 ; k < 4 ; k++){
									$(this).children().eq(cal_index).addClass("calendar_event");
									$(this).children().eq(cal_index).attr("onclick","selectDetail(" + ${cal.calendarNo} + ");");
									$(this).children().eq(cal_index).css("background","${cal.calendarBgColor}");
									$(this).children().eq(cal_index).css("color","${cal.calendarFontColor}");
									$(this).children().eq(cal_index).css("border-right","${cal.calendarBgColor}");
									$(this).children().eq(cal_index).html("${cal.calendarTitle}" + "<input type='hidden' name='calendarNo' value='" + ${cal.calendarNo} + "'>");
								}
							}
							
							// 맨 뒤
							if ($(this).attr("class") == "${cal.calendarEndDate}"){
								$(this).children().eq(cal_index).addClass("calendar_event");
								$(this).children().eq(cal_index).attr("onclick","selectDetail(" + ${cal.calendarNo} + ");");
								$(this).children().eq(cal_index).css("background","${cal.calendarBgColor}");
								$(this).children().eq(cal_index).css("color","${cal.calendarFontColor}");
								$(this).children().eq(cal_index).html("<input type='hidden' name='calendarNo' value='" + ${cal.calendarNo} + "'>");
							}
							
						})
						
						// 가운데
						for(var j = scanBegin+1 ; j < scanEnd ; j++){
							cal.children().eq(j).children().eq(cal_index).addClass("calendar_event");
							cal.children().eq(j).children().eq(cal_index).attr("onclick","selectDetail(" + ${cal.calendarNo} + ");");
							cal.children().eq(j).children().eq(cal_index).css("background","${cal.calendarBgColor}");
							cal.children().eq(j).children().eq(cal_index).css("color","${cal.calendarFontColor}");
							cal.children().eq(j).children().eq(cal_index).css("border-right","${cal.calendarBgColor}");
							cal.children().eq(j).children().eq(cal_index).html("<input type='hidden' name='calendarNo' value='" + ${cal.calendarNo} + "'>");
						}
						
					}
				
				// 1일 
				}else{
					
					if(parse("${cal.calendarEndDate}").getDate() - parse("${cal.calendarBeginDate}").getDate() == 0){
						
						cal.children().each(function(index){
							if($(this).attr("class") == "${cal.calendarBeginDate}"){
								for(var k = 1 ; k < 4 ; k++){
									if($(this).children().eq(k).html() == ""){
										$(this).children().eq(k).addClass("calendar_event");
										$(this).children().eq(k).attr("onclick","selectDetail(" + ${cal.calendarNo} + ");");
										$(this).children().eq(k).css("background","${cal.calendarBgColor}");
										$(this).children().eq(k).css("color","${cal.calendarFontColor}");
										$(this).children().eq(k).html("${cal.calendarTitle}" + "<input type='hidden' name='calendarNo' value='" + ${cal.calendarNo} + "'>");
										break;
									}
								}
							}
						})
						
					}
					
				}
			</c:forEach>
		}
		
    }
    
    function selectDetail(calendarNo){
    	if(${ loginUser.memberNo eq loginUser.diaryMemberNo}){
    		location.href="selectDetail.ca?calendarNo="+calendarNo;
    	}else{
    		alert("작성자만 조회할 수 있습니다.");
    	}
    }
    
</script>	
</head>
<body>

	<jsp:include page="../../common/diaryHeader.jsp" />
	
	<script>
		$(function(){
			
			$(".metismenu a[href*='selectList.ca']").addClass("active");
			$(".metismenu a[href*='selectList.ca']").parent().addClass("active");
			
		});
	</script>
	
    <!--**********************************
        Content body start
    ***********************************-->
    
    <div class="content-body" style="float: left;">
        <div class="row page-titles mx-0">
            <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">캘린더</h3>
        </div>
        <!-- row -->
        <div class="container-fluid" style="margin-top:15px;">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px;">
                        <div class="card-body" >
	                        <div id="calendar_main">
								<table id="calendar" class="calendar2" style="width:100%; height:700px;">
									<tr style="height:100px;" id="calendar_main_head">
										<td colspan="2" id="calendar_main_head_left">
											<button onclick="prevCalendar()">＜</button>
			                                <button onclick="nextCalendar()">＞</button>
										</td>
										<td colspan="3" id="calendar_main_head_center_td">
											<div id="calendar_main_head_center"></div>
										</td>
										<td colspan="2" id="calendar_main_head_right" align="right">
											<c:if test="${ loginUser.memberNo eq loginUser.diaryMemberNo}">
												<a class="btn mb-1 btn-primary btn-sm" href="enroll.ca">일정 등록</a>
											</c:if>
										</td>
									</tr>
								    <tr id="calendar_day">
								        <td align="center" style="color:#f55656;">SUN</td>
								        <td align="center">MON</td>
								        <td align="center">TUE</td>
								        <td align="center">WED</td>
								        <td align="center">THU</td>
								        <td align="center">FRI</td>
								        <td align="center" style="color:#596cf7;">SAT</td>
								    </tr> 
								</table>
								<script>
									buildCalendar();
								</script>
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
</body>
</html>