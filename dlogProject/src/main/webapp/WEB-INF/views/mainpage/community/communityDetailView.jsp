<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dlog</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/images/webImage.png" />
<style>
    .page-section .container{
        background-color: rgb(250, 250, 250);
        padding: 50px;
    }
    #searchForm input, #searchForm select, #sortOpt{
        width: 400px; 
        height: 50px; 
        border: .1px solid lightgrey; 
        border-radius: 4px;
    }
    #replyArea{
    	padding:10px;
    }
    .reply1, .reply2{
        margin-bottom: 15px;
    }
    .page-section .container textarea{
        width: 100%; 
        height: 70px; 
        border: .1px solid lightgrey; 
        border-radius: 0px;
        resize: none; 
        padding: 10px;
    }
    .page-section .container textarea:focus{
        outline:none
    }
    #addReply2-0 textarea{
    	height: 90px;
    }
    .enrollBtn, #addFriendBtn{
        border:none;
        background-color: rgb(132, 200, 185);
        color: white;
        border-radius: 0px;
        width: 70px;
        height: 35px;
        font-size: 15px;
        /* margin-top: 0; */
    }
    .enrollBtn:hover, #addFriendBtn:hover, #replyArea .enrollBtn:hover{
        background-color: rgb(172, 223, 213);
        color: white;
        border-color: rgb(172, 223, 213);
    }
    #replyArea .enrollBtn{
    	width: 50px;
    	height: 30px;
    	border: 1px solid rgb(132, 200, 185);
    	background: white;
    	color:rgb(132, 200, 185);
    }
    #addFriendBtn{
        height: 30px;
        margin-top: 10px;
        width: 75px;
    }
    
    #replyPagination button, .deleteBtn, .addBtn, .reportBtn{
    	border-radius:0px;
    	background: white;
    	border: .5px solid lightgrey;
    	margin:1px;
    	height: 30px;
    }
    #replyPagination button{
    	width: 30px;
    }
    .deleteBtn, .reportBtn{
    	background:none;
    	border:none;
    }
    #replyPagination button:hover, .deleteBtn:hover, .addBtn:hover, .reportBtn:hover{
        background:rgb(233, 233, 233);
    }
	.likeBtn:hover{
		cursor:pointer;
	}
    .modal-content{
    	border-radius:5px !important;
    }
    .modal-content .form-control{
    	border: 0.5px solid lightgrey;
    	border-radius:3px;
    }
    .page-section *{
    }
