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
</head>
<body>
	<div class="img">
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
	<!--상품등록 부분-->
	<div class="login-cover">
		<div class="container">
			<div class="form_txtInput">
				<div class="join_top">
					<h3>상품등록</h3>
					<form action="${cpath}/product.do" method="post">
                    	<div class="p_info">
                        	<table>
                            	<colgroup>
                                	<col width="30%"/>
                                    <col width="auto"/>
                                 </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><span>상품명</span></th>
                                            <td><input type="hidden"name="u_num" value="${mvo.u_num}" />
												<input type="text" name="p_name" placeholder="상품명을 입력해주세요..">
											</td>
                                        </tr>
                                        <tr>
                                            <th><span>가격</span></th>
                                            <td><input type="text" name="p_price" placeholder="상품가격을 입력해주세요."></td>
                                        </tr>
                                        <tr>
                                            <th><span>안내사항</span></th>
                                            <td>
                                                <table  class="p-info">
                                                    <tr>
                                                        <td>종류</td>
                                                        <td><input type="text" name="p_kind"></td>
                                                    </tr>
                                                    <tr>
														<td>판매옵션</td>
														<td><input type="radio" name="p_option" value="1">일반판매
															<input type="radio" name="p_option" value="2">특가
														</td>
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
                                                    	<td>상세설명</td>
                                                    	<td><textarea rows="20" name="p_data"></textarea></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>                                                                                
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn_wrap"> 
                                <button type="submit" class="submit">상품등록</button>
                            </div>
                        </form>	
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>
