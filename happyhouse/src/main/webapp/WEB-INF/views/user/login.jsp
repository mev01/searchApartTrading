<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse|로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/happyhouse.css" />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {
			
			if($("#userid").val() == "") {
				alert("아이디 입력!!!");
				return;
			} else if($("#userpwd").val() == "") {
				alert("비밀번호 입력!!!");
				return;
			} else {
				$("#loginform").attr("action", "${root}/user/login").submit();
			}
		});
		
	 	$('#mvRegisterBtn').click(function() {
			$(location).attr("href", "${root}/user/join");
		}); 
	 	
	 	$('#findPwBtn').click(function() {
	 		$(location).attr("href", "${root}/user/searchPW");
		}); 
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Masthead -->
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
			<div class="col-lg-6 loginBoxBg" align="center">
				<h3 class="pt-4 pb-2">로그인</h3>
				<div class="inputForm">
					<form id="loginform" method="post" action="">
						<input type="hidden" name="act" id="act" value="login">
						<div class="form-group" align="left">
							<label for="">아이디</label> <input type="text" class="form-control" id="userid" name="userid" placeholder="" value="${saveid}">
						</div>
						<div class="form-group" align="left">
							<label for="">비밀번호</label>
							<input type="password"	class="form-control" id="userpwd" name="userpwd" placeholder="" onkeydown="javascript:if(event.keyCode == 13) {login();}">
						</div>
						<div class="form-group form-check" align="right">
							<label class="form-check-label"> <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok" ${idck}> 아이디저장
							</label>
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-info" id="loginBtn">로그인</button>
							<button type="button" class="btn btn-primary" id="mvRegisterBtn">회원가입</button>
							<button type="button" class="btn btn-primary" id="findPwBtn">비밀번호찾기</button>
						</div>
						<div>
							<c:if test="${userinfo == null}">
								<div class="msg">
									<Strong>${msg}</Strong>
								</div>
							</c:if>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	
</body>
</html>
