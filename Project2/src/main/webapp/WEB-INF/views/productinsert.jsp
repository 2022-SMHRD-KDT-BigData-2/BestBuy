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
<link rel="stylesheet" href="${cpath}/resources/css/product.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<style>
.redline{
color: red;
}
.redlist{
width:130px;
height:130px;
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
				<h1 onclick="location.href='${pageContext.request.contextPath}/main.do'">FARM & FARM</h1>
				<div class="menu">
					<ul id="nav">							
							<li><a href="${pageContext.request.contextPath}/Market">마켓</a></li>
							<c:if test="${empty mvo.u_num && !empty mvo}">
							<li><a href="${pageContext.request.contextPath}/ShoppingList">장바구니</a></li>
						</c:if>
						<li><a href="#">농산물가격예측</a>
							<ul>
								<li><a href="http://127.0.0.1:9000/">가격예측</a></li>
							</ul>
						</li>

						<c:if test="${!empty mvo}">
							<li><a href="#">마이페이지</a>
								<ul>
									<li><a href="#">회원정보 수정</a></li>
									<c:if test="${empty mvo.u_num}">
										<li><a onclick="Updateclick()">사업자 등록</a></li>
									</c:if>
									<c:if test="${!empty mvo.u_num}">
										<li><a href="${pageContext.request.contextPath}/product">물품등록</a></li>
										<li><a href="${pageContext.request.contextPath}/myproduct.do">내물품확인</a></li>
									</c:if>
								</ul>
							</li>
						</c:if>
						<c:if test="${empty mvo}">
							<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
							<li><a onclick="Joinclick()">회원가입</a></li>
						</c:if>
						<c:if test="${!empty mvo}">
							<li><a href="${cpath}/logout.do"
								onclick="alert('로그아웃 하시겠습니까?')">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- 검색 부분 -->
            <div class="content">
                <h3>Product Search</h3>
                <form action="#" >
                    <div class="input-group">
                        <input type="text" class="search" placeholder="검색어 입력">
                        <button class="img-button" type="submit" name="search" value="">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
		<div class="footer">
			<p>주)구매하겠조 남구 송암로 60, 2층</p>
		</div>
	</div>
	<!--상품이미지 등록부분-->
    <div class="login-cover">
            <div class="container">
                    <div class="form_txtInput">
                        <div class="join_top">
                           <talble>
                           <tr>
                           <img class="redlist" src="${cpath}/resources/css/ListImage/top.png" alt="">
                           <img class="redlist" src="${cpath}/resources/css/ListImage/left.png" alt="">
                           <img class="redlist" src="${cpath}/resources/css/ListImage/bottom.png" alt="">
                           <img class="redlist" src="${cpath}/resources/css/ListImage/right.png" alt="">
                           </tr>
                           </talble>
                           <h3 class="redline">농산물 사진촬영 가이드라인</h3> 
                           <br>
                           <li>농산물의 상,하,좌,우 4장의 이미지를 업로드해주세요 !</li>
                           <br>
                           <li>사진속 물체가 꽉차게 촬영해주시면 정확도를 높일 수 있습니다.</li>
                           <br>
                           <li>하얀배경에서 촬영해주시면 더 명확한 평가를 받을 수 있습니다.</li>
                           <br>
                           <br>
                            <h3>상품 이미지 등록</h3>
                        </div>
                        <form action="${pageContext.request.contextPath}/upload.do" method="post" enctype="multipart/form-data">
                            <div class="p_info">
      
                                <label><input type="file" name="upload"></label>
								<br>
								<br>
								<label><input type="file" name="upload" /></label>
								<br>
								<br>
								<label><input type="file" name="upload" /></label>
								<br>
								<br>
								<label><input type="file" name="upload" /></label>
								<br>
								<br>
								<input type="hidden"name="p_name" value="${vo.p_name}"/>
								<input type="hidden"name="u_num" value="${vo.u_num}"/>
								<br>
								<button type="submit" class="submit">이미지등록</button>
                            </div>

                        </form>
                    </div>
            </div>
        </div>
</body>
</html>