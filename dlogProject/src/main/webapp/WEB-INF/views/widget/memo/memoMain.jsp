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
			$(".metismenu a[href*='list.fn']").addClass("active");
			$(".metismenu a[href*='list.fn']").parent().addClass("active");
		});
	</script>
    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body" style="float: left;">
        <div class="row page-titles mx-0">
            <h3 style="color:rgb(94, 94, 94); padding-left: 15px; ">메모장</h3>
        </div>
        <!-- row -->
        <a class="btn mb-1 btn-success" href="enroll.mo" style="margin-left: 710px; margin-right:15px; font-size: 20px;">메모 작성</a>
        <button type="button" class="btn mb-1 btn-success deleteButton" style="font-size: 20px;">삭제</button>
        <br>
        <div class="container-fluid" style="margin-top:20px;">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px;">
                        <div class="card-body" >
                        
                            <form action="delete.mo" method="post" class="delete_memo_form update_memo_form">
                             <c:forEach var="m" items="${ list }">
                          	<div class="memo_main">
                               <div class="memo_main_title">
									<input type="hidden" name="memoNum" value="${ m.memoNo }">
                               	<c:out value="${ m.memoTitle }"/>
                                </div>
								<label class="switch">
								<input type="hidden" value="${ m.memoWidget }">
								<input type="checkbox" name="memoNo" value="${ m.memoNo }">
								<span class="slider round"></span>
							</label>
                            <input type="checkbox" name="checkArr" class="removeBox" value="${ m.memoNo }">
                          	</div>
                         	</c:forEach>
                        	</form>
                        	
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #/ container -->
    </div>        
            
	<script>
	
	$(function(){
		
		// 첫 로딩 시 Y인 것을 on
		$(".switch>input:hidden").each(function(){
			if($(this).val()=='Y'){
				$(this).next().attr("checked",true);
			}
		})
		
		// 위젯 하나만 선택할 수 있게
		$(".switch>input:checkbox").click(function(){
			if($(".switch>input:checkbox:checked").length > 0){
				$.ajax({
					url:"widgetNtoY.mo",
					data:{
						memoNo:$(this).val(),
						memoWriter:2
					},
					success:function(memoWidget){
						$(".memo_widget_content").text(memoWidget.memoContent);
						
					},error:function(){
						console.log("ajax통신 실패");
					}
				})
			}else{
				$.ajax({
					url:"widgetAlltoN.mo",
					data:{
						memoWriter:2
					},
					success:function(data){
						$(".memo_widget_content").text("");
					},error:function(){
						console.log("ajax통신 실패");
					}
				})
			}
			$(".switch>input:checkbox").not($(this)).prop("checked",false);
		})
		
		// 메모 삭제
		$(".removeBox").css("display","none");
		$(".deleteButton").click(function(){
			if($(".deleteButton").html()=="삭제"){
				$(this).html("확인");
				$(".removeBox").css("display","");
			}else{
				if($("input:checkbox[class=removeBox]:checked").length > 0){
					
					var checkArr = [];
					$("input:checkbox[class=removeBox]:checked").each(function(){
						checkArr.push($(this).val());
					})
					console.log(checkArr);
					
					var test = confirm("정말 삭제하시겠습니까?");
					if(test == true){
						$(".delete_memo_form").submit();
					}else{
						$("input:checkbox[class=removeBox]:checked").prop("checked", false);
					}
				}
				$(this).html("삭제");
				$(".removeBox").css("display","none");
			}
		})
	                     			
		// 제목 hover
		$(".memo_main_title").hover().css("cursor","pointer");
		
		// 상세 조회
		$(".memo_main_title").click(function(){
			location.href="updateForm.mo?memoNo="+$(this).children().eq(0).val();
		})
	})
	</script>
	
	<!--**********************************
        Content body end
    ***********************************-->  
	<jsp:include page="../../common/diaryWidget.jsp" />
    <jsp:include page="../../common/diaryFooter.jsp" />
    
</body>
</html>