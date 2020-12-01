<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
        <i class="fas fa-user-friends" id="friend_icon"></i>
        <span class="badge gradient-7 badge-pill badge-primary">3</span>
    </a>
    <div class="drop-down fadeIn dropdown-menu" id="friend_list" style="padding: 0px;">
        <div id="friend_list_buttons">
            <div class="friend_list_button">친구 목록</div>  
            <div class="friend_request_button">친구 요청</div>  
        </div>
        <div class="dropdown-content-body" id="friend_list_outer">
            <div id="friend_list_search_outer">
                <div class="friend_list_search">
                    <input type="text" id="friend_ajax_search" placeholder="내 친구를 찾아보세요!">
                    <span id="friend_ajax_count"></span>
                </div>
            </div>
            <div class="friend_list_height">
             <ul class="friend_list_ul">
                 <c:forEach var="f" items="${ friendList }" varStatus="status">
                  <li class="friend_list">
                      <div class="friend_list_images">
                          <img src="resources/images/avatar/1.jpg">
                      </div>
                      <div class="friend_list_nickname">
                          <div class="notification-heading friend_list_nick">${ f.friendNickname }</div>
                      </div>
                      <div class="friend_list_delete" align="right">
                          <button class="friend_delete_DB" value="${ f.friendAccepted }">삭제</button>
                      </div>
                  </li>
                 </c:forEach>
             </ul>
            </div>
            <div class="bootstrap-pagination" align="center">
            	<input type="hidden" value="" id="this_page_friend_currentPage">
            	<c:if test="${ friendList ne null }">
             	<input type="hidden" value="${ friendList[0].friendOwner }" id="friend_owner">
            	</c:if>
                <nav>
                    <ul class="pagination justify-content-center friend_pagination">
<li class="page-item pre-page-moving-li">
	<a class="page-link page-moving pre-page-moving hovered">&lt;</a>
</li>

<c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
	<li class="page-item page-num"><a class="page-link" onclick="pageMove(${p});">${ p }</a></li>
</c:forEach>

<li class="page-item next-page-moving-li">
	<a class="page-link page-moving next-page-moving hovered">&gt;</a>
</li>
                    </ul>
                </nav>
            </div>
        </div>
        
        <div class="dropdown-content-body" id="friend_request_outer">
            <div class="friend_request_search">
            	<div id="frs_left">
            		<input type="text" id="find_friend_keyword" placeholder="추가할 친구를 검색해보세요!">
            	</div>
            	<div id="frs_right" onclick="findFriend();">
                	<i class="fa fa-search"></i>
            	</div>
            </div>
            <div class="friend_request_height">
             <ul class="friend_request_ul">
             	<c:forEach var="rf" items="${ requestFriend }">
                  <li class="friend_request">
                      <div class="friend_request_images">
                          <img src="resources/images/avatar/2.jpg">
                      </div>
                      <div class="friend_request_nickname">
                          <div class="notification-heading">${ rf.friendNickname }</div>
                      </div>
                      <div class="friend_request_yesorno" align="right">
                      	<input type="hidden" value="${ rf.friendNo }">
                          <img src="resources/images/checked.png" width="25" height="25" class="accept_friend_icon">
                          <img src="resources/images/close.png" width="20" height="20">
                      </div>
                  </li>
                 </c:forEach>
             </ul>
            </div>
            
        </div>
    </div>
</li>
<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
        <i class="fas fa-user-friends"></i>
        <span class="badge gradient-7 badge-pill badge-primary">3</span>
    </a>
</li>
</body>
</html>