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
    .container-fluid input[type="text"], .container-fluid input[list="category"]{
        width:784px; 
        height: 35px; 
        border: .5px solid darkgrey;
        padding-left: 10px;
    }
    .card-body>label{
        margin: 13px 0;
    }
    #topicOptions{
        background:rgb(228, 228, 228);
        padding:20px;
        width:200px;
        position:relative;
        left:75px;
        top:-40px;
        display:none;
        margin-bottom: 0;
    }
    #topicSelected:hover, #topicBtn:hover{
        cursor: pointer;
    }
    
</style>
</head>
<body>
	
	<jsp:include page="../../common/diaryHeader.jsp"/>
	
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
	        <div class="col p-md-0">
	            <ol class="breadcrumb">
	                <li class="breadcrumb-item"><a href="list.fn">프리노트</a></li>
	                <li class="breadcrumb-item active">글수정</li>
	            </ol>
	        </div>
	    </div>
	    <!-- row -->
	
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-12">
	                <div class="card backgroundColor" style="width:900px;">
	                    <div class="card-body backgroundColor">
	                        <form action="update.fn" method="post">
	                        	<input type="hidden" name="freenoteNo" value="${ fn.freenoteNo }">
	                            <div align="center">
	                                <input type="text" name="freenoteTitle" placeholder="제목을 작성해주세요" value="${ fn.freenoteTitle }" required>
	                            </div>
	                            <div class="card-body" style="padding-top: 15px;">
	                                <textarea class="summernote" name="freenoteContent">
	                                	${ fn.freenoteContent }
	                                </textarea>
	                            </div>
	                            <div class="card-body" style="padding-top: 0px; padding-bottom: 0;">
	                                <label for="category1"><b>카테고리</b>&emsp;</label>
	                                <input list="category" name="freenoteCategory" value="${ fn.freenoteCategory }" style="width: 160px;" required>
	                                <datalist id="category">
	                                    <c:forEach var="c" items="${ cateList }" >
                                        	<option value="${ c }">${ c }</option>
                                        </c:forEach>
	                                </datalist>
	                                <br>
	                                <label id="topicBtn" onclick="showTopic();"><b>주제 &nbsp;&gt;</b></label>&emsp;&emsp;&nbsp;<span id="topicSelected" onclick="showTopic();">${ fn.freenoteTopic }</span>
	                                <br>
	                                <div id="topicOptions">   
	                                    <h5>주제 설정</h5>
	                                    <input type="radio" name="freenoteTopic" id="art" value="엔터테인먼트/예술"><label for="art">&nbsp;엔터테인먼트/예술</label><br>
	                                    <input type="radio" name="freenoteTopic" id="life" value="생활/노하우/쇼핑"><label for="life">&nbsp;생활/노하우/쇼핑</label><br>
	                                    <input type="radio" name="freenoteTopic" id="hobby" value="취미/여가/여행"><label for="hobby">&nbsp;취미/여가/여행</label><br>
	                                    <input type="radio" name="freenoteTopic" id="knowledge" value="지식/동향"><label for="knowledge">&nbsp;지식/동향</label><br>
	                                    <input type="radio" name="freenoteTopic" id="none" value="주제선택안함" checked><label for="none">&nbsp;주제선택안함</label><br>
	                                </div>
	                                <label><b>공개 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="privacyY" name="freenotePrivacy" required><label for="privacyY">&nbsp;공개</label>&emsp;
	                                <input type="radio" value="N" id="privacyN" name="freenotePrivacy" required><label for="privacyN">&nbsp;비공개</label>
	                                <br>
	                                <label><b>커뮤니티 공개 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="commPrivacyY" name="freenotePrivacyComm" required><label for="commPrivacyY">&nbsp;공개</label>&emsp;
	                                <input type="radio" value="N" id="commPrivacyN" name="freenotePrivacyComm" required><label for="commPrivacyN">&nbsp;비공개</label>
	                                <br>
	                                <label><b>댓글 설정</b>&emsp;</label>
	                                <input type="radio" value="Y" id="commentY" name="freenoteCommentYN" required><label for="commentY">&nbsp;허용</label>&emsp;
	                                <input type="radio" value="N" id="commentN" name="freenoteCommentYN" required><label for="commentN">&nbsp;비허용</label>
	                            </div>
	                            <div align="center">
	                                <button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
	                                <input type="submit" value="저장" class="btn btn-success">
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
	<script>
    	$(function(){
    		// 등록했던 값 표시
    		$("input:radio[value='${ fn.freenoteTopic }']").attr("checked", true);
    		$("input:radio[id='privacy${fn.freenotePrivacy}']").attr("checked", true);
    		$("input:radio[id='commPrivacy${fn.freenotePrivacyComm}']").attr("checked", true);
    		$("input:radio[id='comment${fn.freenoteCommentYN}']").attr("checked", true);
    	
    		if('${fn.freenotePrivacy}' == 'N'){
    			$("input:radio[name='freenotePrivacyComm']").attr("disabled", true);
                $("input:radio[name='freenoteCommentYN']").attr("disabled", true);
    		}
    		
    		// 공개 설정에 따른 변경
            $("input[name=freenotePrivacy]").click(function(){
                if($(this).val()=='Y'){
                    $("input:radio[name='freenoteCommentYN']").removeAttr("disabled");
                    $("input:radio[name='freenotePrivacyComm']").removeAttr("disabled");
                }else{                            
                    $("#commPrivacyN").prop("checked", true);
                    $("#commentN").prop("checked", true);

                    $("input:radio[name='freenotePrivacyComm']").attr("disabled", true);
                    $("input:radio[name='freenoteCommentYN']").attr("disabled", true);
                }
            })
        })

        function showTopic(){
            if($("#topicOptions").css("display")=="none"){
                $("#topicOptions").css("display", "block");
            }else{
                $("#topicOptions").css("display", "none");
            }
        }

        $("input[name=freenoteTopic]").click(function(){
            $("#topicSelected").text($(this).val());
            $("#topicOptions").css("display", "none");
        })
    </script>
	
	
	<jsp:include page="../../common/diaryWidget.jsp"/>
	
	<jsp:include page="../../common/diaryFooter.jsp"/>

</body>
</html>