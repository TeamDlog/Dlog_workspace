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

	<jsp:include page="../../common/diaryHeader.jsp" />
	
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

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px; height: auto;">
                        <div class="card-body" style="margin-left: 30px;">
							<div align="right">
						        <i id="addFrame" class="fas fa-plus-square" onclick="addFrame();"></i>
						        <i id="removeFrame" class="fas fa-minus-square" onclick="removeFrame();"></i>
					        </div>
                            <form method="post" action="insert.ph" enctype="multipart/form-data">
	                            <div class="photo_outer">
		                            <div class="photo_insertForm">
		                            	<input type="hidden" name="list[0].photoWriter" value="${ loginUser.memberNo }">
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
	                             <div align="right">
		                             <button type="button" class="btn mb-1 btn-success btn-sm" style="margin-right:10px; font-size: 15px;" onclick="resetFrame();">초기화</button>
		                             <button type="submit" class="btn mb-1 btn-success btn-sm" style="font-size: 15px;">작성</button>
	                             </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #/ container -->
    </div>        
	<script>
		
		frame = $(".photo_outer").html();
		frameCount = 0;
		frameNum = $(".photo_insertForm").length;
	
		$(function(){
	
			// [+],[-] 버튼에 클릭 모양 추가
			$("#addFrame").hover().css("cursor","pointer");
			$("#removeFrame").hover().css("cursor","pointer");
	
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
	
			$('.photo_insertForm').eq(frameCount).children().eq(2).children('input').attr('id', 'ex_file'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(2).children('label').attr('for', 'ex_file'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(2).children('input').attr('onchange', 'loadImg(this,'+(frameCount+1)+'); loadUrl('+(frameCount+1)+');');
			$('.photo_insertForm').eq(frameCount).children().eq(3).children('input').attr('onchange', 'changeColor('+(frameCount)+');');
			$('.photo_insertForm').eq(frameCount).children().eq(1).attr('id', 'thumbnail'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(2).children('div').attr('id', 'showUrl'+(frameCount+1));
			$('.photo_insertForm').eq(frameCount).children().eq(2).children('input').attr('name', 'upfiles');
			$('.photo_insertForm').eq(frameCount).children().eq(3).children('input').attr('name', 'list['+frameCount+'].photoDate');
			$('.photo_insertForm').eq(frameCount).children().eq(4).children('input').attr('name', 'list['+frameCount+'].photoContent');
			$('.photo_insertForm').eq(frameCount).children().eq(0).attr('name', 'list['+frameCount+'].photoWriter');
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
    <!--**********************************
        Content body end
    ***********************************-->  
    <jsp:include page="../../common/diaryWidget.jsp" />
    <jsp:include page="../../common/diaryFooter.jsp" />
        
</body>
</html>