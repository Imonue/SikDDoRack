<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import = "Database.*"
    import = "Infomation.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5666e7f4eccb32175e7a969a96083b69"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new kakao.maps.LatLng(<%=Map.instance.getInit_lati()%>, <%=Map.instance.getInit_longi()%>), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

var makers = [];
var iwContent
// ��Ŀ�� ǥ���� ��ġ�Դϴ� 
<%
for(int i = 0; i < DB.instance.GetStoCount(); i++){
	
%>
	var position =  new kakao.maps.LatLng(<%=DB.instance.getStoreList().get(i).getSto_lati()%>,<%=DB.instance.getStoreList().get(i).getSto_longi()%>);

	// ��Ŀ�� �����մϴ�
	makers[<%=i%>] = new kakao.maps.Marker({
	  position: position,
	  clickable: true // ��Ŀ�� Ŭ������ �� ������ Ŭ�� �̺�Ʈ�� �߻����� �ʵ��� �����մϴ�
	});
	
	// �Ʒ� �ڵ�� ���� ��Ŀ�� �����ϴ� �ڵ忡�� clickable: true �� ����
	// ��Ŀ�� Ŭ������ �� ������ Ŭ�� �̺�Ʈ�� �߻����� �ʵ��� �����մϴ�
	// marker.setClickable(true);
	
	// ��Ŀ�� ������ ǥ���մϴ�.
	makers[<%=i%>].setMap(map);

	
	// ��Ŀ�� Ŭ������ �� ��Ŀ ���� ǥ���� ���������츦 �����մϴ�
	var iwContent = "<a href ='../Frame/Customer_Frame.jsp' target = '_parent'>�����ϱ�</a>", // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
	    iwRemoveable = true; // removeable �Ӽ��� ture �� �����ϸ� ���������츦 ���� �� �ִ� x��ư�� ǥ�õ˴ϴ�
	
	// ���������츦 �����մϴ�
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	
	// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
	kakao.maps.event.addListener(makers[<%=i%>], 'click', function() {
	      // ��Ŀ ���� ���������츦 ǥ���մϴ�
	      infowindow.open(map, makers[<%=i%>]);  
	});
<%
}
%>
	
</script>
</body>
</html>