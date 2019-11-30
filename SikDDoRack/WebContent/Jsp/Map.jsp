<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- �̹��� ������ ǥ���� div �Դϴ� -->
<div id="staticMap" style="width:600px;height:350px;"></div>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5666e7f4eccb32175e7a969a96083b69"></script>
<script>    
// �̹��� ������ ǥ���� ��Ŀ�Դϴ�
// �̹��� ������ ǥ���� ��Ŀ�� �Ʒ��� ���� �迭�� �־��ָ� �������� ��Ŀ�� ǥ���� �� �ֽ��ϴ� 
var markers = [
    {
        position: new kakao.maps.LatLng(33.450701, 126.570667)
    },
    {
        position: new kakao.maps.LatLng(33.450001, 126.570467), 
        text: '�ؽ�Ʈ�� ǥ���� �� �־��!' // text �ɼ��� �����ϸ� ��Ŀ ���� �ؽ�Ʈ�� �Բ� ǥ���� �� �ֽ��ϴ�     
    }
];

var staticMapContainer  = document.getElementById('staticMap'), // �̹��� ������ ǥ���� div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // �̹��� ������ �߽���ǥ
        level: 3, // �̹��� ������ Ȯ�� ����
        marker: markers // �̹��� ������ ǥ���� ��Ŀ 
    };    

// �̹��� ������ �����մϴ�
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</body>
</html>