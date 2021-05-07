<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/happyhouse.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9bf0d7936418891b021d9471ec64035f"></script>
<script src="./js/kakaomap.js"></script>
<script type="text/javascript">
	var root = '<c:out value="${pageContext.request.contextPath}"/>';
	$(document).ready(function() {
		 $('#select-city').change(function() {
			var city = $('#select-city').val();
			location.href = "${root}/apart/select/" + city;
		});
	
		$('#select-gu').change(function() {
			var city = $('#select-city').val();
			var gu = $('#select-gu').val();
			location.href = "${root}/apart/select/" + city+ "/" + gu;
		}); 
		
		Search = function () {
			var city = $('#select-city').val();
			var gu = $('#select-gu').val();
			var dong = $('#select-dong').val();
	    	location.href = "${root}/apart/select/" + city+ "/" + gu + "/" + dong;
		}
	})
</script>
</head>
<body>

	<div align="center">
		<c:if test="${userinfo == null}">
			<%@ include file="/WEB-INF/views/user/login.jsp"%>
		</c:if>
		<c:if test="${userinfo != null}">
			<div class="container content " align="center">
				<%@ include file="/WEB-INF/views/include/header.jsp"%>
			</div>
		</c:if>
	</div>
	<c:if test="${userinfo != null}">
		<header class="masthead text-white text-center houseImg">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-xl-9 mx-auto">
						<h1 class="mb-5 main-title">HAPPY HOUSE</h1>
						<hr class="main-hr">
						<h5 class="mb-5 main-sub">이 아파트는 얼마에 팔렸지? 얼마에 사야 해?</h5>
					</div>
					<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
						<div class="col-lg-12" id="address">
							<select class="custom-select-sm" id="select-city">
								<c:choose>
									<c:when test="${city eq null }"><option selected>시도</option></c:when>
									<c:otherwise><option selected>${city }</option></c:otherwise>
								</c:choose>
								<c:forEach items="${cityList }" var="city">
									<option>${city }</option>
								</c:forEach>
							</select> <select class="custom-select-sm" id="select-gu">
								<c:choose>
									<c:when test="${gu eq null }"><option selected>구군</option></c:when>
									<c:otherwise><option selected>${gu }</option></c:otherwise>
								</c:choose>
								<c:forEach items="${guList }" var="gu">
									<option>${gu }</option>
								</c:forEach>
							</select> <select class="custom-select-sm" id="select-dong">
								<option selected>동</option>
								<c:forEach items="${dongList }" var="dong">
									<option>${dong }</option>
								</c:forEach>
							</select>
							<!-- <div style="margin-top: 10px">
								<input type="button" class="btn-primary btn-sm" id="goService"
									value="검색하기">
							</div> -->
						</div>
						<div>
							<div class="option text-center mt-2 mb-2">
								<a class="btn btn-lg btn-goto" href="javascript:void(0);" onclick="Search();return false;"> 실거래가 지금 보기 👉 </a>
							</div>
						</div> 
					</div>
				</div>
			</div>
		</header>

		<!-- Testimonials -->
		<section class="testimonials text-center bg-light">
			<div class="container">
				<h2 class="mb-5">Happy House에서 제공하는 서비스는...</h2>
				<div class="row">
					<div class="col-lg-4">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<img class="img-fluid rounded-circle mb-3"
								src="img/apartment.jpg" alt="">
							<h5>주택 실거래가 정보 수집</h5>
							<p class="font-weight-light mb-0">"국토교통부 : 실시간 실거래가를 얻어와 화면에
								출력."</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<img class="img-fluid rounded-circle mb-3" src="img/house_1.jpg"
								alt="">
							<h5>주택 실거래가 검색</h5>
							<p class="font-weight-light mb-0">"주택 실거래가 정보를 원하는 검색 정보에 따라
								검색 결과 데이터 제공."</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<img class="img-fluid rounded-circle mb-3" src="img/purchase.jpg"
								alt="">
							<h5>회원 가입 서비스</h5>
							<p class="font-weight-light mb-0">"로그인과 회원정보 조회, 수정 가능!"</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
		
		
		<!-- Footer -->
		<footer class="footer bg-light">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
						<ul class="list-inline mb-2">
							<li class="list-inline-item"><a href="#">About</a></li>
							<li class="list-inline-item">&sdot;</li>
							<li class="list-inline-item"><a href="#">Contact</a></li>
							<li class="list-inline-item">&sdot;</li>
							<li class="list-inline-item"><a href="#">Terms of Use</a></li>
							<li class="list-inline-item">&sdot;</li>
							<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
						</ul>
						<p class="text-muted small mb-4 mb-lg-0">&copy; 2021.05.07 이조순
							양동현 PairPJT.</p>
					</div>
					<div class="col-lg-6 h-100 text-center text-lg-right my-auto">
						<ul class="list-inline mb-0">
							<li class="list-inline-item mr-3"><a href="#"> <i
									class="fab fa-facebook fa-2x fa-fw"></i>
							</a></li>
							<li class="list-inline-item mr-3"><a href="#"> <i
									class="fab fa-twitter-square fa-2x fa-fw"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fab fa-instagram fa-2x fa-fw"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</c:if>

</body>
</html>