<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="./include/head.jsp">
    	<c:param name="pageTitle" value="2024강원바이오엑스포&제2회창업엑스포"/>
    </c:import>
    <body>
	   	<%@include file="./include/header.jsp" %>
   	    <div class="subTop">
	        <p>행사 안내</p>
	        <h2>오시는 길</h2>
	    </div>
	    <div class="subContainer">
	        <div class="subInner">
	            <div class="locationTitle">
	                <p>
	                    <img src="/img/user_img/location.png" alt="">강원 춘천시 송암동 297
	                </p>
	                <span>*행사기간 송암스포츠타운으로 진입하는 관람객 차량 통제가 있을 예정입니다. 임시주차장 이용 후 셔틀버스 탑승 부탁드립니다.</span>
	            </div>
	            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d776bb34a08483e971b1a5e18e0b065&libraries=services"></script>
	            <div class="map" id="map"></div>
	            <ul class="locationTexts">
	                <li>
	                    <p>임시 주차장</p>
	                    <div class="locationList">
	                        <p><span>•</span>중도주차장 (베어스호텔 아래)</p>
	                        <p><span>•</span>수변공원주차장 (베어스호텔 길건너)</p>
	                        <p><span>•</span>케이블카 임시주차장</p>
	                    </div>
	                </li>
	                <li>
	                    <p>셔틀버스 운행</p>
	                    <div class="locationList">
	                        <p><span>•</span>수변공원주차장 ⇆ 케이블카 임시주차장 ⇆ 행사장</p>
	                        <span>* 10분 소요 예상(임시주차장 ~ 행사장)</span>
	                    </div>
	                </li>
	                <li>
	                    <p>시내버스 운행</p>
	                    <div class="locationList">
	                        <p><span>•</span>16번 버스노선 (춘천역 ⇆ 송암스포츠타운 양방향)</p>
	                    </div>
	                </li>
	            </ul>
	        </div>
	    </div>	
	   	<%@include file="./include/footer.jsp" %>
    </body>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng('37.855251660943196', '127.6899523691818'), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng('37.855251660943196', '127.6899523691818'); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		
		map.setDraggable(false);
		map.setZoomable(false)
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	
		var iwContent = '<div style="line-height:25px;width:250px; text-align:center">' + '강원 춘천시 송암동 297' +'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent
		});
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});
	</script>
</html>
