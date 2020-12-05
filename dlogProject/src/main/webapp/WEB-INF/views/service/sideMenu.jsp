<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
 	textarea:focus, input:focus{
        	outline:none;
    }
    div{
            box-sizing: border-box;
    }
    #wrap{
        width:1350px;
        height:900px;
        margin:auto;
        background:#F6F6F6;
        margin-bottom:1%;
    }
    #content{
        width: 90%;
        height: 65%;
        margin:auto;
        margin-top:9%;

        
    }
    #content>div{
        float:left;
    }
    #content_left{
        width: 20%;
        height: 90%;
        padding: 20px;
       
    }
   
    #content_right{
            width: 80%;
            height: 90%;
            padding: 20px;
            position:relative;
           
    }
        
    #title{
            background: rgb(132, 200, 185);
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            padding: 5px;
    }
    .bootstrap-pagination{width:fit-content;margin:auto;}
    #searchForm{
            width:70%;
            margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:10px;
    }
    .select{width:17%;}
    .text{width:53%;}
    .searchBtn{Width:13%;}
	
	#sideMenu{
		height:500px;
	}
	#service{
		border:1px solid lightgrey;
		margin-bottom:30px;
		height:70%;
	}
	#service div{
		padding-left:20px;
	}
	#serviceTitle{
		background:rgb(132, 200, 185);
		font-size:25px;
		font-weight:bold;
		padding:5px;
		text-align: center;
	}
	#serviceNotice{
		font-size:25px;
		margin-top:50px;
	}	
	#serviceFAQ{
		font-size:25px;
		margin-top:50px;
	}
	#serviceInquiry{
		font-size:25px;
		margin-top:50px;
	}

 	#serviceNotice>a{
        color:black;
    }
    #serviceFAQ>a{
    	color:black;
	}	
	#serviceInquiry>a{
		color:black;
	}
	
	#serviceTime{
		border:1px solid lightgray;
		padding-left:20px;
		font-size:18px;
		height:40%;
		padding-top:18px;
	}
	#serviceTime>p:nth-child(1){
		font-weight:bold;
	}
    
  	#boardList>tbody>tr:hover{cursor:pointer;}
	.footer h5{font-weight:bold;}
	a[href="serviceMain.fo"]{color:grey !important;}
</style>
  <script>
        $(function(){
            var navbarCollapse = function() {
                $("#mainNav").addClass("navbar-shrink");
                $(".logoImage").addClass("image-shrink");
                $(".nav-lcs").addClass("nav-item-shrink");
            };
            navbarCollapse();
            $(window).scroll(navbarCollapse);
        });
    </script>
</head>
<body>


		<div id="sideMenu">
		   <div id="service">
			   <div id="serviceTitle">고객센터</div>
			   <div id="serviceNotice">
					  <a href="list.no">공지사항</a>
			   </div>
			   <div id="serviceFAQ">
				   <a href="list.fo">FAQ</a>
			   </div>
			    <c:if test="${ !empty loginUser }">
				   <div id="serviceInquiry">
						<a href="enrollForm.io">1:1문의</a>
				   </div>
			   </c:if>
		   </div>
		   <div id="serviceTime">
			   <p>고객센터 <br>
				   1588-9393
			   </p>
			   <p>
				   월 - 금 <br>
				   09:00 ~ 17:00 <br>
				   (토 / 일 / 공휴일 휴무)
			   </p>
			</div>
		</div>
</body>
</html>