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
							<li><a onclick="Loginclick()">로그인</a></li>
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
                        <div class="intro2">삶의 바탕이 되는 자연과 환경을<br>소중하게 생각합니다.</div>
                        <div class="intro3"><img src="${cpath}/ListImage/선요소.png"></div>
                    </div>
                    <div class="container">
                        <ul id="slider">
                            <li class="item"><figure><img class="mySlides" src="${cpath}/resources/css/ListImage\1-1.png"></figure></li>
                            <li class="item"><figure><img class="mySlides" src="${cpath}/resources/css/ListImage\1-1.png"></figure><img src="${cpath}/resources/css/ListImage\1-1.png"></li>
                            <li class="item"><figure><img class="mySlides" src="${cpath}/resources/css/ListImage\1-1.png"></figure><img src="${cpath}/resources/css/ListImage\1-1.png"></li>
                        </ul>
                    </div>
        <script>
        var myIndex = 0;
        carousel();
                        
        function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) 
        x[i].style.display = "none";  
       
        myIndex++;
        
        if (myIndex > x.length) {myIndex = 1}    
        	x[myIndex-1].style.display = "block";  
        setTimeout(carousel, 2000); // Change image every 2 seconds
         }
        </script>
	</div>
	 <!-- 추천상품 4개 -->

            <div class="best_item">
                        <h3>Product</h3>
                        <div class="item-button">
                            <button class="button">신상품</button>
                            <button class="button">특가</button>
                        </div>
                </div>
                <div class="best-item">
                    <ul class="top_best">
                        <li>
                            <div class="img-box"><a href="product.html"><img class="img" src="${cpath}/resources/css/ListImage/1.png" alt=""></a></div>
                            <div class="product-name">영주 별사과 600g</div>
                            <div class="product-price">6930원</div>
                        </li>
                        <li>
                            <div class="img-box"><a href="product.html"><img class="img" src="${cpath}/resources/css/ListImage/3.png" alt=""></a></div>
                            <div class="product-name">왕사과,왕배</div>
                            <div class="product-price">12900원</div>
                        </li>
                        <li>
                            <div class="img-box"><a href="product.html"><img class="img" src="${cpath}/resources/css/ListImage/2.png" alt=""></a></div>
                            <div class="product-name">GAP 미시마 사과 2kg</div>
                            <div class="product-price">13990원</div>
                        </li>
                        <li>
                            <div class="img-box"><a href="product.html"><img class="img" src="${cpath}/resources/css/ListImage/7.png" alt=""></a></div>
                            <div class="product-name">용암 참외 1.2kg</div>
                            <div class="product-price">16900원</div>
                        </li>
                    </ul>
                </div>
      <!--상품등록 파라미터 받기 -->

        <div class="item_List">
            <div class="best_item">
                <div class="pro-order">
                    추천순　신상품순　판매량순　낮은가격순　높은가격순
                </div>
            </div>
            <ul class="row">             
                <c:forEach var="vo" items="${ market_list }">
				<c:url var="contentLink" value="/market2.do/${vo.p_num}"/>
				 <li class="cell">
                    <div class="img-box"><img src="${cpath}/ListImage/1.png" alt=""></div>
                    <div class="product-name"><a href = "${contentLink}">${vo.p_name}</a></div>                 
                    <div class="product-price">${vo.p_price}</div>
                </li>
                </c:forEach>	
            </ul>
        </div>  
        
        <div class="footer">
            <p>주)구매하겠조 남구 송암로 60, 2층</p>
        </div>
</body>
</body>

</html>