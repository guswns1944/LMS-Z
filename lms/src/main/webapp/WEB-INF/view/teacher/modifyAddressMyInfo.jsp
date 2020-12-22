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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
        <jsp:include page="/WEB-INF/view/teacher/inc/logoMenu.jsp" flush="false"></jsp:include>
        
        <jsp:include page="/WEB-INF/view/teacher/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">My Page</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                	<!-- 소제목 밑 글씨 -->
                                    <li class="breadcrumb-item"><a href="index.html">Members</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid">
                
                <!-- 2번째 라인 카드 -->
                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0">내 정보 관리</h4>
                                </div>
                                <div class="pl-1 mb-1">
									<jsp:include page="/WEB-INF/view/teacher/inc/myInfoMenu.jsp" flush="false"></jsp:include>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-9">
                        <div class="card">
                            <div class="card-body text-muted font-12">
                                <h4 class="card-title">주소변경</h4>
                                <div class="mb-3"></div>
                            	<form id="modifyPwMyInfo" method="post" action="${path}/teacher/modifyPwMyInfo">
	                                <table class="table no-wrap v-middle mb-0">
										<tr>
											<th class=" font-14 font-weight-medium text-dark">현재 비밀번호</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="password" id="teacherPw">
												<input type="hidden" id="accountId" name="accountId" value="${teacherId}">
											</td>
										</tr>
										<tr>
											<th class=" font-14 font-weight-medium text-dark">새 비밀번호</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="password" id="teacherNewPw" name="accountPw">
												<div id="textNewPw">
													영문/숫자/특수문자를 조합하여 8~20자로 입력해주세요.
												</div>
											</td>
										</tr>
										<tr>
											<th class=" font-14 font-weight-medium text-dark">새 비밀번호 확인</th>
											<td class=" font-14 font-weight-medium text-dark">
												<input type="password" id="teacherNewPw2">
												<div id="textNewPw2">
													비밀번호를 다시 한번 입력해주세요.
												</div>
											</td>
										</tr>
	                            	</table>
	                            	<div>
		                            	<button type="button" class="btn btn-dark" id="btnResult">확인</button>
		                            	<button type="button" class="btn btn-dark" id="btnReset">새로 입력</button>
	                            	</div>
                            	</form>
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
</body>
</html>