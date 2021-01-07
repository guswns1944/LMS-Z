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
    <title>modifyLmsNotice</title>
    <!-- css -->
    <link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${path}/dist/css/style.min.css" rel="stylesheet">
    <link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
    <!-- SmartEditor 텍스트편집기 -->
	<script src="${path }/smarteditor2/js/HuskyEZCreator.js"></script>
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
        
        <jsp:include page="/WEB-INF/view/manager/inc/logoMenu.jsp" flush="false"></jsp:include>
        <jsp:include page="/WEB-INF/view/manager/inc/navbarMenu.jsp" flush="false"></jsp:include>
	
		<!-- 소제목 -->
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1"><a style="color: black;" href="">lmsNotice</a></h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
				<!-- 1번째 라인 카드 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card" id="cardStyle">
                            <div class="card-body">
                               <h4 class="card-title">공지 수정</h4>
	                            <div>
	                            	<form method="post" action="${path}/manager/modifyLmsNotice/${currentPage}">
	                            		<table id="lmsTable" class="table table" style="margin-top: 20px; text-align: center;">
	                            			<tr>
												<th style="width:10%;">NO</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="lmsNoticeNo" value="${lmsNotice.lmsNoticeNo }" readonly="readonly">
												</td>
											</tr>
											<tr>
												<th>게시일</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" value="${lmsNotice.lmsNoticeCreatedate }" readonly="readonly">
												</td>
											</tr>
											<tr>
												<th>수정일</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" value="${lmsNotice.lmsNoticeUpdatedate }" readonly="readonly">
												</td>
											</tr>
											<tr>
												<th>작성자</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" value="${lmsNotice.lmsNoticeWriter }" readonly="readonly">
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td>
													<input class="form-control" style="width:100%;" type="text" name="lmsNoticeTitle" id="lmsNoticeTitle" value="${lmsNotice.lmsNoticeTitle }" style="width:560px">
												</td>
											</tr>
											<tr>
												<th>내용</th>
												<td>
													<textarea class="form-control" style="width:100%;" name="lmsNoticeContent" id="lmsNoticeContent" style="resize:none;overflow:visible;" cols="50">${lmsNotice.lmsNoticeContent }</textarea>
												</td>
											</tr>
										</table>
										<button class="btn btn-success" style="border-radius: 4px; float:right;" type="button" id="updateBtn">수정완료</button>
									</form>
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
		$(document).ready(function() {
			// SmartEditor2 스크립트 추가
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : 'lmsNoticeContent',
				sSkinURI : '${path}/smarteditor2/SmartEditor2Skin.html',
				fCreator : 'createSEditor2'
			})
			$('#updateBtn').click(function(){
				//네이버 에디터 적용한 input value를 갖고 오기 위해
				oEditors.getById["lmsNoticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
				if($('#lmsNoticeTitle').val() ==""){
					alert('제목을 입력해주세요.');
					}
				else if($('#lmsNoticeContent').val() == '<p>&nbsp;</p>' ||$('#lmsNoticeContent').val() == ''){
					alert('내용을 입력해주세요.');
					}
				else{
					$('#updateBtn').removeAttr("type");
					$('#updateBtn').attr("type","submit");
					}
				});
			
		})
	</script>
</body>
</html>