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
    #searchForm input, #searchForm select, #sortOpt{
        width: 400px; 
        height: 50px; 
        border: .1px solid lightgrey; 
        border-radius: 4px;
        padding: 0 10px;
    }
    #searchForm select{
    	padding: 0;
        width: 120px;
    }
    #searchForm #searchBtn{
        width: 50px; 
        height: 50px; 
        border: .1px solid rgb(132,200,185); 
        background: rgb(132,200,185);
        border-radius: 4px;
        color: white;
    }
    #sortOpt{
        width: 90px;
        height: 35px;
    }
    .nav-tabs a{
        color:rgb(49, 49, 49);
        font-size: 18px;
        height: 60px;
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
            $(".nav-tabs .nav-link[href*='topic=${topic}']").addClass("active");
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
                    <input type="text" name="keyword" value="${ sc.keyword }">
                    <button type="submit" id="searchBtn"><i class="fa fa-search"></i></button>
                </form>
            </div>

            <br><br><br>

            <table>
                <tr>
                    <td width="900">
                        "${ sc.keyword }"에 대한 검색 결과 입니다. (${ pi.listCount }건)
                    </td>
                    <td>
                        <select name="sort" id="sortOpt">
                            <option value="recent">최신순</option>
                            <option value="popular">조회순</option>
                        </select>
                    </td>
                </tr>
            </table>
            <script>
            	$(function(){
            		$("#searchForm option[value=${ sc.condition }]").attr("selected", true);
            		
            		$("#sortOpt").change(function(){
            			var $sort = $("#sortOpt").val();
            			location.href="search.co?condition=${ sc.condition }&keyword=${ sc.keyword }&sort=" + $sort;
            		});
            		
            		$("#sortOpt option[value='${ sc.sort }']").attr("selected", true);
            		
            	});
            </script>
            
            <hr>

            <div id="listArea" align="center" style="min-height:200px;"></div>
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
    		loadList(1);
    		
    		// 스크롤링
    		// 참고자료 1: https://dzone.com/articles/infinite-scroll-loading
    		// 참고자료 2: https://stackoverflow.com/questions/10662528/load-ajax-when-scroll-reaches-80
			var count = 1;
    		$contentLoadTriggered = false;
	
    		$(window).scroll(function(){
	    		if ($(window).scrollTop() >= ($(document).height() - $(window).height()) && $contentLoadTriggered == false){
	    			$contentLoadTriggered = true;
	    			count++;
	    			loadList(count);
					$contentLoadTriggered = false;
	    		}
    		});
    	});
    		
    	function loadList(cPage){
    		$.ajax({
		    	url:"searchList.co",
    			data:{
	    			condition:'${sc.condition}',
	    			keyword:'${sc.keyword}',
	    			sort:'${sc.sort}',
	    			currentPage:cPage
    			}, success:function(result){
    				
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
    					$("#listArea").append(listCard);
    					
    				}else if(cPage == 1){
    					$("#listArea").html('조회된 결과가 없습니다.');
    				}
    			}, error:function(){
    				console.log('커뮤니티 검색리스트 조회 ajax 통신 실패');
    			}
    		});
    	}
    </script>
	
	<jsp:include page="../../common/mainFooter.jsp" />

</body>
</html>