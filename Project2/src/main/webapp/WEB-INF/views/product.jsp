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
</head>
<body>
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
	<!--상품등록 부분-->
	<div class="login-cover">
		<div class="container">
			<div class="form_txtInput">
				<div class="join_top">
					<h3>상품등록</h3>
				</div>
				<form action="${cpath}/product.do" method="post">
					<div class="p_info">
						
							
							
								<tr>
									<th><span>상품명</span></th>
									<td><input type="hidden"name="u_num" value="${mvo.u_num}" />
										<input type="text" name="p_name" placeholder="상품명을 입력해주세요..">
									</td>
								</tr>
								<tr>
									<th><span>상품등급</span></th>
									<td><input type="text" name="p_grade" placeholder="상품가격을 입력해주세요."></td>
								</tr>
								<tr>
									<th><span>가격</span></th>
									<td><input type="text" name="p_price" placeholder="상품가격을 입력해주세요."></td>
								</tr>
								<tr>
									<th><span>판매옵션</span></th>
									<td><input type="text" name="p_option" placeholder="판매옵션을 입력해주세요."></td>
								</tr>
								<tr>						
									<th><span>안내사항</span></th>
									<!--높이값 설정이 절대 안되는 중!!!!ㅠㅠ..-->
									<td>
											<tr>
												<td>종류</td>
												<td><input type="text" name="p_kind"></td>
											</tr>
											<tr>
												<td>중량/용량</td>
												<td><input type="text" name="p_weight"></td>
											</tr>
											<tr>
												<td>당도</td>
												<td><input type="text" name="p_sweet"></td>
											</tr>
											<tr>
												<td>포장타입</td>
												<td><input type="text" name="p_pack"></td>
											</tr>
											<tr>
												<td>설명</td>
												<td><input type="text" name="p_data"></td>
											</tr>
										
									</td>
								</tr>
								
					<div class="btn_wrap">
						<button type="submit" class="submit" name="">상품등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	
</body>
</html>