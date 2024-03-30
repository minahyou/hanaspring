<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    #geo2 > #map{
        width:500px;
        height: 400px;
        border:2px solid red;
    }
</style>
<script>
    let geo2 = {
        //initialize
        map: null,
        loc: ['s','b','j'],
        init: function (){
            //화살표함수는 선언한 객체가 OWNER
            $('#btn_s').click(()=> {
                this.go(37.5447611,127.0564625);
            });
            $('#btn_b').click(()=> {
                this.go(35.1290483,129.0446982);
            });
            $('#btn_j').click(()=> {
                this.go(33.3846216,126.5534925);
            });
            this.mapdisplay();
        },
        //mpa 객체 생성
        mapdisplay: function (){
            <%--$.ajax({--%>
            <%--    url: '<c:url value="/geo/getdata1"/>',--%>
            <%--    data: {'lat': lat},--%>
            <%--    success: function () {--%>
            <%--        alert(data)--%>
            <%--    }--%>
            <%--});--%>
            // $(data).each(function (index, item){
            //     if(item == 's'){
            var position = [{'lat':37.5447611, 'lng':127.0564625},
                {'lat':35.1290483 , 'lng':129.0446982},
                {'lat':33.3846216 , 'lng':126.5534925}
            ]
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(position[0].lat, position[0].lng), // 지도의 중심좌표
                    level: 8 // 지도의 확대 레벨
                }

                geo2.map = new kakao.maps.Map(mapContainer, mapOption);

            $(position).each(function (index, item){
                var market_position = new kakao.maps.LatLng(item.lat, item.lng);
                var marker = new kakao.maps.Marker({
                    position: market_position
                });
                marker.setMap(geo2.map);
            });
            this.getgeodata(geo2.loc);
            },
        //이동
        go: function (lat, lng){
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            this.map.panTo(moveLatLon);
        },
        //이동하는 지역의 데이터를 가지고 온다.
        // loc(s, b, j)
        getgeodata: function(loc) {
            // AJAX 요청을 보낼 URL 설정
            $(loc).each(function (index, item){
                var url;
                if (item.includes('s')) {
                    url = '<c:url value="/geo/getdata3"/>';
                } else if (item.includes('b')) {
                    url = '<c:url value="/geo/getdata2"/>';
                } else if (item.includes('j')) {
                    url = '<c:url value="/geo/getdata4"/>';
                }

                // AJAX 요청 보내기
                $.ajax({
                    url: url,
                    success: function(datas) {
                        geo2.display(datas);
                    }
                });
            })
        },
        display:function(datas){
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png';
            $(datas).each(function(index, item){
                // marker 생성
                // window 생성
                // event
                var imageSize = new kakao.maps.Size(30, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                var marketPosition = new kakao.maps.LatLng(item.lat,item.lng);
                var marker = new kakao.maps.Marker({
                    map: geo2.map,
                    position: marketPosition,
                    title:item.title,
                    image: markerImage
                });
                // infowindow
                var infoContent = '<h2>'+item.title+'</h2>';
                infoContent += '<img style="width:180px;"  src="<c:url value="/img/'+item.img+'"/>">';

                var infowindow = new kakao.maps.InfoWindow({
                    content : infoContent,
                    position: marketPosition
                });

                kakao.maps.event.addListener(marker, 'mouseover',mouseoverHandler(marker,infowindow));
                kakao.maps.event.addListener(marker, 'mouseout',mouseoutHandler(marker,infowindow));
                kakao.maps.event.addListener(marker, 'click',mouseclickHandler(item.id));

                function mouseoverHandler(marker,infowindow){
                    return function(){
                        infowindow.open(geo2.map, marker);
                    };
                }

                function mouseoutHandler(marker,infowindow){
                    return function(){
                        infowindow.close();
                    };
                }

                function mouseclickHandler(target){
                    return function(){
                        location.href='<c:url value="/geo/shopdetail?shopid='+target+'" />';
                    };
                }

            });
        }
    };
    $(function (){
        geo2.init();
    });
</script>
<div class="container" id = "geo2">
    <h2>GEO2 Page</h2>
    <div id="map"></div>
    <button id = "btn_s" type="button" class="btn btn-primary">Seoul</button>
    <button id = "btn_b" type="button" class="btn btn-primary">Busan</button>
    <button id = "btn_j" type="button" class="btn btn-primary">Jeju</button>
</div>