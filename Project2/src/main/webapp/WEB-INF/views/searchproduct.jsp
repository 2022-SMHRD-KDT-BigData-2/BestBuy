<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<h1 onclick="location.href='${pageContext.request.contextPath}/main.do'">FARM & FARM</h1>
			<div class="menu">
				<ul id="nav">
					<li><a href="${pageContext.request.contextPath}/Market">마켓</a></li>
					<c:if test="${empty mvo.u_num && !empty mvo}">
						<li><a  href="${pageContext.request.contextPath}/ShoppingList/${mvo.u_id}">장바구니</a></li>
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
										<li><a href="${pageContext.request.contextPath}/productinsert">물품등록</a></li>
									</c:if>
								</ul>
							</li>
						</c:if>
						<c:if test="${empty mvo}">
							<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
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
				<div class="intro3"><img src="${cpath}/resources/css/ListImage/선요소.png"></div>
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
	<!--전체 아이템 리스트 -->
	<div class="item-cover">
		<div class="item_List">
			<ul class="row">
				<li>
					<div class="best_item">
					</div>
				</li>
				<c:forEach var="vo" items="${ slist }">
				<c:url var="contentLink" value="/market2.do/${vo.p_num}"/>
				<li class="cell">
					<div class="img-box"  >
					<img src="${cpath}/resources/css/image/${vo.i_save}" style = "width : 200px;">
					</div>
					<div class="product-name" ><a href = "${contentLink}" style = "text-decoration: none; color: #000000;">${vo.p_name}</a></div>
					<div class="product-price"><fmt:formatNumber value="${vo.p_price}" pattern="#,###"/></div>
					<div class="product-name">${vo.p_kind}</div>
					<div class="product-name">${vo.p_weight}</div>
				</li>
			</c:forEach>	
			</ul>
		</div>
	</div>
	<div class="footer">
		<p>주)구매하겠조 남구 송암로 60, 2층</p>
	</div>
</body>

</html>