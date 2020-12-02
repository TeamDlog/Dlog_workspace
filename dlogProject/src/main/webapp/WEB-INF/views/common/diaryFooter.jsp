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
        outer end
    ***********************************-->
    <br clear="both">
    <!--**********************************
    Footer start
    ***********************************-->
    <div align="center">
        <div class="">
            <p>Copyright &copy; Designed & Developed by <a href="">Dlog</a> 2020</p>
        </div>
    </div>
    <!--**********************************
        Footer end
    ***********************************-->  

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    
    <!-- summernote -->
    <script src="resources/plugins/summernote/dist/summernote.min.js"></script>
    <script src="resources/plugins/summernote/dist/summernote-init.js"></script>
        
    <!-- dataTable -->
    <script src="resources/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
	
	<!-- 공개비공개/화설비활성 스크립트 -->
	<script>
		$(function(){
			if(${loginUser.memberNo != loginUser.diaryMemberNo}){
				
				if(${ca.privacyCalendar == "N"}){
					$(".menuCalendar i").addClass('ion-android-lock');
					$(".menuCalendar a").removeAttr("href");
				}
				
				if(${ca.privacyDiary == "N"}){
					$(".menuDiary i").addClass('ion-android-lock');
					$(".meniDiary a").removeAttr("href");
				}
				
				if(${ca.privacyFreenote == "N"}){
					$(".menuFreenote").addClass('ion-android-lock');
					$(".menuFreenote").removeAttr("href");
				}
				
				if(${ca.privacyPhoto == "N"}){
					$(".menuPhoto i").addClass('ion-android-lock');
					$(".menuPhoto a").removeAttr("href");
				}
				
				if(${ca.privacyAccount == "N"}){
					$(".menuAccount i").addClass('ion-android-lock');
					$(".meniAccount a").removeAttr('href');
				}
				
				if(${ca.privacyMemo == "N"}){
					$(".memuMemo i").addClass('ion-android-lock');
					$(".menuMemo a").removeAttr("href");
					$(".widgetMemo").css("display", "none");
				}
				
				if(${ca.privacyVoca == "N"}){
					$(".menuVoca i").addClass('ion-android-lock');
					$(".menuVoca a").removeAttr("href");
					$(".widgetVoca").css("display", "none");
				}
				
				if(${ca.privacyDday == "N"}){
					$(".menuDday i").addClass('ion-android-lock');
					$(".menuDday a").removeAttr("href");
					$(".widgetDday").css("display", "none");
				}
				
				if(${ca.privacyTimetable == "N"}){
					$(".widgetTimetable i").addClass('ion-android-lock');
					$(".widgetTimetable a").removeAttr("href");
					$(".widgetTimetable").css("display", "none");
				}
			
			}
			
		})
	</script>
	<!-- 공개비공개/화설비활성 스크립트 -->
	
</body>
</html>