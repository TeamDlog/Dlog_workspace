<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		</div>
	    <!--**********************************
	        Main wrapper end
	    ***********************************-->
		<!--**********************************
            Widget area start
        ***********************************-->
        <div class="widget-area" style="float:left; margin-top: 100px;">
            <div class="card" style="max-width:170px; height:275px;">
                <div class="card-body">
                    <div class="text-center">
                    	<c:if test="${loginUser.profile == null}">
                        <img alt="" class="rounded-circle mt-4" src="resources/images/default-profile-pic.jpg" width="90px">
                        </c:if>
                        <h4 class="card-widget__title text-dark mt-3" style="font-size:18px; font-weight:bolder;">${loginUser.nickname }</h4>
                        <p class="text-muted" style="font-size:0.8em;">${loginUser.email }</p>
                        <p class="text-muted" style="font-weight:bolder;">${loginUser.introductionTitle }</p>
                    </div>
                </div>
                
            </div>

            <div class="card card-widget">
                <div class="card-body gradient-4">
                    <div class="media">
                        <span class="card-widget__icon"><i class="icon-emotsmile"></i></span>
                        <div class="media-body">
                            <h2 class="card-widget__title">1002</h2>
                            <h5 class="card-widget__subtitle">Task Completed</h5>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="stat-widget-one">
                    <div class="stat-content">
                        <div class="stat-text">Today Expenses</div>
                        <div class="stat-digit"><i class="fa fa-usd"></i>8500</div>
                    </div>
                    <div class="progress mb-3">
                        <div class="progress-bar gradient-3" style="width: 50%;" role="progressbar"><span class="sr-only">50% Complete</span>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <!--**********************************
            Widget area end
        ***********************************-->
</body>
</html>