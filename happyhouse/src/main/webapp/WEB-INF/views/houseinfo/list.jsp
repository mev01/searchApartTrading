<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="houseInfo" value="${houseInfo}" />
<c:set var="houseDealList" value="${houseDealList}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse|실거래가 검색</title>
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
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAHuS3QzpixOgCb9AOfb9yE7ITxgVmigs&callback=initMap&libraries=&v=weekly"></script>
	
<link rel="stylesheet" href="./css/happyhouse.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9bf0d7936418891b021d9471ec64035f"></script> -->
<!--  <script src="./js/kakaomap.js"></script>-->


<style>
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	
	#map {
		width: 500px;
		height: 500px;
		float: left;
	}
	
	#apartinfo {
		width: 500px;
		height: 500px;
		display: inline;
		float: left;
		overflow: scroll;
	}
</style>
<script type="text/javascript">

	

	function movewrite() {
		location.href = "${root}/main.do?act=mvlogin";
	}
	function searchApart() {
		if (document.getElementById("word").value == "") {
			alert("모든 목록 조회!!");
		}
		document.getElementById("searchform").action = "${root}/main.do";
		document.getElementById("searchform").submit();
	}
	function searchall() {
		location.href = "${root}/main.do?act=list&key=&word=";
	}
	function interestList() {

	}
	
	window.onload = function() {
			
			var marker, i;
			var mapLat = '<c:out value="${baseAddress.getLat() }"/>';
			var mapLng = '<c:out value="${baseAddress.getLng() }"/>';
			houseDealList = new Array();
			
			<c:forEach items="${houseDealList}" var="item1">
				var house = {
						aptNAme : "${item1.aptNAme}",
						dealAmount : "${item1.dealAmount}",
						dealYear : "${item1.dealYear}",
						dealMonth : "${item1.dealMonth}",
						dealDay : "${item1.dealDay}",
						lat : "${item1.lat}",
						lng : "${item1.lng}"
				}
				houseDealList.push(house);
			</c:forEach>
	
			(function initMap() {
				map = new google.maps.Map(document.getElementById("map"), {
					center : {
						lat : Number(mapLat),
						lng : Number(mapLng)
					},
					zoom : 16
				});
			})();
	 
			console.log(houseDealList.length);
			for (var i = 0; i < houseDealList.length; i++) {
				
				(function(i) {
					console.log(houseDealList[i]);
			        
		 	        var marker;
					marker = new google.maps.Marker({
						position: {lat: Number(houseDealList[i].lat), lng: Number(houseDealList[i].lng)},
						map: map,
					});
					google.maps.event.addListener(marker, 'click', function() {
						map.setCenter(this.getPosition());
						map.setZoom(17);
						var idx = i; 
						console.log(idx);
						
						$(".apart").each(function() {
							if($(this).find(".apartname").text() !== '아파트이름 : '+houseDealList[i].aptNAme){
								$(this).hide();
							}
							else{
								$(this).show();
							}
						});
						var infowindow = new google.maps.InfoWindow({
							content: houseDealList[i].aptNAme
						});
						infowindow.open(map, this);
					});
				})(i);
			}
			
			
		}
</script>
</head>
<body>
	<div class="container-fluid list_houseImg" align="center">

		<div class="container">
			<%@ include file="/WEB-INF/views/include/header.jsp"%>
		</div>
		<div class="col" align="center">
			<div class="col-8 listcontent col-pb-90px" align="center">
				<div class="tlteinfo">
					<h1>아파트 실거래가 검색</h1>
					<h1>아파트 실거래가 검색</h1>
					<h5>동 별, 이름 별 아파트 정보를 찾아볼 수 있습니다.</h5>
				</div>

			</div>
		</div>
	</div>
	
	<div class="col" align="center">
		<div class="col-8" align="center">
			<form id="searchform" method="get" class="form-inline"
				onsubmit=""; return false;">
				 <input type="hidden" name="act" id="act" value="list"> 
				
				<%-- <table class="table table-borderless">
					<tr>
						<td align="right">
						<select class="form-control" name="key" id="key" >
								<option value="dong" selected="selected" >동별실거래가</option>
								<option value="aptName">아파트이름별로실거래가</option>
								<option value="dongavg">동별 평균 매매가</option>
						</select> 
							<input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
							
							<button type="submit" class="btn btn-primary" id="searchBtn">검색</button>
							 <input type="hidden" id="lat" name="lat" value="${lat}">
							<input type="hidden" id="lng" name="lng"  value="${lng}">
							<button type="button" class="btn btn-primary" onclick="javascript:searchall();">초기화</button></td>  
							<ul id="placesList"></ul>
        					<div id="pagination"></div>
        					
					</tr>
				</table> --%>
			</form>
		
		
			<!-- 아파트 정보 -->
			<div class="mb-4" id="apartinfo">거래 정보
				<c:if test="${fn:length(houseDealList) != 0}">
					<c:forEach var="house" items="${houseDealList}">
						<div class = "apart">
							<hr>
							<div class = "apartname">아파트이름 : ${house.getAptNAme()}</div>
							<div class = "cost">거래 금액: ${house.getDealAmount()}</div>
							<div class = "date">날짜: ${house.getDealYear()}</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(houseDealList) == 0}">
					<div>
						거래내역이 없습니다.
					</div>
				</c:if>
			</div>
			
			<!-- Image Header -->
			<div class="img-fluid rounded mb-4" id="map"></div>
		</div>
	</div>

</body>
</html>
