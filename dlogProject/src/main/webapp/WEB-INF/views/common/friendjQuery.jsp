<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			
			// 첫 로딩 시 curr = 1
			$("#this_page_friend_currentPage").val(1);
			
			// 첫 로딩 시 모든 컬러 gray로
			$(".friend_pagination .page-link").css("color","gray");
			$(".page-num").eq(0).children().css("color","white");
			
			// 첫 로딩 시 disabled넣기
			$(".page-num").eq(0).addClass("disabled");
			
			// dropdown inside 클릭 시 안 사라지게
			$("#friend_list").click(function(){
				event.stopPropagation();
			})
			
			// 첫 로딩 시 '<<' disabled
			$(".pre-page-moving-li").addClass("disabled");
			
			// 커서 모양
			$(".friend_list_button").hover().css("cursor","pointer");
			$(".friend_request_button").hover().css("cursor","pointer");
			
			// 초기에 request 숨기기
			$("#friend_request_outer").css("display","none");
			
			// 메뉴 이동
			$(".friend_list_button").click(function(){
				$("#friend_list_outer").css("display","");
				$("#friend_request_outer").css("display","none");
				$(this).css({background:"white", color:"rgb(40,40,40)"})
				$(".friend_request_button").css({background:"lightgray", color:"rgb(40,40,40)"})
			})
			$(".friend_request_button").click(function(){
				$("#friend_list_outer").css("display","none");
				$("#friend_request_outer").css("display","");
				$(this).css({background:"white", color:"rgb(40,40,40)"})
				$(".friend_list_button").css({background:"lightgray", color:"rgb(40,40,40)"})
			})
				
             // 친구목록 페이지 이동
             // 숫자
               pageMove = function(index){
				$.ajax({
             		url:"selectList.fr",
     				data:{
     					currentPage:index,
     					friendOwner:$("#friend_owner").val()
     				},
     				success:function(friendList){
     					$(".friend_list").remove();
                          
     					var value="";
     					$.each(friendList[0], function(i, obj){
     						value += "<li class='friend_list'>" + 
     									"<div class='friend_list_images'>" + "<img src='resources/images/avatar/1.jpg'>" + "</div>" + 
     									"<div class='friend_list_nickname'>" + "<div class='notification-heading friend_list_nick'>" + obj.friendNickname + "</div>" + "</div>" + 
     									"<div class='friend_list_delete' align='right'>" + "<button class='friend_delete_DB' onclick='deleteFriend(" + obj.friendAccepted + ");' value='" + obj.friendAccepted+ "'>삭제</button>" + "</div>" + 
     								"</li>";
     					})
     					$(".friend_list_ul").append(value);
     					$("#this_page_friend_currentPage").val(friendList[1].currentPage);
     						
     					// 비활성화
     					if(friendList[1].currentPage == 1){
     						$(".pre-page-moving-li").addClass("disabled");
     					}else{
     						$(".pre-page-moving-li").removeClass("disabled");
     					}
     					
     					var realEnd = Math.ceil(friendList[1].listCount/5)
     					if(friendList[1].currentPage != realEnd){
     						$(".next-page-moving-li").removeClass("disabled");
     					} else{
     						$(".next-page-moving-li").addClass("disabled");
     					}
     					
     					// 현재 페이지에 색 입히기
     					$(".friend_pagination .page-link").not(".page-moving").each(function(){
                     		if($(this).text() == friendList[1].currentPage){
                     			$(this).parent().addClass("disabled");
     		               		$(".friend_pagination .page-link").not($(this)).not(".page-moving").parent().removeClass("disabled");
     		               		$(this).css({background:"rgb(132,200,185)", color:"white"});
     		               		$(".friend_pagination .page-link").not($(this)).not(".page-moving").css({background:"", color:"gray"});
     		               		$(this).removeClass("hovered");
     		               		$(".friend_pagination .page-link").not($(this)).not(".page-moving").addClass("hovered");
                     		}
                     	})
     						
     				},error:function(){
     					console.log("ajax통신 실패");
     				}
             	})
              		
			}
				
				// previous
               	$(".pre-page-moving").click(function(){
               		
               		$.ajax({
               			url:"selectList.fr",
       					data:{
       						currentPage:Number($("#this_page_friend_currentPage").val())-1,
       						friendOwner:$("#friend_owner").val()
       					},
       					success:function(friendList){
							$(".friend_list").remove();
                            
       						var value1="";
       						var value2="";
       						$.each(friendList[0], function(i, obj){
       							value1 += "<li class='friend_list'>" + 
       										"<div class='friend_list_images'>" + "<img src='resources/images/avatar/1.jpg'>" + "</div>" + 
       										"<div class='friend_list_nickname'>" + "<div class='notification-heading friend_list_nick'>" + obj.friendNickname + "</div>" + "</div>" + 
       										"<div class='friend_list_delete' align='right'>" + "<button class='friend_delete_DB' onclick='deleteFriend("+ obj.friendAccepted +");' value='" + obj.friendAccepted+ "'>삭제</button>" + "</div>" + 
       									"</li>";
       						})
       						
       						$(".friend_list_ul").append(value1);
       						
       						if(friendList[1].currentPage == 1){
       							$(".pre-page-moving-li").addClass("disabled");
       						}
       						
       						// 4 -> 3
       						if(friendList[1].currentPage == friendList[1].endPage){
        						for(var i = 0 ; i <= friendList[1].endPage - friendList[1].startPage; i++){
        							var inputPage = Number(friendList[1].startPage + i);
        							if(i == friendList[1].endPage - friendList[1].startPage){
	        							value2 += "<li class='page-item page-num disabled'><a class='page-link' onclick='pageMove(" + inputPage + ");'>" + inputPage + "</a></li>"; 
        							}else{
	        							value2 += "<li class='page-item page-num'><a class='page-link hovered' onclick='pageMove(" + inputPage + ");'>" + inputPage + "</a></li>"; 
        							}
        						}
        						$(".friend_pagination .page-num").remove();
        						
        						// 페이지 넣어주기
        						$(".pre-page-moving-li").after(value2);
        						
        						$(".page-num").children().css("color","gray");
        						$(".page-num").eq(2).children().css({background:"rgb(132,200,185)", color:"white"});
       						}
       						
       						$("#this_page_friend_currentPage").val(friendList[1].currentPage);
       						
							var realEnd = Math.ceil(friendList[1].listCount/5)
       						if(friendList[1].currentPage != realEnd){
       							$(".next-page-moving-li").removeClass("disabled");
       						}
       						
       						// 현재 페이지에 색 입히기
       						$(".friend_pagination .page-link").not(".page-moving").each(function(){
                       			if($(this).text() == friendList[1].currentPage){
       		                		$(this).css({background:"rgb(132,200,185)", color:"white"});
       		                		$(".friend_pagination .page-link").not($(this)).not(".page-moving").css({background:"", color:"gray"});
       		                		$(this).parent().addClass("disabled");
       		                		$(".friend_pagination .page-link").not($(this)).not(".page-moving").parent().removeClass("disabled");
       		                		$(this).removeClass("hovered");
       		                		$(".friend_pagination .page-link").not($(this)).not(".page-moving").addClass("hovered");
                       			}
                       		})
                       		
       					},error:function(){
       						console.log("ajax통신 실패");
       					}
               		})
               	})
               	
               	// next
               	$(".next-page-moving").click(function(){
               		$.ajax({
               			url:"selectList.fr",
       					data:{
       						currentPage:Number($("#this_page_friend_currentPage").val())+1,
       						friendOwner:$("#friend_owner").val()
       					},
       					success:function(friendList){
							$(".friend_list").remove();
                            
       						var value1="";
       						var value2="";
       						$.each(friendList[0], function(i, obj){
       							value1 += "<li class='friend_list'>" + 
       										"<div class='friend_list_images'>" + "<img src='resources/images/avatar/1.jpg'>" + "</div>" + 
       										"<div class='friend_list_nickname'>" + "<div class='notification-heading friend_list_nick'>" + obj.friendNickname + "</div>" + "</div>" + 
       										"<div class='friend_list_delete' align='right'>" + "<button class='friend_delete_DB' onclick='deleteFriend("+ obj.friendAccepted +");' value='" + obj.friendAccepted+ "'>삭제</button>" + "</div>" + 
       									"</li>";
       						})
       						var realEnd = Math.ceil(friendList[1].listCount/5)
       						
       						if(friendList[1].currentPage == realEnd){
       							$(".next-page-moving-li").addClass("disabled");
       						}
       						
       						if(friendList[1].currentPage != 1){
       							$(".pre-page-moving-li").removeClass("disabled");
       						}
       						
       						// 3 -> 4
       						if(friendList[1].currentPage == friendList[1].startPage){
        						for(var i = 0 ; i <= friendList[1].endPage - friendList[1].startPage; i++){
        							var inputPage = Number(friendList[1].startPage + i);
        							if(i == 0){
	        							value2 += "<li class='page-item page-num disabled'><a class='page-link' onclick='pageMove(" + inputPage + ");'>" + inputPage + "</a></li>"; 
        							}else{
	        							value2 += "<li class='page-item page-num'><a class='page-link hovered' onclick='pageMove(" + inputPage + ");'>" + inputPage + "</a></li>"; 
        							}
        						}
        						$(".friend_pagination .page-num").remove();
        						
        						// 페이지 넣어주기
        						$(".pre-page-moving-li").after(value2);
        						
        						$(".page-num").children().css("color","gray");
        						$(".page-num").eq(0).children().css({background:"rgb(132,200,185)", color:"white"});
       						}
       						
       						// 친구 목록 넣어주기
       						$(".friend_list_ul").append(value1);
       						
       						$("#this_page_friend_currentPage").val(friendList[1].currentPage);
       						
       						// 현재 페이지에 색 입히기
       						$(".friend_pagination .page-link").not(".page-moving").each(function(){
                       			if($(this).text() == friendList[1].currentPage){
       		                		$(this).css({background:"rgb(132,200,185)", color:"white"});
       		                		$(".friend_pagination .page-link").not($(this)).not(".page-moving").css({background:"", color:"gray"});
       		                		$(this).parent().addClass("disabled");
       		                		$(".friend_pagination .page-link").not($(this)).not(".page-moving").parent().removeClass("disabled");
       		                		$(this).removeClass("hovered");
       		                		$(".friend_pagination .page-link").not($(this)).not(".page-moving").addClass("hovered");
                       			}
                       		})
                       		
       					},error:function(){
       						console.log("ajax통신 실패");
       					}
               		})
               	})
				
               	// 친구 목록 삭제
               	
               	reloadFriend = function(){
               		location.reload();
				}
               	
				deleteFriend = function(index){
					var test = confirm("정말 삭제하시겠습니까?");
               		if(test == true){
                		$.ajax({
                			url:"delete.fr",
        					data:{
        						friendOwner:$("#friend_owner").val(),
        						friendAccepted:index
        					},
        					success:function(result){
	                            console.log("ajax통신 성공");
	                            reloadFriend();
        					},error:function(){
        						console.log("ajax통신 실패");
        					}
                		})
               		}
				}
               	
               	// 친구 목록 검색
               	$("#friend_ajax_search").keyup(function(){
               		$.ajax({
               			url:"search.fr",
               			data:{
               				nickname:$("#friend_ajax_search").val(),
               				memberNo:$("#friend_owner").val()
               			},
               			success:function(friendList){
               				$(".friend_pagination .page-link").remove();
							$(".friend_list").remove();
                            
       						var value="";
       						$.each(friendList[0], function(i, obj){
       							value += "<li class='friend_list'>" + 
       										"<div class='friend_list_images'>" + "<img src='resources/images/avatar/1.jpg'>" + "</div>" + 
       										"<div class='friend_list_nickname'>" + "<div class='notification-heading friend_list_nick'>" + obj.nickname + "</div>" + "</div>" + 
       										"<div class='friend_list_delete' align='right'>" + "<button class='friend_delete_DB' onclick='deleteFriend(" + obj.memberNo + ");' value='" + obj.memberNo + "'>삭제</button>" + "</div>" + 
       									"</li>";
       						})
       						$(".friend_list_ul").append(value);
       						
       						if($("#friend_ajax_search").val() == ""){
       							$(".friend_list").remove();
       						}
       						
       						$("#friend_ajax_count").text("(" + friendList[1] + ")");
       						
       						// 검색 스크롤 때문에 폭 줄이기
       						$(".friend_list_ul").addClass("scrolling");
       						$(".friend_list_delete").css("margin-left","0");
       						
               			},error:function(){
               				console.log("ajax 통신 실패..")
               			}
               		})
               	})
               	
               	
			})
			
      	// 친구 요청 검색
      	findFriend = function(){
      		$.ajax({
      			url:"find.fr",
      			data:{
      				nickname:$("#find_friend_keyword").val()
      			},
      			success:function(friendList){
      				$(".friend_request").remove();
      				
      				var value="";
				$.each(friendList, function(i, obj){
					value += "<li class='friend_request'>" + 
								"<div class='friend_request_images'>" + "<img src='resources/images/avatar/2.jpg'>" + "</div>" + 
								"<div class='friend_request_nickname'>" + "<div class='notification-heading'>" + obj.nickname + "</div>" + "</div>" + 
								"<div class='friend_request_appeal' align='right'>" + "<button class='friend_insert_DB' value='" + obj.memberNo + "'>추가</button>" + "</div>" + 
							"</li>";
				})
				
				$(".friend_request_ul").append(value);
      				$(".friend_insert_DB").css({"background":"rgb(132,200,185)", "border":"0", "border-radius":"5px", "color":"white", "width":"50px", "height":"27px", "font-size":"15px"});
      				$(".friend_request_appeal").css("width","70px");
      			},error:function(){
      				console.log("ajax 통신 실패..")
      			}
      		})
      	}
		$("#find_friend_keyword").keydown(function(key) {

			if (key.keyCode == 13) {

				findFriend();
				
			}

		});
		
		// 친구 수락, 거절
		acceptFriend = function(index){
			$.ajax({
      			url:"accept.fr",
      			data:{
      				friendNo:index
      			},
      			success:function(result){
      				$(".will_disapper"+index).remove();
      			},error:function(){
      				console.log("ajax 통신 실패..")
      			}
      		})
		}

		rejectFriend = function(index){
			$.ajax({
      			url:"reject.fr",
      			data:{
      				friendNo:index
      			},
      			success:function(result){
      				$(".will_disapper"+index).remove();
      				
      			},error:function(){
      				console.log("ajax 통신 실패..")
      			}
      		})
		}
		
	</script>    
</body>
</html>