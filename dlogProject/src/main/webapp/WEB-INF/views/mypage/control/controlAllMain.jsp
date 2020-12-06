<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Dlog</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
    <!-- Custom Stylesheet -->
    <link href="resources/css/osageuStyle.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .toggleBG{
            background: #CCCCCC; 
            width: 60px; 
            height: 20px; 
            border: 1px solid #CCCCCC; 
            border-radius: 30px;
            float: right;
            }
        .toggleFG{
            background: #FFFFFF; 
            width: 15px;
             height: 15px; 
             border: none; 
             border-radius: 15px; 
             position: relative; 
             left: 0px;}
        #myColor input[type=color]{
            border: none;
            madding:0px;
            margin:0px;
            width: 100px;
            height: 30px;
        }
        
    	
    </style>
    
</head>

<body>
	<jsp:include page="../../common/myPageHeader.jsp"/>
            <!--**********************************
                Sidebar end
            ***********************************-->

           <!--**********************************
                Content body start
            ***********************************-->
            <div id="mainContents" class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">통합 관리</h3>
                </div>
                <!-- row -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:290px; float: left; margin-right: 15px; height: 450px;">
                                <div class="card-body  backgroundColor" >
                                
                                <!-- 여기다가 작성 -->
                                <div style="float:right"><h4>위젯 관리</h4></div>
                                <select name="privacy" id="privacy" style="height: 30px; margin-bottom: 30px;">
                                    <option value="1">다이어리 표시</option>
                                    <option value="2">친구 공개</option>
                                </select>
                                <br><br>
                                <h4>
                                    <i class="icon-clock menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;디데이 </span>
                                    <div class='toggleBG widgetController ddayCheck'>
                                        <button class='toggleFG widgetController ddayCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-speech menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;단어장</span>
                                    <div class='toggleBG widgetController vocaCheck'>
                                        <button id="" class='toggleFG widgetController vocaCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-doc menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;메모장</span>
                                    <div class='toggleBG widgetController memoCheck'>
                                        <button id="" class='toggleFG widgetController memoCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-grid menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;시간표</span>
                                    <div class='toggleBG widgetController timetableCheck'>
                                        <button id="" class='toggleFG widgetController timetableCheck'></button>
                                    </div>
                                </h4>
								
                                </div>
                            </div>

                            <div class="card" style="width:290px; float: left;  margin-right: 15px; height: 450px;">
                                <div class="card-body  backgroundColor" >
                               	<div style="float:right"><h4>메뉴 관리</h4></div>
                                <!-- 여기다가 작성 -->
                                <br><br><br>
                                <h4>
                                    <i class="icon-calender menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;캘린더</span>
                                    <div class='toggleBG calenderCheck'>
                                        <button class='toggleFG calenderCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-notebook menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;다이어리</span>
                                    <div class='toggleBG diaryCheck'>
                                        <button class='toggleFG diaryCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-note menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;프리노트</span>
                                    <div class='toggleBG freenoteCheck'>
                                        <button class='toggleFG freenoteCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-picture menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;사진게시판</span>
                                    <div class='toggleBG photoCheck'>
                                        <button class='toggleFG photoCheck'></button>
                                    </div>
                                </h4>
                                <br><br>
                                <h4>
                                    <i class="icon-wallet menu-icon"></i><span class="nav-text">&nbsp;&nbsp;&nbsp;가계부</span>
                                    <div class='toggleBG accountCheck'>
                                        <button class='toggleFG accountCheck'></button>
                                    </div>
                                </h4>
                                </div>
                            </div>
							
                            <div class="card" style="width:290px; float: left; height: 450px;">
                                <div class="card-body backgroundColor" >
                                <!-- 여기다가 작성 -->
                                <div style="float:right"><h4>테마 관리</h4></div>
                                <br><br><br>
                                <form action="myColor.ca" method="post">
                                	<input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
                                    <table id="myColor">
                                        <tr>
                                            <th>
                                                <h4>로고 색상 :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="color" name="myColorLogo" id="logoColorCh"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <h4>배경 색상 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="color" name="myColorBackground" id="backgroundColorCh"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <h4>메뉴바 색상 :&nbsp;&nbsp;&nbsp;&nbsp; <input type="color" name="myColorMenubar" id="menubarColorCh"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <h4>글자 색상 :&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="color" name="myColorFont" id="fontColorCh"></h4>
                                                <br>
                                            </th>
                                        </tr>
                                    </table>
                                    <br><br>
                                    <div style="float: right;">
                                        <button type="submit" class="btn btn-success" >테마적용</button>
                                        <button onclick="resetMyColor();" type="button" class="btn btn-danger" >초기화</button>
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
            
        </div>
        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Widget area start
        ***********************************-->
        <jsp:include page="../../common/diaryWidget.jsp"/>
    <!--**********************************
        Widget area end
    ***********************************-->
   <jsp:include page="../../common/diaryFooter.jsp"/>
    <script>
        $(document).on('click', '.toggleBG', function () {
            var toggleBG = $(this);
            var toggleFG = $(this).find('.toggleFG');
            var left = toggleFG.css('left');
            if(left == '40px') { // 선택안함
                toggleBG.css('background', '#CCCCCC');
                toggleActionStart(toggleFG, 'TO_LEFT');
                
                if($(this).hasClass("widgetController")){
                	if($("#privacy").val() == 1){
                   		
       					var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "active_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "active_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "active_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "active_timetable";
       					}
       					
    					$.ajax({
                    		url:"activeWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"N", "memberNo":"${loginUser.memberNo}"},
                    		success:function(ca){
                    			
                    			if(ca.activeDday == "N"){
                        			$(".widgetDday").css("display", "none");
                        		}else{
                        			$(".widgetDday").css("display", "block");
                        		}
                        		
                        		if(ca.activeMemo == "N"){
                        			$(".widgetMemo").css("display", "none");
                        		}else{
                        			$(".widgetMemo").css("display", "block");
                        		}
                        		
                        		if(ca.activeVoca == "N"){
                        			$(".widgetVoca").css("display", "none");
                        		}else{
                        			$(".widgetVoca").css("display", "block");
                        		}
                        		
                        		if(ca.activeTimetable == "N"){
                        			$(".widgetTimetable").css("display", "none");
                        		}else{
                        			$(".widgetTimetable").css("display", "block");
                        		}
                        		
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
    					
                    }else if($("#privacy").val() == 2){
                    	
                    	var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "privacy_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "privacy_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "privacy_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "privacy_timetable";
       					}
       					
                    	$.ajax({
                    		url:"privacyWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"N", "memberNo":"${loginUser.memberNo}"},
                    		success:function(ca){
                    			
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
                    	
                    }
                }else{
                	var widget = "";
   					if($(this).hasClass("calenderCheck")){
   						widget = "privacy_calendar";
   					}else if($(this).hasClass("diaryCheck")){
   						widget = "privacy_diary";
   					}else if($(this).hasClass("freenoteCheck")){
   						widget = "privacy_freenote";
   					}else if($(this).hasClass("photoCheck")){
   						widget = "privacy_photo";
   					}else if($(this).hasClass("accountCheck")){
   						widget = "privacy_account";
   					}
               		
               		$.ajax({
                		url:"privacyWidget.ca",
                		type:"post",
                		data:{"widget":widget,"status":"N", "memberNo":"${loginUser.memberNo}"},
                		success:function(ca){
                			
                		},error:function(){
                			console.log("다이어리 공개 ajax실패");
                		}
                	});
                }
                

            }else if(left == '0px') { // 선택함
                toggleBG.css('background', '#53FF4C');
                toggleActionStart(toggleFG, 'TO_RIGHT');
                
                if($(this).hasClass("widgetController")){
                	
                	if($("#privacy").val() == 1){
       					
                   		var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "active_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "active_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "active_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "active_timetable";
       					}
                   		
                   		$.ajax({
                    		url:"activeWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"Y", "memberNo":"${loginUser.memberNo}"},
                    		success:function(ca){
                    			if(ca.activeDday == "N"){
                        			$(".widgetDday").css("display", "none");
                        		}else{
                        			$(".widgetDday").css("display", "block");
                        		}
                        		
                        		if(ca.activeMemo == "N"){
                        			$(".widgetMemo").css("display", "none");
                        		}else{
                        			$(".widgetMemo").css("display", "block");
                        		}
                        		
                        		if(ca.activeVoca == "N"){
                        			$(".widgetVoca").css("display", "none");
                        		}else{
                        			$(".widgetVoca").css("display", "block");
                        		}
                        		
                        		if(ca.activeTimetable == "N"){
                        			$(".widgetTimetable").css("display", "none");
                        		}else{
                        			$(".widgetTimetable").css("display", "block");
                        		}
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
    				
                    }else if($("#privacy").val() == 2){
                    	
                    	var widget = "";
       					if($(this).hasClass("ddayCheck")){
       						widget = "privacy_dday";
       					}else if($(this).hasClass("vocaCheck")){
       						widget = "privacy_voca";
       					}else if($(this).hasClass("memoCheck")){
       						widget = "privacy_memo";
       					}else if($(this).hasClass("timetableCheck")){
       						widget = "privacy_timetable";
       					}
                    	
                    	$.ajax({
                    		url:"privacyWidget.ca",
                    		type:"post",
                    		data:{"widget":widget,"status":"Y", "memberNo":"${loginUser.memberNo}"},
                    		success:function(ca){
                    			
                    		},error:function(){
                    			console.log("다이어리 공개 ajax실패");
                    		}
                    	});
                    	
                    }
                	
                }else{
                	var widget = "";
   					if($(this).hasClass("calenderCheck")){
   						widget = "privacy_calendar";
   					}else if($(this).hasClass("diaryCheck")){
   						widget = "privacy_diary";
   					}else if($(this).hasClass("freenoteCheck")){
   						widget = "privacy_freenote";
   					}else if($(this).hasClass("photoCheck")){
   						widget = "privacy_photo";
   					}else if($(this).hasClass("accountCheck")){
   						widget = "privacy_account";
   					}
               		
               		$.ajax({
                		url:"privacyWidget.ca",
                		type:"post",
                		data:{"widget":widget,"status":"Y", "memberNo":"${loginUser.memberNo}"},
                		success:function(ca){
                				
                		},error:function(){
                			console.log("다이어리 공개 ajax실패");
                		}
                	});
                }
               	
                
            }
        });
     
        // 토글 버튼 이동 모션 함수
        function toggleActionStart(toggleBtn, LR) {
            // 0.01초 단위로 실행
            var intervalID = setInterval(
                function() {
                    // 버튼 이동
                    var left = parseInt(toggleBtn.css('left'));
                    left += (LR == 'TO_RIGHT') ? 5 : -5;
                    if(left >= 0 && left <= 40) {
                        left += 'px';
                        toggleBtn.css('left', left);
                    }
                }, 10);
            setTimeout(function(){
                clearInterval(intervalID);
            }, 201);
        }
    </script>
    
    <script>
    	$(function(){
    		
    		$("#logoColorCh").val("${ca.myColorLogo}");
    		$("#backgroundColorCh").val("${ca.myColorBackground}");
    		$("#menubarColorCh").val("${ca.myColorMenubar}");
    		$("#fontColorCh").val("${ca.myColorFont}")
    		
    		/* 메뉴관리 */
    		if('${ca.privacyCalendar}' == 'Y'){

	            $("div.calenderCheck").css('background', '#53FF4C');
				$("button.calenderCheck").css("left","40px");    
				
			}else if('${ca.privacyCalendar}' == 'N'){
				
				$("div.calenderCheck").css('background', '#CCCCCC');
				$("button.calenderCheck").css("left","0px");      				
				
			}
		
		    if('${ca.privacyDiary}' == 'Y'){

	            $("div.diaryCheck").css('background', '#53FF4C');
				$("button.diaryCheck").css("left","40px");    
				
			}else if('${ca.privacyDiary}' == 'N'){
				
				$("div.diaryCheck").css('background', '#CCCCCC');
				$("button.diaryCheck").css("left","0px");  
				
			}
		    
			if('${ca.privacyFreenote}' == 'Y'){

	            $("div.freenoteCheck").css('background', '#53FF4C');
				$("button.freenoteCheck").css("left","40px");    
				
			}else if('${ca.privacyFreenote}' == 'N'){
				
				$("div.freenoteCheck").css('background', '#CCCCCC');
				$("button.freenoteCheck").css("left","0px");  
				
			}
			if('${ca.privacyPhoto}' == 'Y'){

	            $("div.photoCheck").css('background', '#53FF4C');
				$("button.photoCheck").css("left","40px");    
				
			}else if('${ca.privacyPhoto}' == 'N'){
				
				$("div.photoCheck").css('background', '#CCCCCC');
				$("button.photoCheck").css("left","0px");  
				
			}
			if('${ca.privacyAccount}' == 'Y'){

	            $("div.accountCheck").css('background', '#53FF4C');
				$("button.accountCheck").css("left","40px");    
				
			}else if('${ca.privacyAccount}' == 'N'){
				
				$("div.accountCheck").css('background', '#CCCCCC');
				$("button.accountCheck").css("left","0px");  
				
			}
			/* 메뉴관리 */
			
			/* 위젯관리 */
			if($("#privacy").val() == 1){ // 다이어리 공개
    			
    			if('${ca.activeDday}' == 'Y'){

   	            	$("div.ddayCheck").css('background', '#53FF4C');
					$("button.ddayCheck").css("left","40px");    
					
    			}else if('${ca.activeDday}' == 'N'){
    				
    				$("div.ddayCheck").css('background', '#CCCCCC');
					$("button.ddayCheck").css("left","0px");      				
    				
    			}
    		
    		    if('${ca.activeVoca}' == 'Y'){

   	            	$("div.vocaCheck").css('background', '#53FF4C');
					$("button.vocaCheck").css("left","40px");    
					
    			}else if('${ca.activeVoca}' == 'N'){
    				
    				$("div.vocaCheck").css('background', '#CCCCCC');
					$("button.vocaCheck").css("left","0px");  
    				
    			}
    		    
    			if('${ca.activeMemo}' == 'Y'){

   	            	$("div.memoCheck").css('background', '#53FF4C');
					$("button.memoCheck").css("left","40px");    
					
    			}else if('${ca.activeMemo}' == 'N'){
    				
    				$("div.memoCheck").css('background', '#CCCCCC');
					$("button.memoCheck").css("left","0px");  
    				
    			}
    			if('${ca.activeTimetable}' == 'Y'){

   	            	$("div.timetableCheck").css('background', '#53FF4C');
					$("button.timetableCheck").css("left","40px");    
					
    			}else if('${ca.activeTimetable}' == 'N'){
    				
    				$("div.timetableCheck").css('background', '#CCCCCC');
					$("button.timetableCheck").css("left","0px");  
    				
    			}
    		}else if($("#privacy").val() == 2){ // 친구 공개
    			
    			if('${ca.privacyDday}' == 'Y'){

   	            	$("div.ddayCheck").css('background', '#53FF4C');
					$("button.ddayCheck").css("left","40px");    
					
    			}else if('${ca.privacyDday}' == 'N'){
    				
    				$("div.ddayCheck").css('background', '#CCCCCC');
					$("button.ddayCheck").css("left","0px");      				
    				
    			}
    		
    		    if('${ca.privacyVoca}' == 'Y'){

   	            	$("div.vocaCheck").css('background', '#53FF4C');
					$("button.vocaCheck").css("left","40px");    
					
    			}else if('${ca.privacyVoca}' == 'N'){
    				
    				$("div.vocaCheck").css('background', '#CCCCCC');
					$("button.vocaCheck").css("left","0px");  
    				
    			}
    		    
    			if('${ca.privacyMemo}' == 'Y'){

   	            	$("div.memoCheck").css('background', '#53FF4C');
					$("button.memoCheck").css("left","40px");    
					
    			}else if('${ca.privacyMemo}' == 'N'){
    				
    				$("div.memoCheck").css('background', '#CCCCCC');
					$("button.memoCheck").css("left","0px");  
    				
    			}
    			if('${ca.privacyTimetable}' == 'Y'){

   	            	$("div.timetableCheck").css('background', '#53FF4C');
					$("button.timetableCheck").css("left","40px");    
					
    			}else if('${ca.privacyTimetable}' == 'N'){
    				
    				$("div.timetableCheck").css('background', '#CCCCCC');
					$("button.timetableCheck").css("left","0px");  
    				
    			}
    		}
			/* 위젯관리 */
    		
			/* 위젯관리 */
			$("#privacy").change(function(){
				
				$.ajax({
					url:"widgetChecked.ca",
            		type:"post",
            		data:{"memberNo":"3"},
            		success:function(ca){
            			if($("#privacy").val() == 1){ // 다이어리 공개
            				
                			if(ca.activeDday == 'Y'){

               	            	$("div.ddayCheck").css('background', '#53FF4C');
            					$("button.ddayCheck").css("left","40px");    
            					
                			}else if(ca.activeDday == 'N'){
                				
                				$("div.ddayCheck").css('background', '#CCCCCC');
            					$("button.ddayCheck").css("left","0px");      				
                				
                			}
                		
                		    if(ca.activeVoca == 'Y'){

               	            	$("div.vocaCheck").css('background', '#53FF4C');
            					$("button.vocaCheck").css("left","40px");    
            					
                			}else if(ca.activeVoca == 'N'){
                				
                				$("div.vocaCheck").css('background', '#CCCCCC');
            					$("button.vocaCheck").css("left","0px");  
                				
                			}
                		    
                			if(ca.activeMemo == 'Y'){

               	            	$("div.memoCheck").css('background', '#53FF4C');
            					$("button.memoCheck").css("left","40px");    
            					
                			}else if(ca.activeMemo == 'N'){
                				
                				$("div.memoCheck").css('background', '#CCCCCC');
            					$("button.memoCheck").css("left","0px");  
                				
                			}
                			if(ca.activeTimetable == 'Y'){

               	            	$("div.timetableCheck").css('background', '#53FF4C');
            					$("button.timetableCheck").css("left","40px");    
            					
                			}else if(ca.activeTimetable == 'N'){
                				
                				$("div.timetableCheck").css('background', '#CCCCCC');
            					$("button.timetableCheck").css("left","0px");  
                				
                			}
                		}else if($("#privacy").val() == 2){ // 친구 공개
                			
                			if(ca.privacyDday == 'Y'){

               	            	$("div.ddayCheck").css('background', '#53FF4C');
            					$("button.ddayCheck").css("left","40px");    
            					
                			}else if(ca.privacyDday == 'N'){
                				
                				$("div.ddayCheck").css('background', '#CCCCCC');
            					$("button.ddayCheck").css("left","0px");      				
                				
                			}
                		
                		    if(ca.privacyVoca == 'Y'){

               	            	$("div.vocaCheck").css('background', '#53FF4C');
            					$("button.vocaCheck").css("left","40px");    
            					
                			}else if(ca.privacyVoca == 'N'){
                				
                				$("div.vocaCheck").css('background', '#CCCCCC');
            					$("button.vocaCheck").css("left","0px");  
                				
                			}
                		    
                			if(ca.privacyMemo == 'Y'){

               	            	$("div.memoCheck").css('background', '#53FF4C');
            					$("button.memoCheck").css("left","40px");    
            					
                			}else if(ca.privacyMemo == 'N'){
                				
                				$("div.memoCheck").css('background', '#CCCCCC');
            					$("button.memoCheck").css("left","0px");  
                				
                			}
                			if(ca.privacyTimetable == 'Y'){

               	            	$("div.timetableCheck").css('background', '#53FF4C');
            					$("button.timetableCheck").css("left","40px");    
            					
                			}else if(ca.privacyTimetable == 'N'){
                				
                				$("div.timetableCheck").css('background', '#CCCCCC');
            					$("button.timetableCheck").css("left","0px");  
                				
                			}
                		}
            		},error:function(ca){
            			console.log("change 공개 ajax실패");
            		}
				});
				
    		});
			/* 위젯관리 */
				
    	});
    	
    	function resetMyColor(){
    		if(confirm("정말 초기화 하시겠습니까?")){
    			location.href="reset.ca?memberNo=${loginUser.memberNo}";
    		}else{
    			alert("최소 되었습니다.");
    		}
    	}
    	
    </script>
    
</body>

</html>