<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=1)" />
<meta http-equiv="Page-Exit" content="blendTrans(Duration=1)" />
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" href="${cpath}/resources/css/market.css">
<style>
#MyCan{
max-width: 200px; 
max-height: 200px;
object-fit: contain;
}
</style>
</head>
<body>
<script type="text/javascript">
$('input[id=i_idx]'),attr('value','1')
</script>
	<div class="img">
		<!-- 상단 메뉴바 -->
		<div class="top">
			<h1>FARM & FARM</h1>
			<div class="menu">
				<ul id="nav">
					<li><a href="${pageContext.request.contextPath}/Market">마켓</a></li>
					<li><a href="6-2.html">기업정보</a>
						<ul>
							<li><a href="#">기업리스트</a></li>
							<li><a href="#">기업등록</a></li>
						</ul></li>
					<li><a href="#">마이페이지</a>
						<ul>
							<li><a href="memberInfo.html">회원정보 수정</a></li>
							<li><a href="${pageContext.request.contextPath}/product">물품등록</a></li>
						</ul></li>
					<li><a href="${cpath}/logout.do"
								onclick="alert('로그아웃 하시겠습니까?')">로그아웃</a></li>
				</ul>
			</div>
		</div>

		<div class="footer">
			<p>주)구매하겠조 남구 송암로 60, 2층</p>
		</div>
	</div>
	
	<!-- 이미지등록 -->
	<p><input type="file" accept="image/*" name="image" id="file" style="display: none;"></p>
    <p><label for="file" style="cursor: pointer;">Upload Image</label></p>
    <p><canvas id="MyCan" width="150px" height="150px"></canvas></p>
	
	    <script>
        
	    document.getElementById("file").oninput = async (evt) => {
            try {
                // input event로부터 file가져오기
                const file = evt.target.files[0];

                // file을 bitmap image로 변환
                const bitmap = await createImageBitmap(file);

                // Canvas DOM 선택
                const canvas = document.getElementById("MyCan");
                // canvas크기를 image크기로 변환
                canvas.width = bitmap.width;
                canvas.height = bitmap.height;
                
                // ctx -> 펜, 2d그림으로 그려주겠다
                const ctx = canvas.getContext("2d");
                
                // bitmap이미지를 canvas에 그려주기
                ctx.drawImage(bitmap, 0, 0);

                // toDataURL --> base64라는 인코딩 방식으로 image를 변환
                // ("image/*") --> image파일 전부 허용
                var b64 = canvas.toDataURL("image/*")
                console.log(b64);
                // post방식으로 보낼것
                sendData(b64)
                
            }
            catch (err) {
                console.error(err);
            }
        };
        
        let requestURL = "http://localhost:5000/sendFrame";
        function sendData(data){
        	const xhr = new XMLHttpRequest();
            xhr.open('POST', requestURL);
            xhr.onload = () => {
              console.log(xhr.response); // 응답 메세지
            };
            xhr.send(data);
        }
    </script>
	
	
</body>
</html>