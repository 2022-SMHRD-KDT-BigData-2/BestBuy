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
                            <h3>상품 이미지 등록</h3>
                        </div>
                        <form action="${pageContext.request.contextPath}/upload.do" method="post" enctype="multipart/form-data">
                            <div class="p_info">
                                <table class="image-preview" >
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                                <label><input type="file" name="upload"></label>
								<br>
								<label><input type="file" name="upload" /></label>
								<br>
								<label><input type="file" name="upload" /></label>
								<br>
								<label><input type="file" name="upload" /></label>
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