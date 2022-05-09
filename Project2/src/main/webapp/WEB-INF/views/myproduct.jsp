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
							<li><a href="${pageContext.request.contextPath}/Market">마켓</a></li>
							<c:if test="${empty mvo.u_num && !empty mvo}">
							<li><a href="${pageContext.request.contextPath}/ShoppingList">장바구니</a></li>
						</c:if>
						<li><a href="#">기업정보</a>
							<ul>
								<li><a href="#">기업리스트</a></li>
								<li><a href="#">기업등록</a></li>
							</ul></li>

						<c:if test="${!empty mvo}">
							<li><a href="#">마이페이지</a>
								<ul>
									<li><a href="memberInfo.html">회원정보 수정</a></li>
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
	<!--전체 아이템 리스트 -->
	<form id= "myproduct" action="${cpath}/myproduct.do" method="post">
	<div class="item-cover">
		<div class="item_List">
			<ul class="row">
				<li>
					<div class="best_item">
						<h3>내상품리스트</h3>					
					</div>
				
				<input type="hidden"name="u_num" value="${vo.u_num}"/>
				</li>
				<c:forEach var="vo" items="${ mlist }" varStatus="status">
				<c:url var="contentLink" value="/myproduct2.do/${vo.p_num}"/>
				<li class="cell">
					<div class="img-box">
						<a><img src="${cpath}/resources/css/image/${vo.i_save}"></a>
					</div>
					<div class="product-name"> <a href = "${contentLink}">${vo.p_num}</a></div>
					<div class="product-name" >${vo.p_name}</div>
					
				</li>
			</c:forEach>	
			
			</ul>			
		</div>
	</div>
	</form>

</body>

</html>