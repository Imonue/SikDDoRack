<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "Database.*"
    import = "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
.category .ico_caffe {background-position:-10px 0;}  
.category .ico_food {background-position:-10px -36px;}   
.category .ico_pc {background-position:-10px -72px;} 
</style>
</head>
<body>
<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:100%;height:830px;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="caffeMenu" onclick="changeMarker('카페')">
                <span class="ico_comm ico_caffe"></span>
                카페
            </li>
            <li id="foodMenu" onclick="changeMarker('음식점')">
                <span class="ico_comm ico_food"></span>
                음식점
            </li>
            <li id="pcMenu" onclick="changeMarker('PC방')">
                <span class="ico_comm ico_pc"></span>
           PC방
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5666e7f4eccb32175e7a969a96083b69"></script>
<script>

<%
Thread.sleep(500);
request.setCharacterEncoding("UTF-8");

String stoname = request.getParameter("_sto_name");
String stotype = request.getParameter("_sto_type");

if(stoname == null || stotype == null)
{
	stotype = "음식점";
	Map.instance.setLati(Map.instance.getInit_lati());
	Map.instance.setLongi(Map.instance.getInit_longi());
}
else{
	Map.instance.setLati(DB.instance.GetStoLati(stoname));
	Map.instance.setLongi(DB.instance.GetStoLongi(stoname));
}

%>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(<%=Map.instance.getLati()%>, <%=Map.instance.getLongi()%>), // 지도의 중심좌표
        level:2// 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


var foodPosition = new Array();
var caffePosition = new Array();
var pcPosition = new Array();
<%
int foodIndex = 0;
int caffeIndex = 0;
int pcIndex = 0;
String sto_name;
for(int i = 0; i < DB.instance.GetStoCount(); i++){
	if(DB.instance.getStoreList().get(i).getSto_type().equals("음식점"))
	{
		sto_name = DB.instance.getStoreList().get(i).getSto_name();
		//System.out.println("음식점 위도 경도 lati : " + DB.instance.getStoreList().get(i).getSto_lati() + " longi : " + DB.instance.getStoreList().get(i).getSto_longi());
%>
		foodPosition[<%=foodIndex%>] = {content: "<%=DB.instance.getStoreList().get(i).getSto_name()%><p>전체 테이블 : <%=DB.instance.getStoreList().get(i).getSto_max_table()%><p>현재 테이블 : <%=DB.instance.getStoreList().get(i).getSto_now_table()%><p><a href='../Frame/Customer_Frame.jsp?_sto_name=<%=sto_name %>' target='_parent'>예약하기</a>", latlng: new kakao.maps.LatLng(<%=DB.instance.getStoreList().get(i).getSto_lati()%>,<%=DB.instance.getStoreList().get(i).getSto_longi()%>)};
<%
		foodIndex++;
	}
}
for(int i = 0; i < DB.instance.GetStoCount(); i++){
	if(DB.instance.getStoreList().get(i).getSto_type().equals("카페"))
	{		
		//System.out.println("카페 위도 경도 lati : " + DB.instance.getStoreList().get(i).getSto_lati() + " longi : " + DB.instance.getStoreList().get(i).getSto_longi());
%>
		caffePosition[<%=caffeIndex%>] = {content: "<a href='../Frame/Customer_Frame.jsp' target='_parent'>예약하기</a>", latlng: new kakao.maps.LatLng(<%=DB.instance.getStoreList().get(i).getSto_lati()%>,<%=DB.instance.getStoreList().get(i).getSto_longi()%>)};
<%
		caffeIndex++;
	}
}
for(int i = 0; i < DB.instance.GetStoCount(); i++){
	if(DB.instance.getStoreList().get(i).getSto_type().equals("PC방"))
	{		
		//System.out.println("PC방 위도 경도 lati : " + DB.instance.getStoreList().get(i).getSto_lati() + " longi : " + DB.instance.getStoreList().get(i).getSto_longi());
%>
		pcPosition[<%=pcIndex%>] = {content: "<a href='../Frame/Customer_Frame.jsp' target='_parent'>예약하기</a>", latlng: new kakao.maps.LatLng(<%=DB.instance.getStoreList().get(i).getSto_lati()%>,<%=DB.instance.getStoreList().get(i).getSto_longi()%>)};
<%
		pcIndex++;
	}
}
%>


var markerImageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
caffeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
foodMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
pcMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

createCaffeMarkers();
createFoodMarkers();
createPCMarkers();


changeMarker('<%=stotype%>');


//마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;            
}

//좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image, content) {
    var marker = new kakao.maps.Marker({
        position: position,
        clickable: true,
        image: image
    });
    
    var iwContent = content, iwRemoveable = true;
    
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    }); 
    //////////////////////////////////////////////////////////////////////////////////////////////////
    var maplatlng = new kakao.maps.LatLng(<%=Map.instance.getLati()%>,<%=Map.instance.getLongi()%>);
    if(maplatlng.equals(position))
    {
    	infowindow.open(map, marker); 
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커 위에 인포윈도우를 표시합니다
	        infowindow.open(map, marker); 
	        //스토어 이름 저장
	        //
	  });
    }
    else{
   
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커 위에 인포윈도우를 표시합니다
	        infowindow.open(map, marker); 
	        //스토어 이름 저장
	        //
	  });
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////
    return marker;  
}

//커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function createCaffeMarkers() {
    
    for (var i = 0; i < caffePosition.length; i++) {  
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
        var position = caffePosition[i].latlng;
        var content = caffePosition[i].content;
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(position, markerImage, content);  
        <%
			System.out.println("카페 마커 생성");
		%>
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        caffeMarkers.push(marker);
    }     
}

//커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCaffeMarkers(map) {        
    for (var i = 0; i < caffeMarkers.length; i++) {  
    	caffeMarkers[i].setMap(map);
    }        
}

//식당 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
function createFoodMarkers() {
    for (var i = 0; i < foodPosition.length; i++) {
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 36),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        var position = foodPosition[i].latlng;
        var content = foodPosition[i].content;
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(position, markerImage, content);  

        // 생성된 마커를 편의점 마커 배열에 추가합니다
        <%
  			System.out.println("음식점 마커 생성");
    	%>
        foodMarkers.push(marker);    
    }        
}

//식당 마커들의 지도 표시 여부를 설정하는 함수입니다
function setFoodMarkers(map) {        
    for (var i = 0; i < foodMarkers.length; i++) {
    	foodMarkers[i].setMap(map);
    }        
}

//주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
function createPCMarkers() {
    for (var i = 0; i < pcPosition.length; i++) {
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 72),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(pcPosition[i].latlng, markerImage);  

        // 생성된 마커를 주차장 마커 배열에 추가합니다
        pcMarkers.push(marker);        
    }                
}

// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
function setPCMarkers(map) {        
    for (var i = 0; i < pcMarkers.length; i++) {  
    	pcMarkers[i].setMap(map);
    }        
}
//카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    
    var caffeMenu = document.getElementById('caffeMenu');
    var foodMenu = document.getElementById('foodMenu');
    var pcMenu = document.getElementById('pcMenu');
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === '카페') {
    
        // 커피숍 카테고리를 선택된 스타일로 변경하고
        caffeMenu.className = 'menu_selected';
        
        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        foodMenu.className = '';
        pcMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setCaffeMarkers(map);
        setFoodMarkers(null);
        setPCMarkers(null);
        
    } else if (type === '음식점') { // 편의점 카테고리가 클릭됐을 때
    
        // 편의점 카테고리를 선택된 스타일로 변경하고
        caffeMenu.className = '';
        foodMenu.className = 'menu_selected';
        pcMenu.className = '';
        
        // 편의점 마커들만 지도에 표시하도록 설정합니다
        setCaffeMarkers(null);
        setFoodMarkers(map);
        setPCMarkers(null);
        
    } else if (type === 'PC방') { // 주차장 카테고리가 클릭됐을 때
     
        // 주차장 카테고리를 선택된 스타일로 변경하고
        caffeMenu.className = '';
        foodMenu.className = '';
        pcMenu.className = 'menu_selected';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        setCaffeMarkers(null);
        setFoodMarkers(null);
        setPCMarkers(map);  
    }    
}


</script>
</body>
</html>