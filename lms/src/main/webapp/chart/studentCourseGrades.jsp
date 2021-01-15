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
    <title>CourseGrades</title>
    <!-- css -->
    <link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${path}/dist/css/style.min.css" rel="stylesheet">
    <link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
</head>
<body>
	<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
        <jsp:include page="/WEB-INF/view/student/inc/logoMenu.jsp" flush="false"></jsp:include>
        <jsp:include page="/WEB-INF/view/student/inc/navbarMenu.jsp" flush="false"></jsp:include>
        
        
        <div class="page-wrapper">
            <div class="page-breadcrumb">
            <div>
            <ul class="navbar-nav float-left">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<span>차트를 선택하세요</span><i data-feather="chevron-down"></i>
					</a>
					<!-- 드롭다운 내용 -->
					<div id="dropDown" class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
						
					<!--  
						<a class="dropdown-item" href="${path }/chart/teacherInOutCount.jsp">
							<i class="svg-icon mr-2 ml-1"></i>
							강사 가입/탈퇴수 
						</a>
						<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${path }/chart/studentInOutCount.jsp">
							<i class="svg-icon mr-2 ml-1"></i>
							학생 가입/탈퇴수
						</a>
						<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${path }/chart/teacherAndStudentCount.jsp">
							<i class="svg-icon mr-2 ml-1"></i>
							lms이용자
						</a>
					-->
					</div>
				</li>
			</ul>
			</div>
           	<div class="row">
				<div class="col-md-8 col-lg-8">
					<canvas id="barChart">
					</canvas>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 col-lg-12">
					<div class="card" id="cardStyle">
						<div class="card-body">
							<h4 class="card-title">● 성적 및 평균 점수</h4>
							<div class="table-responsive">
								<table class="table no-wrap v-middle mb-0">
									<thead>
										<tr id="lectureList" class="border-top-0 px-2 py-4">
											
										</tr>
									</thead>
									<tbody>
										<tr id="score" class="border-top-0 px-2 py-4">
										</tr>
										<tr id="scoreAvg">
										</tr>
									</tbody>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script>
		$(document).ready(function(){
			//script에서 session 값 받기
			let studentId = '<%=(String)session.getAttribute("studentId")%>';
			let space =
				`
				<td class="font-14 font-weight-medium text-muted px-2">
					<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
						
					</span>
				</td>
				`
			$('#lectureList').append(space);
			
			$.ajax({
				url:'${path}/chart/allMyLectureList/'+studentId,
				type:'GET',
				success:function(data){
					console.log(data);
					for(let i=0;i<data.length;i++){
						let dropDown=
							`
							<button type="button" class="dropdown-item" id="\${i}">
								\${data[i].lecture.lectureName}
							</button>
							`
						$('#dropDown').append(dropDown);
						}
					
					for(let i=0;i<data.length;i++){
						let list=
							`
							<td class="font-14 font-weight-medium text-muted px-2">
								<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
									\${data[i].lecture.lectureName}
								</span>
							</td>
							`
						$('#lectureList').append(list);
						}
					}
				})
			
			let scoreTitle=
				`
				<td class="font-14 font-weight-medium text-muted px-2">
					<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
						성적
					</span>
				</td>
				`
			let scoreAvgTitle=
				`
				<td class="font-14 font-weight-medium text-muted px-2">
					<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
						강의 평균 성적
					</span>
				</td>
				`
			$('#score').append(scoreTitle);
			$('#scoreAvg').append(scoreAvgTitle);
			
			$.ajax({
				url:'${path}/chart/studentCourseGrades/'+studentId,
				type:"get",
				success:function(data){
						let html=
							`
							<tr class="border-top-0 px-2 py-4">
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.test}
									</span>
								</td>
							</tr>
							<tr class="border-top-0 px-2 py-4">
								<td class="font-14 font-weight-medium text-muted px-2">
									<span class="font-weight-medium text-dark border-top-0 px-2 py-4">
										\${data.testAvg}
									</span>
								</td>
							</tr>
							`
						$('#tableBody').html(html)
						
						
					var ctx = document.getElementById('barChart');
					var chart = new Chart(ctx,{
						type:'bar',
						data:{
							labels:['JAVA123','fintech','JAVAcc','Doraemon','DigitalEngineering','Cshop'],
							datasets:[{
								label:'강의별 성적',
								backgroundColor:'rgba(255, 99, 132, 0.5)',
					            borderColor: 'rgba(255, 99, 132, 1)',
						        data:[
							        data.test,
									data.fintech,
									data.JAVAcc,
									data.Doraemon,
									data.DigitalEngineering,
									data.Cshop
							        ]
								}, {
								label:'강의별 평균 성적',
								backgroundColor:'rgba(54, 162, 235, 0.5)',
						        borderColor:'rgba(54, 162, 235, 1)',
							    data:[
								    data.testAvg,
									data.fintechAvg,
									data.JAVAccAvg,
									data.DoraemonAvg,
									data.DigitalEngineeringAvg,
									data.CshopAvg
								    ]
								}]
							}
						})
					}
				})
			})
    </script>
</body>
</html>