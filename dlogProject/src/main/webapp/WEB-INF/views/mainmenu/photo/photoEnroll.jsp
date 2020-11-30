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
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/images/webImage.png" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="resources/css/osageuStyle.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div class="outer" style="margin: auto; width: 1390px;">
        <div id="main-wrapper" style="float: left;">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <div class="brand-logo">
                    <a href="#">
                        <b class="logo-abbr"><img src="resources/images/DlogLogo-text-short.png" alt="" width="19px"></b>
                        <span class="logo-compact"><img src="resources/images/DlogLogo-text.png" alt="" width="87"></span>
                        <span class="brand-title">
                            <img src="resources/images/DlogLogo-text.png" alt="" width="87px">
                        </span>
                    </a>
                </div>
            </div>
            <!--**********************************
                Nav header end
            ***********************************-->

            <!--**********************************
                Header start
            ***********************************-->
            <div class="header">    
                <div class="header-content clearfix">
                    
                    <div class="nav-control">
                        <div class="hamburger">
                            <span class="toggle-icon"><i class="icon-menu"></i></span>
                        </div>
                    </div>
                    <div class="header-left">
                        <div class="input-group icons">
                            <div class="input-group-prepend">
                                <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                            </div>
                            <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                            <div class="drop-down   d-md-none">
                                <form action="#">
                                    <input type="text" class="form-control" placeholder="Search">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-account-multiple-outline"></i>
                                    <span class="badge gradient-7 badge-pill badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">3 New Messages</span>  
                                        
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/1.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Saiful Islam</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/2.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Adam Smith</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Can you do me a favour?</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/3.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Barak Obama</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="resources/images/avatar/4.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Hilari Clinton</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hello</div>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                        
                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-bell-outline"></i>
                                    <span class="badge badge-pill gradient-2 badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">2 New Notifications</span>  
                                        
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events near you</h6>
                                                        <span class="notification-text">Within next 5 days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Started</h6>
                                                        <span class="notification-text">One hour ago</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Ended Successfully</h6>
                                                        <span class="notification-text">One hour ago</span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events to Join</h6>
                                                        <span class="notification-text">After two days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                        
                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown">
                                <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                    <img src="resources/images/default-profile-pic.jpg" height="40" width="40" alt="">
                                </div>
                                <div class="drop-down dropdown-profile   dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="app-profile.html"><i class="icon-home"></i> <span>내 다이어리로</span></a>
                                            </li>
                                            <li>
                                                <a href="email-inbox.html"><i class="icon-settings"></i> <span>설정</span></a>
                                            </li>
                                            
                                            <hr class="my-2">
                                            <li>
                                                <a href="page-lock.html"><i class="icon-lock"></i> <span>스크린 잠금</span></a>
                                            </li>
                                            <li><a href="page-login.html"><i class="icon-key"></i> <span>로그아웃</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            <div class="nk-sidebar">           
                <div class="nk-nav-scroll">
                    <ul class="metismenu" id="menu">
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-home menu-icon"></i><span class="nav-text">소개글</span>
                            </a>
                        </li>
                        <!-- 메인메뉴 -->
                        <li class="nav-label">메인메뉴</li>
                        <li>
                            <a href="selectList.ca" aria-expanded="false">
                                <i class="icon-calender menu-icon"></i><span class="nav-text">캘린더</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-notebook menu-icon"></i><span class="nav-text">다이어리</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-note menu-icon"></i><span class="nav-text">프리노트</span>
                            </a>
                        </li>
                        <li>
                            <a href="selectList.ph" aria-expanded="false" style="background:#F3F3F9">
                                <i class="icon-picture menu-icon"></i><span class="nav-text">사진게시판</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-wallet menu-icon"></i><span class="nav-text">가계부</span>
                            </a>
                        </li>
                        <!-- 위젯메뉴 -->
                        <li class="nav-label">위젯메뉴</li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-clock menu-icon"></i><span class="nav-text">디데이</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-speech menu-icon"></i><span class="nav-text">단어장</span>
                            </a>
                        </li>
                        <li>
                            <a href="selectList.mo" aria-expanded="false">
                                <i class="icon-doc menu-icon"></i><span class="nav-text">메모장</span>
                            </a>
                        </li>
                        <li>
                            <a href="url" aria-expanded="false">
                                <i class="icon-grid menu-icon"></i><span class="nav-text">시간표<span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">사진게시판</h3>
                </div>
                <!-- row -->
				
                <i id="addFrame" class="fas fa-plus-square" onclick="addFrame();"></i>
                <i id="removeFrame" class="fas fa-minus-square" onclick="removeFrame();"></i>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:900px; height: auto;">
                                <div class="card-body" style="margin-left: 30px;">
                                    
                                    <form method="post" action="insert.ph" enctype="multipart/form-data">
	                                    <div class="photo_outer">
		                                    <div class="photo_insertForm">
		                                        <div class="photo_insertForm_thumbnail" id="thumbnail1">
		                                        	
		                                        </div>
		                                        <div class="photo_insertForm_file photo_insertFom_choice">
		                                            <label for="ex_file1">사진 선택</label> 
		                                            <input type="file" name="upfiles" id="ex_file1" onchange="loadImg(this,1); loadUrl(1);" required>
		                                            <div id="showUrl1" class="showurl"></div>
		                                        </div>
		                                        <div class="photo_insertForm_date photo_insertFom_choice">
		                                            <div class="photo_enroll_info">날짜 선택</div>
		                                            <input type="date" name="list[0].photoDate" class="photo_enroll_date" onchange="changeColor(0);" required>
		                                        </div>
		                                        <div class="photo_insertForm_content photo_insertFom_choice">
		                                            <div class="photo_enroll_info">내용 작성</div>
		                                            <input type="text" name="list[0].photoContent" placeholder = "내용을 입력해주세요" class="photo_enroll_content" maxlength="30" required>
		                                        </div>
		                                    </div>
                                    	</div>
	                                    <br clear="both">
	                                    <br><br><br><br>
	                                    <button type="button" class="btn mb-1 btn-success" style="margin-left: 605px; margin-right:15px; font-size: 20px;" onclick="resetFrame();">초기화</button>
	                                    <button type="submit" class="btn mb-1 btn-success" style="font-size: 20px;">작성</button>
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
        
    </div>
    <!--**********************************
        Widget area end
    ***********************************-->
    <br clear="both">
    <!--**********************************
    Footer start
    ***********************************-->
    <div align="center">
        <div class="">
            <p>Copyright &copy; Designed & Developed by <a href="">Dlog</a> 2020</p>
        </div>
    </div>
    <!--**********************************
        Footer end
    ***********************************-->  

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    
	<script>
		
		frame = $(".photo_outer").html();
		frameCount = 0;
		frameNum = $(".photo_insertForm").length;
		
		$(function(){
            
			// [+],[-] 버튼에 클릭 모양 추가
			$("#addFrame").hover().css("cursor","pointer");
			$("#removeFrame").hover().css("cursor","pointer");
			
			// 날짜 선택 시 글자색이 회색에서 검은색으로 변경 --> 보류
			
			
		})
		
		// frame 추가
		addFrame = function(){
			if($(".photo_insertForm").siblings().length > 0){
				$(".photo_insertForm").siblings().last().after(frame);
				frameCount++;
			}else{
				$(".photo_insertForm").after(frame);
				frameCount++;
			}
			
			$('.photo_insertForm').eq(frameCount).children().eq(1).children('input').attr('id', 'ex_file'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(1).children('label').attr('for', 'ex_file'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(1).children('input').attr('onchange', 'loadImg(this,'+(frameCount+1)+'); loadUrl('+(frameCount+1)+');');
			$('.photo_insertForm').eq(frameCount).children().eq(2).children('input').attr('onchange', 'changeColor('+(frameCount)+');');
			$('.photo_insertForm').eq(frameCount).children().eq(0).attr('id', 'thumbnail'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(1).children('div').attr('id', 'showUrl'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(1).children('input').attr('name', 'upfiles');
			$('.photo_insertForm').eq(frameCount).children().eq(2).children('input').attr('name', 'list['+frameCount+'].photoDate');
			$('.photo_insertForm').eq(frameCount).children().eq(3).children('input').attr('name', 'list['+frameCount+'].photoContent');
		}
		
		// frame 제거
		removeFrame = function(){
			$(".photo_outer").children().last().remove();
			frameCount--;
		}
		
		// frame 초기화
		resetFrame = function(){
			$(".photo_outer").html(frame);
			frameCount = 0;
		}
		
		// 미리보기
	   	function loadImg(inputFile, num){
			
	        if(inputFile.files.length == 1){
	            var reader = new FileReader();              
	            reader.readAsDataURL(inputFile.files[0])   
	            reader.onload = function(e){ 
	            	$("#thumbnail"+num).html("<img src="+e.target.result+">");
	            }
	        }else{
	        	$("#thumbnail"+num).html("<img src=''>");
	        }
	        
	    }
		
	 	// 파일 첨부 시 파일명 노출
		function loadUrl(index){
			$("#showUrl"+index).html($("#ex_file"+index).val().substring($("#ex_file"+index).val().lastIndexOf("\\")+1, $("#ex_file"+index).val().length));
		}
		
	 	// 날짜 색상 변경
	 	changeColor = function(index){
	 		$(".photo_enroll_date").eq(index).css("color","rgb(70,70,70)");
	 	}
		
	</script>
</body>

</html>