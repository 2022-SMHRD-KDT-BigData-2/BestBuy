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
<link rel="stylesheet" href="${cpath}/resources/css/market.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<body>
	<div class="top_background">
		<!-- 상단 메뉴바 -->
		<div class="top">
			<h1>FARM & FARM</h1>
			<div class="menu">
				<ul id="nav">
					<li><a href="#">마켓</a></li>
					<c:if test="${empty mvo.u_num && !empty mvo}">
						<li><a href="ShoppingList.html">장바구니</a></li>
					</c:if>
					<li><a href="#">기업정보</a>
						<ul>
							<li><a href="BusinessList.html">기업리스트</a></li>
							<li><a href="BusinessRegi.html">기업등록</a></li>
						</ul></li>
					<c:if test="${!empty mvo}">
							<li><a href="#">마이페이지</a>
								<ul>
									<li><a href="memberInfo.html">회원정보 수정</a></li>
									<c:if test="${empty mvo.u_num}">
										<li><a onclick="Updateclick()">사업자 등록</a></li>
									</c:if>
									<c:if test="${!empty mvo.u_num}">
										<li><a
											href="${pageContext.request.contextPath}/Myproduct">물품등록</a></li>
									</c:if>
								</ul>
							</li>
						</c:if>
						<c:if test="${empty mvo}">
							<li><a onclick="Loginclick()">로그인</a></li>
							<li><a onclick="Joinclick()">회원가입</a></li>
						</c:if>
						<c:if test="${!empty mvo}">
							<li><a href="${cpath}/logout.do" onclick="alert('로그아웃 하시겠습니까?')">로그아웃</a></li>
						</c:if>
				</ul>
			</div>
		</div>
		<div class="wrapper">
			<div class="top_intro">
				<div class="intro">FARM&FARM은</div>
				<div class="intro2">
					삶의 바탕이 되는 자연과 환경을<br>소중하게 생각합니다.
				</div>
				<div class="intro3">123</div>
			</div>
			<!-- 슬라이드 js 혹은 css 필요 -->
			<div class="container">
				<ul id="slider">
					<li class="item"><img src="${cpath}/resources/css/ListImage\1-1.png"></li>
					<li class="item"><img src="${cpath}/resources/css/ListImage\2-2.png"></li>
					<li class="item"><img src="${cpath}/resources/css/ListImage\3-3.png"></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	<!-- 추천상품 4개 -->
	<ul class="top_best">
		<li>
			<div class="best_item">
				<h3>추천상품</h3>
			</div>
			<button class="button">신상품</button>
			<button class="button">특가</button>
		</li>
		<li class="best-cell">
			<div class="img-box">
				<a href="product.html"><img src="${cpath}/resources/css/ListImage\1.png" alt=""></a>
			</div>
			<div class="product-name">영주 별사과 600g</div>
			<div class="product-price">6930원</div>
		</li>
		<li class="best-cell">
			<div class="img-box">
				<a href="product.html"><img src="${cpath}/resources/css/ListImage\3.png" alt=""></a>
			</div>
			<div class="product-name">영주 별사과 600g</div>
			<div class="product-price">6930원</div>
		</li>
		<li class="best-cell">
			<div class="img-box">
				<a href="product.html"><img src="${cpath}/resources/css/ListImage\2.png" alt=""></a>
			</div>
			<div class="product-name">영주 별사과 600g</div>
			<div class="product-price">6930원</div>
		</li>
		<li class="best-cell">
			<div class="img-box">
				<a href="product.html"><img src="${cpath}/resources/css/ListImage\7.png" alt=""></a>
			</div>
			<div class="product-name">영주 별사과 600g</div>
			<div class="product-price">6930원</div>
		</li>
	</ul>
	<!--전체 아이템 리스트 -->
	<div class="item-cover">
		<div class="item_List">
			<ul class="row">
				<li>
					<div class="best_item">
						<h3>상품리스트</h3>
					</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<a href="product.html"><img src="${cpath}/resources/css/ListImage\1.png" alt=""></a>
					</div>
					<div class="product-name">영주 별사과 600g</div>
					<div class="product-price">6930원</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<a href="product.html"><img src="${cpath}/resources/css/ListImage\4.png" alt=""></a>
					</div>
					<div class="product-name">저탄소 GAP 당도선별 배 1.2kg</div>
					<div class="product-price">11000원</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img src="${cpath}/resources/css/ListImage\3.png" alt="">
					</div>
					<div class="product-name">왕사과,왕배</div>
					<div class="product-price">12900</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img src="${cpath}/resources/css/ListImage\2.png" alt="">
					</div>
					<div class="product-name">GAP 미시마 사과 2kg</div>
					<div class="product-price">13990원</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img src="${cpath}/resources/css/ListImage\5.png" alt="">
					</div>
					<div class="product-name">GAP 신고배 1kg</div>
					<div class="product-price">10000원</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img src="${cpath}/resources/css/ListImage\6.png" alt="">
					</div>
					<div class="product-name">실속 성주 참외 1.5kg</div>
					<div class="product-price">12876원</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img src="${cpath}/resources/css/ListImage\7.png" alt="">
					</div>
					<div class="product-name">용암 참외 1.2kg</div>
					<div class="product-price">16900원</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img src="${cpath}/resources/css/ListImage\8.png" alt="">
					</div>
					<div class="product-name">저탄소 GAP SSO농법 사과1kg</div>
					<div class="product-price">8990원</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer">
		<p>주)구매하겠조 남구 송암로 60, 2층</p>
	</div>
</body>

</html>