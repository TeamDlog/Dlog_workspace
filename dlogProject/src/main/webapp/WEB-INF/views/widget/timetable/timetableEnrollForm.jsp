<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Dlog</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/DlogLogo-title.png">
    <!-- Custom Stylesheet -->
    <link href="resources/css/osageuStyle.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

    <jsp:include page="../../common/diaryHeader.jsp"/>
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body" style="float: left;">
                <div class="row page-titles mx-0">
                    <h3 style="color:rgb(94, 94, 94); padding-left: 15px; "><b>수업시간표</b></h3>
                </div>
                <!-- row -->

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card" style="width:800px;">
                                <div class="card-body backgroundColor" >
                                
                                <!-- 여기다가 작성 -->
                                
                                <form action="insert.ti" method="post">
                                	<input type="hidden" name="TimetableWriter" value="${ loginUser.memberNo }">
                                    <table id="timetableTable">
                                        <tr>
                                            <th>
                                              	  과목명 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;<input id="timetableTitle" type="text" name="timetableTitle" required maxlength="10" placeholder="최대10글자" style="width: 93%;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                              	  요일 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp; 
                                                <select name="timetableDay" id="timetableDay" style="width: 90%;height: 25px;">
                                                    <option value="월요일">월요일</option>
                                                    <option value="화요일">화요일</option>
                                                    <option value="수요일">수요일</option>
                                                    <option value="목요일">목요일</option>
                                                    <option value="금요일">금요일</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                              	  시작시간 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <select name="timetableStart" id="timetableStart" style="width: 90%; height: 25px;">
                                                    <option value="8">08:00 ~ 09:00</option>
                                                    <option value="9">09:00 ~ 10:00</option>
                                                    <option value="10">10:00 ~ 11:00</option>
                                                    <option value="11">11:00 ~ 12:00</option>
                                                    <option value="12">12:00 ~ 13:00</option>
                                                    <option value="13">13:00 ~ 14:00</option>
                                                    <option value="14">14:00 ~ 15:00</option>
                                                    <option value="15">15:00 ~ 16:00</option>
                                                    <option value="16">16:00 ~ 17:00</option>
                                                    <option value="17">17:00 ~ 18:00</option>
                                                    <option value="18">18:00 ~ 19:00</option>
                                                    <option value="19">19:00 ~ 20:00</option>
                                                    <option value="20">20:00 ~ 21:00</option>
                                                    <option value="21">21:00 ~ 22:00</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                               	 종료시간 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <select name="timetableEnd" id="timetableEnd" style="width: 90%; height: 25px;">
                                                    <option value="8">08:00 ~ 09:00</option>
                                                    <option value="9">09:00 ~ 10:00</option>
                                                    <option value="10">10:00 ~ 11:00</option>
                                                    <option value="11">11:00 ~ 12:00</option>
                                                    <option value="12">12:00 ~ 13:00</option>
                                                    <option value="13">13:00 ~ 14:00</option>
                                                    <option value="14">14:00 ~ 15:00</option>
                                                    <option value="15">15:00 ~ 16:00</option>
                                                    <option value="16">16:00 ~ 17:00</option>
                                                    <option value="17">17:00 ~ 18:00</option>
                                                    <option value="18">18:00 ~ 19:00</option>
                                                    <option value="19">19:00 ~ 20:00</option>
                                                    <option value="20">20:00 ~ 21:00</option>
                                                    <option value="21">21:00 ~ 22:00</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                               	 배경색상 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <input id="timetableBackground" type="color" name="timetableBackground" style="width: 90%; height: 25px;" value="#000000">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                	글자색상 : 
                                            </th>
                                            <td>
                                                &nbsp;&nbsp;
                                                <input id="timetableColor" type="color" name="timetableColor" style="width: 90%; height: 25px;" value="#ffffff">
                                            </td>
                                        </tr>
                                    </table>
                                    <br><br>
                                    <span>메모</span>
                                    <textarea maxlength="50" placeholder="최대 50자" name="timetableContent" id="timetableContent" cols="100" rows="10" style="resize: none;" ></textarea>
                                    <br><br>
                                    <a href="main.ti" style="float: right;" class="btn btn-danger">취소</a>
                                    <button type="submit" style="float: right; margin-right: 15px;" class="btn btn-success">등록</button>
                                </form>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>
            <!--**********************************
                Content body end
            ***********************************-->  
            <script>
            	$(function(){
            		
            		$("#timetableStart").change(function(){
            			if($(this).val() > $("#timetableEnd").val()){
            				$("#timetableEnd").val($(this).val());
            			}
            			$("#timetableEnd option").attr("disabled", false);
           				for(var i=8; i<$("#timetableStart").val(); i++){
           					$("#timetableEnd option[value="+i+"]").attr("disabled", true);
           				}
            		});
            		
            	});
            </script>
        </div>
        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Widget area start
        ***********************************-->
        <jsp:include page="../../common/diaryWidget.jsp"/>
    <!--**********************************
        Widget area end
    ***********************************-->
    <jsp:include page="../../common/diaryFooter.jsp"/>

</body>

</html>