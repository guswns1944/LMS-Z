<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 위의 사이트 아이콘 -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/assets/images/favicon.png">
    <title>lms</title>
    <!-- css -->
    <link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${path}/dist/css/style.min.css" rel="stylesheet">
</head>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>


    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md">
            	<!-- 사이드바 로고 -->
                <div class="navbar-header" data-logobg="skin6">
                    <div class="navbar-brand">
                        <!-- 사이트 이름 -->
                         <a href="${path}/student/index">
                            <b class="logo-icon">
                            	<!-- 사이트 이름 옆 로고 -->
                                <img src="${path}/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <img src="${path}/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
                            </b>
							<!-- 사이트 이름 -->
                            <span class="logo-text">
								GOODEE LMS
                            </span>
                        </a>
                    </div>
                </div>

				<!-- 로고 오른쪽 메뉴 -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent">
					<!-- 뛰어쓰기 용 ul -->
					
                    <span class="navbar-nav float-left mr-auto ml-3 pl-1">
	                    <a class="btn btn-success font-20 popover-item " href="${path }/student/myLectureList/${studentId}/${currentPage}">
	                        	목록으로
	                    </a>
	                    <a class="btn btn-success font-20 popover-item ml-3" id="reviewBtn" style="color:white">
	                        	수강후기
	                   </a>
                    </span>
                    <!-- 메뉴 오른쪽 마이페이지 -->
                    <ul class="navbar-nav float-right">
                    	<!-- 눌렀을 때 드롭다운 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <!-- 마이페이지 사진 -->
                                <img src="${path}/assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle"
                                    width="40">
                                <span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span> <span
                                        class="text-dark"><c:out value="${studentId}"/></span> 
                                       <!-- <i data-feather="chevron-down" class="svg-icon"></i> 다운드롭 화살표-->
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        <!-- 로고 밑 메뉴 -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/student/index"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">Index</span></a></li>
                        <!-- 사용 시 줄 표시 -->
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">menu</span></li>

                        <li class="sidebar-item"> <a class="sidebar-link" href=""
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">강의 목록
                                </span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/student/lectureList/1"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">수강신청</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/student/questionList/1"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">질문 목록</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link" href="#"
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">4</span></a>
                        </li>
                        <li class="list-divider"></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/student/logout"
                                aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                                    class="hide-menu">Logout</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">${myLectureListOne.lecture.lectureName }</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item">
                                    	<a href="">${myLectureListOne.teacher.teacherName }(${myLectureListOne.lecture.accountId})</a>
                                    	<span class="text-center mt-4 mb-0"> ${myLectureListOne.lecture.lectureCreatedate}</span>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center text-right">
                    	<div class="col-12 align-self-center">
                    		<c:if test="${myLectureListOne.classRegistrationState=='대기'}">
		                        <a class="btn btn-success font-20 popover-item" style="color:white;">
		                        	${myLectureListOne.classRegistrationState}
		                        </a>
	                        </c:if>
	                        <c:if test="${myLectureListOne.classRegistrationState=='수강중'}">
		                        <a class="btn btn-primary font-20 popover-item" style="color:white;">
		                        	${myLectureListOne.classRegistrationState}
		                        </a>
	                        </c:if>
	                        <c:if test="${myLectureListOne.classRegistrationState=='수료'}">
		                        <a class="btn btn-warning font-20 popover-item" id="state" style="color:white;">
		                        	${myLectureListOne.classRegistrationState}
		                        </a>
	                        </c:if>
	                        <c:if test="${myLectureListOne.classRegistrationState=='과락'}">
		                        <a class="btn btn-danger font-20 popover-item" style="color:white;">
		                        	${myLectureListOne.classRegistrationState}
		                        </a>
	                        </c:if>
	                        <c:if test="${myLectureListOne.classRegistrationState=='취소'}">
		                        <a class="btn btn-secondary font-20 popover-item" style="color:white;">
		                        	${myLectureListOne.classRegistrationState}
		                        </a>
	                        </c:if>
		                </div>
		           </div>
		       </div>
			<br>
				<!-- 수강평 작성란 -->
				<div class="row" hidden="hidden" id="reviewDiv">
                    <div class="col-md-6 col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0">수강 후기</h4>
                                    <button class="btn btn-light text-dark rounded-circle btn-circle font-20 ml-auto" 
                                    type="button" id="reviewCloseBtn">▲</button>
                                </div>
                                <br>
                                <div class="table-responsive">
                                <form method="post" action="${path }/student/lectureReview/${currentPage}">
                                	<div hidden="hidden">
                                		<input type="text" name="lectureNo" value="${myLectureListOne.lecture.lectureNo}">
                                		<input type="text" name="accountId" value="${studentId }">
                                	</div>
	                                <div>
	                                	수강평점 : &emsp;<input type="radio" name=classRegistrationPoint value="0">&nbsp;0&emsp;
	                                					<input type="radio" name=classRegistrationPoint value="1">&nbsp;1&emsp;
	                                					<input type="radio" name=classRegistrationPoint value="2">&nbsp;2&emsp;
	                                					<input type="radio" name=classRegistrationPoint value="3">&nbsp;3&emsp;
	                                					<input type="radio" name=classRegistrationPoint value="4">&nbsp;4&emsp;
	                                					<input type="radio" name=classRegistrationPoint value="5">&nbsp;5
	                                </div>
	                                <br>
	                                <div>
	                                	수강후기
	                                	<div class="font-14 font-weight-medium text-muted px-2 py-2">
	                                         <textarea style="resize:none" cols="70" rows="6" id="classRegistrationReview"
	                                         	name="classRegistrationReview" class="font-weight-medium text-dark px-4 py-4"></textarea>
	                                    </div>
	                                </div>
	                                <div class="d-flex align-items-start">
	                                    <button class="btn btn-warning text-white font-20" 
	                                    type="button" id="reviewInputBtn">입력</button>
	                                </div>
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-md-5 col-lg-7">
                        <div class="card">
                            <div class="card-body">
                            	<h4 class="card-title">● 강의정보</h4>
                                <div class="table-responsive">
                                    <table class="table no-wrap v-middle mb-0">
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 font-weight-medium text-muted">과목</th>
                                            <td class="font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.subject.subjectName }</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">이수인정시간</th>
                                            <td class="border-0 font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.subject.subjectTotalday }시간</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">과목설명</th>
                                            <td class="border-0 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.subject.subjectInfo }</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 font-weight-medium text-muted">강의 기간</th>
                                            <td class="font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">
                                            	 	${myLectureListOne.lecture.lectureStartdate } ~ ${myLectureListOne.lecture.lectureEnddate }
                                            	 </span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">강좌 정원</th>
                                            <td class="border-0 font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">
                                            	 	${myLectureListOne.lecture.lectureTotal }명
                                            	 </span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 font-weight-medium text-muted">강의계획서</th>
                                            <td class="font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	<textarea style="resize:none" cols="30" rows="6" class="font-weight-medium text-dark border-0 px-2 py-4">${myLectureListOne.syllabus.syllabusContent }</textarea>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 font-weight-medium text-muted">강의실</th>
                                            <td class="font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.classroom.classroomNumber }호</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">강의실 크기</th>
                                            <td class="border-0 font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.classroom.classroomSize }㎡</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">강의실 수용인원</th>
                                            <td class="border-0 font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.classroom.classroomTotal }명</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-13">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">● 교재정보</h4>
                                <div class="table-responsive">
                                    <table class="table no-wrap v-middle mb-0">
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 font-weight-medium text-muted">교재 제목</th>
                                            <td class="font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.textbook.textbookTitle }</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">저자</th>
                                            <td class="border-0 font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.textbook.textbookWriter }시간</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">출판사</th>
                                            <td class="border-0 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.textbook.textbookPublisher }</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">발행</th>
                                            <td class="border-0 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.textbook.textbookPublishdate }</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">가격</th>
                                            <td class="border-0 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.textbook.textbookPrice }</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                         <tr class="border-top-0 px-2 py-4">
                                            <th class="border-0 font-14 font-weight-medium text-muted">ISBN</th>
                                            <td class="border-0 font-weight-medium text-muted px-2" colspan="2">
                                            	 <span class="font-weight-medium text-dark border-top-0 px-2 py-4">${myLectureListOne.textbook.textbookIsbn }</span>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                        <tr class="border-top-0 px-2 py-4">
                                            <th class="font-14 font-weight-medium text-muted">책 정보</th>
                                            <td class="font-14 font-weight-medium text-muted px-2" colspan="2">
                                            	<textarea style="resize:none" cols="30" rows="3" class="font-weight-medium text-dark border-0 px-2 py-4">${myLectureListOne.textbook.textbookInfo }</textarea>
                                           	</td>
                                           	<td class="border-0"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
	
	<!-- script 코드 -->
    <script src="${path}/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${path}/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${path}/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${path}/dist/js/app-style-switcher.js"></script>
    <script src="${path}/dist/js/feather.min.js"></script>
    <script src="${path}/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${path}/dist/js/sidebarmenu.js"></script>
    <script src="${path}/dist/js/custom.min.js"></script>
    <script src="${path}/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${path}/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${path}/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${path}/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${path}/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${path}/dist/js/pages/dashboards/dashboard1.min.js"></script>
    <script>
		$(document).ready(function(){
			$("#reviewBtn").click(function(){
				if("${myLectureListOne.classRegistrationState}"=="수료"){
						$("#reviewDiv").removeAttr('hidden');
						if("${myLectureListOne.classRegistrationPoint}"!="0" && "${myLectureListOne.classRegistrationReview}"!= null){
								$('input:radio[name="classRegistrationPoint"]:input[value="${myLectureListOne.classRegistrationPoint}"]').attr("checked",true);
								$('textarea[name="classRegistrationReview"]').text("${myLectureListOne.classRegistrationReview}");
						}
					}else{
						alert("수료한 학생만 작성할 수 있습니다.");
					}
				})
			$("#reviewCloseBtn").click(function(){
				$("#reviewDiv").attr("hidden","hidden");
				})
			})
			$("#reviewInputBtn").click(function(){
					if($("input[name='classRegistrationPoint']:checked").val() == null){
						alert("평점을 체크해주세요");
					}else if($("#classRegistrationReview").val() == ""){
						alert("후기를 입력해주세요");
					}else{
						$("#reviewInputBtn").removeAttr('type');
						$("#reviewInputBtn").attr('type','submit');
						alert("수강후기가 저장되었습니다.")
					}
				})
    </script>
</body>

</html>