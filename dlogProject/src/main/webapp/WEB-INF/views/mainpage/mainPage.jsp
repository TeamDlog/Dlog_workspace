<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dlog</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/images/webImage.png" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resources/css/mainStyles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body id="page-top">
    
    <jsp:include page="../common/mainHeader.jsp" />

    <!-- Masthead-->
    <header class="masthead text-white text-center">
        <div id="mainImage" class="" style="width:100%;" >
            <img class="" src="resources/images/mainImage.jpeg" alt="" style="width: 100%;"/>
        </div>
    </header>
   

    <!-- Introduction Section -->
    <section class="page-section bg-primary text-white mb-0" id="about">
        <div class="container">
            <!-- About Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-white">:Dlog를 소개합니다</h2>
            <!-- Icon Divider-->
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- About Section Content-->
            <div class="row" >
                <div class="introductionComment">아날로그 감성을 디지털에서 마음껏 누릴 수 있는 최적의 다이어리를 소개합니다!</div>
                <div class="col-lg-4 ml-auto"><p style="font-size: 18px; text-align: justify;">언제부터인가 무거운 책을 들고 다니는 것 보다 태블릿 하나로 독서를 하는 것이 더욱 편리한 시대가 왔습니다. 다이어리라고 크게 다르지 않다고 생각합니다.  저희 :Dlog과 함께라면 언제, 어디서든 자신의 다이어리를 꾸미고 즐길 수 있습니다. </p></div>
                <div class="col-lg-4 mr-auto"><p style="font-size: 18px; text-align: justify;">저희 :Dlog에서는 기존의 아날로그 다이어리의 기능을 그대로 가져왔습니다. 거기서 멈추지 않고 디지털만의 기능을 추가하여 여러분이 이용하기에 더욱 편하게 만들었습니다. 멋있었던 과거와 앞으로 빛날 미래를 :Dlog과 함께 하세요!</p></div>
            </div>
        </div>
    </section>

    <!-- WhatCanDo Section-->
    <section class="page-section portfolio" id="portfolio">
        <div class="container">
            <!-- WhatCanDo Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">무엇을 할 수 있나요?</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- WhatCanDo Grid Items-->
            <div class="row">
                <!-- WhatCanDo Item 1-->
                <div class="col-md-6 col-lg-4 mb-5">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="resources/images/memo.jpg" alt="" />
                    </div>
                </div>
                <!-- WhatCanDo Item 2-->
                <div class="col-md-6 col-lg-4 mb-5">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="resources/images/calendar.jpg" alt="" />
                    </div>
                </div>
                <!-- WhatCanDo Item 3-->
                <div class="col-md-6 col-lg-4 mb-5">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="resources/images/picture.jpg" alt="" style="height: 222px; width: 100%;" />
                    </div>
                </div>
                <!-- WhatCanDo Item 4-->
                <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="resources/images/d-day.jpg" alt="" />
                    </div>
                </div>
                <!-- WhatCanDo Item 5-->
                <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal5">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="resources/images/diary.jpg" alt="" />
                    </div>
                </div>
                <!-- WhatCanDo Item 6-->
                <div class="col-md-6 col-lg-4">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal6">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="resources/images/friends.jpg" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- HowToStart Section-->
    <section class="page-section bg-primary text-white mb-0">
        <div class="container">
            <!-- HowToStart Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-white">어떻게 시작하나요?</h2>
            <!-- Icon Divider-->
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- HowToStart Section Content-->
            <div class="row">
                <div class="col-lg-4 ml-auto mr-auto" align="center"><p class="page-section-heading">Just Sign Up!</p></div>
            </div>
            <!-- HowToStart Section Button-->
            <div class="text-center mt-4">
                <a class="btn btn-lg btn-outline-light" href="enrollForm.me">
                    회원가입 →
                </a>
            </div>
        </div>
    </section>


    <!-- Contact Section-->
    <section class="page-section" id="contact">
        <div class="container">
            <!-- Contact Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">연락하기</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Contact Section Form-->
            <div class="row">
                <div class="col-lg-8 mx-auto">
                
                    <form action="https://script.google.com/macros/s/AKfycbyisfe3KmAnGanCnb9ZINuseLs_SZRY4sGifnPIog/exec" class="gform" method="POST" data-email="dhwkdtjr123@naver.com">
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                <label>Name</label>
                                <input class="form-control" name="name" type="text" placeholder="Name" required="required" data-validation-required-message="Please enter your name." />
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                <label>Email Address</label>
                                <input class="form-control" name="email" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address." />
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                <label>Phone Number</label>
                                <input class="form-control" name="phone" type="tel" placeholder="Phone Number" required="required" data-validation-required-message="Please enter your phone number." />
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                <label>Message</label>
                                <textarea class="form-control" name="message" rows="5" placeholder="Message" required="required" data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br />
                        <div class="form-group"><button class="btn btn-primary" id="sendMessageButton" style="height: 50px; font-size: 20px;">&emsp;Send&emsp;</button></div>
                        <div style="display:none" class="thankyou_message">
							<!-- You can customize the thankyou message by editing the code below -->
							<h4> 연락해주셔서 감사합니다! 빠른 시일내에 답변을 드리겠습니다.</h4>
						</div>
                    </form>
                </div>
            </div>
            <script data-cfasync="false" type="text/javascript"
				src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js">
            </script>
        </div>
    </section>
    
    <!-- Portfolio Modals-->
    <!-- Portfolio Modal 1-->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-times"></i></span>
                </button>
                <div class="modal-body text-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal1Label">메모장</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Image-->
                                <img class="img-fluid rounded mb-5" src="resources/images/memo.jpg" alt="" />
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-5">저희 Dlog는 여러분에게 메모장 기능을 제공합니다. 순간 떠오르는 아이디어나 간단히 메모할 것이 있다면 이 기능을 사용하세요! 최대 10개의 메모를 작성할 수 있으며 위젯으로 등록하여 계속해서 볼 수 있습니다. </p>
                                <button class="btn btn-primary" data-dismiss="modal">
                                    <i class="fas fa-times fa-fw"></i>
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 2-->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-labelledby="portfolioModal2Label" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-times"></i></span>
                </button>
                <div class="modal-body text-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal2Label">캘린더</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Image-->
                                <img class="img-fluid rounded mb-5" src="resources/images/calendar.jpg" alt="" />
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-5">저희 Dlog는 여러분에게 캘린더 기능을 제공합니다. 여러분이 기억하고자 하는 일정을 연, 월, 일 단위로 볼 수 있고 여러분이 직접 고른 색상으로 캘린더를 알록달록하게 꾸밀 수 있습니다.</p>
                                <button class="btn btn-primary" data-dismiss="modal">
                                    <i class="fas fa-times fa-fw"></i>
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 3-->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-labelledby="portfolioModal3Label" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-times"></i></span>
                </button>
                <div class="modal-body text-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal3Label">사진 게시판</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Image-->
                                <img class="img-fluid rounded mb-5" src="resources/images/picture.jpg" alt="" />
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-5">저희 Dlog는 여러분에게 사진 게시판 기능을 제공합니다. 누군가와의 추억, 언젠가의 추억, 어디서의 추억을 사진 게시판에 장식해보세요. 간략한 설명과 함께 언제 사진을 찍었는 지 등록할 수 있답니다.  </p>
                                <button class="btn btn-primary" data-dismiss="modal">
                                    <i class="fas fa-times fa-fw"></i>
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 4-->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-labelledby="portfolioModal4Label" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-times"></i></span>
                </button>
                <div class="modal-body text-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal4Label">디데이</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Image-->
                                <img class="img-fluid rounded mb-5" src="resources/images/d-day.jpg" alt="" />
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-5">저희 Dlog는 여러분에게 디데이 기능을 제공합니다. 연인과의 기념일, 중요한 시험 등등 꼭 기억해야할 일정을 위젯으로 최대 3개까지 등록가능합니다.</p>
                                <button class="btn btn-primary" data-dismiss="modal">
                                    <i class="fas fa-times fa-fw"></i>
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 5-->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-labelledby="portfolioModal5Label" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-times"></i></span>
                </button>
                <div class="modal-body text-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal5Label">일기장</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Image-->
                                <img class="img-fluid rounded mb-5" src="resources/images/diary.jpg" alt="" />
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-5">저희 Dlog는 여러분에게 일기장 기능을 제공합니다. 오늘 하루 특별했던 경험이 있다면 저희 Dlog diary에 일기를 써보세요! 먼 훗날 오늘 날을 다시 추억할 수 있게 된답니다.</p>
                                <button class="btn btn-primary" data-dismiss="modal">
                                    <i class="fas fa-times fa-fw"></i>
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 6-->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-labelledby="portfolioModal6Label" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-times"></i></span>
                </button>
                <div class="modal-body text-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" id="portfolioModal6Label">친구 기능</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Image-->
                                <img class="img-fluid rounded mb-5" src="resources/images/friends.jpg" alt="" />
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-5">저희 Dlog는 여러분에게 친구 기능을 제공합니다. 친구와의 추억, 나만의 고민을 친구와 함께 하고 싶습니까? 저희 Dlog를 통해 친구와 다이어리를 공유해보세요! 물론 친구에게도 비밀인 것은 혼자만 간직할 수도 있답니다.</p>
                                <button class="btn btn-primary" data-dismiss="modal">
                                    <i class="fas fa-times fa-fw"></i>
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script data-cfasync="false" type="text/javascript"
		src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>
		
	<script>
		$(".form-control").keyup(function(){
			$("#sendMessageButton").attr("disabled",false);
			$(".thankyou_message").css("display","none");
		})
	</script>
	
    <jsp:include page="../common/mainFooter.jsp" />
</body>
</html>
