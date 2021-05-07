<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/main.do" />
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse|회원 정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/happyhouse.css" />
<script type="text/javascript">
	$(document).ready(function() {
		  $("#modifyBtn").click(function() {
				if($("#password").val() == "") {
					alert("바뀐 비밀번호입력");
					return;
				} else {
					$("#modifyform").attr("action", "${root}/user/modifypassword").submit();
				}
			});
		  
		  $("#deleteBtn").click(function() {
					$("#deleteForm").attr("action", "${root}/user/delete").submit();
			});
		});
	
	function cancelModify() {
		history.back();
	}

	function deleteMem() {
		document.getElementById("deleteForm").action = "${root}/main.do";
		document.getElementById("deleteForm").submit();
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<header class="masthead text-white text-center houseImg">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-9 mx-auto">
					<h1 class="mb-5 main-title">HAPPY HOUSE</h1>
					<hr class="main-hr">
				</div>
			</div>
		</div>
		<div class="container" align="center">
			<div class="col-lg-6 modifyBoxBg" align="center">
				<h2 class="mt-4">회원정보변경</h2>
				<form id="modifyform" method="post" action="">
					<input type="hidden" class="form-control" id="userid" name="userid" value="${member.userid}">
					
					<div class="form-group" align="left">
						<label for="password">비밀번호변경: </label>
						 <input type="text" class="form-control" id="userpwd" name="userpwd" value="${member.userpwd}">
					</div>
					<div class="form-group" align="left">
						<label for="email">이메일변경: </label>
						 <input type="text" class="form-control" id="email" name="email" value="${member.email}">
					</div>
					
					<div class="form-group" align="left">
						<label for="address">주소 변경: </label>
						 <input type="text" class="form-control" id="address" name="address" value="${member.address}">
					</div>
					<button type="button" class="btn btn-info" id="modifyBtn">수정</button>
					<button type="button" class="btn btn-light" onclick="javascript:cancelModify();">취소</button>
				</form>
				<br>
				<h2 class="mt-4">회원탈퇴</h2>
				<form id="deleteForm" method="post" action="">
					<input type="hidden" name="delete" id="delete" value="delete"> 
					<input type="hidden" class="form-control" id="userid" name="userid" value="${member.userid}">
					<button type="button" class="btn btn-secondary" id="deleteBtn">탈퇴</button>
				</form>
			</div>
		</div>		
	</header>
	
	<section class="testimonials text-center bg-light" style="padding-top:230px">
			<div class="container">
				<h2 class="mb-5">Happy House에서 제공하는 서비스는...</h2>
				<div class="row">
					<div class="col-lg-4">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<img class="img-fluid rounded-circle mb-3"
								src="../img/apartment.jpg" alt="">
							<h5>주택 실거래가 정보 수집</h5>
							<p class="font-weight-light mb-0">"국토교통부 : 실시간 실거래가를 얻어와 화면에 출력."</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<img class="img-fluid rounded-circle mb-3" src="../img/house_1.jpg" alt="">
							<h5>주택 실거래가 검색</h5>
							<p class="font-weight-light mb-0">"주택 실거래가 정보를 원하는 검색 정보에 따라 검색 결과 데이터 제공."</p>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<img class="img-fluid rounded-circle mb-3" src="../img/purchase.jpg" alt="">
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
		
		</html>
		</c:if>
</body>


	