</style>
</head>
<body>
	<jsp:include page="../../common/mainHeader.jsp" />
	<script>
        $(function(){
            var navbarCollapse = function() {
                $("#mainNav").addClass("navbar-shrink");
                $(".logoImage").addClass("image-shrink");
                $(".nav-lcs").addClass("nav-item-shrink");
            };
            navbarCollapse();
            $(window).scroll(navbarCollapse);
            
            $(".nav-link[href*='list.co']").addClass("select");
            $(".nav-tabs .nav-link[href*='topic=${topic}']").addClass("active");
        });
    </script>
    
    <!-- Content Section-->
    <section class="page-section">
        <div class="container" style="margin-top: 80px; width: 1050px;">
            <div id="titleArea">
                <table>
                    <tr>
                        <td width="750" style="font-size: 20px;">${ fn.freenoteTitle }</td>
                        <td width="200" align="right">
                            <img src="resources/images/default-profile-pic.jpg" class="rounded-circle" height="35" width="35"> 
                            &nbsp; <a type="button" data-toggle="popover" data-content="
                                <div align='center'>
                                    ${ fn.freenoteWriter }님의 다이어리가 궁금하다면 <br>
                                    친구가 되어 방문할 수 있습니다. <br>
                                    <button id='addFriendBtn' onclick='test()'>친구요청</button>
                                </div>
                            " data-placement="right">${ fn.freenoteWriter }</a>
                        </td>
                    </tr>
                </table>
            </div>
            <script>
                $(function() {
                    $('[data-toggle="popover"]').popover({
                        html: true,
                        sanitize: false,
                        trigger:"manual"
                    })
                    .on("mouseenter", function () {
                        var _this = this;
                        $(this).popover("show");
                        $(".popover").on("mouseleave", function () {
                            $(_this).popover('hide');
                        });
                    }).on("mouseleave", function () {
                        var _this = this;
                        setTimeout(function () {
                            if (!$(".popover:hover").length) {
                                $(_this).popover("hide");
                            }
                        }, 300);
                    });
                })
                function test(){
                    location.href=""
                }
            </script>
            
            <hr style="margin:10px 0">
            <div id="dateArea" style="text-align: right;">
                ${ fn.createDate }
            </div>
            <div id="contentArea" style="min-height: 500px;">
				${ fn.freenoteContent }
            </div>
            <div id="etcArea">
                <table>
                    <tr>
                        <td width="500">
                            댓글&nbsp; <span id="rcount"></span> &emsp;
                            <!-- 좋아요 -->
                            <c:choose>
                            	<c:when test="${ fn.freenoteWriter != loginUser.nickname }">
                              		<a class="likeBtn" onclick="likePost();" style="text-decoration: none; color: black">
                            		<c:choose>
                            			<c:when test="${ fn.likeStatus eq 0 }">
                              				<span id="heart"><i class="far fa-heart"></i></span> 좋아요</a>
                              			</c:when>
                              			<c:otherwise>
                              				<span id="heart"><i class="fas fa-heart"></i></span> 좋아요</a>
                              			</c:otherwise>
                            		</c:choose>
                            		<span id="likeCount">&nbsp;${ fn.freenoteLike }</span>
                            	</c:when>
                             	<c:otherwise>
                             		좋아요&nbsp; ${ fn.freenoteLike }
                             	</c:otherwise>
                        	</c:choose>
                        </td>
                        <td width="450" align="right">
                        	<c:choose>
                        		<c:when test="${ loginUser.nickname == fn.freenoteWriter }">
		                            <a href="detail.fn?fno=${ fn.freenoteNo }" style="color:black;">내 다이어리에서 보기 &#8594;</a>
		                        </c:when>
		                        <c:otherwise>
		                            <button class="deleteBtn" id="report" onclick="report(${fn.freenoteNo}, ${fn.freenoteNo}, '글');">신고</button>&nbsp;&nbsp;
		                        </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>
            <hr>
            <div id="replyArea"></div>
            <div id="replyPagination" align="center"></div>
            <c:if test="${fn.freenoteCommentYN eq 'Y' }">
	            <div class="enrollReply1" id="addReply2-0" align="right" style="padding-top: 30px;">
	                <textarea name="" id="enrollReply1" placeholder="내용을 입력해주세요"  maxlength="500"></textarea>
	                <span id="count">0</span>/500&nbsp;&nbsp;<button class="enrollBtn" onclick="addReply(0, 1);">등록</button>
	            </div>
            </c:if>

        </div>
    </section>

	<!-- 좋아요 관련 스크립트 -->
	<script>
		function likePost(){
			$.ajax({
				url:"likePost.fn",
				type:"post",
				data:{
					memberNo:${loginUser.memberNo},
					fno:${fn.freenoteNo}
				}, success:function(result){
					
					if(result>0){
						$("#likeCount").html( parseInt($("#likeCount").text()) + 1);
						$("#heart").html("<i class='fas fa-heart' style='color: black;'></i>");
					}else{
						$("#likeCount").html( parseInt($("#likeCount").text()) - 1 );
						$("#heart").html("<i class='far fa-heart' style='color: black;'></i>");
					}
					
				}, error:function(){
					console.log("게시글 좋아요 ajax 통신 실패");
				}
			});
		}
	    
	    function likeReply(rno){
			$.ajax({
				url:"likeReply.fn",
				type:"post",
				data:{
					memberNo:${loginUser.memberNo},
					rno:rno
				}, success:function(result){
					
					if(result>0){
						$("#likeCount-" + rno).html( parseInt($("#likeCount-" + rno).text()) + 1);
						$("#heart-" + rno).html("<i class='fas fa-heart'></i>");
					}else{
						$("#likeCount-" + rno).html( parseInt($("#likeCount-" + rno).text()) - 1 );
						$("#heart-" + rno).html("<i class='far fa-heart'></i>");
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
							
							var countReply2 = 0;
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
	                                            "<td width='40'>" +
	                                                "<img src='resources/images/reply_arrow.png' width='20'>" +
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
	                                            "<td width='900'>" +
	                                            	result.rlist2[j].createDate + "&emsp;";
	                                if(result.rlist2[j].replyWriter != '${loginUser.nickname}'){
	                                	if(result.rlist2[j].likeStatus == 0){
	                                		comment2 += "<a class='likeBtn' onclick='likeReply(" + result.rlist2[j].replyNo + ")' style='text-decoration: none; color: black;'>" +
	                                					"<span id='heart-" + result.rlist2[j].replyNo + "'><i class='far fa-heart'></i></span> 좋아요</a>&nbsp;" +
	                                					"<span id='likeCount-" + result.rlist2[j].replyNo + "'>" + result.rlist2[j].replyLike + "</span>";
	                                	}else{
	                                		comment2 += "<a class='likeBtn' onclick='likeReply(" + result.rlist2[j].replyNo + ")' style='text-decoration: none; color: black;'>" +
                        					"<span id='heart-" + result.rlist2[j].replyNo + "'><i class='fas fa-heart'></i></span> 좋아요</a>&nbsp;" +
                        					"<span id='likeCount-" + result.rlist2[j].replyNo + "'>" + result.rlist2[j].replyLike + "</span>";
	                                	}
	                                }else{
	                                	comment2 += "좋아요 " + result.rlist2[j].replyLike;
	                                }
	                                                
	                                comment2+=  "</td>" +
	                                            "<td width='200' align='right'>";
	                                if(result.rlist2[j].replyWriter =='${loginUser.nickname}' || '${fn.freenoteWriter}' == '${loginUser.nickname}'){
	                                	comment2 += "<button class='deleteBtn' onclick='confirmDeleteReply(" + result.rlist2[j].replyNo + ", " + result.rlist[i].replyNo + ", " + result.pi.currentPage + ");'>삭제</button>";
	                                	
	                                }else{
		                                comment2 += "<button class='reportBtn' id='report' onclick='report(" + ${fn.freenoteNo} + ", " + result.rlist2[j].replyNo + ", 2);'>신고</button>";
	                                }
	                                comment2 +=
	                                            "</td>" +
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
			                            "<td width='400'>" +
			                            	result.rlist[i].createDate + "&emsp;";
							if(result.rlist[i].status == 'Y' && '${loginUser.nickname}' != result.rlist[i].replyWriter){
			                	if(result.rlist[i].likeStatus == 0){
			                		comment1 += "<a class='likeBtn' onclick='likeReply(" + result.rlist[i].replyNo + ")' style='text-decoration: none; color: black;'>" +
			                					"<span id='heart-" + result.rlist[i].replyNo + "'><i class='far fa-heart'></i></span> 좋아요</a>&nbsp;" +
	                                			"<span id='likeCount-" + result.rlist[i].replyNo + "'>" + result.rlist[i].replyLike + "</span>&emsp;";
			                	}else{
			                		comment1 += "<a class='likeBtn' onclick='likeReply(" + result.rlist[i].replyNo + ")' style='text-decoration: none; color: black;'>" + 
			                					"<span id='heart-" + result.rlist[i].replyNo + "'><i class='fas fa-heart'></i></span> 좋아요</a>&nbsp;" +
	                                			"<span id='likeCount-" + result.rlist[i].replyNo + "'>" + result.rlist[i].replyLike + "</span>&emsp;";
			                	}
			                }else{
			                	comment1 += "좋아요 " + result.rlist[i].replyLike + "&emsp;";
			                }            	
			               
			                comment1 +=  	"<button class='addBtn' id='addReply2Btn-" + result.rlist[i].replyNo + "' onclick='addReply2(" + result.rlist[i].replyNo + ");'>답글&nbsp;" + countReply2 + "</button>" +
			                            "</td>" +
			                            "<td width='650' align='right'>";
			                if(result.rlist[i].status == 'Y'){ 
			                	if(result.rlist[i].replyWriter =='${loginUser.nickname}' || '${fn.freenoteWriter}' == '${loginUser.nickname}'){
			                		comment1 += "<button class='deleteBtn' onclick='confirmDeleteReply(" + result.rlist[i].replyNo + ", 0, 1);'>삭제</button>";
			                	}else{
	                                comment1 += "<button class='reportBtn' id='report' onclick='report(" + ${fn.freenoteNo} + ", " + result.rlist[i].replyNo + ", 2);'>신고</button>";
			                	}
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
		                                    "<td width='40' style='vertical-align: top;'>" +
		                                        "<img src='resources/images/reply_arrow.png' width='20'>" +
		                                    "</td>" +
		                                    "<td width='1000'>" +
		                                        "<textarea class='reply2Content' placeholder='내용을 입력해주세요' maxlength='500' required onkeyup='countLetter(this.value.length," + result.rlist[i].replyNo + ");'></textarea>" +
		                                    "</td>" +
		                                "</tr>" +
		                            "</table>" +
		                            "<span id='count" + result.rlist[i].replyNo + "'>0</span>/500&nbsp;&nbsp;<button class='enrollBtn' onclick='addReply(" + result.rlist[i].replyNo + ", " + result.pi.currentPage + ")'>등록</button>" +
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
						    pagination += "<button type='button' onclick='selectReplyList(" + ($currentPage - 1) + ");' style='background:lightgrey;'>&lt;</button>";
						}
	                    for(var $p = $startPage; $p <= $endPage; $p++ ){
	                    	if($p == $currentPage){
	                        	pagination += "<button type='button' onclick='selectReplyList(" + $p + ");' disabled>" + $p + "</button>";
	                    	}else{
	                        	pagination += "<button type='button' onclick='selectReplyList(" + $p + ");'>" + $p + "</button>";
	                    	}
						}
						if($currentPage != $maxPage){
						    pagination += "<button type='button' onclick='selectReplyList(" + ($currentPage + 1) + ");' style='background:lightgrey;'>&gt;</button>";
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
						refRno:refRno
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

    <!-- 신고폼 모달 -->
    <div class="modal" id="reportModal">
        <div class="modal-dialog">
            <div class="modal-content"  style="border:0.5px solid lightgrey;width: 410px;">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h5>신고하기</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body" style="padding:16px;">
                    <form method="post" id="reportForm">
                        <input type="hidden" name="reportWriter" value="${ loginUser.memberNo }">
                        <input type="hidden" name="reportPostNo" id="reportPostNo">
                        <input type="hidden" name="reportPostType" id="reportPostType">
                        <input type="hidden" name="reportLink">
                        <p style="font-size: 13px; padding-left:20px;">
                            * 신고하신 내용은 증거자료를 참고하여 Dlog 약관에 의거해 조치됩니다. <br>
                            * 증거 내용이 불충분하거나 타당한 이유가 아니면 무효 처리됩니다. <br>
                            * 허위 신고의 경우 신고자가 제재받을 수 있음을 유념해주세요. <br>
                        </p>
                        <br>
                        <b style="color:black;">신고유형</b>
                        <select name="reportType" class="form-control" required>
                            <option value="" disabled selected hidden>신고 내용을 선택하세요.</option>
                            <option value="영리목적">영리목적</option>
                            <option value="불법성">불법성</option>
                            <option value="욕설">욕설</option>
                            <option value="도배">도배</option>
                            <option value="개인정보노출">개인정보노출</option>
                            <option value="음란성">음란성</option>
                            <option value="명의도용">명의도용</option>
                            <option value="기타">기타</option>
                        </select>
                        <br>
                        <b style="color:black;">신고내용</b>
                        <textarea name="reportContent" id="reportContent" cols="30" rows="4" style="resize: none;overflow:auto;" class="form-control" maxlength="1000" required></textarea>
                        <br>
                        <div align="center">
                            <input type="checkbox" required id="agreeCheck"> <label for="agreeCheck">개인 정보 수집 및 이용에 동의합니다.</label>
                            <br><br>
                            <button type="submit" class="btn btn-primary">제출</button>
                            <br><br>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> <!--  report modal end -->
    <!-- 신고폼 모달 ajax 스크립트 -->
	<script>
		var reportModal = document.getElementById("reportModal");
		
		$(function(){
			$(".close").click(function() {
				reportModal.style.display = "none";
				document.getElementById("reportForm").reset();
			});
		});
		
		function report(fno, postNo, reportPostType){
			$("#reportPostNo").val(postNo);
			if(reportPostType==2){
				$("#reportPostType").val("댓글");
			}else{
				$("#reportPostType").val(reportPostType);
			}
			$("input[name=reportLink]").val("http://localhost:8888/dlog/detail.co?fno=" + fno);
			reportModal.style.display = "block";
		}
		
		$("#reportForm").submit(function(e){
			e.preventDefault();
			var form = $(this);
			
			$.ajax({
				type:"post",
				url:"report.co",
				data:form.serialize(),
				success:function(result){
					
					if(result>0){
						alert("신고되었습니다.");
						reportModal.style.display = "none";
						document.getElementById("reportForm").reset();
						
					}else{
						alert("이미 신고하셨습니다.")
						reportModal.style.display = "none";
						document.getElementById("reportForm").reset();
					}
					
				}, error:function(){
					console.log("Ajax 통신 실패");
				}
			});
		});
			
	</script>
    
    

	<jsp:include page="../../common/mainFooter.jsp" />

</body>
</html>