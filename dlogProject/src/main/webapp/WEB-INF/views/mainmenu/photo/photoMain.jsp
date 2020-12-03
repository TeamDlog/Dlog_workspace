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
</head>
<body>

	<jsp:include page="../../common/osageuDiaryHeader.jsp" />

	<script>
		$(function(){
			$(".metismenu a[href*='selectList.ph']").addClass("active");
			$(".metismenu a[href*='selectList.ph']").parent().addClass("active");
		});
	</script>
    <!--**********************************
        Content body start
    ***********************************-->

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
                    <div class="card backgroundColor" style="width:900px;">
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
		// 게시글 삭제
		$(function(){
			$(".removeBox").css("display","none");
			$(".deleteButton").click(function(){
				if($(".deleteButton").html()=="삭제"){
					$(this).html("확인");
					$(".photo_main").attr("data-toggle","");
					$(".removeBox").css("display","");
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
	
			$(".photo_main_photo>img").click(function(){
	
				if($(".deleteButton").html()=="확인"){
					if($(this).prev().attr("checked")){
						$(this).prev().attr("checked",false);
					}else{
						$(this).prev().attr("checked",true);
					}
				}
	
			});
	
		})
	</script>

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
            
    <!--**********************************
        Content body end
    ***********************************-->  
	<jsp:include page="../../common/diaryWidget.jsp" />
    <jsp:include page="../../common/diaryFooter.jsp" />
    <jsp:include page="../../common/friendjQuery.jsp" />
    
    
</body>
</html>