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
	
	<jsp:include page="../../common/adminHeader.jsp"/>
	
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
            <h3 style="color:rgb(94, 94, 94); padding-left: 15px;">커뮤니티 관리</h3>
        </div>
        <!-- row -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card" style="width:900px;">
                        <div class="card-body" >
                            <div id="titleArea">
                                <table>
                                    <tr>
                                        <td width="400" style="font-size: 20px;">${ fn.freenoteTitle }</td>
                                        <td width="500" align="right">
											<button class="btn btn-secondary btn-sm" onclick="history.back();">취소</button>
	                           			 	<button class="btn btn-primary btn-sm" id="deleteBtn">삭제</button>
										</td>
                                    </tr>
                                </table>
                            </div>
                            <hr style="margin:10px 0">
                            <div>
                                <table>
                                    <tr>
                                    	
                                        <td width="400"><img src="resources/images/default-profile-pic.jpg" class="rounded-circle" height="30" width="30"> 
                            			&nbsp;<b>${ fn.memberId }&nbsp;(${ fn.freenoteWriter })</b></td>
                                        <td width="500" align="right">${fn.createDate}</td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div id="contentArea" style="min-height:400px;">
                                ${ fn.freenoteContent }
                            </div>
                            <div id="etcArea">
                                댓글 <span id="rcount"></span> &emsp;
                                좋아요 ${ fn.freenoteLike }
                            </div>
                            <hr>
                            <div id="replyArea"></div>
                            <div id="replyPagination" align="center"></div>
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
    
    <!-- 삭제 버튼 관련 스크립트 -->
    <script>
		// 글 삭제 확인용
	    $("#deleteBtn").click(function(){
			if(confirm("정말 삭제하시겠습니까?")) {
				location.href="delete.fn?fno=${ fn.freenoteNo }&index=admin";
			}
		});
		
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
	                                            	result.rlist2[j].createDate + "&emsp;" +
	                        	    				"좋아요 " + result.rlist2[j].replyLike +
	                        	    			"</td>" +
	                                            "<td width='200' align='right'>" +
	                                				"<button class='btn btn-outline-primary btn-sm btn-flat' onclick='confirmDeleteReply(" + result.rlist2[j].replyNo + ", " + result.rlist[i].replyNo + ", " + result.pi.currentPage + ");'>삭제</button>" + 
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
			                            "<td width='300'>" +
			                            	result.rlist[i].createDate + "&emsp;" +
			                				"좋아요 " + result.rlist[i].replyLike + "&emsp;" +
			                				"<button class='btn btn-outline-light btn-sm btn-flat' id='addReply2Btn-" + result.rlist[i].replyNo + "' onclick='addReply2(" + result.rlist[i].replyNo + ");'>답글&nbsp;" + countReply2 + "</button>" +
			                            "</td>" +
			                            "<td width='600' align='right'>";
			                if(result.rlist[i].status == 'Y'){
			                	comment1 += "<button class='btn btn-outline-primary btn-sm btn-flat' onclick='confirmDeleteReply(" + result.rlist[i].replyNo + ", 0, 1);'>삭제</button>";
			                }
			                comment1+=  "</td>" +
			                        "</tr>" +
			                    "</table>" +
			                "</div>";
			                
	                        comment += comment1;
	                        comment += comment2;
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

    	// 대댓글 리스트 확장 버튼
    	function addReply2(rno){
    		var $reply2list = $("#replyArea").find(".reply2-" + rno);
	
	        if($reply2list.css("display")=="none"){
	            $reply2list.css("display", "block");
	        }else{
	            $reply2list.css("display", "none");
	        }   
    	}
    	
		
    </script>
    
    
	
	<jsp:include page="../../common/diaryFooter.jsp"/>

</body>
</html>