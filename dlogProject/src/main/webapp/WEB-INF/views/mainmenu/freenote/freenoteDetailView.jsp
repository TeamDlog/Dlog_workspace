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
     .card-body label{
         margin: 13px 0;
     }
	#replyArea{
		padding: 5px;
	}
    #replyArea textarea, .enrollReply1 textarea{
        resize: none;
    }
    .enrollReply2, .reply2{
        /*display: none;*/
    }
    .reply1, .reply2{
        margin-bottom: 15px;;
    }
    #deleteBtn:hover{
    	cursor:pointer;
    }
    #replyPagination button{
    	margin:1.5px;
    }
    .likeBtn:hover{
    	cursor:pointer;
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
                    <li class="breadcrumb-item active">상세보기</li>
                </ol>
            </div>
        </div>
        <!-- row -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card backgroundColor" style="width:900px;">
                        <div class="card-body" >
                            
                            <div id="titleArea">
                                <table>
                                    <tr>
                                        <td width="400" style="font-size: 20px;">[${ fn.freenoteCategory }] ${ fn.freenoteTitle }</td>
                                        <td width="500" align="right">
                                            ${fn.createDate}
                                        <c:if test="${ fn.freenoteWriter eq loginUser.nickname }">
                                            &nbsp;|&nbsp;
                                            <a href="updateForm.fn?fno=${ fn.freenoteNo }">수정</a>
                                            &nbsp;|&nbsp;
                                            <a id="deleteBtn">삭제</a>
                                        </c:if>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <hr style="margin:10px 0">
                            <div id="contentArea" style="min-height:400px; padding:10px; overflow:auto;">
                                ${ fn.freenoteContent }
                            </div>
                            <div id="etcArea">
                                댓글 <span id="rcount"></span> &emsp;
                                <!-- 좋아요 -->
                                <c:choose>
                                	<c:when test="${ fn.freenoteWriter != loginUser.nickname }">
		                                <a class="likeBtn" onclick="likePost();">
                                		<c:choose>
                                			<c:when test="${ fn.likeStatus eq 0 }">
		                                		<span id="heart"><i class="mdi mdi-heart-outline"></i></span> 좋아요</a>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<span id="heart"><i class="mdi mdi-heart"></i></span> 좋아요</a>
		                                	</c:otherwise>
		                                </c:choose>
		                                <span id="likeCount">${ fn.freenoteLike }</span>
	                                </c:when>
	                                <c:otherwise>
	                                	좋아요 ${ fn.freenoteLike }
	                                </c:otherwise>
                                </c:choose>
                            </div>
                            <hr>
                            <div id="replyArea"></div>
                            <div id="replyPagination" align="center"></div>
                            <c:if test="${fn.freenoteCommentYN eq 'Y' }">
	                            <div class="enrollReply1" id="addReply2-0" align="right" style="padding-top: 30px;">
	                                <textarea id="enrollReply1" class="form-control" placeholder="내용을 입력해주세요" style="height: 80px;" maxlength="500" required></textarea>
	                                <span id="count">0</span>/500&nbsp;&nbsp;<button class="btn btn-flat btn-success" onclick="addReply(0, 1);">등록</button>
	                            </div>
                            </c:if>
                            <br>
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
    
    <!-- 좋아요, 삭제 버튼 관련 스크립트 -->
    <script>
		// 글 삭제 확인용
	    $("#deleteBtn").click(function(){
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href="delete.fn?fno=${ fn.freenoteNo }";
			}
		});
		
		// 글 좋아요 hover
		/*
		$(".likeBtn").hover(
			function(){
				if(${ fn.likeStatus } == 0){
					$("#heart").html("<i class='mdi mdi-heart'></i>");
				}else{
					$("#heart").html("<i class='mdi mdi-heart-outline'></i>");
				}
			}, function(){
				if(${ fn.likeStatus } == 0){
					$("#heart").html("<i class='mdi mdi-heart-outline'></i>");
				}else{
					$("#heart").html("<i class='mdi mdi-heart'></i>");
				}
			}
		);
		*/
		
		// 댓글 좋아요 hover
		$()
		
		// 글 좋아요 버튼
	    function likePost(){
			$.ajax({
				url:"likePost.fn",
				type:"post",
				data:{
					memberNo:${loginUser.memberNo},
					fno:${fn.freenoteNo},
					loginUserNickname:'${ loginUser.nickname }',
					freenoteTitle:'${ fn.freenoteTitle }',
					freenoteWriterNo:${ fn.memberNo }
				}, success:function(result){
					
					
					if(result>0){
						$("#likeCount").html( parseInt($("#likeCount").text()) + 1);
						$("#heart").html("<i class='mdi mdi-heart'></i>");
					}else{
						$("#likeCount").html( parseInt($("#likeCount").text()) - 1 );
						$("#heart").html("<i class='mdi mdi-heart-outline'></i>");
					}
					
					
				}, error:function(){
					console.log("게시글 좋아요 ajax 통신 실패");
				}
			});
		}
	    
		// 댓글 좋아요 버튼
	    function likeReply(rno){
			$.ajax({
				url:"likeReply.fn",
				type:"post",
				data:{
					memberNo:${loginUser.memberNo},
					rno:rno,
					loginUserNickname:'${ loginUser.nickname }',
					freenoteWriterNo:${ fn.memberNo }
				}, success:function(result){
					
					if(result>0){
						$("#likeCount-" + rno).html( parseInt($("#likeCount-" + rno).text()) + 1);
						$("#heart-" + rno).html("<i class='mdi mdi-heart'></i>");
					}else{
						$("#likeCount-" + rno).html( parseInt($("#likeCount-" + rno).text()) - 1 );
						$("#heart-" + rno).html("<i class='mdi mdi-heart-outline'></i>");
					}
				}, error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
    </script>
    
    
    <!-- 댓글관련 스크립트 -->
    <script>
	    $(function(){
			selectReplyList(1, 0);
	    });
		
		// 댓글리스트 조회용 ajax
		function selectReplyList(cPage, refRno){
			$.ajax({
				url:"rlist.fn",
				data:{
					fno:${ fn.freenoteNo },
					currentPage:cPage
				},
				success:function(result){
					$("#rcount").text(result.replyCount);
					
					if(result.rlist.length > 0){
						var comment = "";
						for(var i in result.rlist){
							var countReply2 = 0; // 대댓글 수
                        	var comment2 = "";
	                        for(var j in result.rlist2){
	                        	if(result.rlist2[j].refRno == result.rlist[i].replyNo){
	                        		// 대댓글 작성 후 대댓글 영역 display 속성 block으로 주기 위해
	                        		if(result.rlist[i].replyNo == refRno){
	                        			comment2 += "<div class='reply2 reply2-" + result.rlist[i].replyNo + "' style='display:block;'>";
	                        		}else{
	                        			comment2 += "<div class='reply2 reply2-" + result.rlist[i].replyNo + "' style='display:none;'>";
	                        		}
	                        		
	                        		comment2 += 
	                                    "<table>" +
	                                        "<tr>" +
	                                            "<td width='35'>" +
	                                                "<img src='resources/images/reply_arrow.png' width='17'>" +
	                                            "</td>" +
	                                            "<td colspan='2' height='40'>" +                            
	                                                "<img src='resources/images/default-profile-pic.jpg' class='rounded-circle' height='35' width='35'> &nbsp;" + result.rlist2[j].replyWriter +
	                                            "</td>" +
	                                        "</tr>" +
	                                        "<tr>" +
	                                            "<td></td>" +
	                                            "<td colspan='2'>" +
													result.rlist2[j].replyContent +
	                                            "</td>" +
	                                        "</tr>" +
	                                        "<tr height='30'>" +
	                                            "<td></td>" +
	                                            "<td width='700'>" +
	                                            	result.rlist2[j].createDate + "&emsp;";
	                        	    if(result.rlist2[j].replyWriter != '${loginUser.nickname}'){
	                        	    	if(result.rlist2[j].likeStatus == 0){
	                        	    		comment2 += "<a class='likeBtn' onclick='likeReply(" + result.rlist2[j].replyNo + ")'><span id='heart-" + result.rlist2[j].replyNo + "'><i class='mdi mdi-heart-outline'></i></span> 좋아요</a>&nbsp;" +
                                 			"<span id='likeCount-" + result.rlist2[j].replyNo + "'>" + result.rlist2[j].replyLike + "</span>";
	                        	    	}else{
	                        	    		comment2 += "<a class='likeBtn' onclick='likeReply(" + result.rlist2[j].replyNo + ")'><span id='heart-" + result.rlist2[j].replyNo + "'><i class='mdi mdi-heart'></i></span> 좋아요</a>&nbsp;" +
                                 			"<span id='likeCount-" + result.rlist2[j].replyNo + "'>" + result.rlist2[j].replyLike + "</span>";
	                        	    	}
	                        	    }else{
	                        	    	comment2 += "좋아요 " + result.rlist2[j].replyLike;
	                        	    }
	                        	    comment2 += "</td>" +
	                                            "<td width='200' align='right'>";
	                                if(result.rlist2[j].replyWriter == '${loginUser.nickname}' || '${fn.freenoteWriter}' == '${loginUser.nickname}'){
	                                	comment2 += "<button class='btn btn-outline-light btn-sm btn-flat' onclick='confirmDeleteReply(" + result.rlist2[j].replyNo + ", " + result.rlist[i].replyNo + ", " + result.pi.currentPage + ");'>삭제</button>";
	                                }
	                                comment2 += "</td>" +
	                                        "</tr>" +
	                                    "</table>" +
	                                "</div>";
	                                countReply2 += 1;
	                        	}
	                        }
							
							var comment1 = "<div class='reply1'>" +
			                    "<table>" + 
			                        "<tr>" +
			                            "<td colspan='2' height='40'>" +                            
			                                "<img src='resources/images/default-profile-pic.jpg' class='rounded-circle' height='35' width='35'> &nbsp;" + result.rlist[i].replyWriter + 
			                            "</td>" +
			                        "</tr>" +
			                        "<tr>" +
			                            "<td colspan='2'>";
			                if(result.rlist[i].status == 'Y'){
								comment1 += result.rlist[i].replyContent;
			                }else{
			                	comment1 += "삭제된 댓글입니다";
			                }
			                comment1 +=
			                            "</td>" +
			                        "</tr>" +
			                        "<tr height='30'>" +
			                            "<td width='300'>" +
			                            	result.rlist[i].createDate + "&emsp;";
			                if(result.rlist[i].status == 'Y' && '${loginUser.nickname}' != result.rlist[i].replyWriter){
			                	
			                	if(result.rlist[i].likeStatus == 0){
			                		comment1 += "<a class='likeBtn' onclick='likeReply(" + result.rlist[i].replyNo + ")'><span id='heart-" + result.rlist[i].replyNo + "'><i class='mdi mdi-heart-outline'></i></span> 좋아요</a>&nbsp;" +
	                                			"<span id='likeCount-" + result.rlist[i].replyNo + "'>" + result.rlist[i].replyLike + "</span>&emsp;";
			                	}else{
			                		comment1 += "<a class='likeBtn' onclick='likeReply(" + result.rlist[i].replyNo + ")'><span id='heart-" + result.rlist[i].replyNo + "'><i class='mdi mdi-heart'></i></span> 좋아요</a>&nbsp;" +
	                                			"<span id='likeCount-" + result.rlist[i].replyNo + "'>" + result.rlist[i].replyLike + "</span>&emsp;";
			                	}
			                }else{
			                	comment1 += "좋아요 " + result.rlist[i].replyLike + "&emsp;";
			                }
			                comment1 +=		"<button class='btn btn-outline-light btn-sm btn-flat' id='addReply2Btn-" + result.rlist[i].replyNo + "' onclick='addReply2(" + result.rlist[i].replyNo + ");'>답글&nbsp;" + countReply2 + "</button>" +
			                            "</td>" +
			                            "<td width='600' align='right'>";
			                if(result.rlist[i].status == 'Y' && (result.rlist[i].replyWriter == '${loginUser.nickname}' || '${fn.freenoteWriter}' == '${loginUser.nickname}')){
			                	comment1 += "<button class='btn btn-outline-light btn-sm btn-flat' onclick='confirmDeleteReply(" + result.rlist[i].replyNo + ", 0, 1);'>삭제</button>";
			                }
			                comment1 +=
			                            "</td>" +
			                        "</tr>" +
			                    "</table>" +
			                "</div>";
			                
	                        comment += comment1;
	                        comment += comment2;
	                        
	                        if(result.rlist[i].status == 'Y' && '${fn.freenoteCommentYN}' == 'Y'){
		                     	// 대댓글 작성 후 해당 대댓글 영역 display 속성 block으로 주기 위해
	                    		if(result.rlist[i].replyNo == refRno){
	                    			comment += "<div class='enrollReply2' id='addReply2-" + result.rlist[i].replyNo + "' align='right' style='display:block;'>";
	                    		}else{
	                    			comment += "<div class='enrollReply2' id='addReply2-" + result.rlist[i].replyNo + "' align='right' style='display:none;'>";
	                    		}
		                        
		                        comment += 
		                            "<table>" + 
		                                "<tr>" +
		                                    "<td width='35' style='vertical-align: top;'>" +
		                                        "<img src='resources/images/reply_arrow.png' width='17'>" +
		                                    "</td>" +
		                                    "<td width='850'>" +
		                                        "<textarea class='form-control reply2Content' placeholder='내용을 입력해주세요' maxlength='500' required onkeyup='countLetter(this.value.length," + result.rlist[i].replyNo + ");'></textarea>" +
		                                    "</td>" +
		                                "</tr>" +
		                            "</table>" +
		                            "<span id='count" + result.rlist[i].replyNo + "'>0</span>/500&nbsp;&nbsp;<button class='btn btn-flat btn-outline-success btn-sm' onclick='addReply(" + result.rlist[i].replyNo + ", " + result.pi.currentPage + ")'>등록</button>" +
		                        "</div>";
	                        }else{
                    			comment += "<div class='enrollReply2' id='addReply2-" + result.rlist[i].replyNo + "' align='right' style='display:none;'></div>";
	                        }
							
						}
						$("#replyArea").html(comment);
						
						var $listCount = result.pi.listCount;     	       					
 	       				var $currentPage = result.pi.currentPage;
                        var $startPage = result.pi.startPage;
                        var $endPage = result.pi.endPage;
                        var $maxPage = result.pi.maxPage;
                        
                        var pagination = "";
						if($currentPage != "1"){
						    pagination += "<button type='button' onclick='selectReplyList(" + ($currentPage - 1) + ");' class='btn btn-secondary btn-sm btn-flat'>&lt;</button>";
						}
                        for(var $p = $startPage; $p <= $endPage; $p++ ){
                        	if($p == $currentPage){
	                        	pagination += "<button type='button' onclick='selectReplyList(" + $p + ");' class='btn btn-outline-secondary btn-sm btn-flat' disabled>" + $p + "</button>";
                        	}else{
	                        	pagination += "<button type='button' onclick='selectReplyList(" + $p + ");' class='btn btn-outline-secondary btn-sm btn-flat'>" + $p + "</button>";
                        	}
						}
						if($currentPage != $maxPage){
						    pagination += "<button type='button' onclick='selectReplyList(" + ($currentPage + 1) + ");' class='btn btn-secondary btn-sm btn-flat'>&gt;</button>";
						}
						$("#replyPagination").html(pagination);
		                
					}else{
						$("#replyArea").html("<div align='center'>작성된 댓글이 없습니다.</div>");
						$("#replyPagination").html("");
					}
				}, error:function(){
					console.log("댓글 리스트 조회용 ajax 통신 실패");
				}
			});
		}
		
		// 댓글 작성용 ajax
		function addReply(refRno, cPage){
			
			if($("#addReply2-" + refRno).find("textarea").val().trim().length != 0){
				$.ajax({
					url:"rinsert.fn",
					type:"post",
					data:{
						replyContent:$("#addReply2-" + refRno).find("textarea").val(),
						replyWriter:${ loginUser.memberNo },
						refFno:${ fn.freenoteNo },
						refRno:refRno,
						loginUserNickname:'${ loginUser.nickname }',
						freenoteTitle:'${ fn.freenoteTitle }',
						freenoteWriterNo:${ fn.memberNo }
					}, success:function(result){
						if(result>0){
							$("#addReply2-" + refRno).find("textarea").val("");
							$("#addReply2-" + refRno).children("span").text("0");
							selectReplyList(cPage, refRno);
						}
					}, error:function(){
						console.log("댓글 작성용 ajax 통신 실패");
					}
				});
			}else{
				alert("댓글을 작성해주세요.");
			}
		}
		
		// 댓글 삭제 CONFIRM 용
       	function confirmDeleteReply(rno, refRno, cPage){
       		if(confirm("댓글을 삭제하시겠습니까?")){
       			deleteReply(rno, refRno, cPage);
       		}
       	}
       	
       	// 댓글 삭제용 ajax
       	function deleteReply(rno, refRno, cPage){
       		
       		$.ajax({
       			url:"rdelete.fn",
       			type:"post",
       			data:{"rno":rno},
       			success:function(result){
       				
       				if(result>0){
       					selectReplyList(cPage, refRno);
       				}
       				
       			}, error:function(){
       				console.log("댓글 삭제용 ajax 통신 실패");
       			}
       		});
       	}

    	// 대댓글 작성 및 리스트 확장 버튼
    	function addReply2(rno){
    		var $reply2form = $("#replyArea").find("#addReply2-" + rno);
    		var $reply2list = $("#replyArea").find(".reply2-" + rno);
	
	        if($reply2form.css("display")=="none"){
	            $reply2form.css("display", "block");
	            $reply2list.css("display", "block");
	            $reply2form.find("textarea").val("");
	            $reply2form.children("span").text("0");
	            $reply2form.find("textarea").focus();
	        }else{
	            $reply2form.css("display", "none");
	            $reply2list.css("display", "none");
	        }   
    	}
    	
		// 댓글 글자 수 세기(메인댓글)
	    $("#enrollReply1").keyup(function(){
	        // 현재 요소(textarea)안에 작성된 값의 길이를 알아내기
	        var inputlength = $(this).val().length;
	        
	        $("#count").html(inputlength);
	
	        if(500-inputlength < 0){
	            $("#count").css("color", "red");
	        }else{
	            $("#count").css("color","");
	        }
	    }); 
	
		// 댓글 글자 수 세기(서브댓글)    	
    	function countLetter(count, num){
    		$("#count" + num).text(count);
    	}
    </script>
    
    
	<jsp:include page="../../common/diaryWidget.jsp"/>
	
	<jsp:include page="../../common/diaryFooter.jsp"/>

</body>
</html>