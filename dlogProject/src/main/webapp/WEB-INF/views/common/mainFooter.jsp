<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- Footer-->
    <footer class="footer text-center" style="background: rgb(132,200,185);">
        <div class="container" style="height: 160px;">
            <div class="row">
                <!-- Footer Location-->
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h5 class="text-uppercase mb-4">Location</h5>
                    <p class="mb-0" style="font-size: 17px; font-weight: 700;">
                        서울특별시 강남구 <br>
                        테헤란로 14길 6 <br>
                        남도빌딩                            
                    </p>
                </div>
                <!-- Footer Social Icons-->
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h5 class="text-uppercase mb-4">Around the Web</h5>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-lg fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-lg fa-twitter"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-lg fa-youtube"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-lg fa-instagram-square"></i></a>
                </div>
                <!-- Footer About Text-->
                <div class="col-lg-4">
                    <h5 class="text-uppercase mb-4">About Dlog</h5>
                    <p class="mb-0" style="font-size: 17px; font-weight: 700;">
                        &lt; Final project &gt; <br>
                        very very good diary.. <br>
                        just use it!
                    </p>
                </div>
            </div>
        </div>
    </footer>


    <!-- Copyright Section-->
    <div class="copyright py-2 text-center text-white">
        <div class="container">Copyright Ⓒ 2018-<label id="thisYear"></label> Dlog Diary Providing Service Company All Right Reserved</div>
    </div>


    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
    <div class="scroll-to-top position-fixed">
        <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
    </div>

    
    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Contact form JS-->
    <script src="resources/assets/mail/jqBootstrapValidation.js"></script>
    <script src="resources/assets/mail/contact_me.js"></script>
    <!-- Core theme JS-->
    <script src="resources/js/mainScripts.js"></script>
    <script>
        $(function(){

            // mainImage margin 제거
            $("#mainImage").removeClass("container");

            // copyright 올해 설정
            var date = new Date();
            $("#thisYear").html(date.getFullYear());

        })
    </script>
</body>
</html>
