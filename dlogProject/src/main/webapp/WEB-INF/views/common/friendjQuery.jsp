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
			
			if(${friendList.size() > 5}){
				$(".friend_list_height").addClass("scrolling");
				$(".friend_delete_DB").removeClass("osageu_ml-23");
			}
			
			// 첫 로딩 시 리스트만 보여주기
			$("#friend_request_outer").css("display","none");
			
			// dropdown inside 클릭 시 안 사라지게
			$("#friend_list").click(function(){
				event.stopPropagation();
			});
			
			// 커서 모양
			$(".friend_list_button").addClass("cursor_to_pointer");
			$(".friend_request_button").addClass("cursor_to_pointer");
			$(".friend_delete_DB").addClass("cursor_to_pointer");
			
			// 메뉴 이동 (요청 -> 리스트)
			$(".friend_list_button").click(function(){
				$("#friend_list_outer").css("display","");
				$("#friend_request_outer").css("display","none");
				$(this).css({background:"white", color:"rgb(40,40,40)"})
				$(".friend_request_button").css({background:"lightgray", color:"rgb(40,40,40)"})
				$("#friend_ajax_search").val("");
				$("#friend_ajax_count").text("");
				
				$.ajax({
             		url:"selectList.fr",
     				data:{
     					friendOwner:${loginUser.memberNo}
     				},
     				success:function(friendList){
     					$(".friend_list").remove();
                          
     					var value="";
     					$.each(friendList, function(i, obj){
     						value += "<li class='friend_list list_will_disapper" + obj.friendNo + "'>" + 
										"<div class='friend_list_images'>" + "<img src='" + obj.friendProfile + "' class='cursor_to_pointer' onclick='visitFriend(" + obj.friendAccepted + "," + obj.friendOwner + ");'>" + "</div>" + 
										"<div class='friend_list_nickname'>" + "<div class='notification-heading friend_list_nick cursor_to_pointer' onclick='visitFriend(" + obj.friendAccepted + "," + obj.friendOwner + ");'>" + obj.friendNickname + "</div>" + "</div>" + 
										"<div class='friend_list_delete'>" + "<button class='friend_delete_DB osageu_ml-23 cursor_to_pointer' onclick='deleteFriend(" + obj.friendNo + ");'>삭제</button>" + "</div>" + 
									"</li>";
     					})
     					$(".friend_list_ul").append(value);
     					
     					if(friendList.length > 5){
     						$(".friend_list_height").addClass("scrolling");
     						$(".friend_delete_DB").removeClass("osageu_ml-23");
    	      			}
     					
     				},error:function(){
     					console.log("ajax통신 실패");
     				}
             	})
				
			})
			
			// 메뉴 이동 (리스트 -> 요청)
			$(".friend_request_button").click(function(){
				$("#friend_list_outer").css("display","none");
				$("#friend_request_outer").css("display","");
				$(this).css({background:"white", color:"rgb(40,40,40)"})
				$(".friend_list_button").css({background:"lightgray", color:"rgb(40,40,40)"})
				$("#find_friend_keyword").val("");
				
				$.ajax({
             		url:"reloadRequest.fr",
     				data:{
     					friendAccepted:${loginUser.memberNo}
     				},
     				success:function(friendList){
     					$(".friend_request").remove();
                          
     					var value="";
     					$.each(friendList, function(i, obj){
     						value += "<li class='friend_request will_disapper" + obj.friendNo + "'>" + 
						                      "<div class='friend_request_images'>" + 
					                          "<img src='" + obj.friendProfile + "'>" + 
					                      "</div>" + 
					                      "<div class='friend_request_nickname'>" + 
					                          "<div class='notification-heading'>" + obj.friendNickname + "</div>" + 
					                      "</div>" + 
					                      "<div class='friend_request_yesorno' align='right'>" +
					                          "<img src='resources/images/checked.png' onclick='acceptFriend(" + obj.friendNo + ")' width='25' height='25' class='accept_friend_icon'>" +
					                          "<img src='resources/images/close.png' onclick='rejectFriend(" + obj.friendNo +")' width='20' height='20'>" +
					                      "</div>" +
					                 "</li>"
     					})
     					$(".friend_request_ul").append(value);
     					
     					if(friendList.length >= 5){
    		      			$(".friend_request_ul").addClass("scrolling");
    	      			}else{
    		      			$(".friend_request_ul").removeClass("scrolling");
    	      			}
     					
     				},error:function(){
     					console.log("ajax통신 실패");
     				}
             	})
				
			})
				
            // 친구 목록 삭제
			deleteFriend = function(index){
				var test = confirm("정말 삭제하시겠습니까?");
              		if(test == true){
	               		$.ajax({
	               			url:"delete.fr",
	       					data:{
	       						friendNo:index
	       					},
	       					success:function(result){
	       						$(".list_will_disapper"+index).remove();
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
              			memberNo:${loginUser.memberNo}
              		},
              		success:function(friendList){
              			$(".friend_pagination .page-link").remove();
						$(".friend_list").remove();
                          
     					var value="";
     					$.each(friendList[0], function(i, obj){
      						value += "<li class='friend_list list_will_disapper" + obj.friendNo + "'>" + 
										"<div class='friend_list_images'>" + "<img src='" + obj.friendProfile + "' class='cursor_to_pointer' onclick='visitFriend(" + obj.friendAccepted + "," + obj.friendOwner + ");'>" + "</div>" + 
										"<div class='friend_list_nickname'>" + "<div class='notification-heading friend_list_nick cursor_to_pointer' onclick='visitFriend(" + obj.friendAccepted + "," + obj.friendOwner + ");'>" + obj.friendNickname + "</div>" + "</div>" + 
										"<div class='friend_list_delete' align='right'>" + "<button class='friend_delete_DB' onclick='deleteFriend(" + obj.friendNo + ");'>삭제</button>" + "</div>" + 
									"</li>";
      					})
      					$(".friend_list_ul").append(value);
      					
      					if($("#friend_ajax_search").val() == ""){
      						$(".friend_list").remove();
      					}
      						
      					$("#friend_ajax_count").text("(" + friendList[1] + ")");
      					
      					// 검색 스크롤 때문에 폭 줄이기
      					if(friendList[1] >= 5){
	       					$(".friend_list_height").addClass("scrolling");
	       					$(".friend_delete_DB").removeClass("osageu_ml-23");
      					}else{
	       					$(".friend_list_height").removeClass("scrolling");
	       					$(".friend_delete_DB").addClass("osageu_ml-23");
      					}
      					
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
      				nickname:$("#find_friend_keyword").val(),
      				memberNo:${loginUser.memberNo}
      			},
      			success:function(friendList){
      				$(".friend_request").remove();
      				
      				var value="";
					$.each(friendList, function(i, obj){
						value += "<li class='friend_request will_disapper" + obj.memberNo + "'>" + 
									"<div class='friend_request_images'>" + "<img src='" + obj.profile + "'>" + "</div>" + 
									"<div class='friend_request_nickname'>" + "<div class='notification-heading'>" + obj.nickname + "</div>" + "</div>" + 
									"<div class='friend_request_appeal' align='right'>" + "<button class='friend_insert_DB' style='outline:0;' onclick='insertDB(" + obj.memberNo + ");'>추가</button>" + "</div>" + 
								"</li>";
					})
				
					$(".friend_request_ul").append(value);
	      				$(".friend_insert_DB").css({"background":"rgb(132,200,185)", "border":"0", "border-radius":"5px", "color":"white", "width":"50px", "height":"27px", "font-size":"15px"});
	      				$(".friend_insert_DB").css("cursor","pointer");
	      				$(".friend_request_appeal").css("width","70px");
	      			
	      			if(friendList.length >= 5){
		      			$(".friend_request_ul").addClass("scrolling");
	      			}else{
		      			$(".friend_request_ul").removeClass("scrolling");
	      			}
	      				
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
      				
      				// 수락 알림
      				if(socket && result.n != null){
						var socketMsg = result.n.memberNo + "," + result.n.notificationContent;
						socket.send(socketMsg);
					}
      				
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
		
		insertDB = function(index){
			$.ajax({
      			url:"insert.fr",
      			data:{
      				friendAccepted:index,
      				friendOwner:${loginUser.memberNo}
      			},
      			success:function(result){
      				alert("친구 요청을 보냈습니다.");
      				$(".will_disapper"+index).remove();
      				
      			},error:function(){
      				console.log("ajax 통신 실패..")
      			}
      		})
		}
		
		visitFriend = function(owner, accept){
			var send = 0;
			if(owner != ${loginUser.memberNo}){
				send = owner;
			}else{
				send = accept;
			}
			$("#diaryMemberNo").val(send);
			$("#goToFriend").attr("onSubmit","");
			$("#goToFriend").submit();
			
		}
				
		
	</script>    
</body>
</html>