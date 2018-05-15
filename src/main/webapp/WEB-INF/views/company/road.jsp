<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<%-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=${apiKey}&libraries=services"></script> --%>
<%-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey}"></script> --%>
<script type="text/javascript">
	
	var key = '${apiKey}';
	$(document).ready(function(){
		//roadMap();
		//alert(key);
	});
	
	function roadMap(){
		var container = document.getElementById('map');
		var options = {
			//center: new daum.maps.LatLng(33.450701, 126.570667),
			center: new daum.maps.LatLng(37.64451, 127.02913),
			level: 4
		};
		
		// 지도를 생성 한다
		var map = new daum.maps.Map(container, options);
/* 			
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.64451, 127.02913), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
	
		var content = '<div class =""><span class=""></span><span class="">wiart</span><span class=""></span></div>';
		
		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new daum.maps.LatLng(37.64451, 127.02913);  

		// 커스텀 오버레이를 생성합니다
		var customOverlay = new daum.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 1 
		});
		
		// 커스텀 오버레이를 지도에 표시합니다
		customOverlay.setMap(map);
		 */
	}
</script>
<%@ include file="/WEB-INF/views/layout/header/header.jsp" %>


<!-- <div id="map" style="width:700px;height:500px;"></div> -->


<div class="container">
    <section>	
	<div class="well well-sm">
		<div id="map" style="width:100% ;height:500px;"></div>
	
	</div>
    </section>
</div> 	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey}"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.64451, 127.02913),
			level: 4
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.64451, 127.02913); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;"> WIART<br><a href="http://map.daum.net/link/map/wiart,37.64451,127.02913" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/wiart,37.64451,127.02913" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new daum.maps.LatLng(37.64451, 127.02913); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 		
/* 		
		//마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.64451, 127.02913), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
		var content = '<div class =""><span class=""></span><span class="">WIART</span><span class=""></span></div>';
		
		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new daum.maps.LatLng(37.64451, 127.02913);  

		// 커스텀 오버레이를 생성합니다
		var customOverlay = new daum.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 1 
		});
		
		// 커스텀 오버레이를 지도에 표시합니다
		customOverlay.setMap(map);
		 */
		
	</script>
<%@ include file="/WEB-INF/views/layout/footer/footer.jsp" %>
