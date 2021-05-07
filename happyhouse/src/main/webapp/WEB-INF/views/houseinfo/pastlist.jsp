<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />


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
				
				<table class="table table-borderless">
					<tr>
						<td align="right">
						<select class="form-control" name="key" id="key" >
								<option value="dong" selected="selected" >동별실거래가</option>
								<option value="aptName">아파트이름별로실거래가</option>
								<option value="dongavg">동별 평균 매매가</option>
						</select> 
							<input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
							
							<button type="submit" class="btn btn-primary" onclick="javascript:searchPlaces();">검색</button>
							 <input type="hidden" id="lat" name="lat" value="${lat}">
							<input type="hidden" id="lng" name="lng"  value="${lng}">
							<button type="button" class="btn btn-primary" onclick="javascript:searchall();">초기화</button></td>  
							<ul id="placesList"></ul>
        					<div id="pagination"></div>
        					
					</tr>
				</table>
			</form>
		</div>


	</div>
	<div align="center">
		
		 <!-- <div id="map" style="width: 800px; height: 400px;"></div> -->
		 <div id="map" style="width:800px;height:400px;position:relative;overflow:hidden;"></div>
	</div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9bf0d7936418891b021d9471ec64035f&libraries=services"></script>
			<script>
				var markers = [];

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				var map = new kakao.maps.Map(mapContainer, mapOption);
				var ps = new kakao.maps.services.Places();

				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});

				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {
					
					var keyword = document.getElementById('word').value;

					// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
					ps.keywordSearch(keyword, placesSearchCB);
				}

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					

					if (status === kakao.maps.services.Status.OK) {
						
						displayPlaces(data);

						displayPagination(pagination);
					} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

						alert('검색 결과가 존재하지 않습니다.');
						return;

					} else {

						alert('검색 결과 중 오류가 발생했습니다.');
						return;

					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayPlaces(places) {
					
					var listEl = document.getElementById('placesList'), 
					menuEl = document.getElementById('menu_wrap'),
					fragment = document.createDocumentFragment(), 
					bounds = new kakao.maps.LatLngBounds(), 
					listStr = '';
					
					// 검색 결과 목록에 추가된 항목들을 제거합니다
					//removeAllChildNods(listEl);

					// 지도에 표시되고 있는 마커를 제거합니다
					//removeMarker();
					
					for (var i = 0; i < places.length; i++) {

						// 마커를 생성하고 지도에 표시합니다
						var placePosition = new kakao.maps.LatLng(places[i].y,
								places[i].x), marker = addMarker(placePosition,
								i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(placePosition);

						// 마커와 검색결과 항목에 mouseover 했을때
						// 해당 장소에 인포윈도우에 장소명을 표시합니다
						// mouseout 했을 때는 인포윈도우를 닫습니다
						(function(marker, title) {
							kakao.maps.event.addListener(marker, 'mouseover',
									function() {
										displayInfowindow(marker, title);
									});

							kakao.maps.event.addListener(marker, 'mouseout',
									function() {
										infowindow.close();
									});

							itemEl.onmouseover = function() {
								displayInfowindow(marker, title);
							};

							itemEl.onmouseout = function() {
								infowindow.close();
							};
						})(marker, places[i].place_name);

						fragment.appendChild(itemEl);
					}
					

					// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
					listEl.appendChild(fragment);
					menuEl.scrollTop = 0;
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    document.getElementById('lng').value="36";
				    document.getElementById('lat').value="126.8";
				    
					map.setBounds(bounds);
					mapOption = {
							center : new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};
						var map = new kakao.maps.Map(mapContainer, mapOption);
						var ps = new kakao.maps.services.Places();

						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1
						});
					searchApart();
				}

				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(index, places) {

					var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
							+ (index + 1)
							+ '"></span>'
							+ '<div class="info">'
							+ '   <h5>' + places.place_name + '</h5>';

					if (places.road_address_name) {
						itemStr += '    <span>' + places.road_address_name
								+ '</span>' + '   <span class="jibun gray">'
								+ places.address_name + '</span>';
					} else {
						itemStr += '    <span>' + places.address_name
								+ '</span>';
					}

					itemStr += '  <span class="tel">' + places.phone
							+ '</span>' + '</div>';

					el.innerHTML = itemStr;
					el.className = 'item';

					return el;
				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
					var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
					imgOptions = {
						spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset : new kakao.maps.Point(13, 37)
					// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize, imgOptions), marker = new kakao.maps.Marker(
							{
								position : position, // 마커의 위치
								image : markerImage
							});

					marker.setMap(map); // 지도 위에 마커를 표출합니다
					markers.push(marker); // 배열에 생성된 마커를 추가합니다

					return marker;
				}

				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
					markers = [];
				}

				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
					var paginationEl = document.getElementById('pagination'), fragment = document
							.createDocumentFragment(), i;

					// 기존에 추가된 페이지번호를 삭제합니다
					while (paginationEl.hasChildNodes()) {
						paginationEl.removeChild(paginationEl.lastChild);
					}

					for (i = 1; i <= pagination.last; i++) {
						var el = document.createElement('a');
						el.href = "#";
						el.innerHTML = i;

						if (i === pagination.current) {
							el.className = 'on';
						} else {
							el.onclick = (function(i) {
								return function() {
									pagination.gotoPage(i);
								}
							})(i);
						}

						fragment.appendChild(el);
					}
					paginationEl.appendChild(fragment);
				}

				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
				// 인포윈도우에 장소명을 표시합니다
				function displayInfowindow(marker, title) {
					var content = '<div style="padding:5px;z-index:1;">'
							+ title + '</div>';

					infowindow.setContent(content);
					infowindow.open(map, marker);
				}

				// 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {
					while (el.hasChildNodes()) {
						el.removeChild(el.lastChild);
					}
				}
				
			</script>
		
	

	<br>
	<br>
	<div align="center">
		<div class="container col-4 listml float-left">

			<div class="scrolltable">
				<h1>검색결과</h1>
				<c:if test="${aparts.size() != 0}">
					<c:forEach var="apart" items="${aparts}" begin="0" end="1000">
						<table class="table">
							<tbody>

								<tr>
									<th colspan="2"><strong>${apart.no}.${apart.dong}</strong></th>
								</tr>
								<tr>
									<td colspan="2"><i class="far fa-building"></i>
										${apart.aptName}<br> <i class="fas fa-comment-dollar"></i>
										${apart.dealAmount}</td>
								</tr>

							</tbody>
						</table>
					</c:forEach>
				</c:if>
			</div>
		</div>

		<div class="container col-4 listml float-left">
			<div class="scrolltable">
				<h1>관심도순</h1>
				<c:if test="${interestings.size() != 0}">
					<c:forEach var="interesting" items="${interestings}" begin="0"
						end="1000">
						<table class="table">
							<tbody>

								<tr>
									<th colspan="2"><strong>${interesting.no}.${interesting.dong}</strong></th>
								</tr>
								<tr>
									<td colspan="2"><i class="far fa-building"></i>
										${interesting.aptName}<br> <i
										class="fas fa-comment-dollar"></i> ${interesting.interesting}</td>
								</tr>

							</tbody>
						</table>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>


	<c:if test="${aparts.size() == 0}">
		<table class="table table-active">
			<tbody>
				<tr class="table-info" align="center">
					<td>작성된 글이 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</c:if>

</body>
</html>
