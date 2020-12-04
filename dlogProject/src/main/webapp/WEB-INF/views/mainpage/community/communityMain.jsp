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
    #searchForm input, #searchForm select{
        width: 400px; 
        height: 50px; 
        border: .1px solid lightgrey; 
        border-radius: 4px;
    }
    #searchForm select{
        width: 120px;
    }
    #searchForm #searchBtn{
        width: 50px; 
        height: 50px; 
        border: .1px solid rgb(132,200,185); 
        background: rgb(132,200,185);
        border-radius: 4px;
        color:white
    }
    .nav-tabs a{
        color:rgb(49, 49, 49);
        font-size: 18px;
        height: 60px;
    }
    .nav-tabs a:hover, #pagingArea li{
    	cursor:pointer;
    }
    .listCard{
        border: .5px solid lightgrey;
        height:140px;
        width:990px;
        border-radius: 5px;
        margin-top:20px;
        padding:15px;
    }
    .listCard:hover{
        cursor:pointer;
        background:rgba(245, 245, 245, 0.678);
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
        });
    </script>

	<!-- Content Section-->
    <section class="page-section">
        <div class="container" style="margin-top: 100px; width: 1050px;">
            <div align="center">
                <form action="search.co" method="get" id="searchForm">
                    <select name="condition">
                        <option value="writerTitle">작성자+제목</option>
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                    </select>
                    <input type="text" name="keyword">
                    <button type="submit" id="searchBtn"><i class="fa fa-search"></i></button>
                </form>
            </div>

            <br><br><br>

            <span style="font-size: 23px; color:rgb(82, 82, 82);">주제별 모아보기 | </span> 다양한 주제의 글을 최신순으로 확인할 수 있습니다 :D
            <br><br>
            <div>
	            <ul class="nav nav-tabs nav-justified" id="topicNav">
	            </ul>
			</div>
            <div id="listArea" align="center"  style="min-height:200px;"></div>
            <script>
	        	$(function(){
	         		$("#listArea").on("click", "div", function(){
	         			if('${loginUser}' != ''){
		         			location.href="detail.co?fno=" + $(this).find("input").val();
	         			}else{
	         				alert("로그인 후 이용 가능한 서비스입니다.");
	         			}
	         				
	         		});
	         	});
            </script>
            <br><br>
			<div id="pagingArea"></div>
        </div>
    </section>
    <script>
    	$(function(){
    		loadList(1, 0);
    	});
    	
    	function loadList(cPage, topic){
    		$.ajax({
    			url:"commList.co",
    			data:{
	    			topic:topic,
	    			currentPage:cPage
    			}, success:function(result){
    				
    				var topicList = ["전체", "엔터테인먼트/예술", "생활/노하우/쇼핑", "취미/여가/여행", "지식/동향"];
    				var topicNav =""
    				for(var i in topicList){
	    				topicNav += "<li class='nav-item'>";
	    					if(result.topic == i){
	    						topicNav += "<a class='nav-link active' onclick='loadList(1," + i + ");'>" + topicList[i] + "</a>";
	    					}else{
	    						topicNav += "<a class='nav-link' onclick='loadList(1," + i + ");'>" + topicList[i] + "</a>";
	    					}
			            topicNav += "</li>";
    				}
    				$("#topicNav").html(topicNav);
    				
    				
    				if(result.list.length > 0){
    					var listCard = "";
    					for(var i in result.list){
    						listCard +=
    							"<div class='listCard'>" +
		                    		"<input type='hidden' value='" + result.list[i].freenoteNo + "'>" +
		    	                    "<table>" +
		    	                        "<tr>" +
		    	                            "<td width='790' height='40'>";
		    	            if(result.list[i].profile != null){
		    	            	listCard += "<img src='" + result.list[i].profile + "' width='40' height='40' class='rounded-circle'> &nbsp;&nbsp;";
		    	            } else{
		    	            	listCard += "<img src='resources/images/default-profile-pic.jpg' width='40' height='40' class='rounded-circle'> &nbsp;&nbsp;";
		    	            }
		    	            listCard +=         result.list[i].freenoteWriter +
		    	                            "</td>" +
		    	                            "<td width='140' align='right'>";
                            if(result.list[i].freenoteTopic != '주제선택안함'){
                            	listCard += result.list[i].freenoteTopic;
                            }
		    	            listCard +=     "</td>" +
		    	                        "</tr>" +
		    	                        "<tr>" +
		    	                            "<td colspan='2' height='40' style='font-size: 17px;'>" +
		    	                            	result.list[i].freenoteTitle +
		    	                            "</td>" +
		    	                        "</tr>" +
		    	                        "<tr>" +
		    	                            "<td colspan='2'>" +
		    	                            	result.list[i].createDate + 
		    	                            	"&emsp;조회수&nbsp;" + result.list[i].freenoteCount +
		    	                            	"&emsp;좋아요&nbsp;" +  result.list[i].freenoteLike + 
		    	                            	"&emsp;댓글&nbsp;" + result.list[i].replyCount +
		    	                            "</td>" +
		    	                        "</tr>" +
		    	                    "</table>" +
		    	                "</div>";
    					}
    					$("#listArea").html(listCard);
    					
    					var $listCount = result.pi.listCount;     	       					
 	       				var $currentPage = result.pi.currentPage;
                        var $startPage = result.pi.startPage;
                        var $endPage = result.pi.endPage;
                        var $maxPage = result.pi.maxPage;
    					
    					var paging ="";
    					paging += "<ul class='pagination pagination-lg justify-content-center'>";
    					if($currentPage != "1"){
    						paging += "<li class='page-item'><a class='page-link' onclick='loadList(" + ($currentPage - 1) + ", " + result.topic + ");'>Previous</a></li>";
    					}
    					for(var $p = $startPage; $p <= $endPage; $p++){
    						if($p == $currentPage){
    							paging += "<li class='page-item active'><a class='page-link'>" + $p + "</a></li>";
    						}else{
    							paging += "<li class='page-item'><a class='page-link' onclick='loadList(" + $p + ", " + result.topic + ");'>" + $p + "</a></li>";
    						}
    					}
    					if($currentPage != $maxPage){
    						paging += "<li class='page-item'><a class='page-link' onclick='loadList(" + ($currentPage + 1) + ", " + result.topic + ");'>Next</a></li>";
    					}
    					paging += "</ul>";
    					
    					$("#pagingArea").html(paging);
    					
    				}else{
    					$("#listArea").html('조회된 결과가 없습니다.');
    				}
    				
    			}, error:function(){
    				console.log('커뮤니티 리스트 조회 ajax 통신 실패');
    			}
    		});
    	}
    </script>

	<jsp:include page="../../common/mainFooter.jsp" />
</body>
</html>