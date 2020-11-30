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
     <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Custom Stylesheet -->
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
							        <i class="fas fa-user-friends" id="friend_icon"></i>
							        <span class="badge gradient-7 badge-pill badge-primary">3</span>
							    </a>
							    <div class="drop-down fadeIn dropdown-menu" id="friend_list" style="padding: 0px;">
							        <div id="friend_list_buttons">
							            <div class="friend_list_button">친구 목록</div>  
							            <div class="friend_request_button">친구 요청</div>  
							        </div>
							        <div class="dropdown-content-body" id="friend_list_outer">
							            <div id="friend_list_search_outer">
							                <div class="friend_list_search">
							                    <input type="text" id="friend_ajax_search" placeholder="내 친구를 찾아보세요!">
							                    <span id="friend_ajax_count"></span>
							                </div>
							            </div>
							            <div class="friend_list_height">
							             <ul class="friend_list_ul">
							                 <c:forEach var="f" items="${ friendList }" varStatus="status">
							                  <li class="friend_list">
							                      <div class="friend_list_images">
							                          <img src="resources/images/avatar/1.jpg">
							                      </div>
							                      <div class="friend_list_nickname">
							                          <div class="notification-heading friend_list_nick">${ f.friendNickname }</div>
							                      </div>
							                      <div class="friend_list_delete" align="right">
							                          <button class="friend_delete_DB" value="${ f.friendAccepted }">삭제</button>
							                      </div>
							                  </li>
							                 </c:forEach>
							             </ul>
							            </div>
							            <div class="bootstrap-pagination" align="center">
							            	<input type="hidden" value="" id="this_page_friend_currentPage">
							            	<c:if test="${ friendList ne null }">
							             	<input type="hidden" value="${ friendList[0].friendOwner }" id="friend_owner">
							            	</c:if>
							                <nav>
							                    <ul class="pagination justify-content-center friend_pagination">
													<li class="page-item pre-page-moving-li">
														<a class="page-link page-moving pre-page-moving hovered">&lt;</a>
													</li>
													
													<c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
														<li class="page-item page-num"><a class="page-link" onclick="pageMove(${p});">${ p }</a></li>
													</c:forEach>
													
													<li class="page-item next-page-moving-li">
														<a class="page-link page-moving next-page-moving hovered">&gt;</a>
													</li>
							                    </ul>
							                </nav>
							            </div>
							        </div>
							        
							        <div class="dropdown-content-body" id="friend_request_outer">
							            <div class="friend_request_search">
							            	<div id="frs_left">
							            		<input type="text" id="find_friend_keyword" placeholder="추가할 친구를 검색해보세요!">
							            	</div>
							            	<div id="frs_right" onclick="findFriend();">
							                	<i class="fa fa-search"></i>
							            	</div>
							            </div>
							            <div class="friend_request_height">
							             <ul class="friend_request_ul">
							             	<c:forEach var="rf" items="${ requestFriend }">
							                  <li class="friend_request">
							                      <div class="friend_request_images">
							                          <img src="resources/images/avatar/2.jpg">
							                      </div>
							                      <div class="friend_request_nickname">
							                          <div class="notification-heading">${ rf.friendNickname }</div>
							                      </div>
							                      <div class="friend_request_yesorno" align="right">
							                      	<input type="hidden" value="${ rf.friendNo }">
							                          <img src="resources/images/checked.png" width="25" height="25" class="accept_friend_icon">
							                          <img src="resources/images/close.png" width="20" height="20">
							                      </div>
							                  </li>
							                 </c:forEach>
							             </ul>
							            </div>
							            
							        </div>
							    </div>
							</li>
							<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
							        <i class="fas fa-user-friends"></i>
							        <span class="badge gradient-7 badge-pill badge-primary">3</span>
							    </a>
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
			
						
			<script>
				$(function(){
					
					// 첫 로딩 시 리스트만 보여주기
					$(".friend_request_outer").css("display","none");
					
					// 이동
                    $(".friend_list_button").click(function(){
                    	$(".friend_list_outer").css("display","");
                    	$(".friend_request_outer").css("display","none");
                    })
                    $(".friend_request_button").click(function(){
                    	$(".friend_request_outer").css("display","");
                    	$(".friend_list_outer").css("display","none");
                    })
				})
			</script>
			
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
            
            <c:if test="${ !empty alertMsg }">
            	<script>
            		alert("${ alertMsg }");
            	</script>
            	<c:remove var="alertMsg" scope="session"/>
            </c:if>
            
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">사진게시판</h3>
                </div>
                <!-- row -->
                <a class="btn mb-1 btn-success" style="margin-left: 690px; margin-right:15px; font-size: 20px;" href="enroll.ph">사진 올리기</a>
                <a class="btn mb-1 btn-success deleteButton" style="font-size: 20px;">삭제</a>
                <div class="container-fluid" style="margin-top:15px;">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:900px;">
                                <div class="card-body" >
                                	
                                	<form action = "delete.ph" method="post" id="photo_form">
	                                    <c:forEach var="p" items="${ list }" varStatus="status">
			                                <div class="photo_main portfolio-item">
			                                	<input type="hidden" value="${ status.count }">
			                                    <div class="photo_main_photo" data-toggle="" data-target="#main_photo_modal">
			                                    	<input type="checkbox" class="removeBox" name="deleteNums" value="${ p.photoNo }">
			                                        <img src="${ p.photoChangeName }" class="pick_main_photo">
			                                    </div>
			                                    <div class="photo_main_date">
			                                        ${ p.photoDate }
			                                    </div>
			                                    <div class="photo_main_content">
			                                        ${ p.photoContent }
			                                    </div>
			                                </div>
	                                    </c:forEach>
									</form>
									
									<script>
										// 게시글 삭제
										$(function(){
											$(".removeBox").css("display","none");
											$(".deleteButton").click(function(){
												if($(".deleteButton").html()=="삭제"){
													$(this).html("확인");
													$(".photo_main").attr("data-toggle","");
													$(".removeBox").css("display","");
													$(".photo_main_photo img").click(function(){
														if($(this).prev().attr("checked")==true){
															$(this).prev().prop("checked",false);
														}else{
															$(this).prev().prop("checked",true);
														}
													});
												}else{
													if($("input:checkbox[class=removeBox]:checked").length > 0){
														var test = confirm("정말 삭제하시겠습니까?");
														if(test == true){
															$("#photo_form").submit();
														}else{
															$("input:checkbox[class=removeBox]:checked").prop("checked", false);
														}
													}
													$(this).html("삭제");
													$(".removeBox").css("display","none");
												}
											})
										})
									</script>
									
	                                <div class="bootstrap-pagination" align="center">
                                        <nav>
                                            <ul class="pagination justify-content-center">
	                                            <c:choose>
							                		<c:when test="${ pi.currentPage eq 1 }">
									                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
							                		</c:when>
							                		<c:otherwise>
									                    <li class="page-item"><a class="page-link" href="selectList.ph?currentPage=${ pi.currentPage-1 }">Previous</a></li>
							                		</c:otherwise>
							                    </c:choose>
							                    
							                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							                    	<li class="page-item"><a class="page-link page-number" href="selectList.ph?currentPage=${ p }">${ p }</a></li>
							                    </c:forEach>
							                    
							                    <c:choose>
							                		<c:when test="${ pi.currentPage eq pi.maxPage }">
									                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
							                		</c:when>
							                		<c:otherwise>
							                    		<li class="page-item"><a class="page-link" href="selectList.ph?currentPage=${ pi.currentPage+1 }">Next</a></li>
							                		</c:otherwise>
							                    </c:choose>
                                            </ul>
                                        </nav>
                                    </div>
	                                
				                    <script>
				                    	// 현재 페이지 색칠
				                    	$(function(){
				                    		$(".page-link").each(function(){
				                    			if($(this).text()==${ pi.currentPage }){
				                    				$(this).css({"background":"rgb(132,200,185)", "color":"white"});
				                    			}
				                    		});
				                    	})
				                    </script>
				                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>
            
            <!-- Modal -->
		    <div class="portfolio-modal modal fade" id="main_photo_modal" tabindex="-1" role="dialog" aria-labelledby="portfolioModal3Label" aria-hidden="true">
		        <div class="modal-dialog" role="document" style="width:1000px; height:1000px;">
		            <div class="modal-content" style="background:black;">
		                <div class="modal-body text-center">
		                    <div class="container">
		                        <div class="row justify-content-center">
		                        	<input type="hidden" id="photo_number" value="">
		                        	<span class="page_move_span">
		                        		<i class="fas fa-angle-left pre_page_move page_move"></i>
		                        	</span>
		                            <div class="col-lg-8">
		                                <!-- Portfolio Modal - Title-->
		                                <!-- <h2 class="portfolio-modal-title text-secondary" id="main_photo_modal_date"></h2> -->
		                                <!-- Portfolio Modal - Image-->
		                                <div class="main_photo_modal_outer">
		                                	<img class="main_photo_modal" src=""/>
		                                </div>
		                                <!-- Portfolio Modal - Text-->
		                                <p class="mb-5" id="photo_main_modal_content"></p>
		                                <button class="btn btn-success" data-dismiss="modal" style="font-size:20px;">
		                                    닫기
		                                </button>
		                            </div>
		                            <span class="page_move_span">
		                            	<i class="fas fa-angle-right next_page_move page_move"></i>
		                            </span>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>    
            <script>
            	$(function(){
            		
            		$(".photo_main_photo>img").hover().css("cursor","pointer");
            		var countPhoto = 0;
            		// 확대해서 보기
            		$(".photo_main_photo>img").click(function(){
            			if($(".deleteButton").html()=="삭제"){
            				$(".photo_main_photo").attr("data-toggle","modal");
            				$(".main_photo_modal").attr("src", $(this).attr("src"));
		            		$("#photo_main_modal_content").text($(this).parent().siblings().eq(2).text());
		            		$("#photo_number").val($(this).parent().siblings().eq(0).val()-1);
		            		countPhoto = $("#photo_number").val();
		            		countPhoto = Number(countPhoto);
		            		
		            		if(countPhoto > 0){
		            			$(".pre_page_move").css("display","");
		            		} else if(countPhoto == 0){
		            			$(".pre_page_move").css("display","none");
		            		}
		            		
		            		if(countPhoto < $(".photo_main").length-1){
		            			$(".next_page_move").css("display","");
		            		} else if(countPhoto == $(".photo_main").length-1){
		            			$(".next_page_move").css("display","none");
		            		}
            			}else{
            				$(".photo_main_photo").attr("data-toggle","");
            			}
	            	})
            		
            		
	            	// 페이지 이동
	            	$(".page_move").hover().css("cursor","pointer");
            		
            		$(".pre_page_move").click(function(){
            			countPhoto--;
            			$(".main_photo_modal").attr("src", $(".pick_main_photo").eq(countPhoto).attr("src"));
            			$("#photo_main_modal_content").text($(".photo_main_content").eq(countPhoto).text());
            			if(countPhoto < 1){
            				$(".pre_page_move").css("display","none");
            			}
            			if(countPhoto < $(".photo_main").length-1){
            				$(".next_page_move").css("display","");
            			}
            		})
            		$(".next_page_move").click(function(){
            			countPhoto++;
            			if(countPhoto > 0){
            				$(".pre_page_move").css("display","");
            			}
            			if(countPhoto == $(".photo_main").length-1){
            				$(".next_page_move").css("display","none");
            			}
            			$(".main_photo_modal").attr("src", $(".pick_main_photo").eq(countPhoto).attr("src"));
            			$("#photo_main_modal_content").text($(".photo_main_content").eq(countPhoto).text());
            		})
	            				
            	})
            </script>
            
        </div>
        <!--**********************************
            Content body end
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
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->
    
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
	<jsp:include page="../../common/friendjQuery.jsp"/>
</body>

</html>